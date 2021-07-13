// TODO: Improve the styling of the Redirect component
module Redirect = {
  @react.component
  let make = (~path) => {
    let router = Next.Router.useRouter()
    React.useEffect0(() => {
      router->Next.Router.push(path)
      None
    })
    <div>
      {<>
        {React.string("Redirecting.  If you aren't redirected immediately, please ")}
        <a href={path}> {React.string("click here")} </a>
        {React.string(".")}
      </>}
    </div>
  }
}

@react.component
let make = () => {
  let defaultLang = #en
  let sep = "/"
  let router = Next.Router.useRouter()
  let splitPath = Js.String.split(sep, router.asPath)
  let state = switch Lang.ofString(splitPath[1]) {
  | None =>
    switch splitPath[0] {
    | "" => #Redirect(sep ++ Lang.toString(defaultLang))
    | _ => #NotFound
    }
  | Some(#en) => #NotFound
  | Some(_) =>
    splitPath[1] = Lang.toString(defaultLang)
    let path = Js.Array.joinWith(sep, splitPath)
    #Redirect(path)
  }
  switch state {
  | #NotFound => <Next.Error statusCode=404 />
  | #Redirect(path) => <Redirect path />
  }
}
