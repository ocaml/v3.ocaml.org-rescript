module Link = Next.Link;

let s = React.string

let textEn = {
    "footer": `Footer`,
    "ocamlSummary": `Innovation. Community. Security.`,
    "industry": `Industry`,
    "whatIsOcaml": `What is OCaml`,
    "industrialUsers": `Industrial Users`,
    "successStories": `Success Stories`,
    "resources": `Resources`,
    "documentation": `Documentation`,
    "learn": `Learn`,
    "community": `Community`,
    "opportunities": `Opportunities`,
    "news": `News`,
    "aroundTheWeb": `Around the Web`,
    "legal": `Legal`,
    "privacy": `Privacy`,
    "terms": `Terms`,
    "claims": `Claims`,
    "cookies": `Cookies`
}

module A = {
  @react.component
  let make = (~children, ~href, ~className) =>
    <Link href>
        <a className> children </a>
    </Link>
}

@react.component
let make = (~text=textEn) =>
    <footer className="bg-white" ariaLabelledby="footerHeading">
        <h2 id="footerHeading" className="sr-only"> {s(text["footer"])} </h2>
        <div className="max-w-7xl mx-auto py-12 px-4 sm:px-6 lg:py-16 lg:px-8">
            <div className="xl:grid xl:grid-cols-3 xl:gap-8">
                <div className="space-y-8 xl:col-span-1">
                    <img className="h-10" src="/static/ocaml-logo.jpeg" alt="OCaml" />
                    <p className="text-gray-500 text-base"> {s(text["ocamlSummary"])} </p>
                    <div className="flex space-x-6">
                        <a href="https://www.facebook.com/OCamlLang" className="text-gray-400 hover:text-gray-500">
                            <span className="sr-only">{s(`Facebook`)}</span> 
                            <svg className="h-6 w-6" fill="currentColor" viewBox="0 0 24 24" ariaHidden=true>
                                <path fillRule="evenodd" d="M22 12c0-5.523-4.477-10-10-10S2 6.477 2 12c0 4.991 3.657 9.128 8.438 9.878v-6.987h-2.54V12h2.54V9.797c0-2.506 1.492-3.89 3.777-3.89 1.094 0 2.238.195 2.238.195v2.46h-1.26c-1.243 0-1.63.771-1.63 1.562V12h2.773l-.443 2.89h-2.33v6.988C18.343 21.128 22 16.991 22 12z" clipRule="evenodd" />
                            </svg>
                        </a>
                        <a href="https://twitter.com/OCamlLang" className="text-gray-400 hover:text-gray-500">
                            <span className="sr-only">{s(`Twitter`)}</span> 
                            <svg className="h-6 w-6" fill="currentColor" viewBox="0 0 24 24" ariaHidden=true>
                                <path d="M8.29 20.251c7.547 0 11.675-6.253 11.675-11.675 0-.178 0-.355-.012-.53A8.348 8.348 0 0022 5.92a8.19 8.19 0 01-2.357.646 4.118 4.118 0 001.804-2.27 8.224 8.224 0 01-2.605.996 4.107 4.107 0 00-6.993 3.743 11.65 11.65 0 01-8.457-4.287 4.106 4.106 0 001.27 5.477A4.072 4.072 0 012.8 9.713v.052a4.105 4.105 0 003.292 4.022 4.095 4.095 0 01-1.853.07 4.108 4.108 0 003.834 2.85A8.233 8.233 0 012 18.407a11.616 11.616 0 006.29 1.84" />
                            </svg>
                        </a>
                        <a href="https://github.com/ocaml" className="text-gray-400 hover:text-gray-500">
                            <span className="sr-only">{s(`GitHub`)}</span> 
                            <svg className="h-6 w-6" fill="currentColor" viewBox="0 0 24 24" ariaHidden=true>
                                <path fillRule="evenodd" d="M12 2C6.477 2 2 6.484 2 12.017c0 4.425 2.865 8.18 6.839 9.504.5.092.682-.217.682-.483 0-.237-.008-.868-.013-1.703-2.782.605-3.369-1.343-3.369-1.343-.454-1.158-1.11-1.466-1.11-1.466-.908-.62.069-.608.069-.608 1.003.07 1.531 1.032 1.531 1.032.892 1.53 2.341 1.088 2.91.832.092-.647.35-1.088.636-1.338-2.22-.253-4.555-1.113-4.555-4.951 0-1.093.39-1.988 1.029-2.688-.103-.253-.446-1.272.098-2.65 0 0 .84-.27 2.75 1.026A9.564 9.564 0 0112 6.844c.85.004 1.705.115 2.504.337 1.909-1.296 2.747-1.027 2.747-1.027.546 1.379.202 2.398.1 2.651.64.7 1.028 1.595 1.028 2.688 0 3.848-2.339 4.695-4.566 4.943.359.309.678.92.678 1.855 0 1.338-.012 2.419-.012 2.747 0 .268.18.58.688.482A10.019 10.019 0 0022 12.017C22 6.484 17.522 2 12 2z" clipRule="evenodd" />
                            </svg>
                        </a>
                    </div>
                </div>
                <div className="mt-12 grid grid-cols-2 gap-8 xl:mt-0 xl:col-span-2">
                    <div className="md:grid md:grid-cols-2 md:gap-8">
                        <div>
                            <h3 className="text-sm font-semibold text-gray-400 tracking-wider uppercase">{s(text["industry"])}</h3>
                            <ul className="mt-4 space-y-4">
                                <li><A href="/play/industry/description" className="text-base text-gray-500 hover:text-gray-900">{s(text["whatIsOcaml"])}</A></li>
                                <li><A href="/play/industry/users" className="text-base text-gray-500 hover:text-gray-900">{s(text["industrialUsers"])}</A></li>
                                <li><A href="/play/industry/success" className="text-base text-gray-500 hover:text-gray-900">{s(text["successStories"])}</A></li>
                            </ul>
                        </div>
                        <div className="mt-12 md:mt-0">
                            <h3 className="text-sm font-semibold text-gray-400 tracking-wider uppercase">{s(text["resources"])}</h3>
                            <ul className="mt-4 space-y-4">
                                <li><A href="/play/resource/docs" className="text-base text-gray-500 hover:text-gray-900">{s(text["documentation"])}</A></li>
                                <li><A href="/play/resource/learn" className="text-base text-gray-500 hover:text-gray-900">{s(text["learn"])}</A></li>
                            </ul>
                        </div>
                    </div>
                    <div className="md:grid md:grid-cols-2 md:gap-8">
                        <div>
                            <h3 className="text-sm font-semibold text-gray-400 tracking-wider uppercase">{s(text["community"])}</h3>
                            <ul className="mt-4 space-y-4">
                                <li><A href="/play/community/opportunities" className="text-base text-gray-500 hover:text-gray-900">{s(text["opportunities"])}</A></li>
                                <li><A href="/play/community/news" className="text-base text-gray-500 hover:text-gray-900">{s(text["news"])}</A></li>
                                <li><A href="/play/community/aroundweb" className="text-base text-gray-500 hover:text-gray-900">{s(text["aroundTheWeb"])}</A></li>
                            </ul>
                        </div>
                        <div className="mt-12 md:mt-0">
                            <h3 className="text-sm font-semibold text-gray-400 tracking-wider uppercase">{s(text["legal"])}</h3>
                            <ul className="mt-4 space-y-4">
                                <li><A href="/play/privacypolicy" className="text-base text-gray-500 hover:text-gray-900">{s(text["privacy"])}</A></li>
                                <li><A href="/play/termsconditions" className="text-base text-gray-500 hover:text-gray-900">{s(text["terms"])}</A></li>
                                <li><A href="/play/legal" className="text-base text-gray-500 hover:text-gray-900">{s(text["claims"])}</A></li>
                                <li><A href="/play/cookiepolicy" className="text-base text-gray-500 hover:text-gray-900">{s(text["cookies"])}</A></li>
                            </ul>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </footer>
