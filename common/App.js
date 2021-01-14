

import * as React from "react";
import * as Router from "next/router";
import * as MainLayout$Ocamlorg from "../layouts/MainLayout.js";

function make(props) {
  var component = props.Component;
  var pageProps = props.pageProps;
  var router = Router.useRouter();
  var content = React.createElement(component, pageProps);
  console.log(router.route);
  var match = router.route;
  switch (match) {
    case "/design/industry" :
        return content;
    case "/releases" :
        return React.createElement(MainLayout$Ocamlorg.make, {
                    children: null,
                    editpath: "site/index.md"
                  }, React.createElement("h1", {
                        className: "font-bold"
                      }, "Releases Section"), React.createElement("div", undefined, content));
    default:
      return React.createElement(MainLayout$Ocamlorg.make, {
                  children: content,
                  editpath: "site/index.md"
                });
  }
}

export {
  make ,
  
}
/* react Not a pure module */
