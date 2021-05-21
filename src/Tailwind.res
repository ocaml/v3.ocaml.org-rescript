// TODO: correct? better construct to express this?
module UtilityClassGroup = {
  let toClassName: 'a => string = _ => ""
}

module MarginBottom = {
  include UtilityClassGroup

  type t =
    | Mb4
    | Mb6
    | Mb10
    | Mb11
    | Mb16
    | Mb20
    | Mb24
    | Mb32
    | Mb36

  let toClassName = mb =>
    switch mb {
    | Mb4 => "mb-4"
    | Mb6 => "mb-6"
    | Mb10 => "mb-10"
    | Mb11 => "mb-11"
    | Mb16 => "mb-16"
    | Mb20 => "mb-20"
    | Mb24 => "mb-24"
    | Mb32 => "mb-32"
    | Mb36 => "mb-36"
    }
}

module Breakpoint = {
  type t<'a> = {
    base: 'a,
    sm: option<'a>,
    md: option<'a>,
    lg: option<'a>,
  }

  let make = (base, ~sm=?, ~md=?, ~lg=?, ()) => {
    base: base,
    sm: sm,
    md: md,
    lg: lg,
  }

  // TODO: abstract over type parameter
  let toClassNames = (mb: t<MarginBottom.t>) =>
    Js.String.concatMany(
      [
        MarginBottom.toClassName(mb.base),
        " ",
        mb.sm->Belt.Option.mapWithDefault("", m => "sm:" ++ MarginBottom.toClassName(m)),
        " ",
        mb.md->Belt.Option.mapWithDefault("", m => "md:" ++ MarginBottom.toClassName(m)),
        " ",
        mb.lg->Belt.Option.mapWithDefault("", m => "lg:" ++ MarginBottom.toClassName(m)),
      ],
      "",
    )
}
