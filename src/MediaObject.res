open! Import

module Small = {
  @react.component
  let make = (~header, ~body, ~link, ~linkText, ~image) => {
    <>
      <div className="mb-4 sm:flex-shrink-0 sm:mb-0 sm:mr-4">
        <img className="h-36" src={image} ariaHidden=true />
      </div>
      <div>
        <h2 className="text-2xl font-bold"> {React.string(header)} </h2>
        <p className="mt-1"> {React.string(body)} </p>
        <p className="text-right pr-5">
          <a className="text-orangedark" href=link target="_blank">
            {React.string(linkText ++ ` >`)}
          </a>
        </p>
      </div>
    </>
  }
}

@react.component
let make = (
  ~marginBottom=?,
  ~imageHeight,
  ~imageWidth="",
  ~isRounded=false,
  ~image,
  ~imageSide,
  ~children,
) => {
  let marginBottom = marginBottom->Tailwind.MarginBottomByBreakpoint.toClassNamesOrEmpty
  <div className={`flex flex-col items-center sm:flex-row sm:justify-evenly ${marginBottom}`}>
    {
      let rounded = switch isRounded {
      | true => "rounded-full"
      | false => ""
      }
      let image =
        <img className={`${imageHeight} ${imageWidth} ${rounded}`} src={"/static/" ++ image} />
      switch imageSide {
      | #Left => <>
          <div className="mb-10 sm:mb-0 mr-10 sm:flex-shrink-0"> image </div> <div> children </div>
        </>
      | #Right => <>
          <div className="order-2 sm:order-1"> children </div>
          <div className="order-1 sm:order-2 mt-10 sm:mt-0 ml-10 sm:flex-shrink-0"> image </div>
        </>
      }
    }
  </div>
}
