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

module Make = (Arg: Arg): (S with type t := Arg.content) => {
  type t = Arg.content
  type props<'a> = {content: 'a}
  type params = {.}
  let getStaticProps: Next.GetStaticProps.t<props<t>, params, void> = _ctx => {
    // let lang = Lang.ofString(ctx.Next.GetStaticProps.params.lang)
    let lang = #en
    Arg.getContent(lang) |> Js.Promise.then_(content =>
      Js.Promise.resolve({
        "props": {content: content},
      })
    )
  }
  let default = (props: props<t>) => Arg.component(props.content)
}
