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
      type t = {lang: Lang.t, tutorial: int}
      let ofJson = (json: Js.Json.t): option<t> => {
        let langT = read(json)
        json
        ->Js.Json.decodeObject
        ->Belt.Option.flatMap(dict =>
          dict
          ->Js.Dict.get("tutorial")
          ->Belt.Option.flatMap(json =>
            json
            ->Js.Json.decodeNumber
            ->Belt.Option.map(Belt.Int.fromFloat)
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
            ("tutorial", t.tutorial->Belt.Int.toFloat->Js.Json.number),
          ]),
        )
      let read = (json: u) => json->ofJson->Belt.Option.getExn
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

module Make = (Arg: Arg): S => {
  // let lang = Lang.ofString(ctx.Next.GetStaticProps.params.lang)
  type props = {"content": Arg.t}
  type params = Arg.Params.t
  let getStaticProps: Next.GetStaticProps.t<props, params, void> = ctx => {
    Arg.getContent(ctx.params) |> Js.Promise.then_(content =>
      Js.Promise.resolve({
        "props": {"content": content},
      })
    )
  }

  let default = (props: props) => {
    Arg.make(Arg.makeProps(~content=props["content"], ()))
  }
  // let default = (props: props) => {
  //   switch Arg.Content.ofJson(props["content"]) {
  //   | None => failwith("BUG: Unable to parse content")
  //   | Some(content: Arg.Content.t) => Arg.make(Arg.makeProps(~content, ()))
  //   }
  // }
}
