open! Import

module T = {
  type t = {
    title: string,
    pageDescription: string,
  }
  include Jsonable.Unsafe

  @react.component
  let make = (~content) => <>
    <ConstructionBanner />
    <Page.Basic title=content.title pageDescription=content.pageDescription> {<> </>} </Page.Basic>
  </>

  module Params = Page2.Params.Lang

  let getParams = () => Js.Promise.resolve([{Params.lang: #en}])

  let getContent = (params: Params.t) => {
    let lang = params.lang
    let en = Js.Promise.resolve({
      title: `Platform`,
      pageDescription: `The OCaml Platform represents the best way for developers, both new and old, to write software in OCaml.`,
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
