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
module UL = {
  [@react.component]
  let make = (~children) => 
    <ul className="mb-6 ml-6 -mt-3 list-disc"> children </ul>;
};
module LI = {
  [@react.component]
  let make = (~children) => 
    <li className="mb-3"> children </li>;
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
    <P>{React.string("The ")} 
    <Link href="/releases/latest/"><A>{React.string("latest")}</A></Link>
    {React.string(" page points to the most recent release of the OCaml compiler 
     distribution. Below is a list of the recent releases.")}
    </P>
    <P>{React.string("See also the ")}
    <Link href="/docs/install.html"><A>{React.string("install")}</A></Link>
    {React.string(" page for instructions on installing OCaml by other means, such as
    the OPAM package manager and platform specific package managers.")}
    </P>
    <UL>
    <LI>
    {React.string("OCaml ")}
    <Link href="/releases/4.11.1.html"><A>{React.string("4.11.1")}</A></Link>
    {React.string(", released Aug 31, 2020.")}
    </LI>
    </UL>
  </>;
