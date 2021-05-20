// TODO: correct? better construct to express this?
module UtilityClassGroup = {
  let toClassName: 'a => string = _ => ""
}

module MarginBottom = {
  include UtilityClassGroup

  type t = Mb11

  let toClassName = mb =>
    switch mb {
    | Mb11 => "mb-11"
    }
}
