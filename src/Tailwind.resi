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
/*
module type MakeByBreakpointType = {
  type itemType
  type t
  let make: (itemType, ~sm: itemType=?, ~md: itemType=?, ~lg: itemType=?, unit) => t
  // let toClassNames: t => string
  let toClassNamesOrEmpty: option<t> => string
}
*/
module MarginBottomByBreakpoint: {
  type item = MarginBottom.t
  type t
  let make: (item, ~sm: item=?, ~md: item=?, ~lg: item=?, unit) => t
  let toClassNamesOrEmpty: option<t> => string
}
