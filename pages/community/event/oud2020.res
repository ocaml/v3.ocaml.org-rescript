let s = React.string

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
  | Some(link) => Some(link)
  | None => Belt.List.head(paper.links)
  }
}

@react.component
let make = (~content) => <>
  <ConstructionBanner
    figmaLink=`https://www.figma.com/file/36JnfpPe1Qoc8PaJq8mGMd/V1-Pages-Next-Step?node-id=1176%3A0`
  />
  <Page.Basic title=content.title pageDescription=content.pageDescription>
    {<>
      <SectionContainer.SmallCentered
        otherLayout="px-6" marginBottom={Tailwind.ByBreakpoint.make(#mb16, ())}>
        <h2> {s(content.introduction)} </h2>
      </SectionContainer.SmallCentered>
      <SectionContainer.SmallCentered
        otherLayout="px-6" marginBottom={Tailwind.ByBreakpoint.make(#mb16, ())}>
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
      <SectionContainer.SmallCentered marginBottom={Tailwind.ByBreakpoint.make(#mb16, ())}>
        <h2 className="text-4xl font-bold mb-8"> {s("Presentations")} </h2>
        <Table.Simple
          content={{
            headers: ["", "Presentation"],
            data: Array.map((video: Video.t) => {
              [
                // TODO: Improve the embedding of videos from watch.ocaml.org
                // which requires things like support for lazily loading iframes
                // in Rescrip-react and potentially a different design for mobile
                // screens
                <iframe
                  height="200"
                  width="275"
                  title={video.title}
                  className="rounded-lg"
                  sandbox="allow-same-origin allow-scripts allow-popups"
                  src={Belt_Option.getExn(video.embed)}
                  allowFullScreen=true
                />,
                <p className="font-bold"> {s(video.title)} </p>,
              ]
            }, content.presentations),
          }}
        />
      </SectionContainer.SmallCentered>
      <SectionContainer.SmallCentered marginBottom={Tailwind.ByBreakpoint.make(#mb16, ())}>
        <h2 className="text-4xl font-bold mb-8 px-6"> {s("Papers")} </h2>
        <Table.Simple
          content={{
            headers: ["Title", "Author(s)", "Link"],
            data: Array.map((paper: Paper.t) => {
              [
                <p className="font-bold"> {s(paper.title)} </p>,
                <p> {s(String.concat(", ", paper.authors))} </p>,
                switch pdf_or_head(paper) {
                | Some(link) =>
                  <p>
                    <a
                      target="_blank"
                      rel="noopener noreferrer"
                      className="text-orangedark underline"
                      href={link}>
                      {s("link")} //TODO: Download link icon
                    </a>
                  </p>
                | None => <> {s("No link")} </>
                },
              ]
            }, content.papers),
          }}
        />
      </SectionContainer.SmallCentered>
      // TODO: Add program and organising committee ?
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
