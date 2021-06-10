module BasicWithIcon: {
  module Item: {
    type t = {
      link: string,
      title: string,
    }
  }

  @react.component
  let make: (
    ~items: array<Item.t>,
    ~itemIcon: (~display: string, ~marginRight: string) => React.element,
  ) => React.element
}

module BasicWithDate: {
  module Item: {
    type t = {
      link: string,
      title: string,
      date: string,
    }
  }

  @react.component
  let make: (~items: array<Item.t>) => React.element
}
