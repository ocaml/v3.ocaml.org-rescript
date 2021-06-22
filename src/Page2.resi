open! Import

module Params: {
  module type S = Jsonable.S

  module Lang: {
    type t = {lang: Lang.t}
    include S with type t := t

    module Tutorial: {
      type t = {lang: Lang.t, tutorial: string}
      include S with type t := t
    }
  }
}

module type S = {
  type t
  type props<'a>
  type params

  @react.component
  let make: (~content: t) => React.element

  let getStaticProps: Next.GetStaticProps.t<props<t>, params, void>
  let getStaticPaths: Next.GetStaticPaths.t<params>
  let default: props<Js.Json.t> => React.element
}

module type Arg = {
  type t
  include Jsonable.S with type t := t

  @react.component
  let make: (~content: t) => React.element

  module Params: Params.S
  let getContent: Params.t => Js.Promise.t<t>
  let getParams: unit => Js.Promise.t<array<Params.t>>
}

module Make: (Arg: Arg) => (S with type t := Arg.t and type params = Arg.Params.t)
