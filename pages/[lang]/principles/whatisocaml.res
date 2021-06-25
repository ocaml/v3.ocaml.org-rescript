open! Import

module T = {
  type t = {
    title: string,
    pageDescription: string,
  }
  include Jsonable.Unsafe

  @react.component
  let make = (~content: t) => <>
    <ConstructionBanner />
    <Page.TopImage title=content.title pageDescription=content.pageDescription>
      {<> </>}
    </Page.TopImage>
  </>

  module Params = Page2.Params.Lang

  let contentEn = {
    title: `What is OCaml`,
    pageDescription: `A description of OCaml's features.`,
  }

  let content = [({Params.lang: #en}, contentEn)]
}

include T
include Page2.MakeSimple(T)
