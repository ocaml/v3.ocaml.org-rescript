let s = React.string

@react.component
let make = (~name: string, ~url: string, ~logoSrc: string) =>
  // TODO: for accessibilty, add visual indicator that link opens a tab
  <a
    className="bg-white font-roboto rounded-md shadow-md overflow-hidden px-8 py-4 flex items-center justify-start space-x-8"
    href=url
    target="_blank">
    <img className="w-12 h-12 lg:w-20 lg:h-20" src=logoSrc />
    <span className="text-2xl"> {s(name)} </span>
  </a>
