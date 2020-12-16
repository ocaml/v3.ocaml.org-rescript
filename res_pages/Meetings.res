module Link = Next.Link;

// TODO: rename this file to index.re once duplicate names issue resolved
module P = {
  @react.component
  let make = (~children) => <p className="mb-6"> children </p>;
};
module H1 = {
  // TODO: use mb-1.5 and tailwind 2
  @react.component
  let make = (~children) => 
    <h1 className="font-sans text-4xl font-bold leading-snug mb-2"> children </h1>;
};
module H2 = {
  @react.component
  let make = (~children) => 
    <h2 className="font-sans text-2xl font-bold leading-normal mb-2"> children </h2>;
};
module UL = {
  @react.component
  let make = (~children) => 
    <ul className="mb-6 ml-6 -mt-3 list-disc"> children </ul>;
};
module LI = {
  @react.component
  let make = (~children) => 
    <li className="mb-3"> children </li>;
};
module A = {
  @react.component
  let make = (~children) => 
    <a className="text-ocamlorange hover:underline"> children </a>;
};
module AEXT = {
  @react.component
  let make = (~children, ~href) => 
    <a href={href} className="text-ocamlorange hover:underline" target="_blank" > children </a>;
};

let default = () =>
  <>
    <H1>{React.string(`OCaml Users and Developers Workshop`)}</H1>
    <UL>
    <LI>
    <Link href="/meetings/ocaml/2020/"><A>{React.string(`OCaml 2020`)}</A></Link>
    {React.string(`: Jersey City (New Jersey, USA), August 28, colocated with ICFP 2020.`)}
    </LI>
    <LI>
    <Link href="/meetings/ocaml/2019/"><A>{React.string(`OCaml 2019`)}</A></Link>
    {React.string(`: Berlin (Germany), August 23, colocated with ICFP 2019.`)}
    </LI>
    <LI>
    <Link href="/meetings/ocaml/2018/"><A>{React.string(`OCaml 2018`)}</A></Link>
    {React.string(`: St Louis (Missouri, USA), September 27, colocated with ICFP 2018.`)}
    </LI>
    <LI>
    <Link href="/meetings/ocaml/2017/"><A>{React.string(`OCaml 2017`)}</A></Link>
    {React.string(`: Oxford (UK), September 8, colocated with ICFP 2017.`)}
    </LI>
    <LI>
    <Link href="/meetings/ocaml/2016/"><A>{React.string(`OCaml 2016`)}</A></Link>
    {React.string(`: Nara (Japan), September 23, colocated with ICFP 2016.`)}
    </LI>
    <LI>
    <Link href="/meetings/ocaml/2015/"><A>{React.string(`OCaml 2015`)}</A></Link>
    {React.string(`: Vancouver (BC, Canada), September 4, colocated with ICFP 2015.`)}
    </LI>
    <LI>
    <Link href="/meetings/ocaml/2014/"><A>{React.string(`OCaml 2014`)}</A></Link>
    {React.string(`: Gothenburg (Sweden), September 5, colocated with ICFP 2014.`)}
    </LI>
    <LI>
    <Link href="/meetings/ocaml/2013/"><A>{React.string(`OCaml 2013`)}</A></Link>
    {React.string(`: Boston (MA, USA), September 24, colocated with ICFP 2013.`)}
    </LI>
    <LI>
    <Link href="/meetings/ocaml/2012/"><A>{React.string(`OUD 2012`)}</A></Link>
    {React.string(`: Copenhagen (Denmark), September 14th, colocated with ICFP 2012.`)}
    </LI>
    </UL>

    <H1>{React.string(`OCaml Meetings`)}</H1>

    <H2>{React.string(`In Europe`)}</H2>
    <UL>
    <LI>
    {React.string(`2014, July 8, 7:00 PM: `)}
    <AEXT href="http://www.meetup.com/ocaml-paris/events/188634632/">{React.string(`Rencontre d'été`)}</AEXT>
    {React.string(`, Mozilla Paris, 16 boulevard Montmartre 75009 Paris. Organized by `)}    
    <AEXT href="http://www.meetup.com/ocaml-paris/">{React.string(`OCaml Users in PariS (OUPS)`)}</AEXT>
    {React.string(`.`)}
    </LI>
    <LI>
    {React.string(`2014, May 22, 7:00 PM: `)}
    <AEXT href="http://www.meetup.com/ocaml-paris/events/181647232/">{React.string(`Rencontre de Printemps`)}</AEXT>
    {React.string(`, IRILL 23, avenue d'Italie 75013 Paris. Organized by `)}    
    <AEXT href="http://www.meetup.com/ocaml-paris/">{React.string(`OCaml Users in PariS (OUPS)`)}</AEXT>
    {React.string(`.`)}
    </LI>
    <LI>
    {React.string(`2013, May 21, 7:30 PM: `)}
    <AEXT href="http://www.meetup.com/ocaml-paris/events/116100692/">{React.string(`Rencontre de Mai`)}</AEXT>
    {React.string(`, IRILL 23, avenue d'Italie 75013 Paris. Organized by `)}    
    <AEXT href="http://www.meetup.com/ocaml-paris/">{React.string(`OCaml Users in PariS (OUPS)`)}</AEXT>
    {React.string(`.`)}
    </LI>
    <LI>
    {React.string(`2013, January 29, 8:00 PM: `)}
    <AEXT href="http://www.meetup.com/ocaml-paris/events/99222322/">{React.string(`First \"OPAM Party\"`)}</AEXT>
    {React.string(`, IRILL 23, avenue d'Italie 75013 Paris. Organized by `)}    
    <AEXT href="http://www.meetup.com/ocaml-paris/">{React.string(`OCaml Users in PariS (OUPS)`)}</AEXT>
    {React.string(`.`)}
    </LI>
    <LI>
    {React.string(`2011: `)}
    <Link href="/meetings/ocaml/2011/"><A>{React.string(`Paris`)}</A></Link>
    </LI>
    <LI>
    {React.string(`2010: `)}
    <Link href="/meetings/ocaml/2010/"><A>{React.string(`Paris`)}</A></Link>
    </LI>
    <LI>
    {React.string(`2009: `)}
    <Link href="/meetings/ocaml/2009/"><A>{React.string(`Grenoble`)}</A></Link>
    </LI>
    <LI>
    {React.string(`2008: `)}
    <Link href="/meetings/ocaml/2008/"><A>{React.string(`Paris`)}</A></Link>
    </LI>
    </UL>

    <H2>{React.string(`In Japan`)}</H2>
    <UL>
    <LI>
    {React.string(`2013: `)}
    <AEXT href="http://ocaml.jp/um2013">{React.string(`Nagoya`)}</AEXT>
    </LI>
    <LI>
    {React.string(`2010: `)}
    <AEXT href="http://ocaml.jp/um2010">{React.string(`Nagoya`)}</AEXT>
    </LI>
    <LI>
    {React.string(`2010: Tokyo`)}
    </LI>
    </UL>

    <H2>{React.string(`In the US`)}</H2>
    <UL>
    <LI>
    {React.string(`2012-present: `)}
    <AEXT href="http://www.meetup.com/NYC-OCaml/">{React.string(`NYC OCaml Meetup`)}</AEXT>
    </LI>
    <LI>
    {React.string(`2014-present: `)}
    <AEXT href="http://www.meetup.com/sv-ocaml/">{React.string(`Silicon Valley OCaml meetups`)}</AEXT>
    </LI>
    </UL>

    <H2>{React.string(`In the UK`)}</H2>
    <UL>
    <LI>
    {React.string(`2012: `)}
    <AEXT href="http://www.meetup.com/Cambridge-NonDysFunctional-Programmers/">{React.string(`Cambridge NonDysFunctional Programmers`)}</AEXT>
    </LI>
    </UL>
  </>;
