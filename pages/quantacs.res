module H1 = {
  // TODO: use mb-1.5 and tailwind 2
  @react.component
  let make = (~children) => 
    <h1 className="font-sans text-4xl font-bold leading-snug mb-2"> children </h1>;
};
//    <h2 className="font-sans text-2xl font-bold leading-normal mb-2"> children </h2>;

let default = () => {
  <>
    <H1>{React.string(`OCaml Users and Developers Workshop`)}</H1>
  </>
}