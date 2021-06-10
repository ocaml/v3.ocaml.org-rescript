type t = [#en | #fr | #es]

let name: (~lang: t=?, t) => string
let ofString: string => t
let toString: t => string
let default: [< t > #en]
let ofJson: Js.Json.t => option<t>
let toJson: t => Js.Json.t
