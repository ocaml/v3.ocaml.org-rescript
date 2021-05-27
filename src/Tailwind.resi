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
}

module MarginBottomByBreakpoint: {
  type t
  let make: (
    MarginBottom.t,
    ~sm: MarginBottom.t=?,
    ~md: MarginBottom.t=?,
    ~lg: MarginBottom.t=?,
    unit,
  ) => t
  let toClassNamesOrEmpty: option<t> => string
}
