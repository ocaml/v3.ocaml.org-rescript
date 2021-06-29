let s = React.string

@react.component
let make = (~name: string, ~logoSrc: string) =>
  // TODO: for accessibilty, add visual indicator that link opens a tab
  // TODO: receive link target + set target blank
  <a
    className="bg-white font-roboto rounded-md shadow-md overflow-hidden px-8 py-4 flex items-center justify-start space-x-8">
    <img className="w-20 h-20" src=logoSrc /> <span className="text-2xl"> {s(name)} </span>
  </a>
