open! Import

module type Jsonable = {
  type t
  let toJson: t => Js.Json.t
  let ofJson: Js.Json.t => option<t>
}

module Params: {
  type u

  module type S = {
    type t
    let read: u => t
    include Jsonable with type t := t
  }

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
  include Jsonable with type t := t

  module Params: Params.S

  let getContent: Params.t => Js.Promise.t<t>
  let getParams: unit => Js.Promise.t<array<Params.t>>

  @react.component
  let make: (~content: t) => React.element
}

module Make: (Arg: Arg) => (S with type t := Arg.t and type params = Arg.Params.t)
