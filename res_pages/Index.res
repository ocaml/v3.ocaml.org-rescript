let s = React.string

type indexContent = {
  welcomeHeader: string,
  welcomeBody: string,
  installOcaml: string,
  learnMore: string,
  ocamlInNumbers: string,
  activeMembers: string,
  industrySatisfaction: string,
  averagePrs: string,
  quoteBody: string  
}

type props = {
  content: indexContent,
}

// use get static props to read content from file; parse file from yaml to record
let default = (props) => {
  let content = props.content
  <div className="relative bg-graylight">
    <div className="relative bg-white shadow">
    </div>

    <main>
      <div className="lg:relative">
        <div className="mx-auto max-w-7xl w-full pt-16 pb-20 text-center lg:py-48 lg:text-left">
          <div className="px-4 lg:w-1/2 sm:px-8 xl:pr-16">
            <h1 className="text-4xl tracking-tight font-extrabold text-gray-900 sm:text-5xl md:text-6xl lg:text-5xl xl:text-6xl">{s(content.welcomeHeader)}</h1>
            <p className="mt-3 max-w-md mx-auto text-lg text-gray-500 sm:text-xl md:mt-5 md:max-w-3xl">{s(content.welcomeBody)}</p>
            <div className="mt-10 sm:flex sm:justify-center lg:justify-start">
              <div className="rounded-md shadow">
                <a href="#" 
                  className="w-full flex items-center justify-center px-8 py-3 border border-transparent text-base font-medium rounded-md text-white bg-orangedark hover:bg-orangedarker md:py-4 md:text-lg md:px-10"> 
                  {s(content.installOcaml)} 
                </a>
              </div>
              <div className="mt-3 rounded-md shadow sm:mt-0 sm:ml-3">
                <a href="#" 
                  className="w-full flex items-center justify-center px-8 py-3 border border-transparent text-base font-medium rounded-md text-orangedark bg-white hover:bg-gray-50 md:py-4 md:text-lg md:px-10"> 
                  {s(content.learnMore)} 
                </a>
              </div>
            </div>
          </div>
        </div>    
        <div className="relative w-full h-64 sm:h-72 md:h-96 lg:absolute lg:inset-y-0 lg:right-0 lg:w-1/2 lg:h-full">
          <img className="absolute inset-0 w-full h-full object-cover" src="/static/oc-sq.jpeg" alt="" />
        </div>
      </div>

      <div className="pt-12 sm:pt-16">
        <div className="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8">
          <div className="max-w-4xl mx-auto text-center">
            <h2 className="text-3xl font-extrabold text-gray-900 sm:text-4xl">{s(content.ocamlInNumbers)}</h2>
          </div>
        </div>
        <div className="mt-10 pb-12 sm:pb-16">
          <div className="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8">
            <div className="max-w-4xl mx-auto">
              <dl className="rounded-lg bg-white shadow-lg sm:grid sm:grid-cols-3">
                <div className="flex flex-col border-b border-gray-100 py-16 text-center sm:border-0 sm:border-r">
                  <dt className="order-2 mt-2 text-lg leading-6 font-bold text-black text-opacity-70">{(s(content.activeMembers))}</dt>
                  <dd className="order-1 text-5xl font-extrabold text-orangedark">{s(`2000+`)}</dd>
                </div>
                <div className="flex flex-col border-t border-b border-gray-100 py-16 text-center sm:border-0 sm:border-l sm:border-r">
                  <dt className="order-2 mt-2 text-lg leading-6 font-bold text-black text-opacity-70">{s(content.industrySatisfaction)}</dt>
                  <dd className="order-1 text-5xl font-extrabold text-orangedark">{s(`97%`)}</dd>
                </div>
                <div className="flex flex-col border-t border-gray-100 py-16 text-center sm:border-0 sm:border-l">
                  <dt className="order-2 mt-2 text-lg leading-6 font-bold text-black text-opacity-70">{s(content.averagePrs)}</dt>
                  <dd className="order-1 text-5xl font-extrabold text-orangedark">{s(`450`)}</dd>
                </div>
              </dl>
            </div>
          </div>
        </div>
      </div>

      <section className="pt-5 pb-20 overflow-hidden md:pt-6 mb:pb-24 lg:pt-10 lg:pb-40">
        <div className="relative max-w-7xl mx-auto px-4 sm:px-6 lg:px-8">
          <svg 
            className="absolute top-full right-full transform translate-x-1/3 -translate-y-1/4 lg:translate-x-1/2 xl:-translate-y-1/2" 
            width="404" height="404" fill="none" viewBox="0 0 404 404" role="img" ariaLabelledby="svg-janestreet">
            <title id="svg-janestreet">{s(`Jane Street`)}</title>
            <defs>
              <pattern id="ad119f34-7694-4c31-947f-5c9d249b21f3" x="0" y="0" width="20" height="20" patternUnits="userSpaceOnUse">
                <rect x="0" y="0" width="4" height="4" className="text-gray-200" fill="currentColor" />
              </pattern>
            </defs>
            <rect width="404" height="404" fill="url(#ad119f34-7694-4c31-947f-5c9d249b21f3)" />
          </svg>

          <div className="relative">
            <img className="mx-auto h-24" src="/static/js.svg" alt="Jane Street" />
            <blockquote className="mt-10">
              <div className="max-w-3xl mx-auto text-center text-2xl leading-9 font-medium text-gray-900">
                <p><span className="text-orangedark">{s(`“`)}</span>{s(content.quoteBody)}<span className="text-orangedark">{s(`”`)}</span></p>
              </div>
              <footer className="mt-0">
                <div className="md:flex md:items-center md:justify-center">
                  <div className="mt-3 text-center md:mt-0 md:ml-4 md:flex md:items-center">
                    <div className="text-base font-medium text-gray-900">{s(`Yaron Minsky`)}</div>

                    <svg className="hidden md:block mx-1 h-5 w-5 text-orangedark" fill="currentColor" viewBox="0 0 20 20">
                      <path d="M11 0h3L9 20H6l5-20z" />
                    </svg>

                    <div className="text-base font-medium text-gray-500">{s(`Jane Street`)}</div>
                  </div>
                </div>
              </footer>
            </blockquote>
          </div>
        </div>
      </section>

    </main>
  </div>
}

let indexContentEn1 = {
  welcomeHeader: `NOT USED`,
  welcomeBody: `OCaml is a general purpose industrial-strength programming language with 
    an emphasis on expressiveness and safety. Its reputation for combining security 
    with speed makes it popular with many industrial users, as well as the growing 
    group of developers that make up its community.`,
  installOcaml: `Install OCaml`,
  learnMore: `Learn More`,
  ocamlInNumbers: `OCaml in Numbers`,
  activeMembers: `Active Members`,
  industrySatisfaction: `Industry Satisfaction`,
  averagePrs: `Average PRs per Week`,
  quoteBody: `OCaml helps us to quickly adopt to changing market conditions, and go from 
    prototypes to production systems with less effort ... Billions of dollars of transactions 
    flow through our systems every day, so getting it right matters.`
}

@bs.module("js-yaml") external yamlParse: (string, ~options: 'a=?, unit) => Js.Json.t = "load"

let getStaticProps = _ctx => {
  let contentFilePath = "res_pages/IndexContent.yaml"
  let source = Fs.readFileSync(contentFilePath)
  let jsonRes = yamlParse(source, ~options=None, ())
  let jsonObj = Js.Option.getExn(Js.Json.decodeObject(jsonRes))
  let welcomeObj = Js.Dict.unsafeGet(jsonObj, "welcomeHeader")
  let welcomeVal = Js.Option.getExn(Js.Json.decodeString(welcomeObj))
  let indexContentEn = {
    welcomeHeader: welcomeVal,
    welcomeBody: indexContentEn1.welcomeBody,
    installOcaml: indexContentEn1.installOcaml,
    learnMore: indexContentEn1.learnMore,
    ocamlInNumbers: indexContentEn1.ocamlInNumbers,
    activeMembers: indexContentEn1.activeMembers,
    industrySatisfaction: indexContentEn1.industrySatisfaction,
    averagePrs: indexContentEn1.averagePrs,
    quoteBody: indexContentEn1.quoteBody
  }
  let props = {
    content: indexContentEn,
  }
  Js.Promise.resolve({"props": props})
}