open! Import

module T = {
  type t = {
    source: string,
    title: string,
    pageDescription: Js.Nullable.t<string>,
    tableOfContents: MarkdownPage.TableOfContents.t,
  }
  include Jsonable.Unsafe

  @react.component
  let make = (~content: t) => {
    <>
      // TODO: should this have a constrained width? what does tailwind do?
      <Page.Unstructured>
        <div className="grid grid-cols-9 bg-white">
          <MarkdownPage.TableOfContents content=content.tableOfContents />
          <div className="col-span-9 lg:col-span-7 bg-graylight relative py-16 overflow-hidden">
            <div className="relative px-4 sm:px-6 lg:px-8">
              <TitleHeading.MarkdownMedium
                title=content.title pageDescription={Js.Nullable.toOption(content.pageDescription)}
              />
              <MarkdownPage.MarkdownPageBody margins=`mt-6` renderedMarkdown=content.source />
            </div>
          </div>
        </div>
      </Page.Unstructured>
    </>
  }

  let contentEn = {
    contents: `Contents`,
  }

  module Params = Page2.Params.Lang.Tutorial

  let getContent = (params: Params.t) => {
    let tutorial = params.tutorial
    let lang = params.lang
    let baseDirectory = "data/tutorials/"
    // TODO: find the location of the tutorial
    let contentFilePath = baseDirectory ++ tutorial ++ "/" ++ tutorial ++ ".md"
    let parsed = Fs.readFileSync(contentFilePath)->GrayMatter.ofMarkdown
    let en = {
      parsed.content->Unified.process(
        Unified.unified()
        ->Unified.use(Unified.remarkParse)
        ->Unified.use(Unified.remarkSlug)
        ->Unified.use(MdastToc.plugin)
        ->Unified.use(Unified.remark2rehype)
        ->Unified.use(Unified.rehypeHighlight)
        ->Unified.use(Unified.rehypeStringify),
        _,
      )
        |> Js.Promise.then_((res: Unified.vfile) =>
          Js.Promise.resolve({
            source: res.contents,
            title: parsed.data.title,
            pageDescription: switch parsed.data.pageDescription {
            | None => Js.Nullable.null
            | Some(v) => Js.Nullable.return(v)
            },
            tableOfContents: {
              contents: contentEn.contents,
              toc: res.toc,
            },
          })
        )
    }
    let lang = switch lang {
    | #en => #en
    | #fr | #es => Lang.default
    }
    switch lang {
    | #en => en
    }
  }

  let getParams = () => {
    let markdownFiles = Fs.readdirSyncEntries("data/tutorials/")
    let lang = #en
    Js.Promise.resolve(
      markdownFiles |> Array.map((f: Fs.dirent) => {
        // TODO: better error
        Params.tutorial: Js.String.split(".", f.name)[0],
        lang: lang,
      }),
    )
  }
}

include T
include Page2.Make(T)
