// TODO: .resi

module Link = Next.Link

let s = React.string

// TODO: move into a general Link module
module ButtonLink = {
  type t = {
    label: string,
    url: string,
  }
}

type buttonLinks = {
  primaryButton: ButtonLink.t,
  secondaryButton: ButtonLink.t,
}

module Button = {
  @react.component
  let make = (~href, ~text, ~colors, ~margins) =>
    <div className={margins ++ " rounded-md shadow "}>
      <Link href>
        <a
          className={colors ++ " w-full flex items-center justify-center px-8 py-3 border border-transparent text-base font-medium rounded-md md:py-4 md:text-lg md:px-10"}>
          {s(text)}
        </a>
      </Link>
    </div>
}

module HeroTextContainer = {
  @react.component
  let make = (~textAlign, ~children) =>
    <div className={"mx-auto max-w-7xl w-full pt-16 pb-20 lg:py-48 " ++ textAlign}> children </div>
}

module H1 = {
  @react.component
  let make = (~children) =>
    <h1
      className="text-4xl tracking-tight font-extrabold text-gray-900 sm:text-5xl md:text-6xl lg:text-5xl xl:text-6xl">
      children
    </h1>
}

module P = {
  @react.component
  let make = (~margins, ~children) =>
    <p className={margins ++ " max-w-md mx-auto text-lg text-gray-500 sm:text-xl md:max-w-3xl"}>
      children
    </p>
}

let image = (~imageSrc, ~imageOnRight) => {
  let horizontalPlace = switch imageOnRight {
  | true => "right-0"
  | false => "left-0"
  }
  <div
    className={`relative w-full h-64 sm:h-72 md:h-96 lg:absolute lg:inset-y-0 lg:${horizontalPlace} lg:w-1/2 lg:h-full`}>
    <img className="absolute inset-0 w-full h-full object-cover" src=imageSrc alt="" />
  </div>
}

let callToActionArea = (~header, ~body, ~buttonLinks, ~imageOnRight) => {
  let (lgTextAlign, lgContainerDisplay, lgJustifyButtons) = switch imageOnRight {
  | true => ("text-left", "", "justify-start")
  | false => ("text-center", "flex", "justify-center")
  }
  <HeroTextContainer textAlign={`text-center lg:${lgTextAlign} lg:${containerDisplay}`}>
    {switch imageOnRight {
    | true => <> </>
    | false => <div className="lg:w-1/2" />
    }}
    <div className="px-4 lg:w-1/2 sm:px-8 xl:pr-16">
      <H1> {s(header)} </H1>
      <P margins="mt-3 md:mt-5"> {s(body)} </P>
      {switch buttonLinks {
      | Some(buttonLinks) =>
        <div className={`mt-10 sm:flex sm:justify-center lg:${lgJustifyButtons}}`}>
          <Button
            colors=`text-white bg-orangedark hover:bg-orangedarker`
            href=buttonLinks.primaryButton.url
            text=buttonLinks.primaryButton.label
            margins=``
          />
          <Button
            colors=`text-orangedark bg-white hover:bg-gray-50`
            href=buttonLinks.secondaryButton.url
            text=buttonLinks.secondaryButton.label
            margins=`mt-3 sm:mt-0 sm:ml-3`
          />
        </div>
      | None => <> </>
      }}
    </div>
  </HeroTextContainer>
}

// TODO: add container around hero
@react.component
let make = (~imageSrc, ~header, ~body, ~buttonLinks=?, ~imageOnRight=true, ()) =>
  <div className="lg:relative">
    {callToActionArea(~header, ~body, ~buttonLinks, ~imageOnRight)}
    {image(~imageSrc, ~imageOnRight)}
  </div>
