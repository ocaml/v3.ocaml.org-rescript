open! Import

module T = {
  type t = {
    title: string,
    pageDescription: string,
  }
  include UnsafeJsonable

  @react.component
  let make = (~content: t) => <>
    <ConstructionBanner
      figmaLink=`https://www.figma.com/file/36JnfpPe1Qoc8PaJq8mGMd/V1-Pages-Next-Step?node-id=931%3A6483`
    />
    <Page.TopImage title=content.title pageDescription=content.pageDescription>
      {<> </>}
    </Page.TopImage>
  </>

  module Params = Page2.Params.Lang

  let getContent = (params: Params.t) => {
    let lang = params.lang
    let en = Js.Promise.resolve({
      title: `Carbon Footprint`,
      pageDescription: `Over the years, the OCaml community has become more and more proactive when it comes to reducing its environmental impact. As part of this journey we have documented our efforts towards becoming Carbon Zero.`,
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
