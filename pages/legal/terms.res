module T = {
  type t = {
    title: string,
    pageDescription: string,
  }

  @react.component
  let make = (~content: t) => <>
    <ConstructionBanner />
    <Page.Basic title=content.title pageDescription=content.pageDescription> {<> </>} </Page.Basic>
  </>

  module Params = Page2.Params.Lang

  let getContent = (params: Params.t) => {
    let lang = params.lang
    let en = Js.Promise.resolve({
      title: `Terms and Conditions`,
      pageDescription: ``,
    })

    let lang = switch lang {
    | #en => #en
    | #fr | #es => Lang.default
    }

    switch lang {
    | #en => en
    }
  }
}

include T
include Page2.Make(T)
