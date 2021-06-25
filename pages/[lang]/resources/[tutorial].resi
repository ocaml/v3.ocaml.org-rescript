type t = {
  source: string,
  title: string,
  pageDescription: string,
  tableOfContents: string,
}

include Page2.S with type t := t
