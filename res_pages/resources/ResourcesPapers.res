let s = React.string

type t = {
  title: string,
  pageDescription: string,
}

let contentEn = {
  title: `Papers`,
  pageDescription: `A selection of papers grouped by popular categories.`,
}

@react.component
let make = (~content=contentEn) =>
  <MainContainer.None>
    <ConstructionBanner />
    <TitleHeading.Large title=content.title pageDescription=content.pageDescription />
  </MainContainer.None>

let default = make
