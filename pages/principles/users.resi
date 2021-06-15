module Company: {
  type t = {
    logo: string,
    name: string,
    customWidth: option<string>,
    needsRounding: bool,
    website: string,
  }
}

type t = {
  title: string,
  pageDescription: string,
  companies: array<Company.t>,
}

include Page2.P2.S
