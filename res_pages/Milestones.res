module Timeline = {
  module Item = {
    type t = {date: string, description: string}
  }

  type t = array<Item.t>
  @react.component
  let make = (~content: t) => {
    <div className="col-span-9 lg:col-span-7 relative py-16 bg-graylight overflow-hidden">
      <div className="relative px-4 sm:px-6 lg:px-8">
        <div className="mt-6 prose prose-yellow prose-lg text-gray-500 mx-auto">
          {content
          |> Array.map(({Item.date: date, description}) => <>
            <h2> {React.string(date)} </h2> <p> {React.string(description)} </p>
          </>)
          |> React.array}
        </div>
      </div>
    </div>
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
