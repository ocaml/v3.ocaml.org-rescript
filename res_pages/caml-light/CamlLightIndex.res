let s = React.string

let default = () =>
  <>
  <h1>{s(`Caml Light`)}</h1>
  <h2>{s(`Overview`)}</h2>
  <p>
    {s(`Caml Light is a lightweight, portable implementation of the core Caml language that was 
    developed in the early 1990's, as a precursor to OCaml. It used to run on most Unix machines, 
    as well as PC under Microsoft Windows. The implementation is obsolete, no longer actively 
    maintained, and will be removed eventually. We recommend switching immediately to its 
    successor, OCaml.`)}
  </p>
  <p>
    {s(`Caml Light is implemented as a bytecode compiler, and fully bootstrapped. The runtime 
    system and bytecode interpreter is written in standard C, hence Caml Light is easy to port 
    to almost any 32 or 64 bit platform. The whole system is quite small: about 100K for the 
    runtime system, and another 100K of bytecode for the compiler. Two megabytes of memory is 
    enough to recompile the whole system.`)}
  </p>
  <p>
    {s(`Debugging is possible by tracing function calls in the same way as in OCaml. In the 
    example therein, one should write 
    trace "fib";;
     instead of 
    #trace fib;;
     and 
    untrace "fib";; 
    instead of 
    #untrace fib;;
    . There also exists a debugger, as a user contribution.`)}
  </p>
  <h2>{s(`Availability`)}</h2>
  <p>

  </p>
  </>
