

import * as React from "react";
import * as Markdown from "../components/Markdown.js";
import Hydrate from "next-mdx-remote/hydrate";
import RenderToString from "next-mdx-remote/render-to-string";

function $$default(props) {
  var content = Hydrate(props.source, Markdown.$$default);
  return React.createElement(React.Fragment, undefined, content);
}

function getStaticProps(_ctx) {
  var mdxSource = RenderToString("# some mdx", Markdown.$$default);
  return mdxSource.then(function (vl) {
              var props = {
                source: vl
              };
              return Promise.resolve({
                          props: props
                        });
            });
}

export {
  $$default ,
  $$default as default,
  getStaticProps ,
  
}
/* react Not a pure module */
