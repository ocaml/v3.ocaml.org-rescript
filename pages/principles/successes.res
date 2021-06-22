type t = {
  title: string,
  pageDescription: string,
}

let contentEn = {
  title: `Success Stories`,
  pageDescription: ``,
}

let companies = [
  {
    LogoCloud.Company.logoSrc: "https://tailwindui.com/img/logos/transistor-logo-gray-400.svg",
    name: "Workcation",
  },
  {
    logoSrc: "https://tailwindui.com/img/logos/mirage-logo-gray-400.svg",
    name: "Mirage",
  },
  {
    logoSrc: "https://tailwindui.com/img/logos/tuple-logo-gray-400.svg",
    name: "Tuple",
  },
  {
    logoSrc: "https://tailwindui.com/img/logos/laravel-logo-gray-400.svg",
    name: "Laravel",
  },
  {
    logoSrc: "https://tailwindui.com/img/logos/statickit-logo-gray-400.svg",
    name: "StaticKit",
  },
  {
    logoSrc: "https://tailwindui.com/img/logos/statamic-logo-gray-400.svg",
    name: "Statamic",
  },
]

@react.component
let make = (~content=contentEn) => <>
  <ConstructionBanner />
  <Page.Basic title=content.title pageDescription=content.pageDescription>
    <div className=""> <LogoCloud companies /> </div>
  </Page.Basic>
</>

let default = make
