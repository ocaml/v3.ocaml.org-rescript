open! Import

module ButtonLink: {
  type t = {
    label: string,
    url: string,
  }
}

type buttonLinks = {
  primaryButton: ButtonLink.t,
  secondaryButton: ButtonLink.t,
}

@react.component
let make: (
  ~imageSrcSet: string=?,
  ~imageSizes: string=?,
  ~imageSrc: string,
  ~header: string,
  ~body: string,
  ~buttonLinks: buttonLinks=?,
  ~imagePos: [#Right | #Left],
) => React.element
