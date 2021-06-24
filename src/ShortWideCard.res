let s = React.string

@react.component
let make = (~name: string, ~logoSrc: string) =>
  <div className="block text-center bg-white shadow overflow-hidden rounded-md px-36 py-4">
    {
      // logo here
      s(name)
    }
  </div>
