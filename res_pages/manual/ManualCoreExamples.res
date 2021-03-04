let s = React.string

let mainHtml = `
  <h1 class="text-4xl border-b-2 border-gray-200 pb-1 mb-7"><span class="font-bold">Chapter</span> <span>1</span> <span class="ml-6 font-bold">The core language</span></h1>
  <p class="mb-4">This part of the manual is a tutorial introduction to the OCaml language. A good familiarity with programming in a conventional languages (say, C or Java) is assumed, but no prior exposure to functional languages is required. The present chapter introduces the core language. Chapter ‍<a class="text-yellow-700" href="#">2</a> deals with the module system, chapter ‍<a class="text-yellow-700" href="#">3</a> with the object-oriented features, chapter ‍<a class="text-yellow-700" href="#">4</a> with extensions to the core language (labeled arguments and polymorphic variants), chapter <a class="text-yellow-700" href="#">5</a> with the limitations of polymorphism, and chapter ‍<a class="text-yellow-700" href="#">6</a> gives some advanced examples.</p>
  <h2 class="text-2xl mb-4"><span class="mr-5">1.1</span> Basics</h2>
  <p class="mb-4">For this overview of OCaml, we use the interactive system, which is started by running <span class="text-gray-500">ocaml</span> form the Unix shell or Windows command prompt. This tutorial is presented as the transcript of a session withthe interactive system: lines starting with <span class="text-gray-500">#</span> represent user input; the system responses are printed below, without a leading <span class="text-gray-500">#</span>.</p>

  <p class="mb-4">Under the interactive system, the user types OCaml phrases terminated by <span class="text-gray-500">;;</span> in response to the <span class="text-gray-500">#</span> prompt, and the system compiles them on the fly, executes them, and prints the outcome of evaluation. Phrases are either simple expressions, or <span class="text-gray-500">let</span> definitions of identifiers (either values or functions).</p>
  <pre class="border-l-4 border-yellow-600 bg-gray-200 pl-2">
<code><span class="text-gray-500">#</span># 1 + 2 * 3;;
<span class="text-green-800">- : int = 7</span></code></pre>
  <hr class="border-2 border-gray-600 mt-5" />
  <div class="flex justify-between mb-6">
    <div><< Foreward</div>
    <div>Chapter 2 The module system >></div>
  </div>
  <p class="text-sm">Copyright c 2021 Institut National de Recherche en Informatique et en Automatique</p>
`

let pageTocHeadings = 
  [ `1.1 Basics`
  , `1.2 Data types`
  ]

module PageTOC = {
  @react.component
  let make = () =>
    <>
    <h2 className="">{s(`Contents`)}</h2>
    {
      pageTocHeadings
      |> Js.Array.map(hd =>
        <h3 className="">{s(hd)}</h3>)
      |> React.array
    }
    </>   
}


@react.component
let make = () =>
  <div className="flex space-x-4 w-full mb-2">
    <div className="w-3/4 mt-6 px-4">
      <div dangerouslySetInnerHTML={{"__html": mainHtml}} />
    </div>
    <div className="">
      <PageTOC />
    </div>
  </div>

let default = make