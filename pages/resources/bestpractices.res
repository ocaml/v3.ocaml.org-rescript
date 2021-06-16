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
    <Page.Basic
      marginTop=`mt-1`
      headingMarginBottom=`mb-24`
      addBottomBar=true
      addContainer=Page.Basic.NoContainer
      title=content.title
      pageDescription=content.pageDescription>
      {<> </>}
    </Page.Basic>
  </>

  module Params = Page2.Params.Lang

  let getContent = (params: Params.t) => {
    let lang = params.lang
    let en = Js.Promise.resolve({
      title: `Best Practices`,
      pageDescription: `Some guides to commonly used tools in OCaml development workflows.`,
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
