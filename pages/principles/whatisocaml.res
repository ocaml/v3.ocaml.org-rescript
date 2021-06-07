type t = {
  title: string,
  pageDescription: string,
}

@react.component
let make = (~content: t) => <>
  <ConstructionBanner />
  <Page.TopImage title=content.title pageDescription=content.pageDescription>
    {<> </>}
  </Page.TopImage>
</>

include Page2.Make({
  type content = t

  let getContent = (lang: Lang.t) => {
    let en = Js.Promise.resolve({
      title: `What is OCaml`,
      pageDescription: `A description of OCaml's features.`,
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
