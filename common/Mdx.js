

import * as Belt_Array from "bs-platform/lib/es6/belt_Array.js";

var getMdxType = (element => {
      if(element == null || element.props == null) {
        return 'unknown';
      }
      return element.props.mdxType;
    });

var getMdxClassName = (element => {
      if(element == null || element.props == null) {
        return;
      }
      return element.props.className;
    });

function classify(v) {
  if ((function (a) { return  a instanceof Array})(v)) {
    return {
            TAG: 2,
            _0: v,
            [Symbol.for("name")]: "Array"
          };
  } else if (typeof v === "string") {
    return {
            TAG: 0,
            _0: v,
            [Symbol.for("name")]: "String"
          };
  } else if (typeof v === "object") {
    return {
            TAG: 1,
            _0: v,
            [Symbol.for("name")]: "Element"
          };
  } else {
    return {
            TAG: 3,
            _0: v,
            [Symbol.for("name")]: "Unknown"
          };
  }
}

var getMdxChildren = (element => {
      if(typeof element === 'string') {
        return element;
      }
      if(element == null || element.props == null || element.props.children == null) {
        return;
      }
      return element.props.children;
    });

function flatten(_mdxComp) {
  while(true) {
    var mdxComp = _mdxComp;
    var str = classify(getMdxChildren(mdxComp));
    switch (str.TAG | 0) {
      case /* String */0 :
          return [str._0];
      case /* Element */1 :
          _mdxComp = str._0;
          continue ;
      case /* Array */2 :
          return Belt_Array.reduce(str._0, [], (function (acc, next) {
                        return Belt_Array.concat(acc, flatten(next));
                      }));
      case /* Unknown */3 :
          return [];
      
    }
  };
}

function MdxChildren_toReactElement(prim) {
  return prim;
}

var MdxChildren = {
  classify: classify,
  getMdxChildren: getMdxChildren,
  flatten: flatten,
  toReactElement: MdxChildren_toReactElement
};

var Components = {};

var Provider = {};

export {
  getMdxType ,
  getMdxClassName ,
  MdxChildren ,
  Components ,
  Provider ,
  
}
/* No side effect */
