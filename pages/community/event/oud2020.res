let s = React.string

// TODO: Move to a components library?
module SimpleTable = {
  type t = {
    headers: array<string>,
    // The string is a unique identifier for the row for the key prop
    data: array<(string, array<React.element>)>,
  }

  @react.component
  let make = (~content) =>
    <div className="flex flex-col">
      <div className="-my-2 overflow-x-auto sm:-mx-6 lg:-mx-8">
        <div className="py-2 align-middle inline-block min-w-full sm:px-6 lg:px-8">
          <div className="shadow overflow-hidden border-b border-gray-200 sm:rounded-lg">
            <table className="min-w-full divide-y divide-gray-200">
              <thead className="bg-orangedark">
                <tr>
                  {content.headers
                  |> Array.map(header =>
                    <th
                      key={header}
                      scope="col"
                      className="px-6 py-3 text-left text-xs font-medium text-white uppercase tracking-wider">
                      {s(header)}
                    </th>
                  )
                  |> React.array}
                </tr>
              </thead>
              <tbody>
                {content.data
                |> Array.mapi((idx, (ident, item)) => {
                  let base_ident = ident ++ string_of_int(idx)
                  <tr key={base_ident} className={mod(idx, 2) === 0 ? "bg-white" : "bg-gray-50"}>
                    {item
                    |> Array.mapi((jdx, cell) =>
                      <td
                        key={base_ident ++ string_of_int(jdx)}
                        className="px-6 py-4 text-sm font-medium text-gray-900">
                        cell
                      </td>
                    )
                    |> React.array}
                  </tr>
                })
                |> React.array}
              </tbody>
            </table>
          </div>
        </div>
      </div>
    </div>

  let default = make
}

type date = {
  date: string,
  text: string,
}

type t = {
  title: string,
  pageDescription: string,
  introduction: string,
  dates: array<date>,
  presentations: array<Video.t>,
  papers: array<Paper.t>,
  // Committee too ?
}

let pdf_or_head = paper => {
  switch Paper.get_pdf(paper) {
  | Some(link) => link
  | None => List.hd(paper.links)
  }
}

@react.component
let make = (~content) => <>
  <ConstructionBanner
    figmaLink=`https://www.figma.com/file/36JnfpPe1Qoc8PaJq8mGMd/V1-Pages-Next-Step?node-id=1176%3A0`
  />
  <Page.Basic title=content.title pageDescription=content.pageDescription>
    {<>
      <SectionContainer.SmallCentered otherLayout="px-6" margins="mb-16">
        <h1> {s(content.introduction)} </h1>
      </SectionContainer.SmallCentered>
      <SectionContainer.SmallCentered otherLayout="px-6" margins="mb-16">
        <h2 className="text-4xl font-bold mb-8"> {s("Important Dates")} </h2>
        <div className="flow-root rounded bg-white p-6">
          <ul className="-mb-8">
            {content.dates
            |> Array.mapi((idx, date) =>
              <li key={date.text}>
                <div className="relative pb-8">
                  {idx !== Array.length(content.dates) - 1
                    ? <span
                        className="absolute top-3 left-3 -ml-px h-full w-0.5 bg-gray-200"
                        ariaHidden=true
                      />
                    : <> </>}
                  <div className="relative flex space-x-3">
                    <div>
                      <span
                        className="h-6 w-6 rounded-full flex items-center justify-center bg-orangedark"
                      />
                    </div>
                    <div className="min-w-0 flex-1 pt-1.5 flex justify-between space-x-4">
                      <div> <p className="text-sm text-gray-500"> {s(date.text)} </p> </div>
                      <div className="text-right text-sm whitespace-nowrap text-gray-500">
                        <time dateTime={date.date}> {s(date.date)} </time>
                      </div>
                    </div>
                  </div>
                </div>
              </li>
            )
            |> React.array}
          </ul>
        </div>
      </SectionContainer.SmallCentered>
      <SectionContainer.LargeCentered paddingX="px-6" paddingY="mb-16">
        <h2 className="text-4xl font-bold mb-8"> {s("Presentations")} </h2>
        <ul className="grid grid-cols-1 gap-10 sm:grid-cols-2 md:grid-cols-3">
          {content.presentations
          |> Array.map((video: Video.t) =>
            switch video.embed {
            | Some(link) =>
              <li
                key={video.title}
                className="col-span-1 flex flex-col text-center rounded-lg shadow divide-y divide-gray-200">
                <iframe
                  height="250"
                  // loading="lazy" would be nice
                  className="rounded-lg"
                  sandbox="allow-same-origin allow-scripts allow-popups"
                  src={link}
                  allowFullScreen=true
                />
              </li>
            | None => <> </>
            }
          )
          |> React.array}
        </ul>
      </SectionContainer.LargeCentered>
      <SectionContainer.SmallCentered margins="mb-16">
        <h2 className="text-4xl font-bold mb-8 px-6"> {s("Papers")} </h2>
        <SimpleTable
          content={{
            SimpleTable.headers: ["Title", "Author(s)", "Link"],
            data: Array.map((paper: Paper.t) => {
              (
                paper.title,
                [
                  <p className="font-bold"> {s(paper.title)} </p>,
                  <p> {s(String.concat(", ", paper.authors))} </p>,
                  <p>
                    <a
                      target="_blank"
                      rel="noopener noreferrer"
                      className="text-orangedark underline"
                      href={pdf_or_head(paper)}>
                      {s("link")}
                    </a>
                  </p>,
                ],
              )
            }, content.papers),
          }}
        />
      </SectionContainer.SmallCentered>
    </>}
  </Page.Basic>
</>

type props = {content: t}

let getStaticProps = _ctx => {
  let video_filter = List.filter((video: Video.t) => {
    List.exists(String.equal("ocaml-workshop"), video.tags) && video.year === 2020
  })

  let oud_filter = List.filter((paper: Paper.t) => {
    List.exists(String.equal("ocaml-workshop"), paper.tags) && paper.year === 2020
  })

  // TODO: Extract from media archive or watch.ocaml.org API
  let presentations = VideosData.readAll().videos->video_filter->Array.of_list
  let presentations = Array.map(
    presentation => Video.toJson(presentation)->Next.stripUndefined->Video.fromJson,
    presentations,
  )
  let papers = PapersData.readAll().papers->oud_filter->Array.of_list

  let contentEn = {
    title: `OCaml Workshop 2020`,
    pageDescription: `The OCaml Users and Developers Workshop 2020`,
    introduction: `
  The OCaml Users and Developers Workshop Jersey City, New Jersey, United States, August 28th, 2020.\n
  The OCaml Users and Developers Workshop brings together the OCaml community, including users of OCaml in industry, academia, hobbyists, and the free software community.\n
  The meeting is an informal community gathering of users of the language, library authors, and developers, using and extending OCaml in new ways. The meeting will be held online this year.
  `,
    dates: [
      {date: "March 30th", text: "Workshop announcement and submission website opens"},
      {date: "May 7th", text: "Deadline extension"},
      {date: "May 29th", text: "Abstract submission deadline"},
      {date: "July 17th", text: "Author notification, talks are accepted"},
      {date: "August 14th", text: "Camera-ready deadline"},
      {date: "August 28th", text: "OCaml Workshop!"},
    ],
    presentations: presentations,
    papers: papers,
  }
  Js.Promise.resolve({
    "props": {
      content: contentEn,
    },
  })
}

let default = make
