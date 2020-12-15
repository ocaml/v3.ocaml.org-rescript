module Link = Next.Link;

module P = {
  [@react.component]
  let make = (~children) => <p className="mb-6"> children </p>;
};
module H1 = {
  [@react.component]
  let make = (~children) => 
    <h1 className="font-sans text-4xl font-bold leading-snub mb-1.5"> children </h1>;
};
module H2 = {
  // TODO: STYLE
  [@react.component]
  let make = (~children) => 
    <h2 className="font-sans text-3xl font-bold leading-snub mb-1.5"> children </h2>;
};
module H3 = {
  // TODO: STYLE
  [@react.component]
  let make = (~children) => 
    <h3 className="font-sans text-xl font-bold leading-snub mb-1.5"> children </h3>;
};
module A = {
  [@react.component]
  let make = (~children) => 
    <a className="text-ocamlorange hover:underline"> children </a>;
};
module AEXT = {
  [@react.component]
  let make = (~children, ~href) => 
    <a href={href} className="text-ocamlorange hover:underline" target="_blank" > children </a>;
};

let default = () =>
  <>
    <H1>{React.string("Mailing Lists and Web Forums")}</H1>
    <P>{React.string("Mailing lists and other forums used to discuss OCaml in 
    general are listed below. There are thousands of other forums related to 
    individual projects. Several mailing lists are hosted on the ")} 
    <AEXT href="http://lists.ocaml.org">{React.string("lists.ocaml.org")}</AEXT>
    {React.string(" domain. Projects on ")}
    <AEXT href="https://github.com/trending?l=ocaml&since=monthly">{React.string("GitHub")}</AEXT>    
    {React.string(" actively use GitHub's Issue system for discussions.")}
    </P>
    <H2>{React.string("Web Forums")}</H2>
    <H3>{React.string("Discuss at OCaml.org")}</H3>
    <P><AEXT href="https://discuss.ocaml.org">{React.string("discuss.ocaml.org")}</AEXT>
    {React.string("This is the most active forum about OCaml. Topics are grouped into a 
    variety of categories, which can be followed independently. This forum welcomes 
    people at all levels of proficiency, including beginners. A mailing-list mode 
    is also available for those who wish to receive all messages.")} 
    </P>
    <P>{React.string("Most categories are in English but categories in other languages 
    are welcome.")} 
    </P>
  </>;
