module MapContainer = {
  @module("react-leaflet") @react.component
  external make: (
    ~className: string=?,
    ~center: LatLng.t,
    ~zoom: float,
    ~zoomControl: bool=?,
    ~scrollWheelZoom: bool,
    ~id: string=?,
    ~minZoom: float,
    ~maxBounds: LatLng.bound,
    ~children: React.element,
  ) => React.element = "MapContainer"
}
module TileLayer = {
  @module("react-leaflet") @react.component
  external make: (~attribution: string=?, ~noWrap: bool, ~url: string) => React.element =
    "TileLayer"
}
//Abstract Icon type
type icon

type iconOptions = {iconUrl: string, iconSize: Point.t, iconAnchor: Point.t}

// Abstract Leaflet Object type
type leaflet

// Binding to the Leaflet function `icon` which creates an Icon object
@send external icon: (leaflet, ~options: iconOptions) => icon = "icon"
@val external leaflet: leaflet = "L"

module Marker = {
  @module("react-leaflet") @react.component
  external make: (~position: LatLng.t, ~icon: icon=?, ~children: React.element=?) => React.element =
    "Marker"
}

module Popup = {
  @module("react-leaflet") @react.component
  external make: (
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
  ) => React.element = "Popup"
}
