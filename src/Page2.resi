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

module Make: Arg => S
