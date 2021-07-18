open! Import
module Link = Next.Link
let s = React.string

module T = {
  module Company = {
    type t = {
      logo: string,
      name: string,
      customWidth: option<string>,
      needsRounding: bool,
      website: string,
    }
  }

  let companies = [
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
      customWidth: Some(`w-24`),
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
      customWidth: Some(`w-20`),
      needsRounding: false,
      website: `https://tezos.com`,
    },
  ]

  type highlightContent = {
    highlightItem: string,
    bgImageClass: string,
  }
  type t = {
    companies: array<Company.t>,
    highlightContent: highlightContent,
  }
  include Jsonable.Unsafe
  module PageHeading = {
    @react.component
    let make = (~marginBottom=?, ~content, ~lang) => <>
      <div
        className={content.bgImageClass ++
        "  bg-center bg-no-repeat flex flex-wrap align-bottom place-content-center sm:h-34 bg-cover  " ++
        marginBottom->Tailwind.MarginBottomByBreakpoint.toClassNamesOrEmpty}>
        <div className=" overflow-hidden  mb-12 lg:mb-7 mt-28 mx-5 max-w-4xl">
          <div className="px-4 py-5 sm:p-6">
            <h2 className="font-bold text-orangedark text-3xl lg:text-6xl text-center mb-12">
              {s(content.highlightItem)}
            </h2>
          </div>
        </div>
      </div>
      <div className={"max-w-7xl mx-auto"}>
        <div className={"mx-auto pb-20 px-4 sm:pb-20 sm:px-6 lg:px-8"}>
          <div className={"text-center m-12 "}>
            <p className={"max-w-7xl mt-5 mx-auto text-xl text-gray-500"}>
              {s("
With its strong security features and high performance, several companies rely on OCaml to keep their data operating both safely and efficiently. On this page, you can get an overview of the companies in the community and learn more about how they use OCaml. 
")}
            </p>
            //CallToAction Button
            <div className="text-center mt-7">
              <Link href={#principlesSuccesses->Route.toString(lang)}>
                <a
                  className="justify-center inline-flex items-center px-4 py-2 border border-transparent text-base font-medium rounded-md shadow-sm text-white bg-orangedark hover:bg-orangedarker focus:outline-none focus:ring-2 focus:ring-offset-2 focus:ring-orangedarker">
                  {s("Success Stories")}
                </a>
              </Link>
            </div>
          </div>
        </div>
      </div>
    </>
  }
  module LogoSection = {
    @react.component
    let make = (~companies, ~marginBottom=?, ()) =>
      <SectionContainer.ResponsiveCentered ?marginBottom>
        // TODO: try switching to a grid
        <div className="flex flex-wrap justify-center items-center flex-row m-48">
          {companies
          |> Js.Array.mapi((c, idx) =>
            <div
              key={Js.Int.toString(idx)}
              className="bg-white flex  items-center pl-2.5 pt-2.5 pb-0 pr-4 h-32 w-72 m-0.5">
              // TODO: considering accessibility, how many elements should the link span?
              <img
                className={switch c.Company.customWidth {
                | Some(width) => width
                | None => ` w-24 `
                } ++
                switch c.needsRounding {
                | true => ` rounded-full `
                | false => ``
                } ++ " my-9  flex-grow-0 flex-shrink-0"}
                src={`/static/` ++ c.logo}
                alt=""
              />
              <p className="  my-9 underline font-bold pl-4">
                // TODO: accessibility - warn opening a new tab
                <a href=c.website target="_blank"> {s(c.name)} </a>
              </p>
            </div>
          )
          |> React.array}
        </div>
      </SectionContainer.ResponsiveCentered>
  }

  module Params = Pages.Params.Lang

  @react.component
  let make = (~content, ~params as {Params.lang: lang}) => <>
    <ConstructionBanner
      figmaLink=`https://www.figma.com/file/36JnfpPe1Qoc8PaJq8mGMd/V1-Pages-Next-Step?node-id=430%3A36400`
      playgroundLink=`/play/industry/users`
    />
    <PageHeading
      marginBottom={Tailwind.ByBreakpoint.make(#mb6, ())} content=content.highlightContent lang
    />
    <LogoSection companies=content.companies />
  </>

  let contentEn = {
    companies: companies,
    highlightContent: {
      highlightItem: `Industrial Users of OCaml`,
      bgImageClass: `bg-user-bg`,
    },
  }

  let content = [({Params.lang: #en}, contentEn)]
}

include T
include Pages.MakeSimple(T)
