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
      figmaLink=`https://www.figma.com/file/36JnfpPe1Qoc8PaJq8mGMd/V1-Pages-Next-Step?node-id=927%3A5`
    />
    <Page.TopImage title=content.title pageDescription=content.pageDescription>
      {<> </>}
    </Page.TopImage>
  </>

  module Params = Page2.Params.Lang

  let getParams = () => Js.Promise.resolve([{Params.lang: #en}])

  let getContent = (params: Params.t) => {
    let lang = params.lang
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
}

include T
include Page2.Make(T)
