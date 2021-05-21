// TODO: correct? better construct to express this?
module UtilityClassGroup = {
  let toClassName: 'a => string = _ => ""
}

module MarginBottom = {
  include UtilityClassGroup

  type t =
    | Mb6
    | Mb11
    | Mb16
    | Mb24
    | Mb36

  let toClassName = mb =>
    switch mb {
    | Mb6 => "mb-6"
    | Mb11 => "mb-11"
    | Mb16 => "mb-16"
    | Mb24 => "mb-24"
    | Mb36 => "mb-36"
    }
}

// med cntrd
// very small centrd
