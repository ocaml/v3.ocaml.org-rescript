module T = {
  let s = React.string

  module Company = {
    type t = {
      logo: string,
      name: string,
      customWidth: option<string>,
      needsRounding: bool,
      website: string,
    }
  }

  let companies = (_lang: Lang.t) => [
    {
      Company.logo: `oclabs.png`,
      name: `OCaml Labs`,
      customWidth: None,
      needsRounding: false,
      website: `https://ocamllabs.io`,
    },
    {
      logo: `trd.png`,
      name: `Tarides`,
      customWidth: Some(`w-40`),
      needsRounding: false,
      website: `https://tarides.com`,
    },
    {
      logo: `slv2.png`,
      name: `Solvuu`,
      customWidth: None,
      needsRounding: true,
      website: `https://solvuu.com`,
    },
    {
      logo: `js2.jpeg`,
      name: `Jane Street`,
      customWidth: None,
      needsRounding: true,
      website: `https://janestreet.com`,
    },
    {
      logo: `lxf.png`,
      name: `LexiFi`,
      customWidth: None,
      needsRounding: false,
      website: `https://lexifi.com`,
    },
    {
      logo: `tz.png`,
      name: `Tezos`,
      customWidth: Some(`w-24`),
      needsRounding: false,
      website: `https://tezos.com`,
    },
  ]

  type t = {
    title: string,
    pageDescription: string,
    companies: array<Company.t>,
  }

  module LogoSection = {
    @react.component
    let make = (~margins, ~companies) =>
      <SectionContainer.ResponsiveCentered margins>
        // TODO: try switching to a grid
        <div className="flex flex-wrap justify-center lg:justify-between ">
          {companies
          |> Js.Array.mapi((c: Company.t, idx) =>
            <div key={Js.Int.toString(idx)} className="p-12 flex flex-col items-center">
              // TODO: considering accessibility, how many elements should the link span?
              <img
                className={switch c.customWidth {
                | Some(width) => width
                | None => ` w-32 `
                } ++
                switch c.needsRounding {
                | true => ` rounded-full `
                | false => ``
                } ++ " mb-9 "}
                src={`/static/` ++ c.logo}
                alt=""
              />
              <p className="text-4xl underline font-bold">
                // TODO: accessibility - warn opening a new tab
                <a href=c.website target="_blank"> {s(c.name)} </a>
              </p>
            </div>
          )
          |> React.array}
        </div>
      </SectionContainer.ResponsiveCentered>
  }

  @react.component
  let make = (~content: t) => <>
    <ConstructionBanner
      figmaLink=`https://www.figma.com/file/36JnfpPe1Qoc8PaJq8mGMd/V1-Pages-Next-Step?node-id=430%3A36400`
      playgroundLink=`/play/industry/users`
    />
    <Page.Basic
      marginTop=`mt-2`
      headingMarginBottom=`mb-6`
      title=content.title
      pageDescription=content.pageDescription
      callToAction={
        TitleHeading.Large.label: "Success Stories",
        url: InternalUrls.principlesSuccesses,
      }>
      <LogoSection margins=`` companies=content.companies />
    </Page.Basic>
  </>

  module Params = Page2.Params.Lang

  let getContent = (params: Params.t) => {
    let lang = params.lang
    let companies = companies(lang)

    let en = Js.Promise.resolve({
      title: `Industrial Users of OCaml`,
      pageDescription: `OCaml is a popular choice for companies who make use of its features in key aspects of their technologies. Some companies that use OCaml code are listed below:`,
      companies: companies,
    })

    let lang = switch lang {
    | #en => #en
    | #fr | #es => Lang.default
    }

    switch lang {
    | #en => en
    }
  }
}

include T
include Page2.Make(T)
