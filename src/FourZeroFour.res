// TODO: Make this look better
module Redirecting = {
  @react.component
  let make = (~path) => {
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
  let tmp = Js.String.split(sep, router.asPath)
  let status = switch Lang.ofString(tmp[1]) {
  | None =>
    switch tmp[0] {
    | "" => #Redirect(sep ++ Lang.toString(defaultLang))
    | _ => #NotFound
    }
  | Some(#en) => #NotFound
  | Some(_) =>
    tmp[1] = Lang.toString(defaultLang)
    let path = Js.Array.joinWith(sep, tmp)
    #Redirect(path)
  }
  React.useEffect0(() => {
    switch status {
    | #Redirect(path) => router->Next.Router.push(path)
    | _ => ()
    }
    None
  })
  switch status {
  | #NotFound => <Next.Error statusCode=404 />
  | #Redirect(path) => <Redirecting path />
  }
}
