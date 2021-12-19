type void
module Jsonable: {
  module type S1 = {
    type t<'a>
    let toJson: t<'a> => Js.Json.t
    let ofJson: Js.Json.t => option<t<'a>>
  }

  module type S = {
    type t
    include S1 with type t<'a> := t
  }

  module Unsafe: {
    // external assumeJsonable: 'a => Js.Json.t = "%identity"
    let toJson: 'a => Js.Json.t
    // external ofJson: Js.Json.t => 'a = "%identity"
    let ofJson: Js.Json.t => option<'a>
  }
}
