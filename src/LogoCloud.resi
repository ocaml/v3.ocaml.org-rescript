module Company: {
  type t = {
    logoSrc: option<string>,
    name: string,
    website: string,
  }
}

@react.component
let make: (~companies: array<Company.t>, ~addNameText: bool=?) => React.element
