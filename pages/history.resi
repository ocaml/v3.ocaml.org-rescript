module Timeline: {
  module Item: {
    type t = {date: string, description: string}
  }
}

type t = {
  title: string,
  pageDescription: string,
  timeline: array<Timeline.Item.t>,
}

include Page2.S with type t := t
