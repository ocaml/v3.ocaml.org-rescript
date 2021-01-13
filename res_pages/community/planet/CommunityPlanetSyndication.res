module LINK = Markdown.LINK

let s = React.string

let default = () =>
  <>
  <h1>{s(`OCaml Planet Syndication`)}</h1>
    <h2>{s(`Guidelines`)}</h2>
      <p>
        {s(`Two types of feeds are aggregated by the `)}
        <LINK href="/community/planet">{s(`OCaml Planet`)}</LINK>
        {s(`: personal and institutional.`)}
      </p>
      <p>
        {s(`Personal feeds are for individuals working with OCaml. Writing about OCaml 
        in every entry is not mandatory. On the contrary, this is an opportunity to broaden 
        the discussion. However, entries must respect the terms of use and the philosophy of 
        ocaml.org. Posts should avoid focusing on overtly commercial topics. If you write a 
        personal blog that also has many posts on other topics, we will be thankful if you 
        provide us with an already filtered feed (e.g., tagging posts and using a tag subfeed).`)}
      </p>
    <h2>{s(`How to syndicate your feed`)}</h2>
    <h2>{s(`How to read planet from your RSS reader`)}</h2>
  </>
