let s = React.string

type t = {
  title: string,
  pageDescription: string,
}

let contentEn = {
  title: `Releases`,
  pageDescription: ``,
}

@react.component
let make = (~content=contentEn) =>
  <MainContainer.None>
    <ConstructionBanner />
    <TitleHeading.Large title=content.title pageDescription=content.pageDescription />
  </MainContainer.None>

let default = make
