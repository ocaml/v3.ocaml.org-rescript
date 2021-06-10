open! Import

module type S = {
  type t
  type props<'a> = {content: 'a}
  type params
  let getStaticProps: Next.GetStaticProps.t<props<t>, params, void>
  let default: props<t> => React.element
}

module type Arg = {
  type content
  let getContent: Lang.t => Js.Promise.t<content>
  let component: React.component<content>
}

module Make: (Arg: Arg) => (S with type t := Arg.content)

module P2: {
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
        type t = {lang: Lang.t, tutorial: int}
        include S with type t := t
      }
    }
  }

  module type S = {
    type props
    type params
    let getStaticProps: Next.GetStaticProps.t<props, params, void>
    let default: props => React.element
  }

  module type Arg = {
    type t

    module Params: Params.S

    let getContent: Params.t => Js.Promise.t<t>

    @react.component
    let make: (~content: t) => React.element
  }

  module Make: Arg => S
}
