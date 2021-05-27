module MarginBottom = {
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

module ByBreakpoint = {
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

  let toClassNames = (brk, toClassName) =>
    // TODO: use rescript-classnames library
    Js.String.concatMany(
      [
        toClassName(brk.base),
        " ",
        brk.sm->mapWithDefaultEmpty(m => `sm:${toClassName(m)}`),
        " ",
        brk.md->mapWithDefaultEmpty(m => `md:${toClassName(m)}`),
        " ",
        brk.lg->mapWithDefaultEmpty(m => `lg:${toClassName(m)}`),
      ],
      "",
    )

  let toClassNamesOrEmpty = (brk, toClassName) =>
    brk->mapWithDefaultEmpty(brk => toClassNames(brk, toClassName))
}

module MarginBottomByBreakpoint = {
  let toClassNamesOrEmpty = brk => ByBreakpoint.toClassNamesOrEmpty(brk, MarginBottom.toClassName)
}
