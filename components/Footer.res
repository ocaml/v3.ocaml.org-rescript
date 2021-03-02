module Link = Next.Link;

let s = React.string

module IconLink = {
  @react.component
  let make = (~href, ~label, ~children) =>
    <a href className="text-gray-400 hover:text-gray-500" target="_blank">
      <span className="sr-only">{s(label)}</span>
      children
    </a>
}

module GithubIcon = {
  @react.component
  let make = (~sizing) =>
    <svg className=sizing fill="currentColor" viewBox="0 0 24 24" ariaHidden=true>
      <path fillRule="evenodd" d="M12 2C6.477 2 2 6.484 2 12.017c0 4.425 2.865 8.18 6.839 9.504.5.092.682-.217.682-.483 0-.237-.008-.868-.013-1.703-2.782.605-3.369-1.343-3.369-1.343-.454-1.158-1.11-1.466-1.11-1.466-.908-.62.069-.608.069-.608 1.003.07 1.531 1.032 1.531 1.032.892 1.53 2.341 1.088 2.91.832.092-.647.35-1.088.636-1.338-2.22-.253-4.555-1.113-4.555-4.951 0-1.093.39-1.988 1.029-2.688-.103-.253-.446-1.272.098-2.65 0 0 .84-.27 2.75 1.026A9.564 9.564 0 0112 6.844c.85.004 1.705.115 2.504.337 1.909-1.296 2.747-1.027 2.747-1.027.546 1.379.202 2.398.1 2.651.64.7 1.028 1.595 1.028 2.688 0 3.848-2.339 4.695-4.566 4.943.359.309.678.92.678 1.855 0 1.338-.012 2.419-.012 2.747 0 .268.18.58.688.482A10.019 10.019 0 0022 12.017C22 6.484 17.522 2 12 2z" clipRule="evenodd" />
    </svg>
}

module TwitterIcon = {
  @react.component
  let make = (~sizing) =>
    <svg className=sizing fill="currentColor" viewBox="0 0 24 24" ariaHidden=true>
        <path d="M8.29 20.251c7.547 0 11.675-6.253 11.675-11.675 0-.178 0-.355-.012-.53A8.348 8.348 0 0022 5.92a8.19 8.19 0 01-2.357.646 4.118 4.118 0 001.804-2.27 8.224 8.224 0 01-2.605.996 4.107 4.107 0 00-6.993 3.743 11.65 11.65 0 01-8.457-4.287 4.106 4.106 0 001.27 5.477A4.072 4.072 0 012.8 9.713v.052a4.105 4.105 0 003.292 4.022 4.095 4.095 0 01-1.853.07 4.108 4.108 0 003.834 2.85A8.233 8.233 0 012 18.407a11.616 11.616 0 006.29 1.84" />
    </svg>
}

module OcamlLogo = {
  @react.component
  let make = (~sizing) =>
    <img className=sizing src="/static/ocaml-logo.jpeg" alt="OCaml" />
}

module Mission = {
  @react.component
  let make = (~ocamlSummary) =>
    <p className="text-gray-500 text-base"> {s(ocamlSummary)} </p>
}

module LogoSection = {
  type t = {
    ocamlSummary: string
  }

  @react.component
  let make = (~content, ~colspan) =>
    <div className={"space-y-8 " ++ colspan}>
      <OcamlLogo sizing="h-10" />
      <Mission ocamlSummary=content.ocamlSummary />
      <div className="flex space-x-6">
        <IconLink
          href=`https://discuss.ocaml.org`
          label=`Discourse`> 
          <img className="h-6 w-6" src="/static/discourselogo.png" alt="" ariaHidden=true />
        </IconLink>
        <IconLink 
          href=`https://sourcegraph.com/search?q=repo:ocaml/ocaml%24+or+repo:janestreet/base+or+repo:gitlab.com/tezos/tezos%24+or+repo:c-cube/ocaml-containers+or+repo:ocaml-batteries-team/batteries-included+or+repo:mirage/mirage%24+or+repo:ocsigen/lwt+or+repo:janestreet/async%24&patternType=literal`
          label=`GitHub`>
          <GithubIcon sizing=`h-6 w-6` />
        </IconLink>
        <IconLink
          href=`https://fosstodon.org/tags/ocaml`
          label=`Twitter`>
          <TwitterIcon sizing=`h-6 w-6` />
        </IconLink>
      </div>
    </div>
}

module A = {
  @react.component
  let make = (~children, ~href) =>
    <Link href>
      <a className="text-base text-gray-500 hover:text-gray-900"> children </a>
    </Link>
}

module H3 = {
  @react.component
  let make = (~children) =>
    <h3 className="text-sm font-semibold text-gray-400 tracking-wider uppercase"> children </h3>
}

module SectionLinks = {
  @react.component
  let make = (~name, ~keyPages: Js.Array.t<NavEntry.t>, ~margins) =>
    <div className=margins>
      <H3>{s(name)}</H3>
      <ul className="mt-4 space-y-4">
        {
          keyPages
          |> Js.Array.map(p => <li><A href=p.url>{s(p.NavEntry.label)}</A></li>)
          |> React.array
        }
      </ul>
    </div>
}

module MainLinksSection = {
  type industrySection = {
    header: string,
    whatIsOcaml: NavEntry.t,
    industrialUsers: NavEntry.t,
    successStories: NavEntry.t
  }

  type resourcesSection = {
    header: string,
    releases: NavEntry.t,
    applications: NavEntry.t,
    language: NavEntry.t,
    archive: NavEntry.t
  }

  type communitySection = {
    header: string,
    opportunities: NavEntry.t,
    news: NavEntry.t,
    aroundTheWeb: NavEntry.t
  }

  type legalSection = {
    header: string,
    privacy: NavEntry.t,
    terms: NavEntry.t,
    carbonFootprint: NavEntry.t
  }

  type t = {
    industrySection: industrySection,
    resourcesSection: resourcesSection,
    communitySection: communitySection,
    legalSection: legalSection,
  }

  @react.component
  let make = (~content, ~margins, ~colspan) =>
    <div className={"grid grid-cols-2 gap-8 " ++ margins ++ ` ` ++ colspan}>
        <div className="md:grid md:grid-cols-2 md:gap-8">
            <SectionLinks 
              name=content.industrySection.header 
              keyPages=[content.industrySection.whatIsOcaml, content.industrySection.industrialUsers, content.industrySection.successStories]
              margins=``/>
            <SectionLinks 
              name=content.resourcesSection.header 
              keyPages=[content.resourcesSection.releases, content.resourcesSection.applications, content.resourcesSection.language, content.resourcesSection.archive]
              margins=`mt-12 md:mt-0`/>
        </div>
        <div className="md:grid md:grid-cols-2 md:gap-8">
            <SectionLinks 
              name=content.communitySection.header 
              keyPages=[content.communitySection.opportunities, content.communitySection.news, content.communitySection.aroundTheWeb]
              margins=``/>
            <SectionLinks 
              name=content.legalSection.header 
              keyPages=[content.legalSection.privacy, content.legalSection.terms, content.legalSection.carbonFootprint]
              margins=`mt-12 md:mt-0`/>
        </div>
    </div>
}

module SponsorsSection = {
  type t = {
    thankSponsorPrefix: string,
    hostingProviders: NavEntry.t
  }

  @react.component
  let make = (~content, ~margins) =>
    <p className={"text-gray-500 text-base " ++ margins}> 
      {s(content.thankSponsorPrefix ++ ` `)} 
      <Link href=content.hostingProviders.url>
        <a className="text-orangedark underline"> {s(content.hostingProviders.label)} </a>
      </Link>
    </p>
}

module FooterContainer = {
  @react.component
  let make = (~children, ~footerLabel) =>
    <footer className="max-w-7xl mx-auto py-12 px-4 sm:px-6 lg:py-16 lg:px-8" ariaLabelledby="footerHeading"> 
      <h2 id="footerHeading" className="sr-only"> {s(footerLabel)} </h2>
      children 
    </footer>
}

type t = {
  footer: string,
  logoContent: LogoSection.t,
  mainLinksContent: MainLinksSection.t,
  sponsorContent: SponsorsSection.t
}

@react.component
let make = (~content) =>
  <FooterContainer footerLabel=content.footer>
    <div className="xl:grid xl:grid-cols-3 xl:gap-8">
      <LogoSection content=content.logoContent colspan="xl:col-span-1" />
      <MainLinksSection content=content.mainLinksContent margins="mt-12 xl:mt-0" colspan="xl:col-span-2" />
    </div>
    <SponsorsSection content=content.sponsorContent margins=`mt-10`/>
  </FooterContainer>
