let default = () => {
  let s = React.string
  <>
    <h1 className="text-4xl font-bold py-2">{s(`Learn`)}</h1>
    <div className="flex justify-between space-x-4 py-4 bg-gray-300">
        <div className="flex-0 self-start bg-orange-200">
            <img src="static/learn-large.svg" className="" />
        </div>
        <div className="w-3/5 bg-red-200">{s(`What is OCaml? Ocaml is a general purpose
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
        <span className="text-xs">{s(`Read more`)}
        {s(`.`)}</span>
        </div>
        <div className="flex-1 flex justify-center pt-5 bg-yellow-200">
            <span>
            <a className="whitespace-no-wrap text-center text-white font-bold inline-block px-5 py-3 bg-green-800 rounded" href="">
            {s(`Install OCaml`)}
            </a>
            </span>
        </div>
    </div>

    <div className="flex space-x-8 mb-5">
        <div className="flex-1">
            <div className="border-b border-gray-500 mb-3">
                <h2 className="text-2xl font-semibold">{s(`Code Examples`)}</h2>
            </div>
            <div className="border-2 bg-gray-200 mb-3">
                <p>
                    {s(`(* If [1] is the list [e1;...;eN] *)`)}<br />
                    {s(`(* e1 +. ... +. eN *)`)}<br />
                    {s(`List.fold_left ( +. ) 0. 1`)}<br />
                    <br />
                    {s(`(* e1 +. ... +. eN *)`)}<br />
                    {s(`List.fold_left ( +. ) 0. 1`)}<br />
                    <br />
                    {s(`(* e1 +. ... +. eN *)`)}<br />
                    {s(`List.fold_left ( +. ) 0. 1`)}<br />
                    <br />
                    {s(`(* e1 +. ... +. eN *)`)}<br />
                    {s(`List.fold_left ( +. ) 0. 1`)}<br />
                    {s(`List.fold_left ( +. ) 0. 1`)}<br />
                </p>
            </div>
            <p className="text-sm">{s(`See more `)}
            {s(`Code Examples`)}
            {s(`, `)}
            {s(`Pleac`)}
            {s(`, and `)}
            {s(`Rosetta`)}
            {s(`.`)}</p>
        </div>
        <div className="flex-1">
            <div className="border-b border-gray-500 mb-3">
                <h2 className="text-2xl font-semibold">{s(`Tutorials & FAQ`)}</h2>
            </div>
            <ul className="px-4 list-disc list-inside space-y-3 mb-6">
                <li>{s("Up and Running")}</li>
                <li>{s("Basics")}</li>
                <li>{s("Structure of OCaml Programs")}</li>
                <li>{s("Modules")}</li>
                <li>{s("Maps (Dictionaries)")}</li>
                <li>{s("Sets")}</li>
                <li>{s("Hash Tables")}</li>
                <li>{s("Comparison of Standard Containers")}</li>
                <li>{s("Frequently Asked Questions")}</li>
            </ul>
            <p className="text-sm">{s("See full list")}</p>
        </div>
        <div className="flex-1">
            <div className="border-b border-gray-500 mb-3">
                <h2 className="text-2xl font-semibold">{s(`Books`)}</h2>
            </div>
            <img src="static/real-world-ocaml.jpeg" className="float-left w-5/12 mr-3"/>
            <img src="static/OCaml_from_beginning.png" className="float-left w-5/12 mb-4"/>
            <span className="clearfix" />
            <p className="mb-6">{s(`There are a number of excellent books, with two new 
            titles published in recent years.`)}</p>
            <p className="text-sm">{s("See full list")}</p>
        </div>
    </div>

    <div className="flex space-x-8">
        <div className="flex-1">
            <div className="border-b border-gray-500 mb-3">
                <h2 className="text-2xl font-semibold">{s(`Online Courses, Slides & Videos`)}</h2>
            </div>
            <div className="w-64 h-64 bg-black mb-2" />
            <p className="mb-6">
                {s(`A massive open online course (MOOC) entirely centered around OCaml`)}
                {s(` is now available, and runs once a year!`)}
                {s(`Learn more, and `)}
                {s(`register now on the FUN platform!`)}
            </p>
            <div className="w-64 h-64 bg-black mb-3"/>
            <p className="mb-6">
                {s(`An invited talk by Xavier Leroy explaining the current state of OCaml at the `)}
                {s(`OCaml Users and Developers WOrkshop 2014`)}
                {s(` in Gothenburg, Sweden (`)}
                {s(`PDF slides`)}
                {s(`, `)}
                {s(`Video`)}
                {s(`).`)}
            </p>
            <div className="w-64 h-64 bg-black mb-3"/>
            <p className="mb-6">
                {s(`A guest lecture given by Yaron Minsky of Jane Street about how to program 
                effectively in ML. The talk was given as part of the intro computer science class 
                at Harvard, CS51, where the students had spent much of the semester programming in 
                OCaml.`)}
            </p>
            <p className="text-sm">{s(`See more slides and videos`)}</p>
        </div>
        <div className="flex-1">
            <div className="border-b border-gray-500 mb-3">
                <h2 className="text-2xl font-semibold">{s(`Industrial Users`)}</h2>
            </div>
            <img src="static/jane-street.jpeg" className="float-left mb-2 mr-2"/>
            <p className="mb-6">{s(`Jane Street is a quantitative proprietary trading firm with 
            a unique focus on technology and collaborative problem solvinig. Almost all of 
            our systems are written in OCaml: from statistical research code operating 
            over terabytes of data to systems management tools to our real-time trading 
            infrastructure. And those systems are deployed at real scale: on an average day, 
            our trading represents between 1% and 2% of US equity volume.`)}</p>    
            <img src="static/facebook.png" className="float-left mb-2 mr-2"/>
            <p className="mb-6">{s(`To handle their huge PHP codebase, Facebook developed `)}
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
            <p className="text-sm">{s(`See more companies using OCaml`)}</p>    
        </div>
        <div className="flex-1">
            <div className="border-b border-gray-500 mb-3">
                <h2 className="text-2xl font-semibold">{s(`Success Stories`)}</h2>
            </div>
            <img src="static/unison-thumb.jpeg" className="float-left mr-2"/>
            <p className="mb-6">
                {s(`Unison`)}
                {s(` is an innovative two-way file synchronizer stemming from the `)}
                {s(`latest research`)}
                {s(`. It is resilient to failures and runs on Windows as well as 
                most flavors of Unix, including MacOSX. OCaml helped the authors to
                "organize a large and intricate codebase".`)}
            </p>                
            <img src="static/lexifi-thumb.jpeg" className="float-left mr-2"/>
            <p className="mb-6">
                {s(`Developed by `)}
                {s(`LexiFi`)}
                {s(` the Modeling Language for Finance (MLFi) is the first formal language that 
                accurately describes the most sophisticated capital market, credit, and investment 
                products. MLFii is implemented as an extension of OCaml.`)}
            </p>                
            <img src="static/fftw-thumb.png" className="float-left mt-3 mr-2"/>
            <p className="mb-6">
                {s(`FFTW`)}
                {s(` is a very Fast Fourier Transform library developed at MIT that competes with 
                vendor-tuned codes while remaining platform independent. The code is generated by `)}
                {s(`genfft`)}                
                {s(`, written in OCaml, that `)}
                {s(`"discovered" algorithms that were previously unknown`)}
                {s(`. It was awarded the `)}
                {s(`J. H. Wilkinson Prize for Numerical Software`)}
                {s(` that rewards software that 
                "best addresses all phases of the preparation of high quality numerical software."`)}
            </p>
            <p className="text-sm">{s(`See more success stories`)}</p>
        </div>
    </div>

  </>
}