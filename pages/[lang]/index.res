open! Import

module T = {
  module HeroSection = {
    type t = {
      heroHeader: string,
      heroBody: string,
      installOcaml: string,
      aboutOcaml: string,
    }
  }

  module StatsSection = {
    type t = {
      statsTitle: string,
      userSatisfaction: string,
      workplaceUse: string,
      easyMaintain: string,
      userSatisfactionPercent: string,
      workplaceUsePercent: string,
      easyMaintainPercent: string,
    }

    @react.component
    let make = (~content) =>
      <Stats title=content.statsTitle>
        [
          {
            Stats.Item.label: content.userSatisfaction,
            value: content.userSatisfactionPercent,
          },
          {
            label: content.workplaceUse,
            value: content.workplaceUsePercent,
          },
          {
            label: content.easyMaintain,
            value: content.easyMaintainPercent,
          },
        ]
      </Stats>
  }

  module OpamSection = {
    type t = {
      header: string,
      body: string,
      linkText: string,
    }

    @react.component
    let make = (~content as {header, body, linkText}) => {
      <MediaObject.Small
        header
        body
        link="https://opam.ocaml.org"
        linkText={linkText ++ ` >`}
        image="/static/opam.png"
      />
    }
  }

  module FillIcon = {
    @react.component
    let make = (~id) =>
      <pattern id x="0" y="0" width="20" height="20" patternUnits="userSpaceOnUse">
        <rect x="0" y="0" width="4" height="4" className="text-gray-200" fill="currentColor" />
      </pattern>
  }

  module FillPattern = {
    @react.component
    let make = (~organizationName, ~position, ~placement, ~transform) =>
      <svg
        className={position ++ ` ` ++ placement ++ ` ` ++ transform}
        width="404"
        height="404"
        fill="none"
        viewBox="0 0 404 404"
        role="img"
        ariaLabelledby="svg-testimonial-org">
        <title id="svg-testimonial-org"> {React.string(organizationName)} </title>
        <defs> <FillIcon id=`ad119f34-7694-4c31-947f-5c9d249b21f3` /> </defs>
        <rect width="404" height="404" fill="url(#ad119f34-7694-4c31-947f-5c9d249b21f3)" />
      </svg>
  }

  module SlashIcon = {
    @react.component
    let make = (~margins) =>
      <svg
        className={"hidden md:block h-5 w-5 text-orangedark " ++ margins}
        fill="currentColor"
        viewBox="0 0 20 20">
        <path d="M11 0h3L9 20H6l5-20z" />
      </svg>
  }

  module Quote = {
    @react.component
    let make = (~margins, ~quote, ~speaker, ~organizationName) =>
      <blockquote className=margins>
        <div className="max-w-3xl mx-auto text-center text-2xl leading-9 font-medium text-gray-900">
          <p>
            <span className="text-orangedark"> {React.string(`”`)} </span>
            {React.string(quote)}
            <span className="text-orangedark"> {React.string(`”`)} </span>
          </p>
        </div>
        <footer className="mt-0">
          <div className="md:flex md:items-center md:justify-center">
            <div className="mt-3 text-center md:mt-0 md:ml-4 md:flex md:items-center">
              <div className="text-base font-medium text-gray-900"> {React.string(speaker)} </div>
              <SlashIcon margins=`mx-1` />
              <div className="text-base font-medium text-gray-500">
                {React.string(organizationName)}
              </div>
            </div>
          </div>
        </footer>
      </blockquote>
  }

  // TODO: move this into general contaienrs?
  module TestimonialContainer = {
    @react.component
    let make = (~marginBottom=?, ~children) =>
      <section
        className={marginBottom->Tailwind.Option.toClassName ++ ` py-12 overflow-hidden md:py-20 lg:py-24 `}>
        <div className="relative max-w-7xl mx-auto px-4 sm:px-6 lg:px-8"> children </div>
      </section>
  }

  module TestimonialSection = {
    type t = {
      quote: string,
      organizationName: string,
      speaker: string,
      organizationLogo: string,
    }

    @react.component
    let make = (~content, ~marginBottom=?) =>
      <TestimonialContainer ?marginBottom>
        <FillPattern
          organizationName=content.organizationName
          position=`absolute`
          placement=`top-full right-full`
          transform=`transform translate-x-1/3 -translate-y-1/4 lg:translate-x-1/2 xl:-translate-y-1/2`
        />
        <div className="relative">
          <img className="mx-auto h-24" src=content.organizationLogo alt=content.organizationName />
          <Quote
            margins=`mt-10`
            quote=content.quote
            speaker=content.speaker
            organizationName=content.organizationName
          />
        </div>
      </TestimonialContainer>
  }

  type t = {
    heroContent: HeroSection.t,
    statsContent: StatsSection.t,
    opamContent: OpamSection.t,
    testimonialContent: TestimonialSection.t,
  }
  include Jsonable.Unsafe

  module Params = Pages.Params.Lang

  @react.component
  let make = (
    ~content as {heroContent, statsContent, opamContent, testimonialContent},
    ~params as {Params.lang: lang},
  ) =>
    <Page.Unstructured>
      <Hero
        imageSrc="/static/oc-sq.jpeg"
        imagePos={#Right}
        header=heroContent.heroHeader
        body=heroContent.heroBody
        buttonLinks={
          Hero.primaryButton: {
            label: heroContent.installOcaml,
            url: #ResourcesInstallocaml->Route.toString(lang),
          },
          secondaryButton: {
            label: heroContent.aboutOcaml,
            url: #PrinciplesWhatisocaml->Route.toString(lang),
          },
        }
      />
      <StatsSection content=statsContent />
      <OpamSection content=opamContent />
      <TestimonialSection
        content=testimonialContent
        marginBottom={Tailwind.Breakpoint.make(#mb6, ~md=#mb4, ~lg=#mb6, ())}
      />
    </Page.Unstructured>

  let contentEn = {
    heroContent: {
      heroHeader: `Welcome to a World of OCaml`,
      heroBody: `OCaml is a general purpose industrial-strength programming language with an emphasis on expressiveness and 
      safety.`,
      installOcaml: `Install OCaml`,
      aboutOcaml: `About OCaml`,
    },
    statsContent: {
      statsTitle: `OCaml in Numbers`,
      userSatisfaction: `Of users report feeling satisfied with the state of OCaml`,
      workplaceUse: `Report that the use of OCaml is increasing or remaining stable in their workplace`,
      easyMaintain: `Of users report feeling that OCaml software is easy to maintain`,
      userSatisfactionPercent: `85%`,
      workplaceUsePercent: `95%`,
      easyMaintainPercent: `75%`,
    },
    opamContent: {
      OpamSection.header: `Opam: the OCaml Package Manager`,
      body: `Opam is a source-based package manager for OCaml. It supports multiple simultaneous compiler 
      installations, flexible package constraints, and a Git-friendly development workflow.`,
      linkText: `Go to opam.ocaml.org`,
    },
    testimonialContent: {
      quote: `OCaml helps us to quickly adopt to changing market conditions, and go from prototypes to production 
      systems with less effort ... Billions of dollars of transactions flow through our systems every day, so getting 
      it right matters.`,
      organizationName: `Jane Street`,
      speaker: `Yaron Minsky`,
      organizationLogo: `/static/js.svg`,
    },
  }

  let content = [({Params.lang: #en}, contentEn)]
}

include T
include Pages.MakeSimple(T)
