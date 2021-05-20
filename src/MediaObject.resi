type imageSide = Left | Right

@react.component
let make: (
  ~marginBottom: Tailwind.MarginBottom.t=?,
  ~imageHeight: string,
  ~imageWidth: string=?,
  ~isRounded: bool=?,
  ~image: string,
  ~imageSide: imageSide,
  ~children: React.element,
  unit,
) => React.element
