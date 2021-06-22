type t = {
  title: string,
  pageDescription: string,
}

let contentEn = {
  title: `Success Stories`,
  pageDescription: ``,
}

@react.component
let make = (~content=contentEn) => <>
  <ConstructionBanner />
  <Page.Basic title=content.title pageDescription=content.pageDescription>
    <div className=""> <LogoCloud /> </div>
  </Page.Basic>
</>

let default = make
