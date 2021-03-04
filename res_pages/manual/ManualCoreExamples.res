let s = React.string

@react.component
let make = () =>
  <div className="flex space-x-4 w-full">
    <div className="w-3/4">
      <h1 className="text-4xl">{s(`Chapter 1  The core language`)}</h1>
    </div>
    <div className="">
      <h2 className="">{s(`Contents`)}</h2>
      <h3 className="">{s(`1.1 Basics`)}</h3>
      <h3 className="">{s(`1.2 Data types`)}</h3>
    </div>
  </div>

let default = make