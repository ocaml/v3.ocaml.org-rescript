module ContentHeavyHeading = {
  @react.component
  let make = (~children) => <div className="text-lg max-w-prose mx-auto"> children </div>
}

module ResponsiveCentered = {
  @react.component
  let make = (~children, ~margins) =>
    <div className={margins ++ " mx-auto sm:max-w-screen-sm lg:max-w-screen-lg"}> children </div>
}
