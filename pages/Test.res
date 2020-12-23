// render
type renderres = {
    compiledSource: string,
    renderedOutput: string,
    //TODO: bind "scope"
}

module NextMdxRemote = {
  @bs.module("next-mdx-remote/render-to-string") external renderToString: (string, Mdx.Components.t) => Js.Promise.t<renderres> = "default";
  // TODO: return value type
  @bs.module("next-mdx-remote/hydrate") external hydrate: (renderres, Mdx.Components.t) => 'a = "default";
};

type props = {
    source: renderres,
}

// render function
let default = (props) => {
  let content = NextMdxRemote.hydrate(props.source, Markdown.default)
  <>
  {content}
  </>
}

module Fs = {
  @bs.module("fs") external readFileSync: (string) => string = "readFileSync";
}

let getStaticProps = _ctx => {
    // TODO: add next file watcher to scripts
    // TODO: export const POSTS_PATH = path.join(process.cwd(), 'posts')
    let contentFilePath = "_content/support.mdx"
    let source = Fs.readFileSync(contentFilePath)
    let mdxSourcePromise = NextMdxRemote.renderToString(source, Markdown.default)
    mdxSourcePromise->Js.Promise.then_(mdxSource => {
        let props = {
            source: mdxSource,
        }
        Js.Promise.resolve({"props": props})
    }, _)
}