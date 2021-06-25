open! Import

let s = React.string

module T = {
  type t = {
    title: string,
    pageDescription: string,
    papers: array<Ood.Paper.t>,
  }
  include Jsonable.Unsafe

  @react.component
  let make = (~content) => <>
    <ConstructionBanner playgroundLink=`/play/resources/paperarchive` />
    <Page.Basic title=content.title pageDescription=content.pageDescription>
      <div>
        <div className="container pt-6 px-4 max-w-7xl mx-auto">
          <div className="p-0">
            <input
              id="search"
              type_="search"
              className="w-3/5 md:w-2/5 text-xs sm:text-base shadow rounded border-0 p-3"
              placeholder="Search papers..."
            />
            <button
              className="rounded-r bg-yellow-200 text-xs sm:text-base p-3 w-1/5 md:w-1/6"
              type_="submit">
              {s("Search")}
            </button>
          </div>
        </div>
        <div className="container py-6 px-4 max-w-7xl mx-auto">
          <div className="overflow-x-auto bg-white rounded-lg shadow overflow-y-auto relative">
            <table
              className="border-collapse table-auto w-full whitespace-no-wrap bg-white table-striped relative">
              <thead>
                <tr className="text-left">
                  <th
                    className="py-2 px-3 rounded-tl sticky top-0 border-b border-gray-200 bg-yellow-300">
                    {s("Title")}
                  </th>
                  <th className="py-2 px-3 sticky top-0 border-b border-gray-200 bg-yellow-300">
                    {s("Authors")}
                  </th>
                  <th className="py-2 px-3 sticky top-0 border-b border-gray-200 bg-yellow-300">
                    {s("Year")}
                  </th>
                  <th className="py-2 px-3 sticky top-0 border-b border-gray-200 bg-yellow-300">
                    {s("Tags")}
                  </th>
                  <th
                    className="py-2 px-3 rounded-tr sticky top-0 border-b border-gray-200 bg-yellow-300">
                    {s("Description")}
                  </th>
                </tr>
              </thead>
              <tbody> {Array.map((paper: Ood.Paper.t) =>
                  <tr
                    key={paper.title}
                    className="border-double border-t-4 border-gray-200 hover:bg-yellow-50">
                    <td className="py-4 px-3">
                      {
                        let link =
                          Array.of_list(paper.links)
                          ->Belt.Array.get(0)
                          ->Js.Option.getWithDefault("", _)
                        <a className="border-b-2 border-yellow-300" href=link> {s(paper.title)} </a>
                      }
                    </td>
                    <td className="py-3 px-3">
                      <div className="flex flex-wrap">
                        {List.map(
                          author =>
                            <div className="bg-red-200 whitespace-nowrap p-1 m-1 rounded">
                              {s(author)}
                            </div>,
                          paper.authors,
                        )
                        |> Array.of_list
                        |> React.array}
                      </div>
                    </td>
                    <td className="py-3 px-3"> {s(string_of_int(paper.year))} </td>
                    <td className="py-3 px-3">
                      <div className="flex flex-wrap">
                        {List.map(
                          tag =>
                            <div className="bg-green-200 whitespace-nowrap p-1 m-1 rounded">
                              {s(tag)}
                            </div>,
                          paper.tags,
                        )
                        |> Array.of_list
                        |> React.array}
                      </div>
                    </td>
                    <td className="py-3 px-3"> {s(paper.abstract)} </td>
                  </tr>
                , content.papers) |> React.array} </tbody>
            </table>
          </div>
        </div>
      </div>
    </Page.Basic>
  </>

  let contentEn = {
    let papers = Array.of_list(Ood.Paper.all->Next.stripUndefined)
    {
      title: `Papers Archive`,
      pageDescription: `A selection of OCaml papers through the ages. Filter by the tags or do a search over all of the text.`,
      papers: papers,
    }
  }

  module Params = Page2.Params.Lang

  let content = [({Params.lang: #en}, contentEn)]
}

include T
include Page2.MakeSimple(T)
