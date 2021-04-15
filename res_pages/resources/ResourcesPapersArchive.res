let s = React.string

type t = {
  title: string,
  pageDescription: string,
}

let contentEn = {
  title: `Papers Archive`,
  pageDescription: `A selection of OCaml papers through the ages. Filter by the tags or do a search over all of the text.`,
}

@react.component
let make = (~content=contentEn) =>
  <MainContainer.None>
    <ConstructionBanner playgroundLink=`/play/resources/paperarchive` />
    <TitleHeading.Large title=content.title pageDescription=content.pageDescription />
  </MainContainer.None>

let default = make
