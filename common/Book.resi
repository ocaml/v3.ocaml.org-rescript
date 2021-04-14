type t = {
  id: int,
  name: string,
  link: string,
  image: string,
}

let load: (string, ~options: 'a=?, unit) => array<t>

let forceInvalidException: JsYaml.forceInvalidException<t>

let readAll: unit => array<t>
