let s = React.string

type t = {
  title: string,
  pageDescription: string,
}

let contentEn = {
  title: `Install OCaml`,
  pageDescription: ``,
}

@react.component
let make = (~content=contentEn) => <>
  <ConstructionBanner
    figmaLink=`https://www.figma.com/file/36JnfpPe1Qoc8PaJq8mGMd/V1-Pages-Next-Step?node-id=430%3A21054`
    playgroundLink=`/play/resources/installocaml`
  />
  // <TitleHeading title=content.title pageDescription=content.pageDescription />
  <div className="grid grid-cols-9">
    <div
      className="hidden lg:sticky lg:self-start lg:top-2 lg:flex lg:flex-col lg:col-span-2 border-r border-gray-200 pt-5 pb-4 bg-white overflow-y-auto"
    />
  </div>
</>

let default = make
