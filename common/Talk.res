type t = {
  id: int,
  name: string,
  author: string,
  creationDate: string,
  link: string,
}

// @module("js-yaml") external load: (string, ~options: 'a=?, unit) => array<t> = "load"
@module("js-yaml") external load: (string, ~options: 'a=?, unit) => Js.Json.t = "load"

let decode = json => {
  id: json |> Json.Decode.field("id", Json.Decode.int),
  name: json |> Json.Decode.field("name", Json.Decode.string),
  author: json |> Json.Decode.field("author", Json.Decode.string),
  creationDate: json |> Json.Decode.field("creationDate", Json.Decode.string),
  link: json |> Json.Decode.field("link", Json.Decode.string),
}

let readAll = () => {
  let databasePath = "data/talks.yaml"
  let fileContents = Fs.readFileSync(databasePath)
  let talksJson = load(fileContents, ())
  talksJson |> Json.Decode.array(decode)
  // TODO: return a validation type and force client to raise exception
}
