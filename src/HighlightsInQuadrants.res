module Link = Next.Link

let s = React.string

// TODO: add .resi file

// TODO: move this into its own top level module
module Story = {
  type t = {
    title: string,
    link: string,
  }
}

module Category = {
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

let seeAllArrowIcon = display =>
  <svg
    className={`${display} h-6 w-6`}
    viewBox="0 0 26 25"
    fill="none"
    xmlns="http://www.w3.org/2000/svg">
    <path
      d="M24.7009 18.2874L16.7407 24.5136C16.069 25.039 14.9924 25.0414 14.3184 24.5189C13.6443 23.9964 13.6425 23.158 14.3143 22.6326L19.386 18.6919L7.37509 18.7179C3.3378 18.7266 0.0351176 16.1663 0.0283118 13.0226L0.00313026 1.39059C0.00154224 0.657037 0.774053 0.052805 1.71609 0.0507657C2.65812 0.0487263 3.43324 0.649608 3.43483 1.38316L3.46001 13.0151C3.4637 14.718 5.24978 16.0765 7.403 16.0718L19.3803 16.0459L14.2914 12.0747C13.6174 11.5522 13.6156 10.7139 14.2873 10.1885C14.6232 9.92577 15.0603 9.79383 15.4977 9.79288C15.935 9.79193 16.3727 9.92198 16.7097 10.1832L24.6968 16.3749C25.3709 16.9236 25.3727 17.762 24.7009 18.2874Z"
      fill="#ED7109"
    />
  </svg>

@react.component
let make = (~margins, ~content) => {
  let title =
    <h2 className="text-orangedark text-3xl mb-5 lg:text-4xl font-bold text-center">
      {s(content.title)}
    </h2>

  let archiveButton =
    <div className="text-center">
      <Link href=content.archiveUrl>
        <a className="bg-orangedark text-white px-10 py-3 rounded"> {s(content.goToArchive)} </a>
      </Link>
    </div>

  let categoryHighlights = (category: Category.t) => {
    let heading =
      <h3 className="text-orangedark text-2xl font-bold mb-2">
        {category.icon(~display="inline", ~marginLeft="ml-2", ~marginRight="mr-4")}
        {s(category.header)}
      </h3>

    let newsItemRow = (idx, story: Story.t) =>
      // TODO: use overflow hidden to truncate story text
      <li className="font-bold" key={Js.Int.toString(idx)}>
        <a href=story.link target="_blank"> {s(story.title)} </a>
      </li>

    let seeAll =
      <p className="text-center">
        <Link href=category.seeAllLink>
          <a> {seeAllArrowIcon("inline")} {s(category.seeAllInCategory)} </a>
        </Link>
      </p>

    <div>
      heading
      <div className="bg-white rounded pt-4 px-8 pb-2">
        <ul className="space-y-3 mb-2">
          {category.stories
          |> Js.Array.mapi((story, idx) => newsItemRow(idx, story))
          |> React.array}
        </ul>
        seeAll
      </div>
    </div>
  }

  <SectionContainer.MediumCentered margins paddingX="px-12">
    title
    <div className="lg:grid lg:grid-cols-2 mb-9 gap-x-9 gap-y-3">
      {categoryHighlights(content.topLeftCategory)}
      {categoryHighlights(content.topRightCategory)}
      {categoryHighlights(content.bottomLeftCategory)}
      {categoryHighlights(content.bottomRightCategory)}
    </div>
    archiveButton
  </SectionContainer.MediumCentered>
}
