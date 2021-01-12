module LINK = Markdown.LINK

let s = React.string

let default = () =>
  <>
  <h1>{s(`Videos and Media`)}</h1>
  <p>
    {s(`Many videos about OCaml can be found on vimeo and youtube:`)}
    <ul>
      <li><LINK href="https://vimeo.com/search?q=ocaml">{s(`vimeo ocaml video results`)}</LINK></li>
      <li><LINK href="https://www.youtube.com/results?search_query=ocaml">{s(`youtube ocaml video results`)}</LINK></li>
    </ul>
  </p>
  <p>
    
  </p>
  </>
