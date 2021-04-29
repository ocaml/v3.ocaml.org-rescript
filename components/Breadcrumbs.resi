type entry = {
  name: string,
  url: string,
}

@react.component
let make: (~entries: array<entry>) => React.element
