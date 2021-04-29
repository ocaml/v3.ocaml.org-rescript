// Generated by ReScript, PLEASE EDIT WITH CARE

import * as React from "react";
import * as TitleHeading$Ocamlorg from "../../components/TitleHeading.js";
import * as MainContainer$Ocamlorg from "../../components/MainContainer.js";
import * as ConstructionBanner$Ocamlorg from "../../components/ConstructionBanner.js";

function s(prim) {
  return prim;
}

var contentEn = {
  title: "Papers Archive",
  pageDescription: "A selection of OCaml papers through the ages. Filter by the tags or do a search over all of the text."
};

function ResourcesPapersArchive(Props) {
  var contentOpt = Props.content;
  var content = contentOpt !== undefined ? contentOpt : contentEn;
  return React.createElement(React.Fragment, undefined, React.createElement(ConstructionBanner$Ocamlorg.make, {
                  playgroundLink: "/play/resources/paperarchive"
                }), React.createElement(MainContainer$Ocamlorg.Centered.make, {
                  children: React.createElement(TitleHeading$Ocamlorg.Large.make, {
                        title: content.title,
                        pageDescription: content.pageDescription
                      })
                }));
}

var make = ResourcesPapersArchive;

var $$default = ResourcesPapersArchive;

export {
  s ,
  contentEn ,
  make ,
  $$default ,
  $$default as default,
  
}
/* react Not a pure module */
