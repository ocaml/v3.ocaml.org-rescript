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
    <H2>{React.string("Mailing Lists")}</H2>
    <H3>{React.string("Official OCaml List")}</H3>
    <P>{React.string("caml-list AT inria.fr The OCaml mailing list is intended for all 
    users of the OCaml implementations developed at Inria. The purpose of this list is 
    to share experience, exchange ideas and code, and report on applications of the 
    OCaml language. This list is not moderated, but posting is restricted to the 
    subscribers of the list. Messages are generally in English but sometimes also in French.")} 
    </P>
    <P><AEXT href="https://sympa.inria.fr/sympa/subscribe/caml-list">{React.string("Subscribe")}</AEXT>
    {React.string(" | ")}
    <AEXT href="https://inbox.ocaml.org/caml-list">{React.string("OCaml Archives")}</AEXT>
    {React.string(" | ")}
    <AEXT href="https://sympa.inria.fr/sympa/arc/caml-list">{React.string("Inria Archives")}</AEXT>    
    </P> 
    <P>{React.string("The ")}
    <AEXT href="http://alan.petitepomme.net/cwn/">{React.string("OCaml Weekly News")}</AEXT>
    {React.string(" also provides a curated summary of camll-list discussions.")}
    </P>
  </>;
