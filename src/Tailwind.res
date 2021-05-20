// TODO: correct? better construct to express this?
module UtilityClassGroup = {
  let toClassName: 'a => string = _ => ""
}

module MarginBottom = {
  include UtilityClassGroup

  type t =
    | Mb6
    | Mb11
    | Mb24

  let toClassName = mb =>
    switch mb {
    | Mb6 => "mb-6"
    | Mb11 => "mb-11"
    | Mb24 => "mb-24"
    }
}
