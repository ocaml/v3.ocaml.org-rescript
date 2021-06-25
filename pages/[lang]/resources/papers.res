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

  let contentEn = {
    title: `Papers`,
    pageDescription: `A selection of papers grouped by popular categories.`,
  }

  let content = [({Params.lang: #en}, contentEn)]
}

include T
include Page2.MakeSimple(T)
