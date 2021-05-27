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

  let mapWithDefaultEmpty = (option, f) => option->Belt.Option.mapWithDefault("", f)

  // TODO: what is the best method to abstract over the parameter to Breakpoint.t
  let toClassNames = (uc, toClassName) =>
    // TODO: use rescript-classnames library
    Js.String.concatMany(
      [
        toClassName(uc.base),
        " ",
        uc.sm->mapWithDefaultEmpty(m => "sm:" ++ toClassName(m)),
        " ",
        uc.md->mapWithDefaultEmpty(m => "md:" ++ toClassName(m)),
        " ",
        uc.lg->mapWithDefaultEmpty(m => "lg:" ++ toClassName(m)),
      ],
      "",
    )

  let toClassNamesOrEmpty = (uc, toClassName) =>
    uc->mapWithDefaultEmpty(uc => toClassNames(uc, toClassName))
}

// TODO: correct? better construct to express this?
/*
module type UtilityClassGroup = {
  type t // the approach does not work because t is abstract

  let toClassName: t => string
}
*/

module MarginBottom /* : UtilityClassGroup */ = {
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
/*
module type UtilityClassGroupUtilities = {
  type t

  let toClassNamesOrEmpty: option<Breakpoint.t<t>> => string
} */

// TODO: Is there a better way to pair MarginBottom and MarginBottomUtilities?
module MarginBottomUtilities /* : UtilityClassGroupUtilities */ = {
  type t = MarginBottom.t

  let toClassNamesOrEmpty = mb => Breakpoint.toClassNamesOrEmpty(mb, MarginBottom.toClassName)
}
