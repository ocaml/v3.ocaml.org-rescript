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

let getStaticProps = _ctx => {
    // TODO: read string from file
    let mdxSource = NextMdxRemote.renderToString(`# some mdx`, Markdown.default)
    Js.Promise.then_(vl => {
        let props = {
            source: vl,
        }
        Js.Promise.resolve({"props": props})
    }, mdxSource)
}