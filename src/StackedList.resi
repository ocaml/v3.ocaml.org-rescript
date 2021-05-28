type item = {
  link: string,
  title: string,
}

@react.component
let make: (
  ~items: array<item>,
  ~itemIcon: (~display: string, ~marginRight: string) => React.element,
) => React.element
