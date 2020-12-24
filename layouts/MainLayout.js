

import * as React from "react";
import * as HeaderNavigation from "../components/HeaderNavigation.js";

function MainLayout(Props) {
  var children = Props.children;
  var editpath = Props.editpath;
  var minWidth = {
    minWidth: "20rem"
  };
  return React.createElement(React.Fragment, undefined, React.createElement("div", {
                  className: "flex lg:justify-center min-h-screen -mb-8",
                  style: minWidth
                }, React.createElement("div", {
                      className: "max-w-5xl w-full lg:w-3/4 text-gray-900 font-base"
                    }, React.createElement(HeaderNavigation.make, {
                          editpath: editpath
                        }), React.createElement("main", {
                          className: "mt-4 mx-4"
                        }, children))), React.createElement("footer", {
                  className: "bg-red-100 p-2"
                }, "footer"));
}

var make = MainLayout;

export {
  make ,
  
}
/* react Not a pure module */
