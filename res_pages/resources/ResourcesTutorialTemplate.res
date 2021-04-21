let s = React.string

module Params = {
  type t = {tutorial: string}
}

type t = {contents: string}

type props = {
  source: string,
  title: string,
  pageDescription: string,
  tableOfContents: MarkdownPage.TableOfContents.t,
}

@react.component
let make = (~source, ~title, ~pageDescription, ~tableOfContents) => {
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
              // todo: pass source into pagebody
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

// TODO: define scanleft (https://github.com/reazen/relude/blob/e733128d0df8022448398a44c80cba6f28443b94/src/list/Relude_List_Base.re#L487)
// and use it below

// TODO: factor out the core algorithm from other concerns, and
//  write unit tests for the core algorithm.

let transformer = (rootnode: Unified.rootnode, file: Unified.vfile) => {
  let rec collect = (nodes, inProgress) => {
    switch nodes {
    | list{} =>
      switch inProgress {
      | None => list{}
      | Some(_, entry) => list{entry}
      }
    | list{h: Unified.headingnode, ...tail} =>
      let d = h.depth
      if d >= 2 || d <= 3 {
        let entry = {
          Unified.MarkdownTableOfContents.label: Unified.MdastUtilToString.toString(h),
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
        | {\"type": "heading", depth: Some(_)} => Some(Unified.asHeadingNode(ch))
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

  let resPromise = Unified.process(
    Unified.use(
      Unified.use(
        Unified.use(
          Unified.use(Unified.use(Unified.unified(), Unified.remarkParse), Unified.remarkSlug),
          plugin,
        ),
        Unified.remark2rehype,
      ),
      Unified.rehypeStringify,
    ),
    source,
  )

  Js.Promise.then_((res: Unified.vfile) => {
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
