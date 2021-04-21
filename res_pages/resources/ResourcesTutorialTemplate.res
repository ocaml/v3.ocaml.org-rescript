let s = React.string

module Params = {
  type t = {tutorial: string}
}

type t = {contents: string}

type props = {
  source: string, //NextMdxRemote.renderToStringResult,
  title: string,
  pageDescription: string,
  tableOfContents: MarkdownPage.TableOfContents.t,
}

@react.component
let make = (~source, ~title, ~pageDescription, ~tableOfContents) => {
  // let body = NextMdxRemote.hydrate(source, NextMdxRemote.hydrateParams())
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
            <MarkdownPage.MarkdownPageBody margins=`mt-6`>
              <div dangerouslySetInnerHTML={{"__html": source}} />
            </MarkdownPage.MarkdownPageBody>
          </div>
        </div>
      </div>
    </MainContainer.None>
  </>
}

let contentEn = {
  contents: `Contents`,
}

type pageContent = {title: string, pageDescription: string}

@module("js-yaml") external load: (string, ~options: 'a=?, unit) => pageContent = "load"

type processor

@module("remark") external remark: unit => processor = "default"

@module("unified") external unified: unit => processor = "default"

type node = {\"type": string, depth: option<int>}

type data = {id: string}

type headingnode = {
  depth: int,
  data: data,
}

external asHeadingNode: node => headingnode = "%identity"

type rootnode = {children: array<node>}

type vfile = {mutable toc: list<MarkdownPage.TableOfContents.toc>, contents: string}

type transformer = (rootnode, vfile) => unit

type attacher = unit => transformer

@send external use: (processor, attacher) => processor = "use"

@send external process: (processor, string) => Js.Promise.t<vfile> = "process"

@module("remark-slug") external remarkSlug: attacher = "default"

// @module("remark-slug") external remarkSlug2: NextMdxRemote.plugin = "default"

@module("remark-parse") external remarkParse: attacher = "default"

@module("remark-rehype") external remark2rehype: attacher = "default"

@module("rehype-stringify") external rehypeStringify: attacher = "default"

@module("mdast-util-to-string") external toString: headingnode => string = "default"

// TODO: define scanleft (https://github.com/reazen/relude/blob/e733128d0df8022448398a44c80cba6f28443b94/src/list/Relude_List_Base.re#L487)
// and use it below

// TODO: factor out the core algorithm from other concerns, and
//  write unit tests for the core algorithm.

let transformer = (rootnode: rootnode, file) => {
  let rec collect = (nodes, inProgress) => {
    switch nodes {
    | list{} =>
      switch inProgress {
      | None => list{}
      | Some(_, entry) => list{entry}
      }
    | list{h: headingnode, ...tail} =>
      let d = h.depth
      if d >= 2 || d <= 3 {
        let entry = {
          MarkdownPage.TableOfContents.label: toString(h),
          id: h.data.id,
          children: list{},
        } // add node.data.id and children = []
        switch inProgress {
        | None => collect(tail, Some(d, entry))
        | Some(lastRootDepth, inProgress) if d <= lastRootDepth => list{
            inProgress,
            ...collect(tail, Some(d, entry)),
          }
        | Some(lastRootDepth, inProgress) =>
          let inProgress = {
            ...inProgress,
            children: Belt.List.concat(inProgress.children, list{entry}),
          }
          collect(tail, Some(lastRootDepth, inProgress))
        }
      } else {
        // TODO: guard against unusual jumps in depth?
        collect(tail, inProgress)
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

  // todo: remove remark; add remark-parse only

  let resPromise = process(
    use(
      use(use(use(use(unified(), remarkParse), remarkSlug), plugin), remark2rehype),
      rehypeStringify,
    ),
    source,
  )

  Js.Promise.then_(res => {
    // Js.log(res.contents)
    let props = {
      source: res.contents,
      title: parsed.data.title,
      pageDescription: parsed.data.pageDescription,
      tableOfContents: {
        contents: "Contents",
        toc: res.toc,
      },
    }
    Js.Promise.resolve({"props": props})
  }, resPromise)

  /*
  Js.Promise.then_(res => {
    // Js.log(res.contents)
    let mdSourcePromise = NextMdxRemote.renderToString(
      res.contents,
      NextMdxRemote.renderToStringParams(~mdxOptions={remarkPlugins: [remarkSlug2]}, ()),
    )
    mdSourcePromise->Js.Promise.then_(
      mdSource => {
        let props = {
          source: mdSource,
          title: parsed.data.title,
          pageDescription: parsed.data.pageDescription,
          tableOfContents: {
            contents: "Contents",
            toc: res.toc,
          },
        }
        Js.Promise.resolve({"props": props})
      },
      // contentEn.tableOfContents,

      _,
    )
  }, process(use(use(remark(), remarkSlug), plugin), source))
 */
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
