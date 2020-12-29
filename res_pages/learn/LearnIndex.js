

import * as React from "react";

function $$default(param) {
  return React.createElement(React.Fragment, undefined, React.createElement("h1", {
                  className: "text-4xl font-bold py-2"
                }, "Learn"), React.createElement("div", {
                  className: "flex space-x-8 py-4"
                }, React.createElement("img", {
                      className: "flex-0",
                      src: "static/learn-large.svg"
                    }), React.createElement("div", {
                      className: "flex-auto"
                    }, "What is OCaml? Ocaml is a general purpose\n        industrial-strength programming language with an emphasis on\n        expressiveness and safety. It is the technology of choice in ", "companies", " where a single mistake can cost millions and speed matters,\n        and there is an ", "active community", " that has developed a ", "rich set of libraries", ". It\'s also a widely used ", "teaching language", ".", "Read more", "."), React.createElement("div", {
                      className: "flex-auto flex align-center items-center"
                    }, React.createElement("span", undefined, React.createElement("a", {
                              className: "whitespace-no-wrap text-center text-white font-bold inline-block px-2 py-1 bg-green-800",
                              href: ""
                            }, "Install OCaml")))), React.createElement("div", {
                  className: "flex space-x-8"
                }, React.createElement("div", {
                      className: "flex-1"
                    }, React.createElement("div", {
                          className: "border-b border-gray-500"
                        }, React.createElement("h2", {
                              className: "text-2xl font-semibold"
                            }, "Code Examples")), React.createElement("div", {
                          className: "border-2 bg-gray-200"
                        }, React.createElement("p", undefined, "(* If [1] is the list [e1;...;eN] *)", React.createElement("br", undefined), "(* e1 +. ... +. eN *)", React.createElement("br", undefined), "List.fold_left ( +. ) 0. 1", React.createElement("br", undefined), React.createElement("br", undefined), "(* e1 +. ... +. eN *)", React.createElement("br", undefined), "List.fold_left ( +. ) 0. 1", React.createElement("br", undefined), React.createElement("br", undefined), "(* e1 +. ... +. eN *)", React.createElement("br", undefined), "List.fold_left ( +. ) 0. 1", React.createElement("br", undefined), React.createElement("br", undefined), "(* e1 +. ... +. eN *)", React.createElement("br", undefined), "List.fold_left ( +. ) 0. 1", React.createElement("br", undefined), "List.fold_left ( +. ) 0. 1", React.createElement("br", undefined))), React.createElement("p", undefined, "See more ", "Code Examples", ", ", "Pleac", ", and ", "Rosetta", ".")), React.createElement("div", {
                      className: "flex-1"
                    }, React.createElement("div", {
                          className: "border-b border-gray-500"
                        }, React.createElement("h2", {
                              className: "text-2xl font-semibold"
                            }, "Tutorials & FAQ")), React.createElement("ul", {
                          className: "px-4 list-disc list-inside space-y-3"
                        }, React.createElement("li", undefined, "Up and Running"), React.createElement("li", undefined, "Basics"), React.createElement("li", undefined, "Structure of OCaml Programs"), React.createElement("li", undefined, "Modules"), React.createElement("li", undefined, "Maps (Dictionaries)"), React.createElement("li", undefined, "Sets"), React.createElement("li", undefined, "Hash Tables"), React.createElement("li", undefined, "Comparison of Standard Containers"), React.createElement("li", undefined, "Frequently Asked Questions")), React.createElement("p", undefined, "See full list")), React.createElement("div", {
                      className: "flex-1"
                    }, React.createElement("div", {
                          className: "border-b border-gray-500"
                        }, React.createElement("h2", {
                              className: "text-2xl font-semibold"
                            }, "Books")), React.createElement("img", {
                          className: "float-left py-3 w-1/2",
                          src: "static/real-world-ocaml.jpeg"
                        }), React.createElement("img", {
                          className: "float-left py-3 w-1/2",
                          src: "static/OCaml_from_beginning.png"
                        }), React.createElement("span", {
                          className: "clearfix"
                        }), React.createElement("p", undefined, "There are a number of excellent books, with two new \n            titles published in recent years."), React.createElement("p", undefined, "See full list"))), React.createElement("div", {
                  className: "flex space-x-8"
                }, React.createElement("div", {
                      className: "flex-1"
                    }, React.createElement("div", {
                          className: "border-b border-gray-500"
                        }, React.createElement("h2", {
                              className: "text-2xl font-semibold"
                            }, "Online Courses, Slides & Videos")), React.createElement("div", {
                          className: "w-64 h-64 bg-black"
                        }), React.createElement("p", undefined, "A massive open online course (MOOC) entirely centered around OCaml", " is now available, and runs once a year!", "Learn more, and ", "register now on the FUN platform!"), React.createElement("div", {
                          className: "w-64 h-64 bg-black"
                        }), React.createElement("p", undefined, "An invited talk by Xavier Leroy explaining the current state of OCaml at the ", "OCaml Users and Developers WOrkshop 2014", " in Gothenburg, Sweden (", "PDF slides", ", ", "Video", ")."), React.createElement("div", {
                          className: "w-64 h-64 bg-black"
                        }), React.createElement("p", undefined, "A guest lecture given by Yaron Minsky of Jane Street about how to program \n                effectively in ML. The talk was given as part of the intro computer science class \n                at Harvard, CS51, where the students had spent much of the semester programming in \n                OCaml."), React.createElement("p", undefined, "See more slides and videos")), React.createElement("div", {
                      className: "flex-1"
                    }, React.createElement("div", {
                          className: "border-b border-gray-500"
                        }, React.createElement("h2", {
                              className: "text-2xl font-semibold"
                            }, "Industrial Users")), React.createElement("img", {
                          className: "float-left mb-2 mr-2 mt-2",
                          src: "static/jane-street.jpeg"
                        }), React.createElement("p", {
                          className: "py-3"
                        }, "Jane Street is a quantitative proprietary trading firm with \n            a unique focus on technology and collaborative problem solvinig. Almost all of \n            our systems are written in OCaml: from statistical research code operating \n            over terabytes of data to systems management tools to our real-time trading \n            infrastructure. And those systems are deployed at real scale: on an average day, \n            our trading represents between 1% and 2% of US equity volume."), React.createElement("img", {
                          className: "float-left mb-2 mr-2 mt-2",
                          src: "static/facebook.png"
                        }), React.createElement("p", {
                          className: "py-3"
                        }, "To handle their huge PHP codebase, Facebook developed ", "pfff", ", a set of tools and APIs to perform static analysis, dynamic analysis, code \n            visualizations, code navigations, and style-preserving source-to-source transformations \n            such as refactorings on source code. They also designed ", "Hack", ", a new statically typed programming language for HHVM, a fast PHP runtime. \n            See Julien Verlaguet\'s ", "CUFP talk", " and ", "slides", "."), React.createElement("p", undefined, "See more companies using OCaml")), React.createElement("div", {
                      className: "flex-1"
                    }, React.createElement("div", {
                          className: "border-b border-gray-500"
                        }, React.createElement("h2", {
                              className: "text-2xl font-semibold"
                            }, "Success Stories")))));
}

export {
  $$default ,
  $$default as default,
  
}
/* react Not a pure module */
