// TODO: implement interface

type imageSide = Left | Right

@react.component
let make = (~marginBottom, ~imageHeight, ~image, ~imageSide, ~children) => {
  <div className={`flex ${marginBottom}`}>
    {switch imageSide {
    | Left => <>
        <div className="mr-10 flex-shrink-0">
          <img className=imageHeight src={"/static/" ++ image} />
        </div>
        <div> children </div>
      </>
    | Right => <>
        <div> children </div>
        <div className="ml-10 flex-shrink-0">
          <img className=imageHeight src={"/static/" ++ image} />
        </div>
      </>
    }}
  </div>
}
