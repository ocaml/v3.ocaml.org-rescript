module MarkdownPageBody: {
  @react.component
  let make: (~margins: string, ~children: React.element) => React.element
}

module TableOfContents: {
  type rec toc = {
    label: string,
    id: string,
    children: list<toc>,
  }

  type t = {
    contents: string,
    toc: list<toc>,
  }

  @react.component
  let make: (~content: t) => React.element
}
