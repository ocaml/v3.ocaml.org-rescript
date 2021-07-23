// NOTE: This is a temporary page to display and test components until
//  we adopt StoryBook or a similar technology.

module Item = {
  @react.component
  let make = (~name: string, ~docs: string, ~children: array<(string, React.element)>) => {
    let rec colors = list{#red, #blue, #green, #yellow, ...colors}
    let children = colors->Belt.List.zip(children->Belt.List.fromArray)->Belt.List.toArray
    let colorClass = x =>
      switch x {
      | #red => "bg-green-100"
      | #blue => "bg-blue-100"
      | #green => "bg-green-100"
      | #yellow => "bg-yellow-100"
      }
    <Card title={`<${name} />`} kind={#transparent}>
      <div className="mb-2"> {React.string(docs)} </div>
      {React.array(
        children->Belt.Array.map(((color, (doc, child))) => {
          <div className={`${colorClass(color)} py-4`}>
            <div className="mb-2"> {React.string(doc)} </div> {child}
          </div>
        }),
      )}
    </Card>
  }
}

module Category = {
  @react.component
  let make = (~name, ~children) => {
    <SectionContainer.FullyResponsiveCentered>
      <Card title=name kind={#transparent}> {children} </Card>
    </SectionContainer.FullyResponsiveCentered>
  }
}

module Categories = {
  module BasicComponents = {
    @react.component
    let make = () =>
      <Category name="Basic Components">
        <Item name="StoryCard.CornerTitleLogo" docs="This as a StoryCard.CornerTitleLogo">
          {[
            (
              "This is the default look of this component. It has an opaque background.",
              <StoryCard.CornerTitleLogo
                title="Mirage OS"
                graphicUrl="/static/ocaml-logo.jpeg"
                body="  Lorem ipsum dolor sit amet, consectetur adipiscing elit. Quisque pellentesque placerat arcu, non tempor nisi ultrices at. Aenean facilisis eleifend velit quis consequat. Sed turpis elit, ultrices et tincidunt nec, gravida et massa. Maecenas hendrerit, ante et imperdiet semper, lorem purus condimentum neque, quis mollis eros augue vel est. Pellentesque id turpis sit amet magna elementum ultricies a id mauris. Nulla ut faucibus dui. Curabitur sit amet consequat nulla."
              />,
            ),
            (
              "This component has colored=true, and bordered=false.",
              <StoryCard.CornerTitleLogo
                title="2012-2016"
                graphicUrl="/static/rackspacelogo.jpeg"
                body="Rackspace is a hosting provider that Lorem ipsum dolor sit amet, consectetur adipiscing elit. Quisque pellentesque placerat arcu, non tempor nisi ultrices at. Aenean facilisis eleifend velit quis consequat. Sed turpis elit, ultrices et tincidunt nec, gravida et massa. Maecenas hendrerit, ante et imperdiet semper, lorem purus condimentum neque, etcetera."
                colored=true
                bordered=false
              />,
            ),
          ]}
        </Item>
        <Item
          name="StoryCard.CornerLogoCenterTitle" docs="This as a StoryCard.CornerLogoCenterTitle">
          {[
            (
              "Default",
              <StoryCard.CornerLogoCenterTitle
                title="Software Engineer at Tarides"
                graphicUrl="/static/trd.png"
                body="Lorem ipsum dolor sit amet, consectetur adipiscing elit. Quisque pellentesque placerat arcu, non tempor nisi ultrices at. Aenean facilisis eleifend velit quis consequat. Sed turpis elit, ultrices et tincidunt nec, gravida et massa. Maecenas hendrerit, ante et imperdiet semper, lorem purus condimentum neque, quis mollis eros augue vel est. Pellentesque id turpis sit amet magna elementum ultricies a id mauris. Nulla ut faucibus dui. Curabitur sit amet consequat nulla."
                buttonText="Learn More"
              />,
            ),
          ]}
        </Item>
        <Item name="ShortWideCard" docs="Short wide card">
          {[
            (
              "Default",
              {
                let name = "Github.com"
                let logoSrc = "/static/github.png"
                let url = "https://github.com/ocaml/ocaml"
                <ShortWideCard name url logoSrc />
              },
            ),
          ]}
        </Item>
        <Item name="CallToAction.Embedded" docs="CallToAction.Embedded">
          {[
            (
              "Default",
              {
                let t = {
                  CallToAction.title: "Title",
                  body: "Body",
                  buttonLink: CallToAction.LinkUrl.External("example.com"),
                  buttonText: "Go to example.com",
                }
                <CallToAction.Embedded t />
              },
            ),
          ]}
        </Item>
        <Item name="StackedList.BasicWithIcon" docs="StackedList.BasicWithIcon">
          {[
            (
              "Default",
              {
                let items = [
                  {
                    StackedList.BasicWithIcon.Item.link: "example.com",
                    title: "Title1",
                  },
                  {
                    link: "example.com",
                    title: "Title2",
                  },
                ]
                let rowPrefixIcon = StackedList.BasicWithIcon.RowPrefixIcon.PaperScroll
                <StackedList.BasicWithIcon items rowPrefixIcon />
              },
            ),
          ]}
        </Item>
        <Item
          name="StackedList.BasicWithAuxiliaryAttribute"
          docs="StackedList.BasicWithAuxiliaryAttribute">
          {[
            (
              "Default",
              {
                let items = [
                  {
                    StackedList.BasicWithAuxiliaryAttribute.Item.link: "example.com",
                    title: "Title1",
                    auxiliaryAttribute: "AuxiliaryAttribute1",
                  },
                  {
                    link: "example.com",
                    title: "Title2",
                    auxiliaryAttribute: "AuxiliaryAttribute2",
                  },
                ]
                <StackedList.BasicWithAuxiliaryAttribute items />
              },
            ),
          ]}
        </Item>
      </Category>
  }

  module Sections = {
    module Items = {
      module LogoCloud = {
        @react.component
        let make = () => {
          <Item name="LogoCloud" docs="inea">
            {[
              (
                "A logo cloud with only icons.",
                {
                  let testCompanies =
                    Belt.Array.range(1, 6)
                    ->Belt.Array.map(_ => {
                      LogoCloud.Company.logoSrc: "/static/oclabs.png",
                      name: "OCaml Labs",
                      website: "https://ocamllabs.io",
                    })
                    ->LogoCloud.LogoOnly
                  <LogoCloud companies=testCompanies />
                },
              ),
              (
                "A logo cloud with icons and an optional title.",
                {
                  let testCompaniesOptional =
                    Belt.Array.range(1, 6)
                    ->Belt.Array.map(i => {
                      LogoCloud.CompanyOptionalLogo.logoSrc: if i == 2 {
                        None
                      } else {
                        Some("/static/oclabs.png")
                      },
                      name: "OCaml Labs",
                      website: "https://ocamllabs.io",
                    })
                    ->LogoCloud.LogoWithText
                  <LogoCloud companies=testCompaniesOptional />
                },
              ),
            ]}
          </Item>
        }
      }

      module Hero = {
        @react.component
        let make = () => {
          let imageSrc = "/static/oc-sq.jpeg"
          let header = "A Header"
          let body = "Some body text here that should be in latin. Some more body text here and here. Text text text text text text text text text text text text text."
          let buttonLinks = {
            Hero.primaryButton: {
              label: "Main Action",
              url: "/en",
            },
            secondaryButton: {
              label: "Other Action",
              url: "/en",
            },
          }
          <Item name="Hero" docs="hero component">
            {[
              ("imagePos=#right", <Hero imageSrc imagePos={#right} header body buttonLinks />),
              ("imagePos=#left", <Hero imageSrc imagePos={#left} header body buttonLinks />),
            ]}
          </Item>
        }
      }

      module HighlightsInQuadrants = {
        @react.component
        let make = () => {
          let category = icon => {
            HighlightsInQuadrants.Category.header: {
              HighlightsInQuadrants.CategoryHeader.title: "CategoryHeader",
              icon: icon,
            },
            stories: [
              {HighlightsInQuadrants.Story.title: "Story1", link: "link"},
              {HighlightsInQuadrants.Story.title: "Story2", link: "link"},
            ],
            seeAllInCategory: {
              HighlightsInQuadrants.LabelledLink.label: "seeAllInCategory",
              link: "seeAllInCategory",
            },
          }

          let t = {
            HighlightsInQuadrants.title: "Example",
            topLeftCategory: category(HighlightsInQuadrants.CategoryHeaderIcon.Profit),
            topRightCategory: category(HighlightsInQuadrants.CategoryHeaderIcon.Calendar),
            bottomLeftCategory: category(HighlightsInQuadrants.CategoryHeaderIcon.Meet),
            bottomRightCategory: category(HighlightsInQuadrants.CategoryHeaderIcon.Package),
            goToArchive: {
              HighlightsInQuadrants.LabelledLink.label: "Example Link",
              link: "link",
            },
          }

          <Item name="HighlightsInQuadrants" docs="A highlights in quadrants component">
            {[("Default", <HighlightsInQuadrants t />)]}
          </Item>
        }
      }
    }

    @react.component
    let make = () =>
      <Category name="Sections">
        <Items.LogoCloud /> <Items.Hero /> <Items.HighlightsInQuadrants />
      </Category>
  }

  @react.component
  let make = () => <> <BasicComponents /> <Sections /> </>
}

@react.component
let make = () => <Page.Unstructured> <Categories /> </Page.Unstructured>

let default = make
