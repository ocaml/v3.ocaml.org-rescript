type pageContent = {
  title: string,
  pageDescription: string,
}

type output = {data: pageContent, content: string}

@module("gray-matter") external matter: string => output = "default"

let forceInvalidException = c => {
  let _ = (Js.String.length(c.title), Js.String.length(c.pageDescription))
}
