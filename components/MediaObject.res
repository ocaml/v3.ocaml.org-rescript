// TODO: implement interface

type imageSide = Left | Right

@react.component
let make = (~marginBottom="", ~imageHeight, ~image, ~imageSide, ~children) => {
  <div className={`sm:flex ${marginBottom}`}>
    {switch imageSide {
    | Left => <>
        <div className="mb-10 sm:mb-0 mr-10 flex-shrink-0">
          <img className=imageHeight src={"/static/" ++ image} />
        </div>
        <div> children </div>
      </>
    | Right => <>
        // TODO: change order in default breakpoint and sm:breakpoint
        <div> children </div>
        <div className="mt-10 sm:mt-0 ml-10 flex-shrink-0">
          <img className=imageHeight src={"/static/" ++ image} />
        </div>
      </>
    }}
  </div>
}
