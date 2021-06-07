type t = {
  title: string,
  pageDescription: string,
}

@react.component
let make = (~content=contentEn) => <>
  <ConstructionBanner
    figmaLink=`https://www.figma.com/file/36JnfpPe1Qoc8PaJq8mGMd/V1-Pages-Next-Step?node-id=927%3A5`
  />
  <Page.TopImage title=content.title pageDescription=content.pageDescription>
    {<> </>}
  </Page.TopImage>
</>

include Page2.Make({
  type content = t
  let getContent = (lang: Lang.t) => {
    let en = Js.Promise.resolve({
      title: `Opportunities`,
      pageDescription: `This is a space where groups, companies, and organisations can advertise their projects directly to the OCaml community.`,
    })
    let lang = switch lang {
    | #en => #en
    | #fr | #es => Lang.default
    }
    switch lang {
    | #en => en
    }
  }
  let component = (content: content) => make(makeProps(~content, ()))
})
