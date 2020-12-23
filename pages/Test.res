// render
type renderres = {
    compiledSource: string,
    renderedOutput: string,
    //TODO: bind "scope"
}

type options = {
    components: Mdx.Components.t,
}

module NextMdxRemote = {
  @bs.module("next-mdx-remote/render-to-string") external renderToString: (string, options) => Js.Promise.t<renderres> = "default";
  @bs.module("next-mdx-remote/hydrate") external hydrate: (renderres, options) => ReasonReact.reactElement = "default";
};

type props = {
    source: renderres,
}

let default = (props) => {
  let content = NextMdxRemote.hydrate(props.source, {components: Markdown.default} )
  <>
  {content}
  </>
}

module Fs = {
  @bs.module("fs") external readFileSync: (string) => string = "readFileSync";
}

let getStaticProps = _ctx => {
    // TODO: add next file watcher to scripts
    // TODO: export const POSTS_PATH = path.join(process.cwd(), '_contents')
    let contentFilePath = "_content/support.mdx"
    let source = Fs.readFileSync(contentFilePath)
    let mdxSourcePromise = NextMdxRemote.renderToString(source, { components: Markdown.default })
    mdxSourcePromise->Js.Promise.then_(mdxSource => {
        let props = {
            source: mdxSource,
        }
        Js.Promise.resolve({"props": props})
    }, _)
}