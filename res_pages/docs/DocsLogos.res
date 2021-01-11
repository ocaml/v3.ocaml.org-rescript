// module LINK = Markdown.LINK

let s = React.string

let default = () =>
  <>
  <h1>{s(`OCaml logo`)}</h1>
    <p>
      {s(`Web sites related to the OCaml language or that use it are encouraged to 
      incorporate the OCaml logo somewhere in their page to indicate their support 
      for OCaml development. The logo should be linked to the OCaml website, ocaml.org. 
      The `)}
      {s(`logo is available in several formats`)}
      {s(`. Also, the `)}
      {s(`logo is available in several colors`)}
      {s(`. Two versions are displayed below. To include one of them on your web page,
      just copy and paste the associated HTML code and tweak it (e.g. adapt the `)}
      {s(`width`)}
      {s(` or change the part after `)}
      {s(`logo/`)}
      {s(` to match the path of the file you want to use in the `)}
      {s(`logo repository`)}
      {s(`). The `)}
      {s(`OCaml logo is released under a liberal license`)}
      {s(`.`)}
    </p>
    <p>{s(`Here is one example:`)}</p>
      <pre>
        <code>
        {s(
`<a href="http://ocaml.org">
  <img src="http://ocaml.org/logo/Colour/PNG/colour-logo.png"
       alt="OCaml"
       style="border: none; width: 150px;" />
</a>`)}
        </code>
      </pre>
    <p>{s(`Here is another example:`)}</p>
      <pre>
        <code>
    {s(
`<a href="http://ocaml.org">
  <img src="http://ocaml.org/logo/Colour/SVG/colour-logo.svg"
       alt="OCaml"
       style="border: none; width: 150px;" />
</a>`)}
        </code>
      </pre>
    <h2>{s(`Stickers`)}</h2>
    <img style=(ReactDOM.Style.make(~width="150px", ())) 
      src="/static/OCaml_Sticker.svg" 
      alt="OCaml logo for sticker"/>
    <p>
      {s(`The following `)}
      {s(`OCaml sticker SVG file`)}
      {s(` is suitable to make stickers, as seen in this`)}
      {s(`tweet announcing stickers made`)}
      {s(`. Similar to the logo, the `)}
      {s(`OCaml sticker file is released under a liberal license`)}
      {s(`, so do no hesitate to print your own stickers to promote OCaml!`)}
    </p>
    <p>
      {s(`Before printing some stickers, it would be great if you tweeted it with 
      tags `)}
      {s(`#OCaml stickers`)}
      {s(`, similar to these `)}
      {s(`OCaml stickers tweets`)}
      {s(`, so that other interested people in your area can get in touch with you!`)}
    </p>
  </>
