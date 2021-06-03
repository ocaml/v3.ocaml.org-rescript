let s = React.string

type t = {
  title: string,
  body: string,
  buttonLink: string,
  buttonText: string,
}

@react.component
let make = (~content) => {
  <div>
    <div className="max-w-2xl mx-auto text-center py-16 px-4 sm:py-20 sm:px-6 lg:px-8">
      <h2 className="text-3xl font-extrabold text-orangedark sm:text-4xl">
        <span className="block"> {s(content.title)} </span>
      </h2>
      <p className="mt-4 text-lg leading-6"> {s(content.body)} </p>
      // TODO: allow caller to indicate if this is an internal or external link
      <a
        href=content.buttonLink
        className="mt-8 w-full inline-flex items-center justify-center px-5 py-3 border border-transparent text-base font-medium rounded-md text-white bg-orangedark hover:bg-orangedarker sm:w-auto">
        {s(content.buttonText)}
      </a>
    </div>
  </div>
}

// current call to action components:
//  - applications->platform tools
//       very similar to above. differences:
//          - container div uses max-w-3xl w/text-center
//          - div w/lg:px-2
//          - h2 w/font-bold, sm:text-3xl; text-center is attached here
//          - uses an internal url
//          - button has px-8 py-1; wrapped in dev with flex + justify-center
//  - around web->want to engage
//       - container is different
//       - uses text white for title
//       - uses text-white for body
//       - button uses white -> bg-orangelight
//       - link is external w/target blank
//  - around web->events
//       - fairly different use of css
//        
