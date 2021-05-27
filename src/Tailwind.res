module type UtilityClassGroup = {
  type t
  let toClassName: t => string
}

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

module type MakeByBreakpointType = (Group: UtilityClassGroup) =>
{
  type t
  let make: (Group.t, ~sm: Group.t=?, ~md: Group.t=?, ~lg: Group.t=?, unit) => t
  // TODO: expose this later once we have a use case for using it.
  // let toClassNames: t => string
  let toClassNamesOrEmpty: option<t> => string
}

module MakeByBreakpoint: MakeByBreakpointType = (Group: UtilityClassGroup) => {
  type t = {
    base: Group.t,
    sm: option<Group.t>,
    md: option<Group.t>,
    lg: option<Group.t>,
  }

  let make = (base, ~sm=?, ~md=?, ~lg=?, ()) => {
    base: base,
    sm: sm,
    md: md,
    lg: lg,
  }

  let mapWithDefaultEmpty = (option, f) => option->Belt.Option.mapWithDefault("", f)

  let toClassNames = uc =>
    // TODO: use rescript-classnames library
    Js.String.concatMany(
      [
        Group.toClassName(uc.base),
        " ",
        uc.sm->mapWithDefaultEmpty(m => `sm:${Group.toClassName(m)}`),
        " ",
        uc.md->mapWithDefaultEmpty(m => `md:${Group.toClassName(m)}`),
        " ",
        uc.lg->mapWithDefaultEmpty(m => `lg:${Group.toClassName(m)}`),
      ],
      "",
    )

  let toClassNamesOrEmpty = uc => uc->mapWithDefaultEmpty(toClassNames)
}

module MarginBottomByBreakpoint = MakeByBreakpoint(MarginBottom)
