open! Import

module T = {
  type t = {
    title: string,
    pageDescription: string,
  }
  include UnsafeJsonable

  @react.component
  let make = (~content) => <>
    <ConstructionBanner />
    <Page.Basic title=content.title pageDescription=content.pageDescription> {<> </>} </Page.Basic>
  </>

  module Params = Page2.Params.Lang

  let getContent = (params: Params.t) => {
    let lang = params.lang
    let en = Js.Promise.resolve({
      title: `Using OCaml`,
      pageDescription: `Besides developing in the language and making your own applications, there are many useful tools that already exist in OCaml for you to use.`,
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
