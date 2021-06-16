type void

module UnsafeJsonable: {
  let toJson: 't => Js.Json.t
  let ofJson: Js.Json.t => 't
} = {
  external toJson: 't => Js.Json.t = "%identity"
  let toJson = t => t->toJson->Json.stringify->Json.parseOrRaise
  external ofJson: Js.Json.t => 't = "%identity"
}
