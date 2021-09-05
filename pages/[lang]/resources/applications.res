open! Import

module T = {
  module ApiDocumentation = {
    @react.component
    let make = () =>
      // TODO: factor out and define content type
      <SectionContainer.MediumCentered paddingX="px-4 sm:px-32">
        <MediaObject imageHeight="h-56" image="api-img.jpeg" imageSide=#Right>
          <h4 className="text-4xl font-bold mb-8"> {React.string(`API Documentation`)} </h4>
          <p className="mt-1 mb-8">
            {React.string(`Visit our page for API Documentation in OCaml for a concise reference manual with all the information you need to work with the OCaml API.`)}
          </p>
          <a
            href="/packages"
            className="inline-flex items-center px-14 py-2 border border-transparent text-sm leading-4 font-medium rounded-md shadow-sm text-white bg-orangedark hover:bg-orangedarker">
            {React.string(`Explore the Docs`)}
          </a>
        </MediaObject>
      </SectionContainer.MediumCentered>
  }

  module DeveloperGuide = {
    type t = {
      name: string,
      description: string,
      link: string,
      image: string,
    }

    let all = [
      {
        link: "https=//docs.mirage.io/mirage/index.html",
        name: "Mirage OS",
        description: "Mirage OS Unikernels lorem ipsum dolor sit amet, consectetur adipiscing elit. Integer at tristique odio. Etiam sodales porta lectus ac malesuada. Proin in odio ultricies, faucibus ligula ut",
        image: "app-image.png",
      },
      {
        link: "https=//b0-system.github.io/odig/doc/js_of_ocaml/Js_of_ocaml/index.html",
        name: "JS_of_OCaml",
        description: "Browser programming dolor sit amet, consectetur adipiscing elit. Integer at tristique odio. Etiam sodales porta lectus ac maleuada. Proin in odio ultricies, faucibus ligula ut",
        image: "jvs.png",
      },
    ]
  }

  module OcamlPoweredSoftware = {
    type t = {
      name: string,
      link: string,
      image: string,
      description: string,
    }

    let all = [
      {
        name: "Unison",
        link: "https://github.com/bcpierce00/unison/wiki/Downloading-Unison",
        image: "unison2.png",
        description: "Dolor sit amet, consectetur adipiscing elit. Integer at tristique odio.",
      },
      {
        name: "Coq",
        link: "https://coq.inria.fr/download",
        image: "coq.png",
        description: "Dolor sit amet, consectetur adipiscing elit. Integer at tristique odio.",
      },
      {
        name: "Liquid Soap",
        link: "https://www.liquidsoap.info/doc-1.4.4/install.html",
        image: "liq.png",
        description: "Dolor sit amet, consectetur adipiscing elit. Integer at tristique odio.",
      },
    ]
  }

  module DeveloperGuides = {
    type t = {
      developerGuidesLabel: string,
      topDeveloperGuide: DeveloperGuide.t,
      bottomDeveloperGuide: DeveloperGuide.t,
    }

    @react.component
    let make = (~marginBottom=?, ~content) =>
      <div
        className={"bg-white overflow-hidden shadow rounded-lg mx-auto max-w-3xl " ++
        marginBottom->Tailwind.Option.toClassName}>
        <div className="px-4 py-5 sm:p-6">
          // TODO: factor out and define content type
          <h2 className="text-center text-orangedark text-4xl font-bold mb-8">
            {React.string(content.developerGuidesLabel)}
          </h2>
          <div className="mb-11">
            <MediaObject imageHeight="h-24" image=content.topDeveloperGuide.image imageSide=#Right>
              // <div className="flex mb-11">
              <div>
                <h4 className="text-base font-bold mb-3">
                  // TODO: visual indicator that link is opening new tab
                  <a
                    className="hover:underline" href=content.topDeveloperGuide.link target="_blank">
                    {React.string(content.topDeveloperGuide.name)}
                  </a>
                </h4>
                <p className="mt-1"> {React.string(content.topDeveloperGuide.description)} </p>
              </div>
            </MediaObject>
          </div>
          <div className="mb-11">
            <MediaObject
              imageHeight="h-24" image=content.bottomDeveloperGuide.image imageSide=#Left>
              <div>
                <h4 className="text-base font-bold mb-3">
                  // TODO: visual indicator that link is opening new tab
                  <a
                    className="hover:underline"
                    href=content.bottomDeveloperGuide.link
                    target="_blank">
                    {React.string(content.bottomDeveloperGuide.name)}
                  </a>
                </h4>
                <p className="mt-1"> {React.string(content.bottomDeveloperGuide.description)} </p>
              </div>
            </MediaObject>
          </div>
        </div>
      </div>
  }

  module UsingOcaml = {
    type t = {
      usingOcamlLabel: string,
      introduction: string,
      seeMore: string,
      softwareLeft: OcamlPoweredSoftware.t,
      softwareMiddle: OcamlPoweredSoftware.t,
      softwareRight: OcamlPoweredSoftware.t,
    }

    @react.component
    let make = (~marginBottom=?, ~content, ~lang) =>
      // TODO: factor out and define content type
      <div
        className={"bg-white overflow-hidden shadow rounded-lg mx-auto max-w-3xl " ++
        marginBottom->Tailwind.Option.toClassName}>
        <div className="px-4 py-5 sm:py-8 sm:px-24">
          <h2 className="text-center text-orangedark text-4xl font-bold mb-8">
            {React.string(content.usingOcamlLabel)}
          </h2>
          <p className="text-center mb-6"> {React.string(content.introduction)} </p>
          <div className="grid grid-cols-3 gap-x-16 mb-6">
            <div className="flex justify-center items-center mb-6">
              // TODO: visual indicator that link opens new tab
              <a href=content.softwareLeft.link target="_blank">
                <img
                  className={"border-1 max-h-24"}
                  src={"/static/" ++ content.softwareLeft.image}
                  alt=content.softwareLeft.name
                />
              </a>
            </div>
            <div className="flex justify-center items-center mb-6">
              <a href=content.softwareMiddle.link target="_blank">
                <img
                  className={"border-1 max-h-24"}
                  src={"/static/" ++ content.softwareMiddle.image}
                  alt=content.softwareMiddle.name
                />
              </a>
            </div>
            <div className="flex justify-center items-center mb-6">
              <a href=content.softwareRight.link target="_blank">
                <img
                  className={"border-1 max-h-24"}
                  src={"/static/" ++ content.softwareRight.image}
                  alt=content.softwareRight.name
                />
              </a>
            </div>
            <div>
              <p className="font-bold text-center mb-2">
                {React.string(content.softwareLeft.name)}
              </p>
              <p> {React.string(content.softwareLeft.description)} </p>
            </div>
            <div>
              <p className="font-bold text-center mb-2">
                {React.string(content.softwareMiddle.name)}
              </p>
              <p> {React.string(content.softwareMiddle.description)} </p>
            </div>
            <div>
              <p className="font-bold text-center mb-2">
                {React.string(content.softwareRight.name)}
              </p>
              <p> {React.string(content.softwareRight.description)} </p>
            </div>
          </div>
          <p className="text-right font-bold">
            <Route _to={#ResourcesUsingocaml} lang>
              // TODO: descriptive link text
              <a className="text-orangedark underline"> {React.string(content.seeMore ++ ` >`)} </a>
            </Route>
          </p>
        </div>
      </div>
  }

  type t = {
    title: string,
    pageDescription: string,
    developerGuidesContent: DeveloperGuides.t,
    usingOcamlContent: UsingOcaml.t,
  }
  include Jsonable.Unsafe

  module Params = Pages.Params.Lang

  @react.component
  let make = (~content, ~params as {Params.lang: lang}) => <>
    <ConstructionBanner
      figmaLink=`https://www.figma.com/file/36JnfpPe1Qoc8PaJq8mGMd/V1-Pages-Next-Step?node-id=745%3A1`
      playgroundLink=`/play/resources/applications`
    />
    <Page.Basic
      marginTop={Tailwind.Breakpoint.make(#mt1, ())}
      addBottomBar=true
      addContainer=#NoContainer
      title=content.title
      pageDescription=content.pageDescription>
      <div className="mb-24"> <ApiDocumentation /> </div>
      <DeveloperGuides
        marginBottom={Tailwind.Breakpoint.make(#mb2, ())} content=content.developerGuidesContent
      />
      // TODO: factor out and define content type
      <CallToAction.TransparentWide
        t={
          CallToAction.title: "Platform Tools",
          body: `The OCaml Platform is a collection of tools that allow programmers to be productive in the OCaml language. It has been an iterative process of refinement as new tools are added and older tools are updated. Different tools accomplish different workflows and are used at different points of a project's life.`,
          buttonLink: #Route(#ResourcesPlatform, lang),
          buttonText: `Visit Platform Tools`,
        }
      />
      <UsingOcaml
        marginBottom={Tailwind.Breakpoint.make(#mb16, ())} content=content.usingOcamlContent lang
      />
    </Page.Basic>
  </>

  let contentEn = {
    let developerGuides = DeveloperGuide.all
    let ocamlPoweredSoftare = OcamlPoweredSoftware.all
    // TODO: store ids of highlighted developer guides explicitly
    let title = `Applications`
    let pageDescription = `This is where you can find resources for working with the language itself. Whether you're building applications or maintaining libraries, this page has useful information for you.`
    let developerGuidesContent = {
      DeveloperGuides.developerGuidesLabel: "Developer Guides",
      topDeveloperGuide: developerGuides[0],
      bottomDeveloperGuide: developerGuides[1],
    }
    {
      title: title,
      pageDescription: pageDescription,
      developerGuidesContent: developerGuidesContent,
      usingOcamlContent: {
        usingOcamlLabel: `Using OCaml`,
        introduction: `Besides developing in the language and making your own applications, there are many useful tools that already exist in OCaml for you to use.`,
        seeMore: `See more`,
        // TODO: store ids of highlighted ocaml powered software explicitly
        softwareLeft: ocamlPoweredSoftare[0],
        softwareMiddle: ocamlPoweredSoftare[1],
        softwareRight: ocamlPoweredSoftare[2],
      },
    }
  }

  let content = [({Params.lang: #en}, contentEn)]
}

include T
include Pages.MakeSimple(T)
