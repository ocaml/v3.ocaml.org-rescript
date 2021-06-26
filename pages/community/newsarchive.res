type t = {
  title: string,
  pageDescription: string,
}

let contentEn = {
  title: `News Archive`,
  pageDescription: `Archive of news presented in the News page.`,
}

let render = (~content) => <>
  <ConstructionBanner />
  <Page.Basic title=content.title pageDescription=content.pageDescription> {<> </>} </Page.Basic>
</>

@react.component
let make = () => render(~content=contentEn)

let default = make
