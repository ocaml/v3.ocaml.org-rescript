module Simple: {
  type t = {
    headers: array<string>,
    // The string is a unique identifier for the row for the key prop
    data: array<(string, array<React.element>)>,
  }

  @react.component
  let make: (~content: t) => React.element
}
