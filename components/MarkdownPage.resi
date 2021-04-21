module MarkdownPageBody: {
  @react.component
  let make: (~margins: string, ~children: React.element) => React.element
}

module TableOfContents: {
  /*
  type subHeading = {
    subName: string,
    subHeadingId: string,
  }

  type heading = {
    name: string,
    headingId: string,
    subHeadings: array<subHeading>,
  }

  type t = {
    contents: string,
    headings: array<heading>,
  }
 */

  type rec toc = {
    label: string,
    // id: string,
    children: list<toc>,
  }

  type t = {
    contents: string,
    toc: list<toc>,
  }

  @react.component
  let make: (~content: t) => React.element
}
