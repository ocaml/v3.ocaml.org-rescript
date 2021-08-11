module MarkArray: {
  type t = {
    positions: LatLng.t,
    name: string,
  }
}
type props = {
  "marginBottom": option<Tailwind.Breakpoint.t<Tailwind.Margin.Bottom.t>>,
  "zoom": float,
  "minZoom": float,
  "center": LatLng.t,
  "position": array<Ood.Academic_institution.t>,
  "scrollWheelZoom": bool,
  "attribution": string,
  "url": string,
  "maxBound": LatLng.bound,
}

@react.component
let make: (~props: props) => React.element
let default: {"props": props} => React.element
