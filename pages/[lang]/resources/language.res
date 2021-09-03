open! Import

module T = {
  module Tutorials = {
    type t = {
      title: string,
      description: string,
      tutorials: array<Ood.Tutorial.t>,
    }

    @react.component
    let make = (~content, ~lang) => {
      let left =
        <div className="flex h-full flex-col items-center justify-center">
          <div className="py-8 sm:pl-12">
            <CallToAction.Embedded
              t={
                CallToAction.title: content.title,
                body: content.description,
                buttonLink: #Route(#ResourcesTutorials, lang),
                buttonText: "See All Tutorials",
              }
            />
          </div>
        </div>

      let right =
        <div className="flex h-full items-center justify-center">
          <ul className="list-disc pb-8 sm:pb-0 leading-10">
            {Array.mapi(
              (i, t: Ood.Tutorial.t) =>
                <li key={string_of_int(i)}>
                  <Route _to={#ResourcesTutorial(t.slug)} lang>
                    <a className="text-orangedark text-xl underline"> {React.string(t.title)} </a>
                  </Route>
                </li>,
              content.tutorials,
            ) |> React.array}
          </ul>
        </div>
      <SplitCard.MediumCentered left right />
    }
  }

  module Manual = {
    type item = {
      link: string,
      text: string,
    }

    type t = {
      title: string,
      items: array<item>,
    }

    @react.component
    let make = (~content: t, ~cols, ~marginBottom=?) => {
      <SectionContainer.MediumCentered ?marginBottom paddingY="pt-8 pb-14" filled=true>
        <ContentGrid
          title=content.title
          cols
          renderChild={(item: item) => <a href={item.link}> {React.string(item.text)} </a>}>
          {content.items}
        </ContentGrid>
      </SectionContainer.MediumCentered>
    }
  }

  module Books = {
    type t = {
      booksLabel: string,
      books: array<Ood.Book.t>,
    }

    @react.component
    let make = (~marginBottom=?, ~content) => {
      let iconComponent = (id: int, idx: int, item: {"item": Ood.Book.t}) => {
        let book = item["item"]
        // TODO: Better default image
        let cover = Belt.Option.getWithDefault(book.cover, "/static/logo1.jpeg")
        <div className="w-40 aspect-w-3 aspect-h-2 sm:aspect-w-3 sm:aspect-h-4">
          <img
            src=cover
            alt=book.title
            className={"object-fit w-full shadow-lg rounded-lg " ++ if id == idx {
              "ring-4 ring-orangedarker"
            } else {
              ""
            }}
          />
        </div>
      }

      let detailsComponent = (item: {"item": Ood.Book.t}) => {
        let book = item["item"]
        <>
          <p className="mt-2 text-lg font-medium text-gray-900"> {React.string(book.title)} </p>
          <p className="mt-2 text-md text-gray-900"> {React.string(book.description)} </p>
          <p className=" text-sm font-medium text-gray-500">
            {book.links
            |> List.mapi((
              _idx,
              link: Ood.Book.link,
            ) => // TODO: visual indicator that link opens new tab
            <>
              <a href=link.uri className="text-orangedarker" target="_blank">
                <span> {React.string(link.description)} </span>
              </a>
              <span className="inline-block px-2"> {React.string("|")} </span>
            </>)
            |> Array.of_list
            |> React.array}
          </p>
        </>
      }
      <MediaCarousel
        ?marginBottom label=content.booksLabel items=content.books iconComponent detailsComponent
      />
    }
  }

  module Applications = {
    @react.component
    let make = (~marginBottom=?, ~lang) =>
      <SectionContainer.VerySmallCentered ?marginBottom>
        <h2 className="text-center text-orangedark text-7xl font-bold mb-8">
          {React.string(`Applications`)}
        </h2>
        <div className="sm:flex items-center space-x-32 mb-20">
          <div className="mb-4 sm:mb-0 sm:mr-4">
            <p className="mt-1 mb-4 text-lg">
              {React.string(`Looking to learn more about the ways in which OCaml is used in real-world applications? Visit our Applications page to find out about different ways of using OCaml.`)}
            </p>
            <p className="text-right">
              <Route _to={#ResourcesApplications} lang>
                <a className="text-orangedark underline">
                  {React.string(`Go to Applications >`)}
                </a>
              </Route>
            </p>
          </div>
          <div className="flex-shrink-0">
            <img className="h-48" src="/static/app-image2.png" />
          </div>
        </div>
      </SectionContainer.VerySmallCentered>
  }

  module Papers = {
    @react.component
    let make = (~marginBottom=?, ~lang, ()) =>
      // TODO: define content type and factor out content
      // TODO: use generic container
      <div
        className={"bg-white overflow-hidden shadow rounded-lg py-3 mx-auto max-w-5xl " ++
        marginBottom->Tailwind.Option.toClassName}>
        <div className="px-4 py-5 sm:p-6">
          <h2 className="text-center text-orangedark text-7xl font-bold mb-8">
            {React.string(`PAPERS`)}
          </h2>
          <div className="grid grid-cols-3 mb-14 px-9 space-x-6 px-14">
            <div className="">
              <p className="text-orangedark text-7xl font-bold"> {React.string(`1.`)} </p>
              // TODO: visual indicator that link will open new tab
              <p className="font-bold">
                <a href="https://arxiv.org/abs/1905.06543" target="_blank">
                  {React.string(`Extending OCaml's Open`)}
                </a>
              </p>
              <p> {React.string(`by Runhang Li, Jeremey Yallop`)} </p>
            </div>
            <div className="">
              <p className="text-orangedark text-7xl font-bold"> {React.string(`2.`)} </p>
              <p className="font-bold">
                <a href="https://kcsrk.info/papers/memory_model_ocaml17.pdf" target="_blank">
                  {React.string(`A Memory Model for Multicore OCaml`)}
                </a>
              </p>
              <p> {React.string(`by Stephen Dolan, KC Sivaramakrishnan`)} </p>
            </div>
            <div className="">
              <p className="text-orangedark text-7xl font-bold"> {React.string(`3.`)} </p>
              <p className="font-bold">
                <a href="https://arxiv.org/abs/1812.11664" target="_blank">
                  {React.string(`Eff Directly in OCaml`)}
                </a>
              </p>
              <p> {React.string(`by Oleg Kiselyov, KC Sivaramakrishnan`)} </p>
            </div>
          </div>
          <div className="flex justify-center">
            <Route _to={#ResourcesPapers} lang>
              <a
                className="font-bold inline-flex items-center px-10 py-3 border border-transparent text-base leading-4 font-medium rounded-md shadow-sm text-white bg-orangedark hover:bg-orangedarker">
                {React.string(`Go to Papers`)}
              </a>
            </Route>
          </div>
        </div>
      </div>
  }

  type t = {
    title: string,
    pageDescription: string,
    tutorials: Tutorials.t,
    beginning: UserLevelIntroduction.t,
    growing: UserLevelIntroduction.t,
    booksContent: Books.t,
    expanding: UserLevelIntroduction.t,
    diversifying: UserLevelIntroduction.t,
    researching: UserLevelIntroduction.t,
    manual: Manual.t,
  }
  include Jsonable.Unsafe

  module Params = Pages.Params.Lang

  @react.component
  let make = (~content, ~params as {Params.lang: lang}) => <>
    <ConstructionBanner
      figmaLink=`https://www.figma.com/file/36JnfpPe1Qoc8PaJq8mGMd/V1-Pages-Next-Step?node-id=1085%3A121`
      playgroundLink=`/play/resources/language`
    />
    // TODO: define a more narrow page type with preset params

    {
      let introMarginBottom = Tailwind.Breakpoint.make(#mb20, ())
      <Page.Basic
        marginTop={Tailwind.Breakpoint.make(#mt1, ())}
        addBottomBar=true
        addContainer=#NoContainer
        title=content.title
        pageDescription=content.pageDescription>
        <Tutorials content=content.tutorials lang />
        <Books marginBottom={Tailwind.Breakpoint.make(#mb16, ())} content=content.booksContent />
        <UserLevelIntroduction content=content.expanding marginBottom=introMarginBottom />
        <Manual
          content=content.manual cols=#_3 marginBottom={Tailwind.Breakpoint.make(#mb20, ())}
        />
        <UserLevelIntroduction content=content.diversifying marginBottom=introMarginBottom />
        <Applications marginBottom={Tailwind.Breakpoint.make(#mb36, ())} lang />
        <UserLevelIntroduction content=content.researching marginBottom=introMarginBottom />
        <Papers marginBottom={Tailwind.Breakpoint.make(#mb16, ())} lang />
      </Page.Basic>
    }
  </>

  let contentEn = {
    let books = Ood.Book.all->Belt.List.toArray
    let tutorials = Belt.List.keepWithIndex(Ood.Tutorial.all, (_, i) => i < 4)->Belt.List.toArray
    // TODO: read book sorting and filtering information and adjust array
    {
      title: `Language`,
      pageDescription: `This is the home of learning and tutorials. Whether you're a beginner, a teacher, or a seasoned researcher, this is where you can find the resources you need to accomplish your goals in OCaml.`,
      tutorials: {
        title: `OCaml Tutorials`,
        description: `There are plenty of tutorials available for you to get started with OCaml, written by dedicated members of the community. Take a look and see what you can discover.`,
        tutorials: tutorials,
      },
      beginning: {
        level: `Beginning`,
        introduction: `Are you a beginner? Or just someone who wants to brush up on the fundamentals? In either case, the OFronds tutorial system has you covered!`,
      },
      growing: {
        level: `Growing`,
        introduction: `Familiar with the basics and looking to get a more robust understanding of OCaml? Or just curious? Check out the books available on OCaml:`,
      },
      booksContent: {
        booksLabel: "Books",
        books: books,
      },
      expanding: {
        level: `Expanding`,
        introduction: `Have a strong foundation in OCaml? Time to get involved! Prepare by getting familiar with the OCaml Manual:`,
      },
      diversifying: {
        level: `Diversifying`,
        introduction: `Now that you're familiar with the building blocks of OCaml, you may want to diversify your portfolio and have a look at the many applications that operate using OCaml.`,
      },
      researching: {
        level: `Researching`,
        introduction: `Aspiring towards greater understanding of the language? Want to push the limits and discover brand new things? Check out papers written by leading OCaml researchers:`,
      },
      manual: {
        title: `The OCaml Manual`,
        items: [
          {
            link: "https://ocaml.org/manual/index.html#sec6",
            text: `Introduction Tutorials`,
          },
          {
            link: "https://ocaml.org/manual/stdlib.html",
            text: `Stdlib`,
          },
          {
            link: "https://ocaml.org/api/index.html",
            text: `API Docs`,
          },
          {
            link: "https://ocaml.org/manual/index.html#sec72",
            text: `Lang`,
          },
          {
            link: "https://ocaml.org/manual/extn.html#sec238",
            text: `Ext`,
          },
          {
            link: "https://ocaml.org/manual",
            text: `Something Else`,
          },
        ],
      },
    }
  }

  let content = [({Params.lang: #en}, contentEn)]
}

include T
include Pages.MakeSimple(T)
