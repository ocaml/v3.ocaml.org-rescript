
let footerContentEn: Footer.footerContent = {
    footer: `Footer`,
    ocamlSummary: `Innovation. Community. Security.`,
    industry: `Industry`,
    whatIsOcaml: `What is OCaml`,
    industrialUsers: `Industrial Users`,
    successStories: `Success Stories`,
    resources: `Resources`,
    documentation: `Documentation`,
    learn: `Learn`,
    community: `Community`,
    opportunities: `Opportunities`,
    news: `News`,
    aroundTheWeb: `Around the Web`,
    legal: `Legal`,
    privacy: `Privacy`,
    terms: `Terms`,
    claims: `Claims`,
    cookies: `Cookies`
}

@react.component
let make = (~children, ~editpath) => {
  let navMainStyle = ReactDOMRe.Style.make(
    ~minWidth="20rem",
    ~flex="1 0 auto",
    ());
  <>
  <div className="flex flex-col min-h-screen font-base text-gray-900">

    <div style=navMainStyle className="flex lg:justify-center">

      <div className="max-w-5xl w-full lg:w-3/4">

        <HeaderNavigation editpath={editpath} />

        <main className="mt-4 mx-4" role="main">
          children 
        </main>

      </div>

    </div>

    <div className="flex-shrink-0 flex lg:justify-center">

      <div className="max-w-5xl w-full lg:w-3/4">
        <Footer content=footerContentEn/>
      </div>

    </div>

  </div>
  </>;
};
