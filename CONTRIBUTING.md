# Contributing to next.ocaml.org

## Code of Conduct

Before participating in the project, please review our [Code of Conduct](CODE_OF_CONDUCT.md).

## Ways to get involved

* fix or suggest content - start by filing an issue
* implement pages - search through existing issues to find out what pages are planned for upcoming implementation
* contribute to site build process - search through existing issues or file an issue suggesting improvements

## Content workflow

...

### Design and Information Architecture

[Sitemap and information architecture on flowmap](https://app.flowmapp.com/share/6e5eeb4573f9e110ac779691fee85422/sitemap/)

Design - Uses Figma, currently managed by designer. Discussion of both design and content is managed with Figma commenting system.

## Implementation Issue workflow

### Contributor

Feel free to use any approach that you prefer. The dev team
suggests the following:
* If you are unsure if your change will be accepted or if want to discuss the
approach before diving in, please create an issue and pose questions.
* Create a draft pull request with a small initial commit. One way to do this quickly is the following:
  * Click the "branch" drop down menu and type the name of your new branch, using the convention INITIALS/TOPIC, such as "kw1/update-homeage", and click "Create branch: ..."
  * In order to be able to create a pull request, make a small commit:
      * Traverse to a source file of interest
      * Click the "pencil" edit icon in the top right, which puts the file in edit mode
      * Make a small change in the edit window
      * Select "Commit directly ..." and click "Commit changes"
  * Create a pull request using one of the following links, using the template which matches the type of change you are making. In the URL, replace "BRANCH" with your branch name.
       * Create or update the implementation of a webpage: https://github.com/solvuu-inc/next.ocaml.org/compare/BRANCH?expand=1&template=webpage_implement.md 
       * Create a mockup page for a new design pull request template: https://github.com/solvuu-inc/next.ocaml.org/compare/BRANCH?expand=1&template=mockup_webpage.md
       * Perform an ecosystem upgrade pull request template: https://github.com/solvuu-inc/next.ocaml.org/compare/BRANCH?expand=1&template=ecosystem_upgrade.md
  * Change the action to "Create draft pull request" and press the button
* Clone the repo locally (or continue editing directly in github if the change is small). Checkout
out the branch that you created.
* Continue developing, feel free to ask questions in
the PR, if you run into obstacles or uncertainty as you make changes
* Once you feel your branch is ready, check the PR preview to ensure the changes
match your local view and appear correct
* Review your implementation according to the checks noted in the PR template
* Perform the following manual smoke test: ...
* Change PR status to "ready to review"
* Update the PR description to indicate relative paths that have changed

### Reviewer

* Observe the relative paths changed in latest PR Preview
* ... MORE CONTENT HERE ...
* When merging, consider cleaning up the commit body
* Close any issues that were addressed by this PR

## Tips

### res_pages vs pages

ReScript can only handle one module of a given name, e.g. "Index". This clashes with nextjs
page-based routing, which expects the filepath starting from `/pages/` to match
the route exposed. So, in order to completely avoid any problems from this issue,
we always create pages in `res_pages/` and rewrap the module in the desired location
in `pages/`. If your module uses `getStaticPaths` or `getStaticProps`, those will also
need to be re-exposed. Also, note that we choose to repeat the folder name (e.g. "releases") 
in the module name (e.g. "ReleasesIndex.js").

### Do not use nextjs server side features, such as getServerSideProps

In order to ensure that this site remains a static site, do not make use of nextjs's
`getServerSideProps` functionality. More [functionality to avoid is enumerated in the nextjs docs](https://nextjs.org/docs/advanced-features/static-html-export#caveats).

### Prefer Simplicity over Accomodating Fast Refresh

We choose to not complicate this project to accomodate Fast Refresh.


## Useful commands

Build CSS seperately via `npx postcss` (useful for debugging)

```
nvm install && npx postcss@8.3.1 styles/main.css -o /tmp/test.css
```

## Test production setup with Next

TODO: change this to use `export` and `start` with output dir, instead of `start` directly
```
nvm install && npx yarn@1.22 install && npx yarn@1.22 build && PORT=3001 npx yarn@1.22 next:start
```

## Setup and Development

If you don't already have `nvm` installed, [install it using the instructions
provided by `nvm`](https://github.com/nvm-sh/nvm#installing-and-updating). Restart
or reload your terminal to pickup the changes.

Install node and javascript libraries and tools:

```
make install-deps
```

Run ReScript compiler in watch mode:

```
make rescript-watch
```

In another tab, run the Next dev server:

```
make next-dev
```

The output from the next dev server is rarely interesting, so you might save some
real estate by running the command in the background. This frees up the second terminal for performing `git` commands.

Go to `http://localhost:3000`

## Architecture

We have prepared some diagrams and explanations to orient new developers. The site expands upon the default build process in NextJS to accommodate more sophisticated markdown transformations.

