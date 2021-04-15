module None = {
  @react.component
  let make = (~children) => children
}

// TODO: define constrained width container and change most pages to use
//  the new container
module Centered = {
  @react.component
  let make = (~children) => <div className="max-w-7xl mx-auto"> children </div>
}
