//  TODO: combine the components below into one variant type

let s = React.string

module MainContainer = {
  module None = {
    @react.component
    let make = (~children) => children
  }

  module Centered = {
    @react.component
    let make = (~children) => <div className="max-w-7xl mx-auto"> children </div>
  }

  module NarrowCentered = {
    @react.component
    let make = (~children) => <div className="max-w-3xl mx-auto"> children </div>
  }
}

module Unstructured = {
  @react.component
  let make = (~children) => {
    <MainContainer.None> children </MainContainer.None>
  }
}

module Basic = {
  type container = NoContainer | Regular | Narrow

  @react.component
  let make = (
    ~children,
    ~title,
    ~pageDescription,
    ~addContainer=Regular,
    ~marginTop=?,
    ~callToAction=?,
    ~addBottomBar=?,
    (),
  ) => {
    let heading = {
      let marginTop = Js.Option.getWithDefault(``, marginTop)
      let addBottomBar = Js.Option.getWithDefault(false, addBottomBar)
      switch callToAction {
      | Some(callToAction) =>
        <TitleHeading.Large
          marginTop
          marginBottom={Tailwind.ByBreakpoint.make(#mb6, ())}
          addBottomBar
          title
          pageDescription
          callToAction
        />
      | None =>
        let headingMarginBottom = switch addBottomBar {
        | true => Some(Tailwind.ByBreakpoint.make(#mb24, ()))
        | false => None
        }
        <TitleHeading.Large
          marginTop marginBottom=?headingMarginBottom addBottomBar title pageDescription
        />
      }
    }
    switch addContainer {
    | Regular => <MainContainer.Centered> heading children </MainContainer.Centered>
    | Narrow => <MainContainer.NarrowCentered> heading children </MainContainer.NarrowCentered>
    | NoContainer => <MainContainer.None> heading children </MainContainer.None>
    }
  }
}

// TODO: imitate "with large screenshot" tailwind ui component
module TopImage = {
  @react.component
  let make = (~children, ~title, ~pageDescription) => {
    <MainContainer.Centered>
      <TitleHeading.Large title pageDescription /> children
    </MainContainer.Centered>
  }
}

type highlightItemSummary = {
  preview: string,
  url: string,
}

type highlightContent = {
  highlightItem: string,
  clickToRead: string,
  highlightItemSummary: highlightItemSummary,
  bgImageClass: string,
}

module HighlightSection = {
  @react.component
  let make = (~marginBottom=?, ~content) =>
    <div
      className={content.bgImageClass ++
      " bg-auto bg-center bg-no-repeat flex align-bottom place-content-center " ++
      marginBottom->Tailwind.MarginBottomByBreakpoint.toClassNamesOrEmpty}>
      <div className="bg-white overflow-hidden shadow rounded-lg mb-2 lg:mb-7 mt-56 mx-5 max-w-4xl">
        <div className="px-4 py-5 sm:p-6">
          <h2 className="font-bold text-orangedark text-3xl lg:text-4xl text-center mb-2">
            {s(content.highlightItem)}
          </h2>
          <p className="text-xl"> {s(content.highlightItemSummary.preview)} </p>
          <p className="text-xl text-center lg:text-right">
            // TODO: more descriptive link text (or use aria attribute) for accessibility
            <a href=content.highlightItemSummary.url className="underline text-orangedark">
              {s(content.clickToRead ++ ` >`)}
            </a>
          </p>
        </div>
      </div>
    </div>
}

module HighlightItem = {
  @react.component
  let make = (~children, ~title, ~pageDescription, ~highlightContent) => {
    <MainContainer.None>
      <TitleHeading.Large title pageDescription />
      <HighlightSection
        marginBottom={Tailwind.ByBreakpoint.make(#mb6, ())} content=highlightContent
      />
      children
    </MainContainer.None>
  }
}

module TitleOverBackgroundImage = {
  module BackgroundImage = {
    type t = {
      // TODO: add the possible height values to tailwind config and request tw value?
      // TODO: use a variant to specify height
      height: string,
      tailwindImageName: string,
    }
  }

  // TODO: factor out titleheading
  @react.component
  let make = (~children, ~title, ~pageDescription, ~backgroundImage: BackgroundImage.t) => {
    <MainContainer.Centered>
      <div
        style={ReactDOM.Style.make(~height=backgroundImage.height, ())}
        className={`${backgroundImage.tailwindImageName} bg-cover bg-center flex justify-center items-center`}>
        <h2 className="text-orangedark font-roboto font-bold text-5xl text-center sm:text-8xl">
          {s(title)}
        </h2>
      </div>
      // TODO: output pageDescription here
      children
    </MainContainer.Centered>
  }
}
