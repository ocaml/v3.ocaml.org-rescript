open! Import

open! Import

module Small: {
  @react.component
  let make: (
    ~header: string,
    ~body: string,
    ~link: string,
    ~linkText: string,
    ~image: string,
  ) => React.element
}

@react.component
let make: (
  ~imageHeight: string,
  ~imageWidth: string=?,
  ~isRounded: bool=?,
  ~image: string,
  ~imageSide: [#Left | #Right],
  ~children: React.element,
) => React.element
