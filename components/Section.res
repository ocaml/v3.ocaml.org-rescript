@react.component
let make = (~bgColor: string="graylight", ~pt: int=16, ~pb: int=16, ~children) => {
  let pt = Js.Int.toString(pt)
  let pb = Js.Int.toString(pb)
  <div className={`pt-${pt} pb-${pb} bg-${bgColor}`}>
    <div className="px-4 sm:px-6 lg:px-8"> children </div>
  </div>
}
