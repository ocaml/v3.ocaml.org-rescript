

import * as React from "react";

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

function Community_mailing_lists$H2(Props) {
  var children = Props.children;
  return React.createElement("h2", {
              className: "font-sans text-3xl font-bold leading-snub mb-1.5"
            }, children);
}

function Community_mailing_lists$H3(Props) {
  var children = Props.children;
  return React.createElement("h3", {
              className: "font-sans text-xl font-bold leading-snub mb-1.5"
            }, children);
}

function Community_mailing_lists$AEXT(Props) {
  var children = Props.children;
  var href = Props.href;
  return React.createElement("a", {
              className: "text-ocamlorange hover:underline",
              href: href,
              target: "_blank"
            }, children);
}

function $$default(param) {
  return React.createElement(React.Fragment, undefined, React.createElement(Community_mailing_lists$H1, {
                  children: "Mailing Lists and Web Forums"
                }), React.createElement(Community_mailing_lists$P, {
                  children: null
                }, "Mailing lists and other forums used to discuss OCaml in \n    general are listed below. There are thousands of other forums related to \n    individual projects. Several mailing lists are hosted on the ", React.createElement(Community_mailing_lists$AEXT, {
                      children: "lists.ocaml.org",
                      href: "http://lists.ocaml.org"
                    }), " domain. Projects on ", React.createElement(Community_mailing_lists$AEXT, {
                      children: "GitHub",
                      href: "https://github.com/trending?l=ocaml&since=monthly"
                    }), " actively use GitHub's Issue system for discussions."), React.createElement(Community_mailing_lists$H2, {
                  children: "Web Forums"
                }), React.createElement(Community_mailing_lists$H3, {
                  children: "Discuss at OCaml.org"
                }), React.createElement(Community_mailing_lists$P, {
                  children: null
                }, React.createElement(Community_mailing_lists$AEXT, {
                      children: "discuss.ocaml.org",
                      href: "https://discuss.ocaml.org"
                    }), "This is the most active forum about OCaml. Topics are grouped into a \n    variety of categories, which can be followed independently. This forum welcomes \n    people at all levels of proficiency, including beginners. A mailing-list mode \n    is also available for those who wish to receive all messages."), React.createElement(Community_mailing_lists$P, {
                  children: "Most categories are in English but categories in other languages \n    are welcome."
                }));
}

export {
  $$default ,
  $$default as default,
  
}
/* react Not a pure module */
