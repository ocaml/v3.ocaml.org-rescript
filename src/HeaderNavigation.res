module Link = Next.Link

let s = React.string

// TODO: change NavEntry.t to HeaderNavEntry.t, which has additional info like icon
type section = {
  header: string,
  entries: array<NavEntry.t>,
}

type content = {
  principlesSection: section,
  resourcesSection: section,
  communitySection: section,
  search: string,
  openMenu: string,
}

type activatedEntry =
  | Principles
  | Resources
  | Community

@react.component
let make = (~content) => {
  let (activeMenu, setActiveMenu) = React.useState(_ => None)

  let hideMenu = _evt => {setActiveMenu(_ => None)}

  let toggleMenu = (entry, _evt) => {
    setActiveMenu(prev =>
      switch prev {
      | Some(activated) if activated == entry => None
      | Some(_) => Some(entry)
      | None => Some(entry)
      }
    )
  }

  let (mobileDropdownVisible, setMobileDropdownVisible) = React.useState(_ => false)

  let hideMobileMenu = _evt => {setMobileDropdownVisible(_ => false)}

  let showMobileMenu = _evt => {setMobileDropdownVisible(_ => true)}

  <div className="relative font-roboto">
    <div className="max-w-7xl mx-auto px-4 sm:px-6 ">
      <div className="flex justify-between items-center md:justify-start py-6 md:space-x-10 ">
        <div className="flex justify-start ">
          <a href="/" className="">
            <img className="h-8 w-auto sm:h-10" src="/static/logo1.jpeg" alt="" />
          </a>
        </div>
        <nav className="hidden md:flex space-x-10 ">
          <FlyoutMenu name="Principles" items=content.principlesSection.entries />
          <FlyoutMenu name="Resources" items=content.resourcesSection.entries />
          <FlyoutMenu name="Community" items=content.communitySection.entries />
        </nav>
        <div className="flex-1 flex items-center justify-center px-2 md:justify-end ">
          <div className="max-w-lg w-full md:max-w-xs">
            <label htmlFor="search" className="sr-only"> {s(content.search)} </label>
            <form id="searchform" method="get" action="https://duckduckgo.com/">
              <input type_="hidden" name="sites" value="ocaml.org" />
              <div className="relative">
                <div
                  className="absolute inset-y-0 left-0 pl-3 flex items-center pointer-events-none">
                  <svg
                    className="h-5 w-5 text-gray-400"
                    xmlns="http://www.w3.org/2000/svg"
                    viewBox="0 0 20 20"
                    fill="currentColor"
                    ariaHidden=true>
                    <path
                      fillRule="evenodd"
                      d="M8 4a4 4 0 100 8 4 4 0 000-8zM2 8a6 6 0 1110.89 3.476l4.817 4.817a1 1 0 01-1.414 1.414l-4.816-4.816A6 6 0 012 8z"
                      clipRule="evenodd"
                    />
                  </svg>
                </div>
                <input
                  id="search"
                  name="q"
                  className="block w-full pl-10 pr-3 py-2 border border-gray-300 rounded-md leading-5 bg-white placeholder-gray-500 focus:outline-none focus:placeholder-gray-400 focus:ring-1 focus:ring-orangedark focus:border-orangedarker sm:text-sm"
                  placeholder=content.search
                  type_="search"
                />
              </div>
            </form>
          </div>
        </div>
        <div className="-mr-2 -my-2 md:hidden ">
          <button
            type_="button"
            onClick=showMobileMenu
            className="bg-white rounded-md p-2 inline-flex items-center justify-center text-gray-400 hover:text-gray-500 hover:bg-gray-100 focus:outline-none focus:ring-2 focus:ring-inset focus:ring-indigo-500">
            <span className="sr-only"> {s(content.openMenu)} </span>
            <svg
              className="h-6 w-6"
              xmlns="http://www.w3.org/2000/svg"
              fill="none"
              viewBox="0 0 24 24"
              stroke="currentColor"
              ariaHidden=true>
              <path
                strokeLinecap="round"
                strokeLinejoin="round"
                strokeWidth="2"
                d="M4 6h16M4 12h16M4 18h16"
              />
            </svg>
          </button>
        </div>
      </div>
    </div>
    <div
      className={"absolute top-0 inset-x-0 p-2 transition transform origin-top-right md:hidden z-10 " ++
      switch mobileDropdownVisible {
      | true => " "
      | false => " hidden "
      }}>
      <div
        className="rounded-lg shadow-lg ring-1 ring-black ring-opacity-5 bg-white divide-y-2 divide-gray-50">
        <div className="pt-5 pb-6 px-5">
          <div className="flex items-center justify-between">
            <div> <img className="h-8 w-auto sm:h-10" src="/static/logo1.jpeg" alt="" /> </div>
            <div className="-mr-2">
              <button
                type_="button"
                onClick=hideMobileMenu
                className="bg-white rounded-md p-2 inline-flex items-center justify-center text-gray-400 hover:text-gray-500 hover:bg-gray-100 focus:outline-none focus:ring-2 focus:ring-inset focus:ring-indigo-500">
                <span className="sr-only"> {s(` Close menu `)} </span>
                <svg
                  className="h-6 w-6"
                  xmlns="http://www.w3.org/2000/svg"
                  fill="none"
                  viewBox="0 0 24 24"
                  stroke="currentColor"
                  ariaHidden=true>
                  <path
                    strokeLinecap="round"
                    strokeLinejoin="round"
                    strokeWidth="2"
                    d="M6 18L18 6M6 6l12 12"
                  />
                </svg>
              </button>
            </div>
          </div>
          <div className="mt-6">
            <nav className="grid gap-y-2">
              {Js.Array.concatMany(
                Js.Array.map(
                  (section: section) =>
                    Js.Array.concat(
                      Js.Array.mapi(
                        (e: NavEntry.t, idx) =>
                          <Link href=e.url key={Js.Int.toString(idx)}>
                            <a
                              onClick=hideMobileMenu
                              className="text-gray-600 hover:bg-gray-50 hover:text-gray-900 group flex items-center px-2 py-2 text-sm font-medium rounded-md">
                              <span
                                className="text-gray-400 group-hover:text-gray-500 mr-3 flex-shrink-0 h-5 w-5 stroke-current fill-current stroke-2">
                                {e.icon}
                              </span>
                              <span className="font-bold"> {s(e.label)} </span>
                            </a>
                          </Link>,
                        section.entries,
                      ),
                      [
                        <h3 className="ml-6 mt-2 px-3 font-semibold text-gray-400 uppercase">
                          {s(section.header)}
                        </h3>,
                      ],
                    ),
                  [content.principlesSection, content.resourcesSection, content.communitySection],
                ),
                [],
              ) |> React.array}
            </nav>
          </div>
        </div>
      </div>
    </div>
  </div>
}
