module Story: {
  type t = {
    title: string,
    link: string,
  }
}

module Category: {
  type t = {
    header: string,
    seeAllInCategory: string,
    seeAllLink: string,
    stories: array<Story.t>,
    icon: (~display: string, ~marginLeft: string, ~marginRight: string) => React.element,
  }
}

type t = {
  title: string,
  topLeftCategory: Category.t,
  topRightCategory: Category.t,
  bottomLeftCategory: Category.t,
  bottomRightCategory: Category.t,
  archiveUrl: string,
  goToArchive: string,
}

let seeAllArrowIcon: string => React.element

@react.component
let make: (~margins: string, ~content: t) => React.element
