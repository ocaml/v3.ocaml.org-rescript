open! Import

module T = {
  type t = {
    title: string,
    pageDescription: string,
    timeline: array<Timeline.Item.t>,
  }
  include Jsonable.Unsafe

  module Params = Pages.Params.Lang

  @react.component
  let make = (~content, ~params as {Params.lang: _}) => <>
    <ConstructionBanner
      figmaLink=`https://www.figma.com/file/Vha4bcBvNVrjyLmAEDgZ1x/History-Timeline?node-id=14%3A5`
    />
    <Page.Basic
      title=content.title pageDescription=content.pageDescription addContainer=#NoContainer>
      <Timeline content=content.timeline />
    </Page.Basic>
  </>

  let contentEn = {
    title: "History",
    pageDescription: "A history of ocaml.org.",
    timeline: [
      {
        date: "Nov 2020",
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
        date: "2000 - Dec 2012",
        description: "The domain ocaml.org redirects to caml.inria.fr.",
      },
    ],
  }

  let content = [({Params.lang: #en}, contentEn)]
}

include T
include Pages.MakeSimple(T)
