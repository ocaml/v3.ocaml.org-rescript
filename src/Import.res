type void

module UnsafeJsonable = {
  let toJson: 't => Js.Json.t = Obj.magic
  let ofJson: Js.Json.t => 't = Obj.magic
}
