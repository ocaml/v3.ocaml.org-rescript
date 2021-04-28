module Timeline = {
  module Item = {
    type t = {date: string, description: string}
  }

  type t = array<Item.t>
  @react.component
  let make = (~content: t) => {
    let item = ({Item.date: date, description}, idx) => {
      let color = "bg-yellowdark"

      let verticalBar =
        <span className={`absolute top-5 left-5 ml-0.5 h-full w-0.5 ${color}`} ariaHidden=true />

      let circle = <div className={`h-11 w-11 ${color} rounded-full flex`} />

      let date = <div className="text-3xl font-bold text-gray-900 mb-4"> {React.string(date)} </div>

      let description =
        <div className="mt-2 text-base text-gray-700"> <p> {React.string(description)} </p> </div>

      <li key={string_of_int(idx)}>
        <div className="relative pb-8">
          verticalBar
          <div className="relative flex items-start space-x-3">
            circle <div className="min-w-0 flex-1"> date description </div>
          </div>
        </div>
      </li>
    }

    <SectionContainer.LargeCentered paddingY="py-12" paddingX="px-4">
      <div className="flow-root">
        <ul className="-mb-8"> {content->Js.Array2.mapi(item)->React.array} </ul>
      </div>
    </SectionContainer.LargeCentered>
  }
}

type props = {
  title: string,
  pageDescription: string,
  timeline: Timeline.t,
}

@module("js-yaml") external yamlParse: (string, ~options: 'a=?, unit) => Js.Json.t = "load"

let ofYaml = (x: string): props => {
  let x = x->yamlParse(~options=None, ())->Js.Json.decodeObject->Js.Option.getExn

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
  {title: title, pageDescription: pageDescription, timeline: timeline}
}

let make = props => <>
  <ConstructionBanner
    figmaLink=`https://www.figma.com/file/Vha4bcBvNVrjyLmAEDgZ1x/History-Timeline?node-id=14%3A5`
  />
  <MainContainer.None>
    <TitleHeading.Large title=props.title pageDescription=props.pageDescription />
    <Timeline content=props.timeline />
  </MainContainer.None>
</>

let default = make

let getStaticProps = _ctxt => {
  let props = "data/history.yaml"->Fs.readFileSync->ofYaml

  {"props": props}
}
