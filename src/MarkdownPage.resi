module MarkdownPageBody: {
  @react.component
  let make: (~margins: string, ~renderedMarkdown: string) => React.element
}

module TableOfContents: {
  type rec toc = {
    label: string,
    id: string,
    children: array<toc>,
  }

  type t = {
    contents: string,
    toc: array<toc>,
  }

  @react.component
  let make: (~content: t) => React.element
}
