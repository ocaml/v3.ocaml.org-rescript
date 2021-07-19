open! Import

@react.component
let make: (
  ~title: string=?,
  ~borderStyle: string=?,
  ~titleTextColor: string=?,
  ~children: React.element,
) => React.element
