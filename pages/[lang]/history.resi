open! Import

type t = {
  title: string,
  pageDescription: string,
  timeline: array<Timeline.Item.t>,
}

include Pages.S with type t := t
