type t = {
  title: string,
  pageDescription: string,
  events: array<Ood.Event.t>,
}

include Page2.S with type t := t
