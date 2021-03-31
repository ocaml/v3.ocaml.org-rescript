module Timeline = {
  module Item = {
    type t = {date: string, description: string}
  }

  type t = array<Item.t>
  @react.component
  let make = (~content: t) => {
    <div className="col-span-9 lg:col-span-7 relative py-16 bg-graylight overflow-hidden">
      <div className="relative px-4 sm:px-6 lg:px-8">
        <div className="mt-6 prose prose-yellow prose-lg text-gray-500 mx-auto">
          {content
          |> Array.map(({Item.date: date, description}) => <>
            <h2> {React.string(date)} </h2> <p> {React.string(description)} </p>
          </>)
          |> React.array}
        </div>
      </div>
    </div>
  }
}

type t = {
  title: string,
  pageDescription: string,
  timeline: Timeline.t,
}

let contentEn: t = {
  title: `Milestones`,
  pageDescription: ``,
  timeline: [
    {
      Timeline.Item.date: "Nov 2020",
      description: "A team of programmers, designers, and content writers begins working full-time on a new implementation.",
    },
    {
      date: "2014 - 2020",
      description: "Christophe Troestler and Anil Madhavapeddy continue to maintain the site with contributions from 250 more volunteers.",
    },
    {
      date: "2013",
      description: "Philippe Wang adds significant support for content editing with new templating and markdown libraries. Amir Chaudry manages a new design with OneSpace Media. Along with Christophe Troestler, Ashish Agarwal, and Anil Madhavapeddy, there are now a total of 50 contributors.",
    },
    {
      date: "Dec 18, 2012",
      description: "The new website is live and [announced](link to caml-list email) to the OCaml community. The old site caml.inria.fr is deprecated.",
    },
    {
      date: "Sep 27, 2012",
      description: "Xavier Leroy approves use of the ocaml.org domain for the new site.",
    },
    {
      date: "2012",
      description: "The website is actively developed by Christophe Troestler, Ashish Agarwal, Esther Baruk, and 10 other volunteers. Anil Madhavapeddy sets up hosting infrastructure. Virtually all pages on caml.inria.fr are ported. Also, over 30 tutorials in 7 languages from two other sites, ocaml-tutorial.org and cocan.org, are ported. Many thanks to Richard Jones for building that valuable content over many years and approving their move to ocaml.org. Also thanks to Sylvain Le Gall for providing archived copies of this content.",
    },
    {
      date: "Apr 15, 2011",
      description: "Ashish Agarwal proposes a new website for the OCaml community at a presentation in Paris. The next day, Christophe Troestler begins the implementation. Ashish also asks that we unify on the name of the language. Everyone unanimously agrees that the name should be “OCaml” with a capital O and capital C.",
    },
    {
      date: "1998? - Dec 2012",
      description: "The domain ocaml.org redirects to caml.inria.fr.",
    },
  ],
}

module StatBox = {
  @react.component
  let make = (~label, ~statValue, ~borderSizes) =>
    <div className={`flex flex-col border-gray-100 py-16 px-4 text-center ` ++ borderSizes}>
      <dt className="order-2 mt-2 text-lg leading-6 font-bold text-black text-opacity-70">
        {React.string(label)}
      </dt>
      <dd className="order-1 text-5xl font-extrabold text-orangedark">
        {React.string(statValue)}
      </dd>
    </div>
}

module ProgressBar = {
  @react.component
  let make = () => {
    <div className="mt-10 pb-12 sm:pb-16">
      <div className="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8">
        <div className={"max-w-4xl mx-auto"}>
          <dl className="rounded-lg bg-white shadow-lg sm:grid sm:grid-cols-3">
            <StatBox
              label="percent complete"
              statValue="30%"
              borderSizes=`border-b sm:border-0 sm:border-r`
            />
          </dl>
        </div>
      </div>
    </div>
  }
}

@react.component
let make = (~content=contentEn) => <>
  <ConstructionBanner
    figmaLink=`https://www.figma.com/file/Vha4bcBvNVrjyLmAEDgZ1x/History-Timeline?node-id=14%3A5`
  />
  <TitleHeading title=content.title pageDescription=content.pageDescription />
  <ProgressBar />
  <Timeline content=content.timeline />
</>

let default = make
