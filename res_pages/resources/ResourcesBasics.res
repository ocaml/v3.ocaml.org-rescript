let s = React.string

type t = {tableOfContents: ResourcesInstallOcaml.TableOfContents.t}

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

let contentEn = {
  tableOfContents: {
    contents: `Contents`, // take this from a generic markdown generic content yaml file, hardcode for now
    headings: [
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
    ],
  },
}

@module("gray-matter") external matter: string => Js.Json.t = "default"

// change this page into a generic url page <<<
let getStaticProps = _ctx => {
  let contentFilePath = "res_pages/resources/basics.md"
  let fileContents = Fs.readFileSync(contentFilePath)
  let parsed = matter(fileContents)
  let dict = Js.Option.getExn(Js.Json.decodeObject(parsed))
  let dataJson = Js.Dict.unsafeGet(dict, "data")
  let dataDict = Js.Option.getExn(Js.Json.decodeObject(dataJson))
  let titleJson = Js.Dict.unsafeGet(dataDict, "title")
  let title = Js.Option.getExn(Js.Json.decodeString(titleJson))

  let contentJson = Js.Dict.unsafeGet(dict, "content")
  let source = Js.Option.getExn(Js.Json.decodeString(contentJson))

  // TODO: parse table of contents from front matter
  let mdSourcePromise = NextMdxRemote.renderToString(source, NextMdxRemote.renderToStringParams())
  mdSourcePromise->Js.Promise.then_(mdSource => {
    let props = {
      source: mdSource,
      title: title,
      pageDescription: "",
      tableOfContents: contentEn.tableOfContents,
    }
    Js.Promise.resolve({"props": props})
  }, _)
}

let default = make
