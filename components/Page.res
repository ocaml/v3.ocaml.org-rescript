// Page:

//  TODO: combine the components below into one variant type

//     Hero (left/right?)

//     TopImage (imitate "with large screenshot"; overlay text?)
//     HighlightedItem

//     Markdown (optional TOC)

// TODO: implement module interface

// need to implement render for the variant
let s = React.string

module Basic = {
  @react.component
  let make = (
    ~children,
    ~title,
    ~pageDescription,
    ~addContainer=true,
    ~marginTop=?,
    ~headingMarginBottom=?,
    ~callToAction=?,
    ~addBottomBar=?,
    (),
  ) => {
    let heading = {
      let marginTop = Js.Option.getWithDefault(``, marginTop)
      let headingMarginBottom = Js.Option.getWithDefault(``, headingMarginBottom)
      let addBottomBar = Js.Option.getWithDefault(false, addBottomBar)
      switch callToAction {
      | Some(callToAction) =>
        <TitleHeading.Large
          marginTop marginBottom=headingMarginBottom addBottomBar title pageDescription callToAction
        />
      | None =>
        <TitleHeading.Large
          marginTop marginBottom=headingMarginBottom addBottomBar title pageDescription
        />
      }
    }
    switch addContainer {
    | true => <MainContainer.Centered> heading children </MainContainer.Centered>
    | false => <MainContainer.None> heading children </MainContainer.None>
    }
  }
}

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
  let make = (~margins, ~content) =>
    <div
      className={content.bgImageClass ++
      " bg-auto bg-center bg-no-repeat flex align-bottom place-content-center " ++
      margins}>
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
      <HighlightSection margins=`mb-6` content=highlightContent />
      children
    </MainContainer.None>
  }
}

// Section:

//  an interface

//     All the sections used currently
