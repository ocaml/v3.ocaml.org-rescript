module Timeline = {
  module Item = {
    type t = {date: string, description: string}
  }

  type t = array<Item.t>

  @react.component
  let make = (~content: t) => {
    let item = ({date, description}: Item.t, idx) => {
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

type pageContent = {
  title: string,
  pageDescription: string,
  timeline: array<Timeline.Item.t>,
}

@module("js-yaml") external load: (string, ~options: 'a=?, unit) => pageContent = "load"

let forceInvalidException: JsYaml.forceInvalidException<pageContent> = c => {
  let _ = Js.String.length(c.title)
  let _ = Js.String.length(c.pageDescription)
  let _ = Js.Array.map((tl: Timeline.Item.t) => {
    (Js.String.length(tl.date), Js.String.length(tl.description))
  }, c.timeline)
}

type props = {content: pageContent}

@react.component
let make = (~content) => <>
  <ConstructionBanner
    figmaLink=`https://www.figma.com/file/Vha4bcBvNVrjyLmAEDgZ1x/History-Timeline?node-id=14%3A5`
  />
  <MainContainer.None>
    <TitleHeading.Large title=content.title pageDescription=content.pageDescription />
    <Timeline content=content.timeline />
  </MainContainer.None>
</>

let default = make

let getStaticProps: Next.GetStaticProps.t<props, unit, unit> = _ctxt => {
  let contentPath = "data/history.yaml"
  let fileContents = Fs.readFileSync(contentPath)
  let pageContent = load(fileContents, ())
  forceInvalidException(pageContent)
  Js.Promise.resolve({"props": {content: pageContent}})
}
