let s = React.string

type t = {
  title: string,
  pageDescription: string,
  tableOfContents: ResourcesInstallOcaml.TableOfContents.t,
}

let contentEn = {
  title: `The Basics`,
  pageDescription: ``,
  tableOfContents: {
    contents: `Contents`,
    headings: [
      {
        name: "Running OCaml code",
        headingId: "running-ocaml-code",
        subHeadings: [],
      },
      {
        name: "Comments",
        headingId: "comments",
        subHeadings: [],
      },
      {
        name: "Calling functions",
        headingId: "calling-functions",
        subHeadings: [],
      },
      {
        name: "Defining a function",
        headingId: "defining-a-function",
        subHeadings: [],
      },
      {
        name: "Basic types",
        headingId: "basic-types",
        subHeadings: [],
      },
      {
        name: "Implicit vs. explicit casts",
        headingId: "implicit-vs-explicit-casts",
        subHeadings: [
          {
            subName: "Is implicit or explicit casting better?",
            subHeadingId: "is-implicit-or-explicit-casting-better",
          },
        ],
      },
      {
        name: "Ordinary functions and recursive functions",
        headingId: "ordinary-functions-and-recursive-functions",
        subHeadings: [],
      },
      {
        name: "Types of functions",
        headingId: "types-of-functions",
        subHeadings: [
          {
            subName: "Polymorphic functions",
            subHeadingId: "polymorphic-functions",
          },
        ],
      },
      {
        name: "Type inference",
        headingId: "type-inference",
        subHeadings: [],
      },
    ],
  },
}

type props = {
  source: NextMdxRemote.renderToStringResult,
  title: string,
  pageDescription: string,
  tableOfContents: ResourcesInstallOcaml.TableOfContents.t,
}

@react.component
let make = (~source, ~title, ~pageDescription, ~tableOfContents) => {
  let body = NextMdxRemote.hydrate(source, NextMdxRemote.hydrateParams())
  <>
    <ConstructionBanner />
    <div className="grid grid-cols-9 bg-white">
      <ResourcesInstallOcaml.TableOfContents content=tableOfContents />
      <div className="col-span-9 lg:col-span-7 bg-graylight relative py-16 overflow-hidden">
        <div className="relative px-4 sm:px-6 lg:px-8">
          <TitleHeading.MarkdownMedium title pageDescription />
          <ResourcesInstallOcaml.MarkdownPageBody margins=`mt-6`>
            body
          </ResourcesInstallOcaml.MarkdownPageBody>
        </div>
      </div>
    </div>
  </>
}

let getStaticProps = _ctx => {
  let contentFilePath = "res_pages/resources/basics.md"
  let source = Fs.readFileSync(contentFilePath)
  let mdSourcePromise = NextMdxRemote.renderToString(source, NextMdxRemote.renderToStringParams())
  mdSourcePromise->Js.Promise.then_(mdSource => {
    let props = {
      source: mdSource,
      title: contentEn.title,
      pageDescription: contentEn.pageDescription,
      tableOfContents: contentEn.tableOfContents,
    }
    Js.Promise.resolve({"props": props})
  }, _)
}

let default = make
