module LabelledLink: {
  type t = {
    label: string,
    link: string,
  }
}

module Story: {
  type t = {
    title: string,
    link: string,
  }
}

module CategoryHeaderIcon: {
  type t = Meet | Package | Profit | Calendar
}

module Category: {
  type t = {
    header: string,
    seeAllInCategory: string,
    seeAllLink: string,
    stories: array<Story.t>,
    icon: CategoryHeaderIcon.t,
  }
}

type t = {
  title: string,
  topLeftCategory: Category.t,
  topRightCategory: Category.t,
  bottomLeftCategory: Category.t,
  bottomRightCategory: Category.t,
  goToArchive: LabelledLink.t,
}

let seeAllArrowIcon: string => React.element

@react.component
let make: (
  ~content: t,
  ~marginBottom: Tailwind.ByBreakpoint.t<Tailwind.MarginBottom.t>=?,
) => React.element
