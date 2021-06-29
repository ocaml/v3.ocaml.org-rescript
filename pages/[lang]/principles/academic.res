open! Import

module Link = Next.Link
module T = {
  type t = {acads: array<Ood.Academic_institution.t>}

  let s = React.string
  include Jsonable.Unsafe
  //PageBasicDetail Module
  module PageBasic = {
    @react.component
    let make = () => <>
      <div
        className={"bg-acad-bg bg-center bg-no-repeat flex flex-wrap align-bottom sm:h-160 bg-cover "}>
        <div
          className=" bg-white overflow-hidden shadow rounded-lg mb-2 lg:mb-7 mt-56 mx-5 max-w-4xl"
        />
      </div>
      //PageTitle
      <div className={"bg-white place-content-center "}>
        <div className="text-center py-8 px-4 sm:py-8 sm:px-6 lg:px-8">
          <h1
            className={" text-4xl font-extrabold text-orangedark sm:text-5xl sm:tracking-tight lg:text-6xl"}>
            {s("Academic Excellence")}
          </h1>
        </div>
      </div>
      //PageDescription
      <div className={"max-w-7xl mx-auto"}>
        <div className={"mx-auto pb-20 px-4 sm:pb-20 sm:px-6 lg:px-8"}>
          <div className={"text-center"}>
            <p className={"max-w-7xl mt-5 mx-auto text-xl text-gray-500"}>
              {s(
                "With its strong mathematical roots, OCaml has always had strong ties to academia. Currently, it is being taught in universities around the world, and has accrued an ever growing body of research. This page will provide you with an overview of the academic excellence that defines the culture of OCaml.",
              )}
            </p>
            //CallToAction Button
            <div className="text-center mt-7">
              <Link href=InternalUrls.principlesSuccesses>
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

  //University and Courses module

  module University = {
    @react.component
    let make = (~marginBottom=?, ~content, ()) => {
      //filter University based on Continents
      let (filteredData, setFilteredData) = React.useState(_ => content.acads)
      let onChange = evt => {
        ReactEvent.Form.preventDefault(evt)
        let value = ReactEvent.Form.target(evt)["value"]
        let result = {
          switch value {
          | "All" => content.acads
          | _ =>
            Js.Array.filter(
              data => data.Ood.Academic_institution.continent === value,
              content.acads,
            )
          }
        }
        setFilteredData(_prev => result)
      }

      <>
        //University and Courses
        <SectionContainer.MediumCentered ?marginBottom paddingX="px-12">
          <h2 className="text-grey-900 text-3xl mb-5 lg:text-4xl font-bold text-center">
            {s("Universities & Courses")}
          </h2>
        </SectionContainer.MediumCentered>
        //Select Button
        <SectionContainer.ResponsiveCentered ?marginBottom>
          <label className="block pr-8  sm:pr-8 lg:pr-20 ">
            <select className="form-select block mt-1 ml-auto " onChange>
              <option> {s("All")} </option>
              <option> {s("North America")} </option>
              <option> {s(" Europe")} </option>
              <option> {s("Asia")} </option>
            </select>
          </label>
        </SectionContainer.ResponsiveCentered>
        //Display Images
        <SectionContainer.ResponsiveCentered ?marginBottom>
          //TODO: Modal implementation
          <div className=" flex flex-wrap justify-center items-center flex-row ">
            {filteredData
            |> Array.mapi((idx, c) =>
              <div
                key={string_of_int(idx)}
                className="bg-white flex  items-center pl-2.5 pt-2.5 pb-0 pr-4 h-32 w-72 m-0.5">
                <img
                  className="w-24 my-9 flex-grow-0 flex-shrink-0"
                  src={`` ++
                  switch c.Ood.Academic_institution.logo {
                  | None => ``
                  | Some(logo) => logo
                  }}
                  alt=""
                />
                <div className="my-9 underline font-bold pl-4">
                  // TODO: accessibility - warn opening a new tab:(Can be solved using Modal)
                  <a href=c.url target="_blank"> {s(c.name)} </a>
                </div>
              </div>
            )
            |> React.array}
          </div>
          //TODO: implement expand button
        </SectionContainer.ResponsiveCentered>
        <div className="text-center mt-7 mb-20">
          <a
            className="w-44 justify-center inline-flex items-center px-4 py-2 border border-transparent text-base font-medium rounded-md shadow-sm text-white bg-orangedark hover:bg-orangedarker focus:outline-none focus:ring-2 focus:ring-offset-2 focus:ring-orangedarker w-56">
            {s("Expand")}
          </a>
        </div>
      </>
    }
  }
  //TODO: Implement Map
  module Map = {
    @react.component
    let make = (~marginBottom=?) => <>
      <SectionContainer.MediumCentered ?marginBottom paddingX="px-12">
        <h2 className="mb-16 text-grey-900 text-3xl mb-5 lg:text-4xl font-bold text-center">
          {s("Ocaml Courses around the World")}
        </h2>
      </SectionContainer.MediumCentered>
      <SectionContainer.ResponsiveCentered ?marginBottom>
        // TODO: try switching to a grid
        <div className="bg-white flex flex-wrap justify-center lg:justify-between ">
          <img src={`/static/worldmap.jpg`} alt="" />
        </div>
      </SectionContainer.ResponsiveCentered>
    </>
  }

  @react.component
  let make = (~content) => <>
    <PageBasic />
    <University marginBottom={Tailwind.ByBreakpoint.make(#mb10, ~lg=#mb32, ())} content />
    <Map marginBottom={Tailwind.ByBreakpoint.make(#mb10, ~lg=#mb32, ())} />
  </>

  module Params = Pages.Params.Lang
  let contentEn = {
    let acads = Ood.Academic_institution.all->Belt.List.toArray
    {
      acads: acads,
    }
  }

  let content = [({Params.lang: #en}, contentEn)]
}

include T
include Pages.MakeSimple(T)
