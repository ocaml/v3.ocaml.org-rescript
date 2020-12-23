type renderres = {
    compiledSource: string,
    renderedOutput: string,
    //TODO: bind "scope"
}

type options = {
    components: Mdx.Components.t,
}

@bs.module("next-mdx-remote/render-to-string") external renderToString: ('source, options) => Js.Promise.t<renderres> = "default";
@bs.module("next-mdx-remote/hydrate") external hydrate: (renderres, options) => ReasonReact.reactElement = "default";
