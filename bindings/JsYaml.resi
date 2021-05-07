type forceInvalidException<'a> = 'a => unit

let load: (string, ~options: 'a=?, unit) => Js.Json.t
