let s = React.string

module Params = {
  type t = {tutorial: string}
}

type t = {tableOfContents: MarkdownPage.TableOfContents.t}

type rec toc = {
  label: string,
  // id: string,
  children: list<toc>,
}

type props = {
  source: NextMdxRemote.renderToStringResult,
  title: string,
  pageDescription: string,
  tableOfContents: MarkdownPage.TableOfContents.t,
}

@react.component
let make = (~source, ~title, ~pageDescription, ~tableOfContents) => {
  let body = NextMdxRemote.hydrate(source, NextMdxRemote.hydrateParams())
  <>
    <ConstructionBanner
      figmaLink=`https://www.figma.com/file/36JnfpPe1Qoc8PaJq8mGMd/V1-Pages-Next-Step?node-id=430%3A21054`
      playgroundLink=`/play/resources/installocaml`
    />
    // TODO: should this have a constrained width? what does tailwind do?
    <MainContainer.None>
      <div className="grid grid-cols-9 bg-white">
        <MarkdownPage.TableOfContents content=tableOfContents />
        <div className="col-span-9 lg:col-span-7 bg-graylight relative py-16 overflow-hidden">
          <div className="relative px-4 sm:px-6 lg:px-8">
            <TitleHeading.MarkdownMedium title pageDescription />
            <MarkdownPage.MarkdownPageBody margins=`mt-6`> body </MarkdownPage.MarkdownPageBody>
          </div>
        </div>
      </div>
    </MainContainer.None>
  </>
}

let contentEn = {
  tableOfContents: {
    contents: `Contents`, // take this from a generic markdown generic content yaml file, hardcode for now
    headings: [
      {
        name: "Implicit vs. explicit casts",
        headingId: "implicit-vs-explicit-casts",
        subHeadings: [
          {
            subName: "Is implicit or explicit casting better?",
            subHeadingId: "is-implicit-or-explicit-casting-better",
          },
        ],
      },
    ],
  },
}

type pageContent = {title: string, pageDescription: string}

@module("js-yaml") external load: (string, ~options: 'a=?, unit) => pageContent = "load"

/*
let run = %raw(`
  function () {
    var remark = require('remark')
    remark()
      .process("# l1 title", function (err, file) {
        console.log(String(file))
      })
  }
`)
*/

type processor
@module("remark") external remark: unit => processor = "default"

type node = {\"type": string, depth: option<int>}

type headingnode = {
  depth: int,
  // data
}

external asHeadingNode: node => headingnode = "%identity"

type rootnode = {children: array<node>}

type vfile = {mutable toc: list<toc>}
type transformer = (rootnode, vfile) => unit

type attacher = unit => transformer

@send external use: (processor, attacher) => processor = "use"

@send external process: (processor, string) => Js.Promise.t<vfile> = "process"

@module("mdast-util-to-string") external toString: headingnode => string = "default"

let transformer = (rootnode: rootnode, file) => {
  let rec collect = (nodes, inProgress, headings) => {
    switch nodes {
    | list{} =>
      Js.List.rev(
        switch inProgress {
        | None => headings
        | Some(_, entry) => list{entry, ...headings}
        },
      )
    | list{h: headingnode, ...tail} =>
      let d = h.depth
      if d >= 2 || d <= 3 {
        let entry = {label: toString(h), children: list{}} // add node.data.id and children = []
        switch inProgress {
        | None => collect(tail, Some(d, entry), headings)
        | Some(lastCollectedDepth, inProgress) if d < lastCollectedDepth =>
          collect(tail, Some(d, entry), list{inProgress, ...headings})
        | Some(_, inProgress) =>
          let inProgress = {
            ...inProgress,
            children: Belt.List.concat(inProgress.children, list{entry}),
          }
          collect(tail, Some(d, inProgress), headings)
        }
      } else {
        collect(tail, inProgress, headings)
      }
    }
  }
  let headings = collect(
    Array.to_list(
      Belt.Array.keepMap(rootnode.children, ch =>
        switch ch {
        | {\"type": "heading", depth: Some(_)} => Some(asHeadingNode(ch))
        | _ => None
        }
      ),
    ),
    None,
    list{},
  )

  file.toc = headings
}

let plugin = () => {
  transformer
}

let getStaticProps = ctx => {
  let params = ctx.Next.GetStaticProps.params
  let contentFilePath = "res_pages/resources/" ++ params.Params.tutorial ++ ".md"
  let fileContents = Fs.readFileSync(contentFilePath)
  let parsed = GrayMatter.matter(fileContents)
  // TODO: move this into GrayMatter or another module
  GrayMatter.forceInvalidException(parsed.data)
  let source = parsed.content

  let _ = Js.Promise.then_(res => {
    Js.log(res.toc)
    Js.Promise.resolve()
  }, process(use(remark(), plugin), source))
  // "# first heading\n ## second heading"

  // need to compute headings first?
  // parse string into md-ast

  // TODO: parse table of contents from front matter
  let mdSourcePromise = NextMdxRemote.renderToString(source, NextMdxRemote.renderToStringParams())
  mdSourcePromise->Js.Promise.then_(mdSource => {
    let props = {
      source: mdSource,
      title: parsed.data.title,
      pageDescription: parsed.data.pageDescription,
      tableOfContents: contentEn.tableOfContents,
    }
    Js.Promise.resolve({"props": props})
  }, _)
}

let getStaticPaths: Next.GetStaticPaths.t<Params.t> = () => {
  let markdownFiles = Js.Array.filter(// todo: case insensitive
  s => Js.String.endsWith("md", s), Fs.readdirSync("res_pages/resources/"))

  let ret = {
    Next.GetStaticPaths.paths: Array.map(
      f => {Next.GetStaticPaths.params: {Params.tutorial: Js.String.split(".", f)[0]}}, // TODO: better error
      markdownFiles,
    ),
    fallback: false, //TODO: is this value correct?
  }
  Js.Promise.resolve(ret)
}

let default = make
