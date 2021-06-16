type t = {
  title: string,
  pageDescription: string,
  papers: array<Paper.t>,
}

include Page2.S with type t := t
