

import * as React from "react";
import Link from "next/link";

function Community_mailing_lists$P(Props) {
  var children = Props.children;
  return React.createElement("p", {
              className: "mb-6"
            }, children);
}

function Community_mailing_lists$H1(Props) {
  var children = Props.children;
  return React.createElement("h1", {
              className: "font-sans text-4xl font-bold leading-snub mb-1.5"
            }, children);
}

function Community_mailing_lists$UL(Props) {
  var children = Props.children;
  return React.createElement("ul", {
              className: "mb-6 ml-6 -mt-3 list-disc"
            }, children);
}

function Community_mailing_lists$LI(Props) {
  var children = Props.children;
  return React.createElement("li", {
              className: "mb-3"
            }, children);
}

function Community_mailing_lists$A(Props) {
  var children = Props.children;
  return React.createElement("a", {
              className: "text-ocamlorange hover:underline"
            }, children);
}

function $$default(param) {
  return React.createElement(React.Fragment, undefined, React.createElement(Community_mailing_lists$H1, {
                  children: "Mailing Lists and Web Forums"
                }), React.createElement(Community_mailing_lists$P, {
                  children: null
                }, "The ", React.createElement(Link, {
                      href: "/releases/latest/",
                      children: React.createElement(Community_mailing_lists$A, {
                            children: "latest"
                          })
                    }), " page points to the most recent release of the OCaml compiler \n     distribution. Below is a list of the recent releases."), React.createElement(Community_mailing_lists$P, {
                  children: null
                }, "See also the ", React.createElement(Link, {
                      href: "/docs/install.html",
                      children: React.createElement(Community_mailing_lists$A, {
                            children: "install"
                          })
                    }), " page for instructions on installing OCaml by other means, such as\n    the OPAM package manager and platform specific package managers."), React.createElement(Community_mailing_lists$UL, {
                  children: React.createElement(Community_mailing_lists$LI, {
                        children: null
                      }, "OCaml ", React.createElement(Link, {
                            href: "/releases/4.11.1.html",
                            children: React.createElement(Community_mailing_lists$A, {
                                  children: "4.11.1"
                                })
                          }), ", released Aug 31, 2020.")
                }));
}

export {
  $$default ,
  $$default as default,
  
}
/* react Not a pure module */
