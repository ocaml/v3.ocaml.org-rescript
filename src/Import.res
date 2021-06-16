type void

module UnsafeJsonable = {
  external toJson: 't => Js.Json.t = "%identity"
  external ofJson: Js.Json.t => 't = "%identity"
}
