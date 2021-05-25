module Content = {
  type t = {
    title: string,
    pageDescription: string,
  }

  let en = {
    title: `Carbon Footprint`,
    pageDescription: `Over the years, the OCaml community has become more and more proactive when it comes to reducing its environmental impact. As part of this journey we have documented our efforts towards becoming Carbon Zero.`,
  }

  let loremipsum = {
    title: `Lorem Ipsum`,
    pageDescription: `Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed eiusmod tempor incidunt ut labore.`,
  }

  let make = lang => {
    switch lang {
    | #en => en
    | #fr => loremipsum
    | #es => loremipsum
    }
  }
}

@react.component
let make = (~content=Content.make(#en)) => <>
  <ConstructionBanner
    figmaLink=`https://www.figma.com/file/36JnfpPe1Qoc8PaJq8mGMd/V1-Pages-Next-Step?node-id=931%3A6483`
  />
  <Page.TopImage title=content.title pageDescription=content.pageDescription>
    {<> </>}
  </Page.TopImage>
</>

let default = make
