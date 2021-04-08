@react.component
let make = (~bgColor: string="graylight", ~pt: int=16, ~pb: int=16, ~children) => {
  let pt = Js.Int.toString(pt)
  let pb = Js.Int.toString(pb)
  <div
    className={`col-span-9 lg:col-span-7 relative pt-${pt} pb-${pb} bg-${bgColor} overflow-hidden`}>
    <div className="relative px-4 sm:px-6 lg:px-8"> children </div>
  </div>
}
