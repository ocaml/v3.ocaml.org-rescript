let s = React.string

type t = {
  title: string,
  pageDescription: string,
}

let contentEn = {
  title: `Events`,
  pageDescription: `Several events take place in the OCaml community over the course of each year, in countries all over the world. This calendar will help you stay up to date on what is coming up in the OCaml sphere.`,
}

@react.component
let make = (~content=contentEn) => <>
  <ConstructionBanner
    figmaLink=`https://www.figma.com/file/36JnfpPe1Qoc8PaJq8mGMd/V1-Pages-Next-Step?node-id=1176%3A0`
  />
  <div className="max-w-7xl mx-auto py-16 px-4 sm:py-24 sm:px-6 lg:px-8">
    <div className="text-center">
      <h1 className="mt-1 text-3xl font-extrabold text-gray-900 sm:text-4xl sm:tracking-tight">
        {s(content.title)}
      </h1>
      <p className="max-w-4xl mt-5 mx-auto text-xl text-gray-500"> {s(content.pageDescription)} </p>
    </div>
  </div>
</>

let default = make
