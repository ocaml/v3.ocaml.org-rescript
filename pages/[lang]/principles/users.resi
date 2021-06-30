module Company: {
  type t = {
    logo: string,
    name: string,
    customWidth: option<string>,
    needsRounding: bool,
    website: string,
  }
}
type highlightContent = {
  highlightItem: string,
  bgImageClass: string,
}
type t = {
  companies: array<Company.t>,
  highlightContent: highlightContent,
}

include Pages.S with type t := t
