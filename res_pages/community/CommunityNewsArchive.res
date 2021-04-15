let s = React.string

type t = {
  title: string,
  pageDescription: string,
}

let contentEn = {
  title: `News Archive`,
  pageDescription: `Archive of news presented in the News page.`,
}

@react.component
let make = (~content=contentEn) =>
  <MainContainer.None>
    <ConstructionBanner />
    <TitleHeading.Large title=content.title pageDescription=content.pageDescription />
  </MainContainer.None>

let default = make
