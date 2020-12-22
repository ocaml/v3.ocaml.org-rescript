module Components = {
  type props = {"children": ReasonReact.reactElement}

  type headerProps = {
    "id": string,
    "children": // Used for anchor tags
    React.element,
  }

  // Used for reflection based logic in
  // components such as `code` or `ul`
  // with runtime reflection
  type unknown

  @bs.deriving(abstract)
  type t = {
    /* Common markdown elements */
    @bs.optional
    p: React.component<props>,
    @bs.optional
    li: React.component<props>,
    @bs.optional
    h1: React.component<props>,
    @bs.optional
    h2: React.component<headerProps>,
    @bs.optional
    h3: React.component<headerProps>,
    @bs.optional
    h4: React.component<headerProps>,
    @bs.optional
    h5: React.component<headerProps>,
    @bs.optional
    ul: React.component<props>,
    @bs.optional
    ol: React.component<props>,
    @bs.optional
    table: React.component<props>,
    @bs.optional
    thead: React.component<props>,
    @bs.optional
    th: React.component<props>,
    @bs.optional
    td: React.component<props>,
    @bs.optional
    blockquote: React.component<props>,
    @bs.optional
    inlineCode: React.component<props>,
    @bs.optional
    strong: React.component<props>,
    @bs.optional
    hr: React.component<{.}>,
    @bs.optional
    code: React.component<{
      "className": option<string>,
      "metastring": option<string>,
      "children": unknown,
    }>,
    @bs.optional
    pre: React.component<props>,
    @bs.optional
    a: React.component<{
      "children": ReasonReact.reactElement,
      "target": option<string>,
      "href": string,
    }>,
  }
}

module Provider = {
  @bs.module("@mdx-js/react") @react.component
  external make: (
    ~components: Components.t,
    ~children: ReasonReact.reactElement=?,
  ) => React.element = "MDXProvider"
}
