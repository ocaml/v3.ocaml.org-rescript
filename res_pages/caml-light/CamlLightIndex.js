

import * as React from "react";

function $$default(param) {
  return React.createElement(React.Fragment, undefined, React.createElement("h1", undefined, "Caml Light"), React.createElement("h2", undefined, "Overview"), React.createElement("p", undefined, "Caml Light is a lightweight, portable implementation of the core Caml language that was \n    developed in the early 1990\'s, as a precursor to OCaml. It used to run on most Unix machines, \n    as well as PC under Microsoft Windows. The implementation is obsolete, no longer actively \n    maintained, and will be removed eventually. We recommend switching immediately to its \n    successor, OCaml."), React.createElement("p", undefined, "Caml Light is implemented as a bytecode compiler, and fully bootstrapped. The runtime \n    system and bytecode interpreter is written in standard C, hence Caml Light is easy to port \n    to almost any 32 or 64 bit platform. The whole system is quite small: about 100K for the \n    runtime system, and another 100K of bytecode for the compiler. Two megabytes of memory is \n    enough to recompile the whole system."), React.createElement("p", undefined, "Debugging is possible by tracing function calls in the same way as in OCaml. In the \n    example therein, one should write \n    trace \"fib\";;\n     instead of \n    #trace fib;;\n     and \n    untrace \"fib\";; \n    instead of \n    #untrace fib;;\n    . There also exists a debugger, as a user contribution."), React.createElement("h2", undefined, "Availability"), React.createElement("p", undefined));
}

export {
  $$default ,
  $$default as default,
  
}
/* react Not a pure module */
