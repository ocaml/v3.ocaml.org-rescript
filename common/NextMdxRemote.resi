/*
type transformer

type plugin = unit => transformer

type mdxOptions = {remarkPlugins: array<plugin>}

@deriving(abstract)
type renderToStringParams = {
  @optional components: Mdx.Components.t,
  @optional mdxOptions: mdxOptions,
}

type renderToStringResult = {
  compiledSource: string,
  renderedOutput: string,
}

let renderToString: ('source, renderToStringParams) => Js.Promise.t<renderToStringResult>

@deriving(abstract)
type hydrateParams = {@optional components: Mdx.Components.t}

let hydrate: (renderToStringResult, hydrateParams) => ReasonReact.reactElement
*/
