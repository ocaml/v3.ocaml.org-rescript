let s = React.string

module BasicWithIcon = {
  module Item = {
    type t = {
      link: string,
      title: string,
    }
  }

  let rightArrow =
    <svg
      className="w-4"
      width="21"
      height="24"
      viewBox="0 0 21 24"
      fill="none"
      xmlns="http://www.w3.org/2000/svg">
      <path
        d="M20.5607 13.0607C21.1464 12.4749 21.1464 11.5251 20.5607 10.9393L11.0147 1.3934C10.4289 0.807611 9.47919 0.807611 8.8934 1.3934C8.30761 1.97919 8.30761 2.92893 8.8934 3.51472L17.3787 12L8.8934 20.4853C8.30761 21.0711 8.30761 22.0208 8.8934 22.6066C9.47919 23.1924 10.4289 23.1924 11.0147 22.6066L20.5607 13.0607ZM0 13.5L19.5 13.5V10.5L0 10.5L0 13.5Z"
        fill="#ED7109"
      />
    </svg>

  let itemRow = (item: Item.t, itemIcon) =>
    <a href=item.link target="_blank">
      <div className="flex justify-between items-center space-x-6">
        <div> itemIcon {s(item.title)} </div> rightArrow
      </div>
    </a>

  @react.component
  let make = (~items, ~itemIcon) => {
    <ul className="divide-y divide-gray-300">
      {items
      |> Array.map((item: Item.t) =>
        // TODO: accessible link; indicate that link opens new tab
        <li className="px-6 py-4" key=item.title>
          {itemRow(item, itemIcon(~display="hidden lg:inline-block", ~marginRight="mr-3"))}
        </li>
      )
      |> React.array}
    </ul>
  }
}

module BasicWithDate = {
  module Item = {
    type t = {
      link: string,
      title: string, // TODO: better name than title
      date: string, // TODO: real data type
    }
  }

  let rightArrow = {s(` -> `)}

  let itemRow = (item: Item.t) =>
    // TODO: is it okay to make an "a" tag into a grid??
    <a className="grid grid-cols-8 w-full " href=item.link target="_blank" key=item.title>
      <div className="text-yellow-600 col-span-5 font-semibold"> {s(item.title)} </div>
      <div className="text-gray-400 text-sm col-span-2 ml-4"> {s(item.date)} </div>
      <div className="text-right"> rightArrow </div>
    </a>

  @react.component
  let make = (~items) =>
    // TODO: remove relative?
    // TODO: why aren't these attributes directly on the "ul" below?
    // TODO: why is overflow-y-auto used?
    <div className="rounded-lg shadow overflow-y-auto relative">
      <ul>
        {items
        |> Array.map(item =>
          // TODO: ensure link is accessible; indicator that link opens tab
          <li className="p-6  cursor-pointer hover:bg-gray-200"> {itemRow(item)} </li>
        )
        |> React.array}
      </ul>
    </div>
}
