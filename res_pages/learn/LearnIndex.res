let default = () => {
  let s = React.string
  <>
    <h1 className="text-4xl font-bold py-2">{s(`Learn`)}</h1>
    <div className="flex space-x-8 py-4">
        <img src="static/learn-large.svg" className="flex-0" />
        <div className="flex-auto">{s(`What is OCaml? Ocaml is a general purpose
        industrial-strength programming language with an emphasis on
        expressiveness and safety. It is the technology of choice in `)}
        {s(`companies`)}
        {s(` where a single mistake can cost millions and speed matters,
        and there is an `)}
        {s(`active community`)}
        {s(` that has developed a `)}
        {s(`rich set of libraries`)}
        {s(`. It's also a widely used `)}
        {s(`teaching language`)}
        {s(`.`)}
        {s(`Read more`)}
        {s(`.`)}
        </div>
        <div className="flex-auto flex align-center items-center">
            <span>
            <a className="whitespace-no-wrap text-center text-white font-bold inline-block px-2 py-1 bg-green-800" href="">
            {s(`Install OCaml`)}
            </a>
            </span>
        </div>
    </div>

    <div className="flex space-x-8">
        <div className="flex-1">
            <div className="border-b border-gray-500">
                <h2 className="text-2xl font-semibold">{s(`Code Examples`)}</h2>
            </div>
        </div>
        <div className="flex-1">
            <div className="border-b border-gray-500">
                <h2 className="text-2xl font-semibold">{s(`Tutorials & FAQ`)}</h2>
            </div>
            <ul className="px-4 list-disc list-inside space-y-3">
                <li>{s("Up and Running")}</li>
                <li>{s("Basics")}</li>
                <li>{s("Structure of OCaml Programs")}</li>
            </ul>
        </div>
        <div className="flex-1">
            <div className="border-b border-gray-500">
                <h2 className="text-2xl font-semibold">{s(`Books`)}</h2>
            </div>
            <img src="static/real-world-ocaml.jpeg" className="float-left py-3 w-1/2"/>
            <img src="static/OCaml_from_beginning.png" className="float-left py-3 w-1/2"/>
            <span className="clearfix" />
            <p>{s(`There are a number of excellent books, with two new 
            titles published in recent years.`)}</p>
        </div>
    </div>

    <div className="flex space-x-8">
        <div className="flex-1">
            <div className="border-b border-gray-500">
                <h2 className="text-2xl font-semibold">{s(`Online Courses, Slides & Videos`)}</h2>
            </div>
        </div>
        <div className="flex-1">
            <div className="border-b border-gray-500">
                <h2 className="text-2xl font-semibold">{s(`Industrial Users`)}</h2>
            </div>
            <img src="static/jane-street.jpeg" className="float-left mb-2 mr-2 mt-2"/>
            <p className="py-3">{s(`Jane Street is a quantitative proprietary trading firm with 
            a unique focus on technology and collaborative problem solvinig. Almost all of 
            our systems are written in OCaml: from statistical research code operating 
            over terabytes of data to systems management tools to our real-time trading 
            infrastructure. And those systems are deployed at real scale: on an average day, 
            our trading represents between 1% and 2% of US equity volume.`)}</p>    
            <img src="static/facebook.png" className="float-left mb-2 mr-2 mt-2"/>
            <p className="py-3">{s(`To handle their huge PHP codebase, Facebook developed `)}
            {s(`pfff`)}
            {s(`, a set of tools and APIs to perform static analysis, dynamic analysis, code 
            visualizations, code navigations, and style-preserving source-to-source transformations 
            such as refactorings on source code. They also designed `)}
            {s(`Hack`)}
            {s(`, a new statically typed programming language for HHVM, a fast PHP runtime. 
            See Julien Verlaguet's `)}
            {s(`CUFP talk`)}
            {s(` and `)}
            {s(`slides`)}
            {s(`.`)}
            </p>    
        </div>
        <div className="flex-1">
            <div className="border-b border-gray-500">
                <h2 className="text-2xl font-semibold">{s(`Success Stories`)}</h2>
            </div>
        </div>
    </div>

  </>
}