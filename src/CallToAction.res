let s = React.string

type t = {
  title: string,
  body: string,
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
      <a
        href="#"
        className="mt-8 w-full inline-flex items-center justify-center px-5 py-3 border border-transparent text-base font-medium rounded-md text-white bg-orangedark hover:bg-orangedarker sm:w-auto">
        {s(content.buttonText)}
      </a>
    </div>
  </div>
}
