# next.ocaml.org

**Status:** Private repository, still a work in progress.

This is the working repository for v3 of the ocaml.org site, and the first
major upgrade to the infrastructure since the v2 launch in 2012.  It will
feature the major following improvements when completed:

- **Integrated documentation and package management:** The v3 site will combine the
  package management (currently opam.ocaml.org) with a new central
  documentation source (codenamed 'docs.ocaml.org') for all 14000+ opam packages
  directly within the ocaml.org site.

- **Responsive and accessible:** The site design also takes into account modern
  web-design principles, restructuring the old content in accordance with methods
  that will present it more compellingly. It is a total redesign that modernises
  the look and feel of the webpage, as well as make it easier to navigate, and more
  accessible (particularly on mobile devices).

- **Separation of data editing from HTML/CSS generation:**  The v2 site combined
  (e.g.) fetching external newsfeeds with the HTML generation, whereas this v3
  site keeps a structured store of data, which is then parsed to generate the
  website.  We use ReScript/OCaml to generate the site content, and Ocurrent to
  automate the data pipelines.  This separation enables us to deploy NetlifyCMS
  to provide a web-based mechanism to submit content updates without requiring
  a GitHub workflow (thus simplifying the life of language translators).

- **Publishing content:** There will original content on the ocaml.org site.
  The v2 site only syndicated from external sources, but now we can publish
  editorial content from around the community directly on ocaml.org. Original
  content could include interviews, featured news stories, talks and other media
  from past conferences, along with many other types of content.

Since this site is a work-in-progress, not all of the above features are yet
materialised in this repository. As the team shows the site to more
stakeholders in the ocaml.org ecosystem, we will expand the supported
featureset.

## Team

The immediate team working on the v3 site consists of:
- Ashish Agarwal (Solvuu)
- Kanishka Azimi (Solvuu)
- Patrick Ferris (OCaml Labs)
- Gemma Gordon (OCaml Labs)
- Isabella Leandersson (OCaml Labs)
- Anil Madhavapeddy (University of Cambridge)

The documentation generation portion is courtesy of the odoc
development team, with the site generation done by:
- Jon Ludlam (OCaml Labs)
- Jules Aguillon (Tarides)
- Lucas Pluvinage (Tarides)

Major decisions will be taken by an ocaml.org steering committee:
(TBD, but a set to propose is below along with role positions)
- Ashish Agarwal
- Florian Angeletti
- Gemma Gordon 
- Xavier Leroy
- Jonathan Ludlam (odoc maintainer)
- Anil Madhavapeddy
- Gabriel Scherer
- Christophe Troestler

## Contributing

Please see the [contribution guide](CONTRIBUTING.md) for information on how to
build and contribute content.
