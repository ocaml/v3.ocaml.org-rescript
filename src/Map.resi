module MarkArray: {
  type t = {
    positions: Mapbinding.LatLng.t,
    name: string,
  }
}
type props = {
  "marginBottom": option<Tailwind.Breakpoint.t<Tailwind.Margin.Bottom.t>>,
  "zoom": float,
  "minZoom": float,
  "center": Mapbinding.LatLng.t,
  "position": array<Ood.Academic_institution.t>,
  "scrollWheelZoom": bool,
  "attribution": string,
  "url": string,
  "maxBound": Mapbinding.LatLng.bound,
}

@react.component
let make: (~props: props) => React.element
let default: {"props": props} => React.element
