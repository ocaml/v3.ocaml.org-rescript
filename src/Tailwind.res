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

  // TODO: what is the best method to abstract over the parameter to Breakpoint.t
  let toClassNames = (mb, toClassName) =>
    // TODO: use rescript-classnames library
    Js.String.concatMany(
      [
        toClassName(mb.base),
        " ",
        mb.sm->Util.Option.mapWithDefaultEmpty(m => "sm:" ++ toClassName(m)),
        " ",
        mb.md->Util.Option.mapWithDefaultEmpty(m => "md:" ++ toClassName(m)),
        " ",
        mb.lg->Util.Option.mapWithDefaultEmpty(m => "lg:" ++ toClassName(m)),
      ],
      "",
    )

  let toClassNamesOrEmpty = (mb, toClassName) =>
    mb->Util.Option.mapWithDefaultEmpty(uc => toClassNames(uc, toClassName))
}

// TODO: correct? better construct to express this?
module UtilityClassGroup = {
  let toClassName: 'a => string = _ => ""
}

module MarginBottom = {
  include UtilityClassGroup

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

  let toClassName = mb =>
    switch mb {
    | #mb2 => "mb-2"
    | #mb4 => "mb-4"
    | #mb6 => "mb-6"
    | #mb10 => "mb-10"
    | #mb11 => "mb-11"
    | #mb16 => "mb-16"
    | #mb20 => "mb-20"
    | #mb24 => "mb-24"
    | #mb32 => "mb-32"
    | #mb36 => "mb-36"
    }
}

// TODO: correct? better construct to express this?
module UtilityClassGroupUtilities = {
  let toClassNamesOrEmpty: 'a => string = _ => ""
}

// TODO: Is there a better way to pair MarginBottom and MarginBottomUtilities?
module MarginBottomUtilities = {
  include UtilityClassGroupUtilities

  let toClassNamesOrEmpty = mb => Breakpoint.toClassNamesOrEmpty(mb, MarginBottom.toClassName)
}
