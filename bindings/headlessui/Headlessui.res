module Popover = {
  type popoverChildrenRenderProps = {@as("open") open_: bool}

  @module("@headlessui/react") @react.component
  external make: (
    ~as_: string=?,
    ~children: popoverChildrenRenderProps => React.element=?,
    ~className: string=?,
  ) => React.element = "Popover"

  module Overlay = {
    @module("@headlessui/react") @scope("Popover") @react.component
    external make: (~as_: string=?, ~children: 'children=?, ~className: string=?) => React.element =
      "Overlay"
  }

  module Button = {
    @module("@headlessui/react") @scope("Popover") @react.component
    external make: (~as_: string=?, ~children: 'children=?, ~className: string=?) => React.element =
      "Button"
  }

  module Panel = {
    @module("@headlessui/react") @scope("Popover") @react.component
    external make: (
      ~as_: string=?,
      ~focus: bool=?,
      ~static: bool=?,
      ~unmount: bool=?,
      ~children: 'children=?,
      ~className: string=?,
    ) => React.element = "Panel"
  }

  module Group = {
    @module("@headlessui/react") @scope("Popover") @react.component
    external make: (~as_: string=?, ~children: 'children=?, ~className: string=?) => React.element =
      "Group"
  }
}

module Transition = {
  @module("@headlessui/react") @react.component
  external make: (
    ~show: bool,
    ~as_: string=?,
    ~appear: bool=?,
    ~unmount: bool=?,
    ~enter: string=?,
    ~enterFrom: string=?,
    ~enterTo: string=?,
    ~leave: string=?,
    ~leaveFrom: string=?,
    ~leaveTo: string=?,
    ~beforeEnter: unit => unit=?,
    ~afterEnter: unit => unit=?,
    ~beforeLeave: unit => unit=?,
    ~afterLeave: unit => unit=?,
    ~children: 'children=?,
    ~className: string=?,
  ) => React.element = "Transition"

  module Child = {
    @module("@headlessui/react") @scope("Transition") @react.component
    external make: (
      ~as_: string=?,
      ~appear: bool=?,
      ~unmount: bool=?,
      ~enter: string=?,
      ~enterFrom: string=?,
      ~enterTo: string=?,
      ~leave: string=?,
      ~leaveFrom: string=?,
      ~leaveTo: string=?,
      ~beforeEnter: unit => unit=?,
      ~afterEnter: unit => unit=?,
      ~beforeLeave: unit => unit=?,
      ~afterLeave: unit => unit=?,
      ~children: 'children,
      ~className: string=?,
    ) => React.element = "Child"
  }
}
