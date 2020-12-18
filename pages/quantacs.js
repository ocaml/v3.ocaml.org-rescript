

import * as React from "react";

function Quantacs$H1(Props) {
  var children = Props.children;
  return React.createElement("h1", {
              className: "font-sans text-4xl font-bold leading-snug mb-2"
            }, children);
}

var H1 = {
  make: Quantacs$H1
};

function $$default(param) {
  return React.createElement(React.Fragment, undefined, React.createElement(Quantacs$H1, {
                  children: "OCaml Users and Developers Workshop"
                }));
}

export {
  H1 ,
  $$default ,
  $$default as default,
  
}
/* react Not a pure module */
