module Section = {
  @react.component
  let make = (~children) => {
    <div className="col-span-9 lg:col-span-7 relative py-16 bg-graylight overflow-hidden">
      <div className="relative px-4 sm:px-6 lg:px-8"> children </div>
    </div>
  }
}
module Timeline = {
  module Item = {
    type t = {date: string, description: string}
  }

  type t = array<Item.t>
  @react.component
  let make = (~content: t) => {
    let item = ({Item.date: date, description}) => {
      let color = "bg-yellow-500"

      let verticalBar =
        <span className={`absolute top-5 left-5 ml-0.5 h-full w-0.5 ${color}`} ariaHidden=true />

      let circle = <div className={`h-11 w-11 ${color} rounded-full flex`} />

      let date = <div className="text-3xl font-bold text-gray-900 mb-4"> {React.string(date)} </div>

      let description =
        <div className="mt-2 text-base text-gray-700"> <p> {React.string(description)} </p> </div>

      <li>
        <div className="relative pb-8">
          verticalBar
          <div className="relative flex items-start space-x-3">
            circle <div className="min-w-0 flex-1"> date description </div>
          </div>
        </div>
      </li>
    }

    <Section>
      <div className="flow-root">
        <ul className="-mb-8"> {content |> Array.map(item) |> React.array} </ul>
      </div>
    </Section>
  }
}

type props = {
  title: string,
  pageDescription: string,
  timeline: Timeline.t,
}

module StatBox = {
  @react.component
  let make = (~label, ~statValue, ~borderSizes) =>
    <div className={`flex flex-col border-gray-100 py-16 px-4 text-center ` ++ borderSizes}>
      <dt className="order-2 mt-2 text-lg leading-6 font-bold text-black text-opacity-70">
        {React.string(label)}
      </dt>
      <dd className="order-1 text-5xl font-extrabold text-orangedark">
        {React.string(statValue)}
      </dd>
    </div>
}

module ProgressBar = {
  @react.component
  let make = () => {
    <div className="mt-10 pb-12 sm:pb-16">
      <div className="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8">
        <div className={"max-w-4xl mx-auto"}>
          <dl className="rounded-lg bg-white shadow-lg sm:grid sm:grid-cols-3">
            <StatBox
              label="percent complete"
              statValue="30%"
              borderSizes=`border-b sm:border-0 sm:border-r`
            />
          </dl>
        </div>
      </div>
    </div>
  }
}

let make = props => <>
  <ConstructionBanner
    figmaLink=`https://www.figma.com/file/Vha4bcBvNVrjyLmAEDgZ1x/History-Timeline?node-id=14%3A5`
  />
  <TitleHeading title=props.title pageDescription=props.pageDescription />
  <ProgressBar />
  <Timeline content=props.timeline />
</>

let default = make

@module("js-yaml") external yamlParse: (string, ~options: 'a=?, unit) => Js.Json.t = "load"

let getStaticProps = _ctxt => {
  let x =
    "res_pages/Milestones.yaml"
    ->Fs.readFileSync
    ->yamlParse(~options=None, ())
    ->Js.Json.decodeObject
    ->Js.Option.getExn

  let title: string = x->Js.Dict.unsafeGet("title")->Js.Json.decodeString->Js.Option.getExn
  let pageDescription: string =
    x->Js.Dict.unsafeGet("pageDescription")->Js.Json.decodeString->Js.Option.getExn
  let timeline: Timeline.t = {
    let y: array<Js.Json.t> =
      x->Js.Dict.unsafeGet("timeline")->Js.Json.decodeArray->Js.Option.getExn
    Array.map(x => {
      let o = x->Js.Json.decodeObject->Js.Option.getExn
      let date = o->Js.Dict.unsafeGet("date")->Js.Json.decodeString->Js.Option.getExn
      let description = o->Js.Dict.unsafeGet("description")->Js.Json.decodeString->Js.Option.getExn
      {Timeline.Item.date: date, description: description}
    }, y)
  }
  {"props": {title: title, pageDescription: pageDescription, timeline: timeline}}
}
