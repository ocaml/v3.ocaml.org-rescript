let s = React.string

module Company = {
  type t = {
    logoSrc: string,
    name: string,
    website: string,
  }
}

@react.component
let make = (~companies, ~addNameText=false) =>
  <div className="max-w-7xl mx-auto py-12 px-4 sm:px-6 lg:py-16 lg:px-8">
    <div className="mt-6 grid grid-cols-2 gap-0.5 md:grid-cols-3 lg:mt-8">
      {companies
      ->Js.Array2.map((c: Company.t) =>
        // TODO: accessibility - should the link include the div or only the contents?
        <a href=c.website src=c.website target="_blank">
          <div
            className="col-span-1 flex justify-center items-center space-x-8 py-8 px-4 bg-gray-50">
            // TODO: accessibility - warn opening a new tab
            <img className="rounded max-h-20" src=c.logoSrc alt=c.name />
            {switch addNameText {
            | true =>
              <span className="text-center text-3xl font-bold font-roboto"> {s(c.name)} </span>
            | false => <> </>
            }}
          </div>
        </a>
      )
      ->React.array}
    </div>
  </div>
