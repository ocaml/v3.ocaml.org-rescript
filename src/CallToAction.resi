module LinkUrl: {
  type t = Route(string) | External(string)
}

type t = {
  title: string,
  body: string,
  buttonLink: LinkUrl.t,
  buttonText: string,
}

module General: {
  type width = Narrow | Regular

  type colorStyle = BackgroundFilled | Transparent | TransparentPlainHeader

  type buttonStyle = Short | Normal

  @react.component
  let make: (
    ~content: t,
    ~colorStyle: colorStyle,
    ~width: width,
    ~buttonStyle: buttonStyle,
    ~marginBottom: Tailwind.ByBreakpoint.t<Tailwind.MarginBottom.t>=?,
    unit,
  ) => React.element
}

module Embedded: {
  @react.component
  let make: (~content: t) => React.element
}
