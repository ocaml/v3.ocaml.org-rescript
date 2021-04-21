let s = React.string

module MarkdownPageBody = {
  @react.component
  let make = (~margins, ~children) =>
    <div className={margins ++ ` prose prose-yellow prose-lg text-gray-500 mx-auto`}>
      children
    </div>
}

module TableOfContents = {
  // TODO: define general heading tree type and recursively traverse when rendering
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
    id: string,
    children: list<toc>,
  }

  type t = {
    contents: string,
    toc: list<toc>,
  }

  @react.component
  let make = (~content) =>
    <div
      className="hidden lg:sticky lg:self-start lg:top-2 lg:flex lg:flex-col lg:col-span-2 border-r border-gray-200 pt-5 pb-4 overflow-y-auto">
      <div className="px-4"> <span className="text-lg"> {s(content.contents)} </span> </div>
      <div className="mt-5 ">
        <nav className="px-2 space-y-1" ariaLabel="Sidebar">
          {content.toc
          ->Belt.List.mapWithIndex((idx, hdg) =>
            <div key={Js.Int.toString(idx)} className="space-y-1">
              // Expanded: "text-gray-400 rotate-90", Collapsed: "text-gray-300"
              <a
                href={"#" ++ hdg.id}
                className="block text-gray-600 hover:text-gray-900 pr-2 py-2 text-sm font-medium">
                {s(hdg.label)}
              </a>
              {hdg.children
              ->Belt.List.mapWithIndex((idx, sub) =>
                <a
                  href={"#" ++ sub.id}
                  className="block pl-6 pr-2 py-2 text-sm font-medium text-gray-600 hover:text-gray-900"
                  key={Js.Int.toString(idx)}>
                  {s(sub.label)}
                </a>
              )
              ->Belt.List.toArray |> React.array}
            </div>
          )
          ->Belt.List.toArray |> React.array}
        </nav>
      </div>
    </div>
}
