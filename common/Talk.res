type t = {
  id: int,
  name: string,
  author: string,
  creationDate: string,
  link: string,
}

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
  let talksJson = JsYaml.load(fileContents, ())
  talksJson |> Json.Decode.array(decode)
}
