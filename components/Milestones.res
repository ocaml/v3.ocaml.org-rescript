let percent_complete = "30%"

module Progress = {
  @react.component
  let make = () =>
    <div className="flex flex-col md:flex-row items-center text-center text-white">
      <div className="w-full md:w-3/12 font-bold text-2xl"> {React.string("OCaml.org v3")} </div>
      <div className="w-full md:w-8/12">
        <div className="h-4 relative rounded-full overflow-hidden ring-8 ring-white m-8">
          <div className="w-full h-full bg-white absolute" />
          <div
            className="h-full rounded-full bg-yellowdark absolute"
            style={ReactDOM.Style.make(~width="30%", ())}
          />
        </div>
      </div>
      <div className="w-full md:w-1/12 font-bold text-2xl"> {React.string("30%")} </div>
    </div>
}

module Table = {
  module Item = {
    type t = {
      version: option<string>,
      description: string,
      period: string,
      completion: string,
      results: string,
    }
  }

  let headers = ["version", "description", "period", "completion", "results"]

  @react.component
  let make = (~items: array<Item.t>) => {
    let header = <thead className="bg-gray-50"> <tr> {Array.map(x => {
            <th
              scope="col"
              className="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">
              {React.string(x)}
            </th>
          }, headers)->React.array} </tr> </thead>

    let rows = {
      Array.map(({Item.version: version, description, period, completion, results}) => {
        <tr>
          <td className="px-6 py-4 whitespace-nowrap text-sm font-medium text-gray-900">
            {React.string(
              switch version {
              | None => ""
              | Some(x) => x
              },
            )}
          </td>
          <td className="px-6 py-4 whitespace-nowrap text-sm text-gray-500">
            {React.string(description)}
          </td>
          <td className="px-6 py-4 whitespace-nowrap text-sm text-gray-500">
            {React.string(period)}
          </td>
          <td className="px-6 py-4 whitespace-nowrap text-sm text-gray-500">
            {React.string(completion)}
          </td>
          <td className="px-6 py-4 whitespace-normal text-sm text-gray-500">
            {React.string(results)}
          </td>
        </tr>
      }, items)->React.array
    }

    <div className="flex flex-col">
      <div className="-my-2 overflow-x-auto sm:-mx-6 lg:-mx-8">
        <div className="py-2 align-middle inline-block min-w-full sm:px-6 lg:px-8">
          <div className="shadow overflow-hidden border-b border-gray-200 sm:rounded-lg">
            <table className="table-auto min-w-full divide-y divide-gray-200">
              header <tbody className="bg-white divide-y divide-gray-200"> rows </tbody>
            </table>
          </div>
        </div>
      </div>
    </div>
  }
}

type props = {items: array<Table.Item.t>}

let props: props = {
  items: [
    {
      version: Some("v3.1"),
      description: "Select technologies",
      period: "Nov - Jan 2020",
      completion: "100%",
      results: "Selected NextJS as static site generator, ReScript as implementation language, FlowMapp as sitemap tool, Figma for design, Tailwind for CSS.",
    },
    {
      version: Some("v3.2"),
      description: "Implement most important layouts",
      period: "Feb - Apr 2021",
      completion: "100%",
      results: "The 10 most important pages have been designed and implemented.",
    },
    {
      version: None,
      description: "Design information architecture",
      period: "Aug 2020 - Jun 2021",
      completion: "60%",
      results: " Sitemap is complete, 8 user personas and some journeys have been defined.",
    },
    {
      version: Some("v3.3"),
      description: "Implement all 40 distinct layouts",
      period: "Jun 30, 2021",
      completion: "25%",
      results: "A quarter of the 40 distinct pages have been implemented.",
    },
    {
      version: None,
      description: "Port 40 most important pages",
      period: "Aug 2021",
      completion: "10%",
      results: "Some work started.",
    },
    {
      version: Some("v3.4"),
      description: "Implement OCaml Manual",
      period: "Jul - Aug 2021",
      completion: "0%",
      results: "Not started.",
    },
    {
      version: Some("v3.5"),
      description: "Integrate docs.ocaml.org",
      period: "Jul 2021",
      completion: "0%",
      results: "Pending completiong of the separate docs.ocaml.org project.",
    },
    {
      version: None,
      description: "Implement multilingual site framework",
      period: "Aug 2021",
      completion: "10%",
      results: "Some work started.",
    },
    {
      version: None,
      description: "Finalize site design",
      period: "Jan - Aug 2021",
      completion: "50%",
      results: "Half of the 40 pages needing a distinct design have been designed.",
    },
    {
      version: Some("v3.6"),
      description: "Go live on ocaml.org, replacing old site",
      period: "Aug 1, 2021",
      completion: "30%",
      results: "One-third of the work has been done.",
    },
  ],
}

@react.component
let make = () => {
  let (hidden, setHidden) = React.useState(_ => true)

  let pt = 0
  let pb = switch hidden {
  | true => 0
  | false => 8
  }

  <Section bgColor="yellowdark" pt pb>
    <Progress />
    <div className="flex flex-col items-center">
      <button
        type_="button"
        className="inline-flex items-center pt-0 pb-1.5 border border-transparent text-xs font-medium rounded shadow-sm text-white bg-yellowdark focus:outline-none"
        onClick={_ => setHidden(x => !x)}>
        {React.string(
          "See more " ++
          // TODO: use icons instead of ascii art (: !
          switch hidden {
          | true => "v"
          | false => "^"
          },
        )}
      </button>
    </div>
    <div
      className={switch hidden {
      | true => "hidden"
      | false => ""
      }}>
      <Table items=props.items />
    </div>
  </Section>
}

let default = make
