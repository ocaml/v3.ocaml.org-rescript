type t = Ood.Events.Event.t

let decode = json => {
  open Json.Decode
  {
    Ood.Events.Event.title: json |> field("title", string),
    description: json |> field("description", string),
    url: json |> field("url", string),
    date: json |> field("date", date) |> Js.Date.toISOString,
    online: json |> field("online", bool),
    textual_location: json |> optional(field("textual_location", string)),
    tags: json |> field("tags", list(string)),
    // TODO: This is encoded as a GeoJSON string, would be good to decode it
    location: json |> optional(field("location", string)),
  }
}

external fromJson: Js.Json.t => t = "%identity"
external toJson: t => Js.Json.t = "%identity"
