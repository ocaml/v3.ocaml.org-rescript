type t = {
  title: string,
  pageDescription: string,
}

let contentEn = {
  title: `What is OCaml`,
  pageDescription: `A description of OCaml's features.`,
}

let render = (~content) => <>
  <ConstructionBanner />
  <Page.TopImage title=content.title pageDescription=content.pageDescription>
    {<> </>}
  </Page.TopImage>
</>

@react.component
let make = () => render(~content=contentEn)

let default = make
