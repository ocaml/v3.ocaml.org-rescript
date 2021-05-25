module Content: {
  type t = {
    title: string,
    pageDescription: string,
  }

  let make: Lang.t => t
}

@react.component
let make: (~content: Content.t=?) => React.element

let default: {"content": option<Content.t>} => React.element
