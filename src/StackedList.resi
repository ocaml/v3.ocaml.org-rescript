type item = {
  link: string,
  title: string,
}

@react.component
let make: (~items: array<item>, ~itemIcon: React.element) => React.element
