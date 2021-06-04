module Link = Next.Link

let s = React.string

// TODO: move this into a future Link component
type linkUrl = Route(string) | External(string)

module General = {
  type t = {
    title: string,
    body: string,
    buttonLink: linkUrl,
    buttonText: string,
  }

  type colorStyle = BackgroundFilled | Transparent | TransparentPlainHeader

  type width = Narrow | Regular

  type buttonStyle = Short | Normal

  @react.component
  let make = (~content, ~colorStyle, ~width, ~buttonStyle, ~marginBottom=?, ()) => {
    let mainFrame = {
      let (
        headingTextColor,
        bodyTextColor,
        buttonTextColor,
        buttonBackground,
        buttonHover,
      ) = switch colorStyle {
      // TODO: use the light orange color noted in Figma instead of bg-gray-100
      | BackgroundFilled => ("text-white", "text-white", "", "bg-white", "bg-gray-100")
      | Transparent => ("text-orangedark", "", "text-white", "bg-orangedark", "bg-orangedarker")
      | TransparentPlainHeader => ("", "", "text-white", "bg-orangedark", "bg-orangedarker")
      }
      let buttonPadding = switch buttonStyle {
      | Short => "px-8 py-1"
      | Normal => "px-5 py-3"
      }
      // TODO: move this into a future Link component
      let button = switch content.buttonLink {
      | Route(url) =>
        <Link href=url>
          <a
            className={`mt-8 w-full inline-flex items-center justify-center ${buttonPadding} border border-transparent text-base font-medium rounded-md ${buttonTextColor} ${buttonBackground} hover:${buttonHover} sm:w-auto`}>
            {s(content.buttonText)}
          </a>
        </Link>
      | External(url) =>
        <a
          href=url
          target="_blank"
          className={`mt-8 w-full inline-flex items-center justify-center ${buttonPadding} border border-transparent text-base font-medium rounded-md ${buttonTextColor} ${buttonBackground} hover:${buttonHover} sm:w-auto`}>
          {s(content.buttonText)}
        </a>
      }
      let essentialElements =
        <>
          <h2 className={`text-3xl font-extrabold ${headingTextColor} sm:text-4xl`}>
            <span className="block"> {s(content.title)} </span>
          </h2>
          <p className={`mt-4 text-lg leading-6 ${bodyTextColor}`}> {s(content.body)} </p>
          button
        </>

      switch width {
      | Narrow =>
        <div className="max-w-2xl mx-auto text-center py-16 px-4 sm:py-20 sm:px-6 lg:px-8">
          // TODO: is there an existing container for max-w-2xl mx-auto?
          essentialElements
        </div>
      | Regular =>
        <SectionContainer.VerySmallCentered
          paddingY="py-16 sm:py-20" paddingX="px-4 sm:px-6 lg:px-2" textCenter=true>
          essentialElements
        </SectionContainer.VerySmallCentered>
      }
    }
    switch colorStyle {
    | BackgroundFilled =>
      <SectionContainer.NoneFilled margins={Belt.Option.getWithDefault(marginBottom, "")}>
        mainFrame
      </SectionContainer.NoneFilled>
    | _ => <div className={Belt.Option.getWithDefault(marginBottom, "")}> mainFrame </div>
    }
  }
}

// TODO: remove this and incorporate its implementation as a variation of General
module Embedded = {
  type t = {
    title: string,
    body: string,
    buttonLink: string,
    buttonText: string,
  }

  // TODO: define .resi
  @react.component
  let make = (~content, ~position, ~maxWidth, ~otherLayout) => {
    // TODO: understand how the maxWidth works together with the position
    <div className={`${position} ${maxWidth} mx-auto px-4 py-12 sm:px-6 lg:px-8 lg:py-16`}>
      // TODO: understand why the otherLayout is attached below instead of the div above
      <div className=otherLayout>
        <p
          className="mt-2 text-orangedark text-center text-3xl font-extrabold tracking-tight sm:text-4xl">
          {s(content.title)}
        </p>
        <p className="mt-3 text-center text-lg text-gray-900"> {s(content.body)} </p>
        <div className="mt-8 text-center">
          <div className="inline-flex rounded-md shadow">
            <Next.Link href=content.buttonLink>
              <a
                className="inline-flex items-center justify-center px-5 py-3 border border-transparent text-base font-medium rounded-md text-white bg-orangedark">
                {s(content.buttonText)}
              </a>
            </Next.Link>
          </div>
        </div>
      </div>
    </div>
  }
}
