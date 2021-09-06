let s = React.string
module MapContainer = Mapbinding.MapContainer
module TileLayer = Mapbinding.TileLayer
module Popup = Mapbinding.Popup
module Marker = Mapbinding.Marker

module MarkArray = {
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
let make = (~props: props) => {
  let marginBottom = props["marginBottom"]
  let zoom = props["zoom"]
  let center = props["center"]
  let acads = props["position"]
  let minZoom = props["minZoom"]
  let attribution = props["attribution"]
  let url = props["url"]
  let maxBound = props["maxBound"]
  let scrollWheelZoom = props["scrollWheelZoom"]
  let options = {
    Mapbinding.iconUrl: "/static/marker-icon.png",
    iconSize: {
      x: 25.0,
      y: 46.0,
    },
    iconAnchor: {
      x: 13.0,
      y: 46.0,
    },
  }
  let icon = Mapbinding.icon(Mapbinding.leaflet, ~options)
  let p = acads->Belt.Array.map((c: Ood.Academic_institution.t) => {
    MarkArray.name: c.Ood.Academic_institution.name,
    MarkArray.positions: {
      Mapbinding.LatLng.lat: switch c.Ood.Academic_institution.location {
      | None => 0.0
      | Some(location) => location.lat
      },
      lng: switch c.Ood.Academic_institution.location {
      | None => 0.0
      | Some(location) => location.long
      },
    },
  })

  <>
    <SectionContainer.MediumCentered ?marginBottom paddingX="px-12">
      <h2 className="mb-16 text-grey-900 text-3xl mb-5 lg:text-4xl font-bold text-center">
        {s("OCaml Courses around the World")}
      </h2>
    </SectionContainer.MediumCentered>
    <SectionContainer.ResponsiveCentered ?marginBottom>
      // TODO: try switching to a grid
      <div className="bg-white flex-wrap justify-center lg:justify-between m-8 ">
        <MapContainer center zoom scrollWheelZoom maxBounds=maxBound minZoom className="h-160">
          <TileLayer attribution url noWrap=true />
          {p
          |> Array.map(c =>
            <Marker key={c.name} position=c.MarkArray.positions icon>
              <Popup className="h-16 font-bold text-md text-center ">
                {React.string(c.name)}
              </Popup>
            </Marker>
          )
          |> React.array}
        </MapContainer>
      </div>
    </SectionContainer.ResponsiveCentered>
  </>
}
let default = make
