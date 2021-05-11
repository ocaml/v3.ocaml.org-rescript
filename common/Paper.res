type t = {
  title: string,
  publication: string,
  authors: array<string>,
  abstract: string,
  tags: array<string>,
  year: int,
  links: array<string>,
}

let decode = json => {
  open Json.Decode
  {
    title: json |> field("title", string),
    publication: json |> field("publication", string),
    authors: json |> field("authors", array(string)),
    abstract: json |> field("abstract", string),
    tags: json |> field("tags", array(string)),
    year: json |> field("year", int),
    // TODO: why is this a list of links instead of a single link?
    links: json |> field("links", array(string)),
  }
}

let decodeList = json => {
  open Json.Decode

  {
    json |> field("papers", array(decode))
  }
}

let readAll = () => {
  "ood/data/papers.yml"->Fs.readFileSync->JsYaml.load()->decodeList
}
