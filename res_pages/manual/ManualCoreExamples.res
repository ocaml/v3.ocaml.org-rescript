let s = React.string

let mainHtml = `
  <h1 class="text-4xl">Chapter 1  The core language</h1>
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
  <div className="flex space-x-4 w-full">
    <div className="w-3/4">
      <div dangerouslySetInnerHTML={{"__html": mainHtml}} />
    </div>
    <div className="">
      <PageTOC />
    </div>
  </div>

let default = make