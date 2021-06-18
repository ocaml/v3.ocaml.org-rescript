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
      let button = {
        let buttonPadding = switch buttonStyle {
        | Short => "px-8 py-1"
        | Normal => "px-5 py-3"
        }
        LinkUrl.render(
          ~t=content.buttonLink,
          ~buttonText=content.buttonText,
          ~styling=`mt-8 w-full inline-flex items-center justify-center ${buttonPadding} border border-transparent text-base font-medium rounded-md ${buttonTextColor} ${buttonBackground} hover:${buttonHover} sm:w-auto`,
        )
      }
      let essentialElements = (~centerBody) => <>
        <h2 className={`text-3xl font-extrabold ${headingTextColor} sm:text-4xl text-center`}>
          <span className="block"> {s(content.title)} </span>
        </h2>
        {
          let center = switch centerBody {
          | true => "text-center"
          | false => ""
          }
          <p className={`mt-4 text-lg leading-6 ${bodyTextColor} ${center}`}> {s(content.body)} </p>
        }
        <div className="flex justify-center"> button </div>
      </>

      switch width {
      | Narrow =>
        // TODO: is there an existing container for max-w-2xl mx-auto?
        <div className="max-w-2xl mx-auto py-16 px-4 sm:py-20 sm:px-6 lg:px-8">
          {essentialElements(~centerBody=true)}
        </div>
      | Regular =>
        // TODO: remove textCenter arg
        <SectionContainer.VerySmallCentered
          paddingY="py-16 sm:py-20" paddingX="px-4 sm:px-6 lg:px-2">
          {essentialElements(~centerBody=false)}
        </SectionContainer.VerySmallCentered>
      }
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

module Embedded = {
  @react.component
  let make = (~content) => {
    let button =
      <div className="inline-flex rounded-md shadow">
        {LinkUrl.render(
          ~t=content.buttonLink,
          ~buttonText=content.buttonText,
          ~styling=`inline-flex items-center justify-center px-5 py-3 border border-transparent text-base font-medium rounded-md text-white bg-orangedark hover:bg-orangedarker sm:w-auto`,
        )}
      </div>

    <>
      <p
        className="mt-2 text-orangedark text-center text-3xl font-extrabold tracking-tight sm:text-4xl">
        {s(content.title)}
      </p>
      <p className="mt-3 text-center text-lg text-gray-900"> {s(content.body)} </p>
      <div className="mt-8 text-center"> button </div>
    </>
  }
}
