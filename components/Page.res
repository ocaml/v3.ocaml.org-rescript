// Page:

//  a variant

//     Basic (big? divider?) <<< - start w/industrial users
//     Hero (left/right?)

//     TopImage (imitate "with large screenshot"; overlay text?)
//     HighlightedItem

//     Markdown (optional TOC)

// need to implement render for the variant

type page = Basic // take children. should they be functions or fully rendered?

let render = page =>
  switch page {
  | Basic =>
    <MainContainer.Centered>
      <TitleHeading.Large
        title=`A Title`
        pageDescription=`A description here.`
        marginTop=`mt-2`
        callToAction={
          TitleHeading.Large.label: "Success Stories",
          url: "/industry/successstories",
        }
      />
      <div> {React.string(`Hello.`)} </div>
    </MainContainer.Centered>
  }

// Section:

//  an interface

//     All the sections used currently
