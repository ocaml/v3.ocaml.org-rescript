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

  type t =
    | Mb2
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
    | Mb2 => "mb-2"
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

// TODO: correct? better construct to express this?
module UtilityClassGroupUtilities = {
  let toClassNamesOrEmpty: 'a => string = _ => ""
}

// TODO: Is there a better way to pair MarginBottom and MarginBottomUtilities?
module MarginBottomUtilities = {
  include UtilityClassGroupUtilities

  let toClassNamesOrEmpty = mb => Breakpoint.toClassNamesOrEmpty(mb, MarginBottom.toClassName)
}
