open! Import

type t = {
  title: string,
  pageDescription: string,
}

@react.component
let make = (~content: t) => <>
  <ConstructionBanner />
  <Page.Basic title=content.title pageDescription=content.pageDescription> {<> </>} </Page.Basic>
</>

include Page2.Make({
  type content = t
  let getContent = (lang: Lang.t) => {
    let en = Js.Promise.resolve({
      title: `News Archive`,
      pageDescription: `Archive of news presented in the News page.`,
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
