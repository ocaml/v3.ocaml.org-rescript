type t = {
  title: string,
  pageDescription: string,
}

let contentEn = {
  title: `Opportunities`,
  pageDescription: `This is a space where groups, companies, and organisations can advertise their projects directly to the OCaml community.`,
}

let render = (~content) => <>
  <ConstructionBanner
    figmaLink=`https://www.figma.com/file/36JnfpPe1Qoc8PaJq8mGMd/V1-Pages-Next-Step?node-id=927%3A5`
  />
  <Page.TopImage title=content.title pageDescription=content.pageDescription>
    {<> </>}
  </Page.TopImage>
</>

@react.component
let make = () => render(~content=contentEn)

let default = make
