let s = React.string

type t = {
  title: string,
  pageDescription: string,
}

let contentEn = {
  title: `Get Started with OCaml`,
  pageDescription: `This page will help you install OCaml, the Dune build system, and support for your favourite text editor or IDE. These instructions work on Windows, Unix systems like Linux, and macOS.`,
}

module MarkdownPageTitleHeading = {
  @react.component
  let make = (~title, ~pageDescription) =>
    <div className="text-lg max-w-prose mx-auto">
      <h1>
        <span
          className="mt-2 block text-3xl text-center leading-8 font-extrabold tracking-tight text-gray-900 sm:text-4xl">
          {s(title)}
        </span>
      </h1>
      <p className="mt-8 text-xl text-gray-500 leading-8"> {s(pageDescription)} </p>
    </div>
}

module MarkdownPageBody = {
  @react.component
  let make = (~margins) =>
    <div className={margins ++ ` prose prose-yellow prose-lg text-gray-500 mx-auto`}>
      <h2> {s(`Installing OCaml`)} </h2>
      <p> {s(`There are two procedures: one for Unix-like systems, and one for Windows.`)} </p>
      <h3> {s(`For Linux and macOS`)} </h3>
      <p>
        {s(`We will install OCaml using opam, the OCaml package manager. We will also use opam when we wish to install third-party OCaml libraries.`)}
      </p>
      <h3> {s(`For macOS`)} </h3>
      <pre>
        <code>
          {s(`# Homebrew
brew install opam

# MacPort
port install opam`)}
        </code>
      </pre>
    </div>
}

@react.component
let make = (~content=contentEn) => <>
  <ConstructionBanner
    figmaLink=`https://www.figma.com/file/36JnfpPe1Qoc8PaJq8mGMd/V1-Pages-Next-Step?node-id=430%3A21054`
    playgroundLink=`/play/resources/installocaml`
  />
  <div className="grid grid-cols-9">
    <div className="hidden lg:flex lg:col-span-2 " />
    <div className="col-span-9 lg:col-span-7 relative py-16 bg-graylight overflow-hidden">
      <div className="relative px-4 sm:px-6 lg:px-8">
        <MarkdownPageTitleHeading title=content.title pageDescription=content.pageDescription />
        <MarkdownPageBody margins=`mt-6` />
      </div>
    </div>
  </div>
</>

let default = make
