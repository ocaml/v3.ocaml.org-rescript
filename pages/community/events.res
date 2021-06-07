type t = {
  title: string,
  pageDescription: string,
  events: array<Event.t>,
  headers: array<string>,
}

let s = React.string

let dedicated_page = (event: Event.t) => {
  // OCaml workshop pages
  switch List.find_opt(String.equal("ocaml-workshop"), event.tags) {
  | Some(_) =>
    switch Js.Date.fromString(event.date)->Js.Date.getFullYear {
    | 2020. => Some(InternalUrls.communityEventOud2020)
    | _ => None
    }
  | None => None
  }
}

@react.component
let make = (~content) => <>
  <ConstructionBanner
    figmaLink=`https://www.figma.com/file/36JnfpPe1Qoc8PaJq8mGMd/V1-Pages-Next-Step?node-id=1176%3A0`
  />
  <Page.TopImage title=content.title pageDescription=content.pageDescription>
    <SectionContainer.MediumCentered margins="mb-16">
      <Table.Simple
        content={{
          headers: content.headers,
          data: Array.map((event: Event.t) => [
            <p> {s(event.date |> Js.Date.fromString |> Js.Date.toDateString)} </p>,
            switch dedicated_page(event) {
            | Some(page) =>
              <Next.Link href={page}>
                <a className="text-orangedark underline"> {s(event.title)} </a>
              </Next.Link>
            | None => <p> {s(event.title)} </p>
            },
            <p>
              {s(
                switch event.textual_location {
                | Some(v) =>
                  if event.online {
                    v ++ " (virtual)"
                  } else {
                    v
                  }
                | None =>
                  if event.online {
                    "Virtual"
                  } else {
                    "Unknown"
                  }
                },
              )}
            </p>,
            <p> {s(event.description)} </p>,
          ], content.events),
        }}
      />
    </SectionContainer.MediumCentered>
  </Page.TopImage>
</>

include Page2.Make({
  type content = t
  let getContent = (lang: Lang.t) => {
    let en = {
      let title = `Events`
      let pageDescription = `Several events take place in the OCaml community over the course of each year, in countries all over the world. This calendar will help you stay up to date on what is coming up in the OCaml sphere.`
      let headers = [`Date`, `Event Name`, `Location`, `Description`]
      let events = EventsData.readAll().events->Array.of_list
      let events = Array.map(
        event => Event.toJson(event)->Next.stripUndefined->Event.fromJson,
        events,
      )
      Js.Promise.resolve({
        title: title,
        pageDescription: pageDescription,
        events: events,
        headers: headers,
      })
    }
    let lang = switch lang {
    | #en => #en
    | #fr | #es => Lang.default
    }
    switch lang {
    | #en => en
    }
  }
  let component = (content: content) => make(makeProps(~content, ()))
})
