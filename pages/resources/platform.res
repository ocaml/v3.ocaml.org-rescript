type t = {
  title: string,
  pageDescription: string,
}

let contentEn = {
  title: `Platform`,
  pageDescription: `The OCaml Platform represents the best way for developers, both new and old, to write software in OCaml.`,
}

@react.component
let make = (~content=contentEn) => <>
  <ConstructionBanner />
  <Page.Basic title=content.title pageDescription=content.pageDescription> {<> </>} </Page.Basic>
</>

let default = make
