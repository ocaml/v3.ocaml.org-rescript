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
      version: string,
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
            {React.string(version)}
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
          <td className="px-6 py-4 whitespace-nowrap text-sm text-gray-500">
            {React.string(results)}
          </td>
        </tr>
      }, items)->React.array
    }

    <div className="flex flex-col">
      <div className="-my-2 overflow-x-auto sm:-mx-6 lg:-mx-8">
        <div className="py-2 align-middle inline-block min-w-full sm:px-6 lg:px-8">
          <div className="shadow overflow-hidden border-b border-gray-200 sm:rounded-lg">
            <table className="min-w-full divide-y divide-gray-200">
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
      version: "v3.1",
      description: "Select technologies",
      period: "Nov - Jan 2020",
      completion: "100%",
      results: "Done.",
    },
    {
      version: "v3.1",
      description: "Select technologies",
      period: "Nov - Jan 2020",
      completion: "100%",
      results: "Done.",
    },
    {
      version: "v3.1",
      description: "Select technologies",
      period: "Nov - Jan 2020",
      completion: "100%",
      results: "Done.",
    },
    {
      version: "v3.1",
      description: "Select technologies",
      period: "Nov - Jan 2020",
      completion: "100%",
      results: "Done.",
    },
    {
      version: "v3.1",
      description: "Select technologies",
      period: "Nov - Jan 2020",
      completion: "100%",
      results: "Done.",
    },
    {
      version: "v3.1",
      description: "Select technologies",
      period: "Nov - Jan 2020",
      completion: "100%",
      results: "Done.",
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
        className="inline-flex items-center py-0 border border-transparent text-xs font-medium rounded shadow-sm text-white bg-yellowdark"
        onClick={_ => setHidden(x => !x)}>
        {React.string("See more v")}
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

// @module("js-yaml") external yamlParse: (string, ~options: 'a=?, unit) => Js.Json.t = "load"

// let getStaticProps = _ctxt => {
//   let items =
//     "data/milestones.yaml"
//     ->Fs.readFileSync
//     ->yamlParse(~options=None, ())
//     ->Js.Json.decodeArray
//     ->Js.Option.getExn

//   let items: array<Item.t> = {
//     Array.map(x => {
//       let o = x->Js.Json.decodeObject->Js.Option.getExn
//       let version = o->Js.Dict.unsafeGet("version")->Js.Json.decodeString->Js.Option.getExn
//       let description = o->Js.Dict.unsafeGet("description")->Js.Json.decodeString->Js.Option.getExn
//       let period = o->Js.Dict.unsafeGet("period")->Js.Json.decodeString->Js.Option.getExn
//       let completion = o->Js.Dict.unsafeGet("completion")->Js.Json.decodeString->Js.Option.getExn
//       let results = o->Js.Dict.unsafeGet("results")->Js.Json.decodeString->Js.Option.getExn
//       {
//         Item.version: version,
//         description: description,
//         period: period,
//         completion: completion,
//         results: results,
//       }
//     }, items)
//   }
//   {"props": {items: items}}
// }
