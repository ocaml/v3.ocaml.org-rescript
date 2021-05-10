type t = Ood.Papers.Paper.t

let decode = json => {
  open Json.Decode
  {
    Ood.Papers.Paper.title: json |> field("title", string),
    publication: json |> field("publication", string),
    authors: json |> field("authors", list(string)),
    abstract: json |> field("abstract", string),
    tags: json |> field("tags", list(string)),
    year: json |> field("year", int),
    // TODO: why are we allowing a list of links, instead of having a single link
    links: json |> field("links", list(string)),
  }
}
