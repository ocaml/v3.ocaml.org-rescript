module Link = Next.Link

let s = React.string

// TODO: move this into a future Link component
module LinkUrl = {
  type t = Route(string) | External(string)

  let render = (~t, ~buttonText, ~styling) =>
    switch t {
    | Route(url) => <Link href=url> <a className=styling> {s(buttonText)} </a> </Link>
    | External(url) => <a href=url target="_blank" className=styling> {s(buttonText)} </a>
    }
}

type t = {
  title: string,
  body: string,
  buttonLink: LinkUrl.t,
  buttonText: string,
}

module General = {
  type colorStyle = BackgroundFilled | Transparent

  @react.component
  let make = (~t, ~colorStyle, ~marginBottom=?, ()) => {
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
      | Transparent => ("", "", "text-white", "bg-orangedark", "bg-orangedarker")
      }
      let button = LinkUrl.render(
        ~t=t.buttonLink,
        ~buttonText=t.buttonText,
        ~styling=`mt-8 w-full inline-flex items-center justify-center px-5 py-3 border border-transparent text-base font-medium rounded-md ${buttonTextColor} ${buttonBackground} hover:${buttonHover} sm:w-auto`,
      )

      let essentialElements =
        <>
          <h2 className={`text-3xl font-extrabold ${headingTextColor} sm:text-4xl text-center`}>
            <span className="block"> {s(t.title)} </span>
          </h2>
          <p className={`mt-4 text-lg leading-6 ${bodyTextColor} text-center`}> {s(t.body)} </p>
          <div className="flex justify-center"> button </div>
        </>

      <div className="max-w-2xl mx-auto py-16 px-4 sm:py-20 sm:px-6 lg:px-8">
        essentialElements
      </div>
    }
    switch colorStyle {
    | BackgroundFilled =>
      <SectionContainer.NoneFilled ?marginBottom> mainFrame </SectionContainer.NoneFilled>
    | _ =>
      <div className={marginBottom->Tailwind.MarginBottomByBreakpoint.toClassNamesOrEmpty}>
        mainFrame
      </div>
    }
  }
}

module TransparentWide = {
  @react.component
  let make = (~t, ~marginBottom=?, ()) => {
    let button = LinkUrl.render(
      ~t=t.buttonLink,
      ~buttonText=t.buttonText,
      ~styling=`mt-8 w-full inline-flex items-center justify-center px-8 py-1 border border-transparent text-base font-medium rounded-md text-white bg-orangedark hover:bg-orangedarker sm:w-auto`,
    )

    <div className={marginBottom->Tailwind.MarginBottomByBreakpoint.toClassNamesOrEmpty}>
      <SectionContainer.VerySmallCentered paddingY="py-16 sm:py-20" paddingX="px-4 sm:px-6 lg:px-2">
        <h2 className={`text-3xl font-extrabold sm:text-4xl text-center`}>
          <span className="block"> {s(t.title)} </span>
        </h2>
        <p className={`mt-4 text-lg leading-6`}> {s(t.body)} </p>
        <div className="flex justify-center"> button </div>
      </SectionContainer.VerySmallCentered>
    </div>
  }
}

module Embedded = {
  @react.component
  let make = (~t) => {
    let button =
      <div className="inline-flex rounded-md shadow">
        {LinkUrl.render(
          ~t=t.buttonLink,
          ~buttonText=t.buttonText,
          ~styling=`inline-flex items-center justify-center px-5 py-3 border border-transparent text-base font-medium rounded-md text-white bg-orangedark hover:bg-orangedarker`,
        )}
      </div>

    <>
      <p
        className="mt-2 text-orangedark text-center text-3xl font-extrabold tracking-tight sm:text-4xl">
        {s(t.title)}
      </p>
      <p className="mt-3 text-center text-lg text-gray-900"> {s(t.body)} </p>
      <div className="mt-8 text-center"> button </div>
    </>
  }
}
