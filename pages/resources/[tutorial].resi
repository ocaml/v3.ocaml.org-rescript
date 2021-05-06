@react.component
let make: (
  ~source: React.element,
  ~title: string,
  ~pageDescription: Js.Nullable.t<string>,
  ~tableOfContents: MarkdownPage.TableOfContents.t,
) => React.element

type props = {
  source: React.element,
  title: string,
  pageDescription: Js.Nullable.t<string>,
  tableOfContents: MarkdownPage.TableOfContents.t,
}

module Params: {
  type t = {tutorial: string}
}

let getStaticProps: Next.GetStaticProps.t<props, Params.t, unit>

let getStaticPaths: Next.GetStaticPaths.t<Params.t>

let default: {
  "source": React.element,
  "title": string,
  "pageDescription": Js.Nullable.t<string>,
  "tableOfContents": MarkdownPage.TableOfContents.t,
} => React.element
