// Generated by ReScript, PLEASE EDIT WITH CARE

import * as Fs from "fs";
import * as React from "react";
import * as Js_json from "bs-platform/lib/es6/js_json.js";
import * as JsYaml from "js-yaml";
import * as Js_option from "bs-platform/lib/es6/js_option.js";

function s(prim) {
  return prim;
}

function $$default(props) {
  var content = props.content;
  return React.createElement("div", {
              className: "relative bg-graylight"
            }, React.createElement("div", {
                  className: "relative bg-white shadow"
                }), React.createElement("main", undefined, React.createElement("div", {
                      className: "lg:relative"
                    }, React.createElement("div", {
                          className: "mx-auto max-w-7xl w-full pt-16 pb-20 text-center lg:py-48 lg:text-left"
                        }, React.createElement("div", {
                              className: "px-4 lg:w-1/2 sm:px-8 xl:pr-16"
                            }, React.createElement("h1", {
                                  className: "text-4xl tracking-tight font-extrabold text-gray-900 sm:text-5xl md:text-6xl lg:text-5xl xl:text-6xl"
                                }, content.welcomeHeader), React.createElement("p", {
                                  className: "mt-3 max-w-md mx-auto text-lg text-gray-500 sm:text-xl md:mt-5 md:max-w-3xl"
                                }, content.welcomeBody), React.createElement("div", {
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
                                        }, content.learnMore))))), React.createElement("div", {
                          className: "relative w-full h-64 sm:h-72 md:h-96 lg:absolute lg:inset-y-0 lg:right-0 lg:w-1/2 lg:h-full"
                        }, React.createElement("img", {
                              className: "absolute inset-0 w-full h-full object-cover",
                              alt: "",
                              src: "/static/oc-sq.jpeg"
                            }))), React.createElement("div", {
                      className: "pt-12 sm:pt-16"
                    }, React.createElement("div", {
                          className: "max-w-7xl mx-auto px-4 sm:px-6 lg:px-8"
                        }, React.createElement("div", {
                              className: "max-w-4xl mx-auto text-center"
                            }, React.createElement("h2", {
                                  className: "text-3xl font-extrabold text-gray-900 sm:text-4xl"
                                }, content.ocamlInNumbers))), React.createElement("div", {
                          className: "mt-10 pb-12 sm:pb-16"
                        }, React.createElement("div", {
                              className: "max-w-7xl mx-auto px-4 sm:px-6 lg:px-8"
                            }, React.createElement("div", {
                                  className: "max-w-4xl mx-auto"
                                }, React.createElement("dl", {
                                      className: "rounded-lg bg-white shadow-lg sm:grid sm:grid-cols-3"
                                    }, React.createElement("div", {
                                          className: "flex flex-col border-b border-gray-100 py-16 text-center sm:border-0 sm:border-r"
                                        }, React.createElement("dt", {
                                              className: "order-2 mt-2 text-lg leading-6 font-bold text-black text-opacity-70"
                                            }, content.activeMembers), React.createElement("dd", {
                                              className: "order-1 text-5xl font-extrabold text-orangedark"
                                            }, "2000+")), React.createElement("div", {
                                          className: "flex flex-col border-t border-b border-gray-100 py-16 text-center sm:border-0 sm:border-l sm:border-r"
                                        }, React.createElement("dt", {
                                              className: "order-2 mt-2 text-lg leading-6 font-bold text-black text-opacity-70"
                                            }, content.industrySatisfaction), React.createElement("dd", {
                                              className: "order-1 text-5xl font-extrabold text-orangedark"
                                            }, "97%")), React.createElement("div", {
                                          className: "flex flex-col border-t border-gray-100 py-16 text-center sm:border-0 sm:border-l"
                                        }, React.createElement("dt", {
                                              className: "order-2 mt-2 text-lg leading-6 font-bold text-black text-opacity-70"
                                            }, content.averagePrs), React.createElement("dd", {
                                              className: "order-1 text-5xl font-extrabold text-orangedark"
                                            }, "450"))))))), React.createElement("section", {
                      className: "pt-5 pb-20 overflow-hidden md:pt-6 mb:pb-24 lg:pt-10 lg:pb-40"
                    }, React.createElement("div", {
                          className: "relative max-w-7xl mx-auto px-4 sm:px-6 lg:px-8"
                        }, React.createElement("svg", {
                              "aria-labelledby": "svg-janestreet",
                              className: "absolute top-full right-full transform translate-x-1/3 -translate-y-1/4 lg:translate-x-1/2 xl:-translate-y-1/2",
                              role: "img",
                              height: "404",
                              width: "404",
                              fill: "none",
                              viewBox: "0 0 404 404"
                            }, React.createElement("title", {
                                  id: "svg-janestreet"
                                }, "Jane Street"), React.createElement("defs", undefined, React.createElement("pattern", {
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
                                  alt: "Jane Street",
                                  src: "/static/js.svg"
                                }), React.createElement("blockquote", {
                                  className: "mt-10"
                                }, React.createElement("div", {
                                      className: "max-w-3xl mx-auto text-center text-2xl leading-9 font-medium text-gray-900"
                                    }, React.createElement("p", undefined, React.createElement("span", {
                                              className: "text-orangedark"
                                            }, "“"), content.quoteBody, React.createElement("span", {
                                              className: "text-orangedark"
                                            }, "”"))), React.createElement("footer", {
                                      className: "mt-0"
                                    }, React.createElement("div", {
                                          className: "md:flex md:items-center md:justify-center"
                                        }, React.createElement("div", {
                                              className: "mt-3 text-center md:mt-0 md:ml-4 md:flex md:items-center"
                                            }, React.createElement("div", {
                                                  className: "text-base font-medium text-gray-900"
                                                }, "Yaron Minsky"), React.createElement("svg", {
                                                  className: "hidden md:block mx-1 h-5 w-5 text-orangedark",
                                                  fill: "currentColor",
                                                  viewBox: "0 0 20 20"
                                                }, React.createElement("path", {
                                                      d: "M11 0h3L9 20H6l5-20z"
                                                    })), React.createElement("div", {
                                                  className: "text-base font-medium text-gray-500"
                                                }, "Jane Street"))))))))));
}

function getStaticProps(_ctx) {
  var source = Fs.readFileSync("res_pages/IndexContent.yaml");
  var jsonRes = JsYaml.load(source, undefined);
  var jsonObj = Js_option.getExn(Js_json.decodeObject(jsonRes));
  var welcomeObj = jsonObj["welcomeHeader"];
  var welcomeVal = Js_option.getExn(Js_json.decodeString(welcomeObj));
  var indexContentEn_welcomeBody = "OCaml is a general purpose industrial-strength programming language with \n    an emphasis on expressiveness and safety. Its reputation for combining security \n    with speed makes it popular with many industrial users, as well as the growing \n    group of developers that make up its community.";
  var indexContentEn_installOcaml = "Install OCaml";
  var indexContentEn_learnMore = "Learn More";
  var indexContentEn_ocamlInNumbers = "OCaml in Numbers";
  var indexContentEn_activeMembers = "Active Members";
  var indexContentEn_industrySatisfaction = "Industry Satisfaction";
  var indexContentEn_averagePrs = "Average PRs per Week";
  var indexContentEn_quoteBody = "OCaml helps us to quickly adopt to changing market conditions, and go from \n    prototypes to production systems with less effort ... Billions of dollars of transactions \n    flow through our systems every day, so getting it right matters.";
  var indexContentEn = {
    welcomeHeader: welcomeVal,
    welcomeBody: indexContentEn_welcomeBody,
    installOcaml: indexContentEn_installOcaml,
    learnMore: indexContentEn_learnMore,
    ocamlInNumbers: indexContentEn_ocamlInNumbers,
    activeMembers: indexContentEn_activeMembers,
    industrySatisfaction: indexContentEn_industrySatisfaction,
    averagePrs: indexContentEn_averagePrs,
    quoteBody: indexContentEn_quoteBody
  };
  var props = {
    content: indexContentEn
  };
  return Promise.resolve({
              props: props
            });
}

var indexContentEn1 = {
  welcomeHeader: "NOT USED",
  welcomeBody: "OCaml is a general purpose industrial-strength programming language with \n    an emphasis on expressiveness and safety. Its reputation for combining security \n    with speed makes it popular with many industrial users, as well as the growing \n    group of developers that make up its community.",
  installOcaml: "Install OCaml",
  learnMore: "Learn More",
  ocamlInNumbers: "OCaml in Numbers",
  activeMembers: "Active Members",
  industrySatisfaction: "Industry Satisfaction",
  averagePrs: "Average PRs per Week",
  quoteBody: "OCaml helps us to quickly adopt to changing market conditions, and go from \n    prototypes to production systems with less effort ... Billions of dollars of transactions \n    flow through our systems every day, so getting it right matters."
};

export {
  s ,
  $$default ,
  $$default as default,
  indexContentEn1 ,
  getStaticProps ,
  
}
/* fs Not a pure module */
