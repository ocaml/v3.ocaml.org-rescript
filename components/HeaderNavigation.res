module Link = Next.Link

let s = React.string

type content = {
  industry: string,
  resources: string,
  community: string,
  search: string,
  openMenu: string,
}

@react.component
let make = (~content) => {
  // TODO: single state variable for all buttons
  let (activated, setActivated) = React.useState(_ => false)

  let onClickIndustry = (_evt) => {
    setActivated(prev => !prev)
  }

  <div className="max-w-7xl mx-auto px-4 sm:px-6">
    <div className="flex justify-between items-center md:justify-start py-6 md:space-x-10 ">
      <div className="flex justify-start  ">
        <a href="/" className="bg-blue-100">
          <img className="h-8 w-auto sm:h-10" src="/static/logo1.jpeg" alt="" />
        </a>
      </div>
      <nav className="hidden md:flex space-x-10 ">
        <div className="relative">
          // Item active: "text-gray-600", Item inactive: "text-gray-400"
          <button onClick=onClickIndustry type_="button" className="text-gray-500 group bg-white rounded-md inline-flex items-center text-base font-medium hover:text-gray-900 focus:outline-none focus:ring-2 focus:ring-offset-2 focus:ring-orangedark" ariaExpanded=false>
            <span>{s(content.industry)}</span>
            // Item active: "text-gray-600", Item inactive: "text-gray-400"
            <svg className="text-gray-400 ml-2 h-5 w-5 group-hover:text-gray-500" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 20 20" fill="currentColor" ariaHidden=true>
              <path fillRule="evenodd" d="M5.293 7.293a1 1 0 011.414 0L10 10.586l3.293-3.293a1 1 0 111.414 1.414l-4 4a1 1 0 01-1.414 0l-4-4a1 1 0 010-1.414z" clipRule="evenodd" />
            </svg>
          </button>
          //  'Industry' flyout menu, show/hide based on flyout menu state.
          //  Entering: "transition ease-out duration-200"
          //    From: "opacity-0 translate-y-1"
          //    To: "opacity-100 translate-y-0"
          //  Leaving: "transition ease-in duration-150"
          //    From: "opacity-100 translate-y-0"
          //    To: "opacity-0 translate-y-1"
          <div className={"absolute z-10 left-1/2 transform -translate-x-1/2 mt-3 px-2 w-screen max-w-xs sm:px-0 " ++
            switch activated {
              | true => " opacity-100 translate-y-0 "
              | _ => " opacity-0 translate-y-1 "
              }
            }>
            <div className="rounded-lg shadow-lg ring-1 ring-black ring-opacity-5 overflow-hidden">
              <div className="relative grid gap-6 bg-white px-5 py-6 sm:gap-8 sm:p-8">
                <Link href="/industry/whatisocaml">
                  <a onClick=onClickIndustry className="-m-3 p-3 block rounded-md hover:bg-gray-50 transition ease-in-out duration-150">
                    <p className="text-base font-medium text-gray-900">
                      {s(`What is OCaml`)}
                    </p>
                  </a>
                </Link>
                <Link href="/industry/users">
                  <a onClick=onClickIndustry className="-m-3 p-3 block rounded-md hover:bg-gray-50 transition ease-in-out duration-150">
                    <p className="text-base font-medium text-gray-900">
                      {s(`Industrial Users`)}
                    </p>
                  </a>
                </Link>
                <Link href="/industry/successstories">
                  <a onClick=onClickIndustry className="-m-3 p-3 block rounded-md hover:bg-gray-50 transition ease-in-out duration-150">
                    <p className="text-base font-medium text-gray-900">
                      {s(`Success Stories`)}
                    </p>
                  </a>
                </Link>
              </div>
            </div>
          </div>

        </div>

        <span className="text-base font-medium text-gray-500"> {s(content.resources)} </span>
        <span className="text-base font-medium text-gray-500"> {s(content.community)} </span>
      </nav>
      <div className="flex-1 flex items-center justify-center px-2 md:justify-end ">
        <div className="max-w-lg w-full md:max-w-xs">
          <label htmlFor="search" className="sr-only"> {s(content.search)} </label>
          <form id="searchform" method="get" action="https://duckduckgo.com/">
            <input type_="hidden" name="sites" value="ocaml.org" />
            <div className="relative">
              <div className="absolute inset-y-0 left-0 pl-3 flex items-center pointer-events-none">
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
}