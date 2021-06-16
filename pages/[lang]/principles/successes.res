open! Import

module T = {
  type t = {
    title: string,
    pageDescription: string,
  }
  include UnsafeJsonable

  @react.component
  let make = (~content: t) => <>
    <ConstructionBanner />
    <Page.Basic title=content.title pageDescription=content.pageDescription> {<> </>} </Page.Basic>
  </>

  module Params = Page2.Params.Lang

  let getParams = () => Js.Promise.resolve([{Params.lang: #en}])

  let getContent = (params: Params.t) => {
    let lang = params.lang
    let en = Js.Promise.resolve({
      title: `Success Stories`,
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
