// TODO: replace this
type forceInvalidException<'a> = 'a => unit

@module("js-yaml") external load: (string, ~options: 'a=?, unit) => Js.Json.t = "load"
