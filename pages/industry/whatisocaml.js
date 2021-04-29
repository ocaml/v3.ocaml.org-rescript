// Generated by ReScript, PLEASE EDIT WITH CARE

import * as React from "react";
import * as TitleHeading$Ocamlorg from "../../components/TitleHeading.js";
import * as MainContainer$Ocamlorg from "../../components/MainContainer.js";
import * as ConstructionBanner$Ocamlorg from "../../components/ConstructionBanner.js";

function s(prim) {
  return prim;
}

var contentEn = {
  title: "What is OCaml",
  pageDescription: "A description of OCaml's features."
};

function Whatisocaml(Props) {
  var contentOpt = Props.content;
  var content = contentOpt !== undefined ? contentOpt : contentEn;
  return React.createElement(React.Fragment, undefined, React.createElement(ConstructionBanner$Ocamlorg.make, {}), React.createElement(MainContainer$Ocamlorg.Centered.make, {
                  children: React.createElement(TitleHeading$Ocamlorg.Large.make, {
                        title: content.title,
                        pageDescription: content.pageDescription
                      })
                }));
}

var make = Whatisocaml;

var $$default = Whatisocaml;

export {
  s ,
  contentEn ,
  make ,
  $$default ,
  $$default as default,
  
}
/* react Not a pure module */
