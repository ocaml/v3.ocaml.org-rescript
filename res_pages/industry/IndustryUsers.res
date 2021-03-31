module Link = Next.Link

let s = React.string

type company = {
  logo: string,
  name: string,
  customWidth: option<string>,
  needsRounding: bool,
  website: string,
}

let companies = [
  {
    logo: `oclabs.png`,
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
  companies: array<company>,
}

let contentEn = {
  title: `Industrial Users of OCaml`,
  pageDescription: `OCaml is a popular choice for companies who make use of its features in key aspects of their technologies. Some companies that use OCaml code are listed below:`,
  companies: companies,
}

/*
type callToAction = {
  label: string,
  url: string,
}

// TODO: as part of generalizing, consolidate this with installocaml version
module MarkdownPageTitleHeading2 = {
  @react.component
  let make = (~title, ~pageDescription, ~margins=``, ~descriptionCentered=false, ~callToAction=?) =>
    // TODO: remove default value for margins, fix compiler error
    <div className="text-lg max-w-prose mx-auto">
      <h1
        className={margins ++ " block text-3xl text-center leading-8 font-extrabold tracking-tight text-gray-900 sm:text-4xl"}>
        {s(title)}
      </h1>
      <p
        className={"mt-8 text-xl text-gray-500 leading-8 " ++
        switch descriptionCentered {
        | true => " text-center "
        | false => ""
        }}>
        {s(pageDescription)}
      </p>
      {switch callToAction {
      | Some(callToAction) =>
        <div className="text-center mt-7">
          <Link href=callToAction.url>
            <a
              className="justify-center inline-flex items-center px-4 py-2 border border-transparent text-base font-medium rounded-md shadow-sm text-white bg-orangedark hover:bg-orangedarker focus:outline-none focus:ring-2 focus:ring-offset-2 focus:ring-orangedarker">
              {s(callToAction.label)}
            </a>
          </Link>
        </div>
      | None => <> </>
      }}
    </div>
}
*/

module LogoSection = {
  @react.component
  let make = (~margins, ~companies) =>
    <div className={margins ++ " mx-auto sm:max-w-screen-sm lg:max-w-screen-lg"}>
      // TODO: try switching to a grid
      <div className="flex flex-wrap justify-center lg:justify-between ">
        {companies
        |> Js.Array.mapi((c, idx) =>
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
    </div>
}

@react.component
let make = (~content=contentEn) => <>
  <ConstructionBanner
    figmaLink=`https://www.figma.com/file/36JnfpPe1Qoc8PaJq8mGMd/V1-Pages-Next-Step?node-id=430%3A36400`
    playgroundLink=`/play/industry/users`
  />
  <div className="relative py-16 overflow-hidden">
    <div className="relative px-4 sm:px-6 lg:px-8">
      <TitleHeading.Large
        title=content.title
        pageDescription=content.pageDescription
        marginTop=`mt-2`
        callToAction={
          TitleHeading.Large.label: "Success Stories",
          url: "/industry/successstories",
        }
      />
      <LogoSection margins=`mt-6` companies=content.companies />
    </div>
  </div>
</>

let default = make
