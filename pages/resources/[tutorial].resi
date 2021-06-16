type t = {
  source: string,
  title: string,
  pageDescription: Js.Nullable.t<string>,
  tableOfContents: MarkdownPage.TableOfContents.t,
}

include Page2.SStaticPaths with type t := t
