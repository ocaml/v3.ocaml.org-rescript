open! Import

module Redirect: {
  @react.component
  let make: (~path: string) => React.element
}

@react.component
let make: unit => React.element
