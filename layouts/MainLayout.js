// Generated by ReScript, PLEASE EDIT WITH CARE

import * as React from "react";
import * as Footer$Ocamlorg from "../components/Footer.js";
import * as HeaderNavigation$Ocamlorg from "../components/HeaderNavigation.js";

var headerContentEn_industry = "Industry";

var headerContentEn_resources = "Resources";

var headerContentEn_community = "Community";

var headerContentEn_search = "Search";

var headerContentEn_openMenu = "Open menu";

var headerContentEn = {
  industry: headerContentEn_industry,
  resources: headerContentEn_resources,
  community: headerContentEn_community,
  search: headerContentEn_search,
  openMenu: headerContentEn_openMenu
};

var footerContentEn_footer = "Footer";

var footerContentEn_logoContent = {
  ocamlSummary: "Innovation. Community. Security."
};

var footerContentEn_mainLinksContent = {
  industrySection: {
    header: "Industry",
    whatIsOcaml: {
      label: "What is OCaml",
      url: "/industry/whatisocaml"
    },
    industrialUsers: {
      label: "Industrial Users",
      url: "/industry/users"
    },
    successStories: {
      label: "Success Stories",
      url: "/play/industry/successstories"
    }
  },
  resourcesSection: {
    header: "Resources",
    releases: {
      label: "Releases",
      url: "/play/resource/releases"
    },
    applications: {
      label: "Applications",
      url: "/play/resource/applications"
    },
    language: {
      label: "Language",
      url: "/play/resource/language"
    },
    archive: {
      label: "Archive",
      url: "/play/resource/archive"
    }
  },
  communitySection: {
    header: "Community",
    opportunities: {
      label: "Opportunities",
      url: "/play/community/opportunities"
    },
    news: {
      label: "News",
      url: "/play/community/news"
    },
    aroundTheWeb: {
      label: "Around the Web",
      url: "/community/aroundweb"
    }
  },
  legalSection: {
    header: "Legal",
    privacy: {
      label: "Privacy",
      url: "/play/privacypolicy"
    },
    terms: {
      label: "Terms",
      url: "#"
    },
    carbonFootprint: {
      label: "Carbon Footprint",
      url: "#"
    }
  }
};

var footerContentEn_sponsorContent = {
  thankSponsorPrefix: "Thank you to our",
  hostingProviders: {
    label: "Hosting Providers",
    url: "#"
  }
};

var footerContentEn = {
  footer: footerContentEn_footer,
  logoContent: footerContentEn_logoContent,
  mainLinksContent: footerContentEn_mainLinksContent,
  sponsorContent: footerContentEn_sponsorContent
};

function MainLayout(Props) {
  var children = Props.children;
  return React.createElement("div", {
              className: "bg-white"
            }, React.createElement("div", {
                  className: "relative shadow"
                }, React.createElement(HeaderNavigation$Ocamlorg.make, {
                      content: headerContentEn
                    })), React.createElement("main", {
                  className: "relative bg-graylight pb-1"
                }, children), React.createElement("div", {
                  className: "relative"
                }, React.createElement(Footer$Ocamlorg.make, {
                      content: footerContentEn
                    })));
}

var navContentEn = {
  industry: "Industry",
  resources: "Resources",
  community: "Community"
};

var make = MainLayout;

export {
  navContentEn ,
  headerContentEn ,
  footerContentEn ,
  make ,
  
}
/* react Not a pure module */
