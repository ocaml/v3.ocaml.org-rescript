module Company: {
  type t = {
    logoSrc: string,
    name: string,
    website: string,
  }
}

@react.component
let make: (~companies: array<Company.t>, ~addNameText: bool=?) => React.element
