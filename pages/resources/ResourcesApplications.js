// Generated by ReScript, PLEASE EDIT WITH CARE

import * as React from "react";
import * as Caml_array from "bs-platform/lib/es6/caml_array.mjs";
import * as Next$Ocamlorg from "../../bindings/Next.js";
import * as TitleHeading$Ocamlorg from "../../components/TitleHeading.js";
import * as MainContainer$Ocamlorg from "../../components/MainContainer.js";
import * as DeveloperGuide$Ocamlorg from "../../common/DeveloperGuide.js";
import * as SectionContainer$Ocamlorg from "../../components/SectionContainer.js";
import * as ConstructionBanner$Ocamlorg from "../../components/ConstructionBanner.js";
import * as OcamlPoweredSoftware$Ocamlorg from "../../common/OcamlPoweredSoftware.js";

function s(prim) {
  return prim;
}

function ResourcesApplications$ApiDocumentation(Props) {
  var margins = Props.margins;
  return React.createElement(SectionContainer$Ocamlorg.MediumCentered.make, {
              children: null,
              margins: margins,
              paddingX: "px-32",
              otherLayout: "sm:flex items-center"
            }, React.createElement("div", {
                  className: "mb-4 sm:mb-0 sm:mr-4"
                }, React.createElement("h4", {
                      className: "text-4xl font-bold mb-8"
                    }, "API Documentation"), React.createElement("p", {
                      className: "mt-1 mb-8"
                    }, "Visit our page for API Documentation in OCaml for a concise reference manual with all the information you need to work with the OCaml API."), React.createElement("a", {
                      className: "inline-flex items-center px-14 py-2 border border-transparent text-sm leading-4 font-medium rounded-md shadow-sm text-white bg-orangedark hover:bg-orangedarker",
                      href: "https://docs.mirage.io/",
                      target: "_blank"
                    }, "Visit Docs.ocaml.org")), React.createElement("div", {
                  className: "flex-shrink-0"
                }, React.createElement("img", {
                      className: "h-56",
                      src: "/static/api-img.jpeg"
                    })));
}

var ApiDocumentation = {
  make: ResourcesApplications$ApiDocumentation
};

function ResourcesApplications$DeveloperGuides(Props) {
  var margins = Props.margins;
  var content = Props.content;
  return React.createElement("div", {
              className: "bg-white overflow-hidden shadow rounded-lg mx-auto max-w-3xl " + margins
            }, React.createElement("div", {
                  className: "px-4 py-5 sm:p-6"
                }, React.createElement("h2", {
                      className: "text-center text-orangedark text-4xl font-bold mb-8"
                    }, content.developerGuidesLabel), React.createElement("div", {
                      className: "flex mb-11"
                    }, React.createElement("div", undefined, React.createElement("h4", {
                              className: "text-base font-bold mb-3"
                            }, React.createElement("a", {
                                  className: "hover:underline",
                                  href: content.topDeveloperGuide.link,
                                  target: "_blank"
                                }, content.topDeveloperGuide.name)), React.createElement("p", {
                              className: "mt-1"
                            }, content.topDeveloperGuide.description)), React.createElement("div", {
                          className: "ml-10 flex-shrink-0"
                        }, React.createElement("img", {
                              className: content.topDeveloperGuide.imageHeight,
                              src: "/static/" + content.topDeveloperGuide.image
                            }))), React.createElement("div", {
                      className: "flex mb-11"
                    }, React.createElement("div", {
                          className: "mr-10 flex-shrink-0"
                        }, React.createElement("img", {
                              className: content.bottomDeveloperGuide.imageHeight,
                              src: "/static/" + content.bottomDeveloperGuide.image
                            })), React.createElement("div", undefined, React.createElement("h4", {
                              className: "text-base font-bold mb-3"
                            }, React.createElement("a", {
                                  className: "hover:underline",
                                  href: content.bottomDeveloperGuide.link,
                                  target: "_blank"
                                }, content.bottomDeveloperGuide.name)), React.createElement("p", {
                              className: "mt-1"
                            }, content.bottomDeveloperGuide.description)))));
}

var DeveloperGuides = {
  make: ResourcesApplications$DeveloperGuides
};

function ResourcesApplications$PlatformTools(Props) {
  return React.createElement(SectionContainer$Ocamlorg.VerySmallCentered.make, {
              children: null,
              paddingY: "py-16 sm:py-20",
              paddingX: "px-4 sm:px-6 lg:px-2"
            }, React.createElement("h2", {
                  className: "text-3xl font-bold sm:text-3xl text-center"
                }, "Platform Tools"), React.createElement("p", {
                  className: "mt-4 text-lg leading-6"
                }, "The OCaml Platform is a collection of tools that allow programmers to be productive in the OCaml language. It has been an iterative process of refinement as new tools are added and older tools are updated. Different tools accomplish different workflows and are used at different points of a project's life."), React.createElement("div", {
                  className: "flex justify-center"
                }, React.createElement(Next$Ocamlorg.Link.make, {
                      href: "/resources/platform",
                      children: React.createElement("a", {
                            className: "mt-8 w-full inline-flex items-center justify-center px-8 py-1 border border-transparent text-white text-base font-medium rounded-md bg-orangedark hover:bg-orangedarker sm:w-auto"
                          }, "Visit Platform Tools")
                    })));
}

var PlatformTools = {
  make: ResourcesApplications$PlatformTools
};

function ResourcesApplications$UsingOcaml(Props) {
  var margins = Props.margins;
  var content = Props.content;
  return React.createElement("div", {
              className: "bg-white overflow-hidden shadow rounded-lg mx-auto max-w-3xl " + margins
            }, React.createElement("div", {
                  className: "px-4 py-5 sm:py-8 sm:px-24"
                }, React.createElement("h2", {
                      className: "text-center text-orangedark text-4xl font-bold mb-8"
                    }, content.usingOcamlLabel), React.createElement("p", {
                      className: "text-center mb-6"
                    }, content.introduction), React.createElement("div", {
                      className: "grid grid-cols-3 gap-x-16 mb-6"
                    }, React.createElement("div", {
                          className: "flex justify-center items-center mb-6"
                        }, React.createElement("a", {
                              href: content.softwareLeft.link,
                              target: "_blank"
                            }, React.createElement("img", {
                                  className: "border-1 " + content.softwareLeft.imageHeight,
                                  alt: content.softwareLeft.linkDescription,
                                  src: "/static/" + content.softwareLeft.image
                                }))), React.createElement("div", {
                          className: "flex justify-center items-center mb-6"
                        }, React.createElement("a", {
                              href: content.softwareMiddle.link,
                              target: "_blank"
                            }, React.createElement("img", {
                                  className: "border-1 " + content.softwareMiddle.imageHeight,
                                  alt: content.softwareMiddle.linkDescription,
                                  src: "/static/" + content.softwareMiddle.image
                                }))), React.createElement("div", {
                          className: "flex justify-center items-center mb-6"
                        }, React.createElement("a", {
                              href: content.softwareRight.link,
                              target: "_blank"
                            }, React.createElement("img", {
                                  className: "border-1 " + content.softwareRight.imageHeight,
                                  alt: content.softwareRight.linkDescription,
                                  src: "/static/" + content.softwareRight.image
                                }))), React.createElement("div", undefined, React.createElement("p", {
                              className: "font-bold text-center mb-2"
                            }, content.softwareLeft.name), React.createElement("p", undefined, content.softwareLeft.description)), React.createElement("div", undefined, React.createElement("p", {
                              className: "font-bold text-center mb-2"
                            }, content.softwareMiddle.name), React.createElement("p", undefined, content.softwareMiddle.description)), React.createElement("div", undefined, React.createElement("p", {
                              className: "font-bold text-center mb-2"
                            }, content.softwareRight.name), React.createElement("p", undefined, content.softwareRight.description))), React.createElement("p", {
                      className: "text-right font-bold"
                    }, React.createElement(Next$Ocamlorg.Link.make, {
                          href: "/resources/usingocaml",
                          children: React.createElement("a", {
                                className: "text-orangedark underline"
                              }, content.seeMore + " >")
                        }))));
}

var UsingOcaml = {
  make: ResourcesApplications$UsingOcaml
};

function ResourcesApplications(Props) {
  var title = Props.title;
  var pageDescription = Props.pageDescription;
  var developerGuidesContent = Props.developerGuidesContent;
  var usingOcamlContent = Props.usingOcamlContent;
  return React.createElement(React.Fragment, undefined, React.createElement(ConstructionBanner$Ocamlorg.make, {
                  figmaLink: "https://www.figma.com/file/36JnfpPe1Qoc8PaJq8mGMd/V1-Pages-Next-Step?node-id=745%3A1",
                  playgroundLink: "/play/resources/applications"
                }), React.createElement(MainContainer$Ocamlorg.None.make, {
                  children: null
                }, React.createElement(TitleHeading$Ocamlorg.Large.make, {
                      title: title,
                      pageDescription: pageDescription,
                      marginTop: "mt-1",
                      marginBottom: "mb-24",
                      addBottomBar: true
                    }), React.createElement(ResourcesApplications$ApiDocumentation, {
                      margins: "mb-24"
                    }), React.createElement(ResourcesApplications$DeveloperGuides, {
                      margins: "mb-2",
                      content: developerGuidesContent
                    }), React.createElement(ResourcesApplications$PlatformTools, {}), React.createElement(ResourcesApplications$UsingOcaml, {
                      margins: "mb-16",
                      content: usingOcamlContent
                    })));
}

function getStaticProps(_ctx) {
  var developerGuides = DeveloperGuide$Ocamlorg.readAll(undefined);
  var ocamlPoweredSoftare = OcamlPoweredSoftware$Ocamlorg.readAll(undefined);
  var developerGuidesContent_topDeveloperGuide = Caml_array.get(developerGuides, 0);
  var developerGuidesContent_bottomDeveloperGuide = Caml_array.get(developerGuides, 1);
  var developerGuidesContent = {
    developerGuidesLabel: "Developer Guides",
    topDeveloperGuide: developerGuidesContent_topDeveloperGuide,
    bottomDeveloperGuide: developerGuidesContent_bottomDeveloperGuide
  };
  return {
          props: {
            title: "Applications",
            pageDescription: "This is where you can find resources for working with the language itself. Whether you're building applications or maintaining libraries, this page has useful information for you.",
            developerGuidesContent: developerGuidesContent,
            usingOcamlContent: {
              usingOcamlLabel: "Using OCaml",
              introduction: "Besides developing in the language and making your own applications, there are many useful tools that already exist in OCaml for you to use.",
              seeMore: "See more",
              softwareLeft: Caml_array.get(ocamlPoweredSoftare, 0),
              softwareMiddle: Caml_array.get(ocamlPoweredSoftare, 1),
              softwareRight: Caml_array.get(ocamlPoweredSoftare, 2)
            }
          }
        };
}

var Link;

var make = ResourcesApplications;

var $$default = ResourcesApplications;

export {
  Link ,
  s ,
  ApiDocumentation ,
  DeveloperGuides ,
  PlatformTools ,
  UsingOcaml ,
  make ,
  getStaticProps ,
  $$default ,
  $$default as default,
  
}
/* react Not a pure module */
