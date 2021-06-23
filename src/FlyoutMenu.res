module Popover = Headlessui.Popover
module Transition = Headlessui.Transition
module Link = Next.Link

type item = {
  name: string,
  description: string,
  href: string,
  icon: React.element,
}

@react.component
let make = (~name, ~items) =>
  <Popover className="relative">
    {({open_}) => <>
      <Popover.Button
        className={(
          open_ ? "text-gray-900 " : "text-gray-500 "
        ) ++ "group bg-white rounded-md inline-flex items-center text-base font-medium hover:text-gray-900 focus:outline-none focus:ring-2 focus:ring-offset-2 focus:ring-indigo-500"}>
        <span> {React.string(name)} </span>
        <svg
          className={(
            open_ ? "text-gray-600 " : "text-gray-400 "
          ) ++ "ml-2 h-5 w-5 group-hover:text-gray-500"}
          xmlns="http://www.w3.org/2000/svg"
          viewBox="0 0 20 20"
          fill="currentColor"
          ariaHidden=true>
          <path
            fillRule="evenodd"
            d="M5.293 7.293a1 1 0 011.414 0L10 10.586l3.293-3.293a1 1 0 111.414 1.414l-4 4a1 1 0 01-1.414 0l-4-4a1 1 0 010-1.414z"
            clipRule="evenodd"
          />
        </svg>
      </Popover.Button>
      <Transition
        show={open_}
        as_={"div"}
        enter="transition ease-out duration-200"
        enterFrom="opacity-0 translate-y-1"
        enterTo="opacity-100 translate-y-0"
        leave="transition ease-in duration-150"
        leaveFrom="opacity-100 translate-y-0"
        leaveTo="opacity-0 translate-y-1">
        <Popover.Panel
          static=true
          className="absolute z-10 left-1/2 transform -translate-x-1/2 mt-3 px-2 w-screen max-w-md sm:px-0">
          <div className="rounded-lg shadow-lg ring-1 ring-black ring-opacity-5 overflow-hidden">
            <div className="relative grid gap-6 bg-white px-5 py-6 sm:gap-8 sm:p-8">
              {Array.mapi(
                (idx, item: NavEntry.t) =>
                  <Link href=item.url key={Js.Int.toString(idx)}>
                    <a
                      key={item.label}
                      href={item.url}
                      className="-m-3 p-3 flex items-start rounded-lg hover:bg-gray-50 transition ease-in-out duration-150">
                      <i className="flex-shrink-0 h-6 w-6 text-indigo-600" ariaHidden=true>
                        {item.icon}
                      </i>
                      <div className="ml-4">
                        <p className="text-base font-medium text-gray-900">
                          {React.string(item.label)}
                        </p>
                        <p className="mt-1 text-sm text-gray-500"> {React.string(item.text)} </p>
                      </div>
                    </a>
                  </Link>,
                items,
              )->React.array}
            </div>
          </div>
        </Popover.Panel>
      </Transition>
    </>}
  </Popover>
