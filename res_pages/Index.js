// Generated by ReScript, PLEASE EDIT WITH CARE

import * as React from "react";

function s(prim) {
  return prim;
}

function Index$HeroSection(Props) {
  var content = Props.content;
  return React.createElement("div", {
              className: "lg:relative"
            }, React.createElement("div", {
                  className: "mx-auto max-w-7xl w-full pt-16 pb-20 text-center lg:py-48 lg:text-left"
                }, React.createElement("div", {
                      className: "px-4 lg:w-1/2 sm:px-8 xl:pr-16"
                    }, React.createElement("h1", {
                          className: "text-4xl tracking-tight font-extrabold text-gray-900 sm:text-5xl md:text-6xl lg:text-5xl xl:text-6xl"
                        }, content.heroHeader), React.createElement("p", {
                          className: "mt-3 max-w-md mx-auto text-lg text-gray-500 sm:text-xl md:mt-5 md:max-w-3xl"
                        }, content.heroBody), React.createElement("div", {
                          className: "mt-10 sm:flex sm:justify-center lg:justify-start"
                        }, React.createElement("div", {
                              className: "rounded-md shadow"
                            }, React.createElement("a", {
                                  className: "w-full flex items-center justify-center px-8 py-3 border border-transparent text-base font-medium rounded-md text-white bg-orangedark hover:bg-orangedarker md:py-4 md:text-lg md:px-10",
                                  href: "#"
                                }, content.installOcaml)), React.createElement("div", {
                              className: "mt-3 rounded-md shadow sm:mt-0 sm:ml-3"
                            }, React.createElement("a", {
                                  className: "w-full flex items-center justify-center px-8 py-3 border border-transparent text-base font-medium rounded-md text-orangedark bg-white hover:bg-gray-50 md:py-4 md:text-lg md:px-10",
                                  href: "#"
                                }, content.aboutOcaml))))), React.createElement("div", {
                  className: "relative w-full h-64 sm:h-72 md:h-96 lg:absolute lg:inset-y-0 lg:right-0 lg:w-1/2 lg:h-full"
                }, React.createElement("img", {
                      className: "absolute inset-0 w-full h-full object-cover",
                      alt: "",
                      src: "/static/oc-sq.jpeg"
                    })));
}

var HeroSection = {
  make: Index$HeroSection
};

function Index$StatsSection(Props) {
  var content = Props.content;
  return React.createElement("div", {
              className: "pt-12 sm:pt-16"
            }, React.createElement("div", {
                  className: "max-w-7xl mx-auto px-4 sm:px-6 lg:px-8"
                }, React.createElement("div", {
                      className: "max-w-4xl mx-auto text-center"
                    }, React.createElement("h2", {
                          className: "text-3xl font-extrabold text-gray-900 sm:text-4xl"
                        }, content.statsTitle))), React.createElement("div", {
                  className: "mt-10 pb-12 sm:pb-16"
                }, React.createElement("div", {
                      className: "max-w-7xl mx-auto px-4 sm:px-6 lg:px-8"
                    }, React.createElement("div", {
                          className: "max-w-4xl mx-auto"
                        }, React.createElement("dl", {
                              className: "rounded-lg bg-white shadow-lg sm:grid sm:grid-cols-3"
                            }, React.createElement("div", {
                                  className: "flex flex-col border-b border-gray-100 py-16 px-4 text-center sm:border-0 sm:border-r"
                                }, React.createElement("dt", {
                                      className: "order-2 mt-2 text-lg leading-6 font-bold text-black text-opacity-70"
                                    }, content.userSatisfaction), React.createElement("dd", {
                                      className: "order-1 text-5xl font-extrabold text-orangedark"
                                    }, content.userSatisfactionPercent)), React.createElement("div", {
                                  className: "flex flex-col border-t border-b border-gray-100 py-16 px-4 text-center sm:border-0 sm:border-l sm:border-r"
                                }, React.createElement("dt", {
                                      className: "order-2 mt-2 text-lg leading-6 font-bold text-black text-opacity-70"
                                    }, content.workplaceUse), React.createElement("dd", {
                                      className: "order-1 text-5xl font-extrabold text-orangedark"
                                    }, content.workplaceUsePercent)), React.createElement("div", {
                                  className: "flex flex-col border-t border-gray-100 py-16 px-4 text-center sm:border-0 sm:border-l"
                                }, React.createElement("dt", {
                                      className: "order-2 mt-2 text-lg leading-6 font-bold text-black text-opacity-70"
                                    }, content.easyMaintain), React.createElement("dd", {
                                      className: "order-1 text-5xl font-extrabold text-orangedark"
                                    }, content.easyMaintainPercent)))))));
}

var StatsSection = {
  make: Index$StatsSection
};

function Index$OpamSection(Props) {
  var content = Props.content;
  return React.createElement("div", {
              className: "pt-12 sm:pt-16 pb-14 sm:flex sm:max-w-5xl sm:mx-auto px-4 sm:px-6 lg:px-8"
            }, React.createElement("div", {
                  className: "mb-4 flex-shrink-0 sm:mb-0 sm:mr-4"
                }, React.createElement("img", {
                      "aria-hidden": true,
                      className: "h-36",
                      src: "/static/opam.png"
                    })), React.createElement("div", undefined, React.createElement("h4", {
                      className: "text-2xl font-bold"
                    }, content.opamHeader), React.createElement("p", {
                      className: "mt-1"
                    }, content.opamBody), React.createElement("p", {
                      className: "text-right pr-5"
                    }, React.createElement("a", {
                          className: " text-yellow-600",
                          href: "https://opam.ocaml.org",
                          target: "_blank"
                        }, content.opamLinkText + " >"))));
}

var OpamSection = {
  make: Index$OpamSection
};

function Index$TestimonialSection(Props) {
  var content = Props.content;
  return React.createElement("section", {
              className: "pt-5 pb-20 overflow-hidden md:pt-6 mb:pb-24 lg:pt-10 lg:pb-40"
            }, React.createElement("div", {
                  className: "relative max-w-7xl mx-auto px-4 sm:px-6 lg:px-8"
                }, React.createElement("svg", {
                      "aria-labelledby": "svg-testimonial-org",
                      className: "absolute top-full right-full transform translate-x-1/3 -translate-y-1/4 lg:translate-x-1/2 xl:-translate-y-1/2",
                      role: "img",
                      height: "404",
                      width: "404",
                      fill: "none",
                      viewBox: "0 0 404 404"
                    }, React.createElement("title", {
                          id: "svg-testimonial-org"
                        }, content.organizationName), React.createElement("defs", undefined, React.createElement("pattern", {
                              id: "ad119f34-7694-4c31-947f-5c9d249b21f3",
                              height: "20",
                              width: "20",
                              patternUnits: "userSpaceOnUse",
                              x: "0",
                              y: "0"
                            }, React.createElement("rect", {
                                  className: "text-gray-200",
                                  height: "4",
                                  width: "4",
                                  fill: "currentColor",
                                  x: "0",
                                  y: "0"
                                }))), React.createElement("rect", {
                          height: "404",
                          width: "404",
                          fill: "url(#ad119f34-7694-4c31-947f-5c9d249b21f3)"
                        })), React.createElement("div", {
                      className: "relative"
                    }, React.createElement("img", {
                          className: "mx-auto h-24",
                          alt: content.organizationName,
                          src: content.organizationLogo
                        }), React.createElement("blockquote", {
                          className: "mt-10"
                        }, React.createElement("div", {
                              className: "max-w-3xl mx-auto text-center text-2xl leading-9 font-medium text-gray-900"
                            }, React.createElement("p", undefined, React.createElement("span", {
                                      className: "text-orangedark"
                                    }, "”"), content.quote, React.createElement("span", {
                                      className: "text-orangedark"
                                    }, "”"))), React.createElement("footer", {
                              className: "mt-0"
                            }, React.createElement("div", {
                                  className: "md:flex md:items-center md:justify-center"
                                }, React.createElement("div", {
                                      className: "mt-3 text-center md:mt-0 md:ml-4 md:flex md:items-center"
                                    }, React.createElement("div", {
                                          className: "text-base font-medium text-gray-900"
                                        }, content.speaker), React.createElement("svg", {
                                          className: "hidden md:block mx-1 h-5 w-5 text-orangedark",
                                          fill: "currentColor",
                                          viewBox: "0 0 20 20"
                                        }, React.createElement("path", {
                                              d: "M11 0h3L9 20H6l5-20z"
                                            })), React.createElement("div", {
                                          className: "text-base font-medium text-gray-500"
                                        }, content.organizationName))))))));
}

var TestimonialSection = {
  make: Index$TestimonialSection
};

var contentEn = {
  heroContent: {
    heroHeader: "Welcome to a World of OCaml",
    heroBody: "OCaml is a general purpose industrial-strength programming language with an emphasis on expressiveness and \n      safety.",
    installOcaml: "Install OCaml",
    aboutOcaml: "About OCaml"
  },
  statsContent: {
    statsTitle: "OCaml in Numbers",
    userSatisfaction: "Of users report feeling satisfied with the state of OCaml",
    workplaceUse: "Report that the use of OCaml is increasing or remaining stable in their workplace",
    easyMaintain: "Of users report feeling that OCaml software is easy to maintain",
    userSatisfactionPercent: "85%",
    workplaceUsePercent: "95%",
    easyMaintainPercent: "75%"
  },
  opamContent: {
    opamHeader: "Opam: the OCaml Package Manager",
    opamBody: "Opam is a source-based package manager for OCaml. It supports multiple simultaneous compiler \n      installations, flexible package constraints, and a Git-friendly development workflow.",
    opamLinkText: "Go to opam.ocaml.org"
  },
  testimonialContent: {
    quote: "OCaml helps us to quickly adopt to changing market conditions, and go from prototypes to production \n      systems with less effort ... Billions of dollars of transactions flow through our systems every day, so getting \n      it right matters.",
    organizationName: "Jane Street",
    speaker: "Yaron Minsky",
    organizationLogo: "/static/js.svg"
  }
};

function Index(Props) {
  var contentOpt = Props.content;
  var content = contentOpt !== undefined ? contentOpt : contentEn;
  return React.createElement(React.Fragment, undefined, React.createElement(Index$HeroSection, {
                  content: content.heroContent
                }), React.createElement(Index$StatsSection, {
                  content: content.statsContent
                }), React.createElement(Index$OpamSection, {
                  content: content.opamContent
                }), React.createElement(Index$TestimonialSection, {
                  content: content.testimonialContent
                }));
}

var make = Index;

var $$default = Index;

export {
  s ,
  HeroSection ,
  StatsSection ,
  OpamSection ,
  TestimonialSection ,
  contentEn ,
  make ,
  $$default ,
  $$default as default,
  
}
/* react Not a pure module */
