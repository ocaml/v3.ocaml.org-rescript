module MarginBottom: {
  type t = [
    | #mb2
    | #mb4
    | #mb6
    | #mb10
    | #mb11
    | #mb16
    | #mb20
    | #mb24
    | #mb32
    | #mb36
  ]

  let toClassName: t => string
}

module Breakpoint: {
  type t<'a>

  let make: ('a, ~sm: 'a=?, ~md: 'a=?, ~lg: 'a=?, unit) => t<'a>

  let toClassNames: (t<'a>, 'a => string) => string

  let toClassNamesOrEmpty: (option<t<'a>>, 'a => string) => string
}

module MarginBottomUtilities: {
  type t = MarginBottom.t

  let toClassNamesOrEmpty: option<Breakpoint.t<t>> => string
}
