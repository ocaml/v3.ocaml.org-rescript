module Option = {
  let mapWithDefaultEmpty = (option, f) => option->Belt.Option.mapWithDefault("", f)
}
