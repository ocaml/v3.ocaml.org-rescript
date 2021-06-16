module DeveloperGuides: {
  type t = {
    developerGuidesLabel: string,
    topDeveloperGuide: DeveloperGuide.t,
    bottomDeveloperGuide: DeveloperGuide.t,
  }
}

module UsingOcaml: {
  type t = {
    usingOcamlLabel: string,
    introduction: string,
    seeMore: string,
    softwareLeft: OcamlPoweredSoftware.t,
    softwareMiddle: OcamlPoweredSoftware.t,
    softwareRight: OcamlPoweredSoftware.t,
  }
}

type t = {
  title: string,
  pageDescription: string,
  developerGuidesContent: DeveloperGuides.t,
  usingOcamlContent: UsingOcaml.t,
}

include Page2.S with type t := t
