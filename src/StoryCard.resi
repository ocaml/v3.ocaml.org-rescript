open! Import

module CornerTitleLogo: {
  @react.component
  let make: (
    ~title: string,
    ~graphicUrl: string,
    ~body: string,
    ~colored: bool=?,
    ~bordered: bool=?,
    ~largerText: bool=?,
  ) => React.element
}

module CornerLogoCenterTitle: {
  @react.component
  let make: (
    ~title: string,
    ~graphicUrl: string,
    ~body: string,
    ~buttonText: string=?,
  ) => React.element
}
