type date = {
  date: string,
  text: string,
}

type t = {
  title: string,
  pageDescription: string,
  introduction: string,
  dates: array<date>,
  presentations: array<Video.t>,
  papers: array<Paper.t>,
  // Committee too ?
}

include Page2.S with type t := t
