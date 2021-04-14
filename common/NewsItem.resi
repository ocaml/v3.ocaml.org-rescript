type t = {
  id: int,
  link: string,
  title: string,
}

let load: (string, ~options: 'a=?, unit) => array<t>

let forceInvalidException: JsYaml.forceInvalidException<t>

let readAll: unit => array<t>
