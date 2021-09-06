module LatLng: {
  type t = {
    lat: float,
    lng: float,
  }
  type bound = {
    mib: t,
    mab: t,
  }
}
module Point: {
  type t = {
    x: float,
    y: float,
  }
}
module MapContainer: {
  @react.component
  let make: (
    ~className: string=?,
    ~center: LatLng.t,
    ~zoom: float,
    ~zoomControl: bool=?,
    ~scrollWheelZoom: bool,
    ~id: string=?,
    ~minZoom: float,
    ~maxBounds: LatLng.bound,
    ~children: React.element,
  ) => React.element
}
module TileLayer: {
  @react.component
  let make: (~attribution: string=?, ~noWrap: bool, ~url: string) => React.element
}
//Abstract Icon type
type icon

type iconOptions = {iconUrl: string, iconSize: Point.t, iconAnchor: Point.t}

// Abstract Leaflet Object type
type leaflet

// Binding to the Leaflet function `icon` which creates an Icon object
@send external icon: (leaflet, ~options: iconOptions) => icon = "icon"
@val external leaflet: leaflet = "L"

module Marker: {
  @react.component
  let make: (~position: LatLng.t, ~icon: icon=?, ~children: React.element=?) => React.element
}

module Popup: {
  @react.component
  let make: (
    ~maxWidth: int=?,
    ~minWidth: int=?,
    ~maxHeight: int=?,
    ~autoPan: bool=?,
    ~autoPanPaddingTopLeft: Point.t=?,
    ~autoPanPaddingBottomRight: Point.t=?,
    ~autoPanPadding: Point.t=?,
    ~keepInView: bool=?,
    ~closeButton: bool=?,
    ~autoClose: bool=?,
    ~closeOnEscapeKey: bool=?,
    ~closeOnClick: bool=?,
    ~className: string=?,
    ~children: React.element=?,
  ) => React.element
}
