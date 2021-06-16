open! Import

module type Jsonable = {
  type t
  let toJson: t => Js.Json.t
  let ofJson: Js.Json.t => option<t>
}

module Params = {
  type u = Js.Json.t
  module type S = {
    type t
    let read: u => t
    include Jsonable with type t := t
  }
  module Lang = {
    type t = {lang: Lang.t}
    let ofJson = (json: u): option<t> => {
      json
      ->Js.Json.decodeObject
      ->Belt.Option.flatMap(dict =>
        dict
        ->Js.Dict.get("lang")
        ->Belt.Option.flatMap(Lang.ofJson)
        ->Belt.Option.map(lang => {lang: lang})
      )
    }
    let toJson = (t: t): Js.Json.t =>
      Js.Json.object_(Js.Dict.fromArray([("lang", t.lang->Lang.toJson)]))
    let read = json => json->ofJson->Belt.Option.getExn

    module Tutorial = {
      type t = {lang: Lang.t, tutorial: string}
      let ofJson = (json: Js.Json.t): option<t> => {
        let langT = read(json)
        json
        ->Js.Json.decodeObject
        ->Belt.Option.flatMap(dict =>
          dict
          ->Js.Dict.get("tutorial")
          ->Belt.Option.flatMap(json =>
            json
            ->Js.Json.decodeString
            ->Belt.Option.map(tutorial => {
              lang: langT.lang,
              tutorial: tutorial,
            })
          )
        )
      }
      let toJson = (t: t): Js.Json.t =>
        Js.Json.object_(
          Js.Dict.fromArray([
            ("lang", t.lang->Lang.toJson),
            ("tutorial", t.tutorial->Js.Json.string),
          ]),
        )
      let read = (json: u) => json->ofJson->Belt.Option.getExn
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

module Make = (Arg: Arg): (S with type t := Arg.t and type params = Arg.Params.t) => {
  // let lang = Lang.ofString(ctx.Next.GetStaticProps.params.lang)

  module Props = {
    type t<'content> = {content: 'content}
    let toJson = (t: t<'content>, contentToJson: 'content => Js.Json.t): Js.Json.t =>
      [("content", contentToJson(t.content))]->Js.Dict.fromArray->Js.Json.object_
  }

  type props<'a> = Props.t<'a>
  type params = Arg.Params.t

  let getStaticProps: Next.GetStaticProps.t<props<Arg.t>, params, void> = ctx => {
    Arg.getContent(ctx.params) |> Js.Promise.then_(content => {
      let props = {Props.content: content}
      Js.Promise.resolve({
        "props": props->Props.toJson(Arg.toJson),
      })
    })
  }

  let default = (props: props<Js.Json.t>) => {
    switch Arg.ofJson(props.content) {
    | None => failwith("BUG: Unable to parse content")
    | Some(content: Arg.t) => Arg.make(Arg.makeProps(~content, ()))
    }
  }

  let getStaticPaths: Next.GetStaticPaths.t<Arg.Params.t> = () => {
    let params = Arg.getParams()
    params |> Js.Promise.then_(params =>
      Js.Promise.resolve({
        Next.GetStaticPaths.paths: params->Belt.Array.map(params => {
          Next.GetStaticPaths.params: params,
        }),
        fallback: false,
      })
    )
  }

  include Arg
}
