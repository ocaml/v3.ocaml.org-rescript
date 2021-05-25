type t = [#en | #fr | #es]

let name: (~lang: t=?, t) => string
let toString: t => string
