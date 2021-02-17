let s = React.string

@react.component
let make = () =>
  <>
  
  <div className="relative bg-indigo-600">
    <div className="max-w-7xl mx-auto py-3 px-3 sm:px-6 lg:px-8">
      <div className="pr-16 sm:text-center sm:px-16">
        <p className="font-medium text-white">
          <span className="">
            {s(`Under construction`)}
          </span>
          <span className="block sm:ml-2 sm:inline-block">
            <a href="/play/community/aroundweb" className="text-white font-bold underline"> {s(`View Playground >>`)} </a>
          </span>
        </p>
      </div>
    </div>
  </div>


  <div className="bg-graylight">
    <div className="max-w-7xl mx-auto py-16 px-4 sm:py-24 sm:px-6 lg:px-8">
      <div className="text-center">
        <p className="mt-1 text-4xl font-extrabold text-gray-900 sm:text-5xl sm:tracking-tight lg:text-6xl">{s(`OCaml Around the Web`)}</p>
        <p className="max-w-4xl mt-5 mx-auto text-xl text-gray-500">{s(`Looking to interact with people who are also interested in OCaml? Find out about upcoming events, read up on blogs from the community, sign up for OCaml mailing lists, and discover even more places to engage with people from the community!`)}</p>
      </div>
    </div>
  </div>

  <div className="bg-graylight pb-16"> {/* change to mb */ React.null}
    <div className="bg-orangedark">
      <div className="max-w-2xl mx-auto text-center py-16 px-4 sm:py-20 sm:px-6 lg:px-8">
        <h2 className="text-3xl font-extrabold text-white sm:text-4xl">
          <span className="block">{s(`Want to engage with the OCaml Community?`)}</span>
        </h2>
        <p className="mt-4 text-lg leading-6 text-white">{s(`Participate in discussions on everything OCaml over at discuss.ocaml.org, where members of the community post`)}</p>
        <a href="#" className="mt-8 w-full inline-flex items-center justify-center px-5 py-3 border border-transparent text-base font-medium rounded-md bg-white hover:bg-orangelight sm:w-auto">
          {s(`Take me to Discuss`)}
        </a>
      </div>
    </div>
  </div>

  <div className="relative bg-graylight pt-16 pb-3 px-4 sm:px-6 lg:pt-24 lg:pb-8 lg:px-8">
    <div className="absolute inset-0">
      <div className="bg-graylight h-1/3 sm:h-2/3"></div>
    </div>
    <div className="relative max-w-7xl mx-auto">
      <div className="text-center">
        <h2 className="text-3xl tracking-tight font-extrabold text-gray-900 sm:text-4xl">{s(`Recent Blog Posts`)}</h2>
        <p className="mt-3 max-w-2xl mx-auto text-xl text-gray-500 sm:mt-4">{s(`Be inspired by the work of OCaml programmers all over the world and stay up-to-date on the latest developments.`)}</p>
      </div>
      <div className="mt-12 max-w-lg mx-auto grid gap-5 lg:grid-cols-3 lg:max-w-none">
        <div className="flex flex-col rounded-lg shadow-lg overflow-hidden">
          <div className="flex-shrink-0">
            <img className="h-48 w-full object-cover" src="https://images.unsplash.com/photo-1496128858413-b36217c2ce36?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1679&q=80" alt="" />
          </div>
          <div className="flex-1 bg-white p-6 flex flex-col justify-between">
            <div className="flex-1">
              <p className="text-sm font-medium text-orangedark">
                <a href="#" className="hover:underline"> {s(`Blog`)} </a>
              </p>
              <a href="#" className="block mt-2">
                <p className="text-xl font-semibold text-gray-900">{s(`What I learned Coding from Home`)}</p>
                <p className="mt-3 text-base text-gray-500">{s(`Lorem ipsum dolor sit amet consectetur adipisicing elit. Architecto accusantium praesentium eius, ut atque fuga culpa, similique sequi cum eos quis dolorum.`)}</p>
              </a>
            </div>
            <div className="mt-6 flex items-center">
              <div className="flex-shrink-0">
                <a href="#">
                  <span className="sr-only">{s(`Roel Aufderehar`)}</span>
                  <img className="h-10 w-10 rounded-full" src="https://images.unsplash.com/photo-1472099645785-5658abf4ff4e?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=facearea&facepad=2&w=256&h=256&q=80" alt="" />
                </a>
              </div>
              <div className="ml-3">
                <p className="text-sm font-medium text-gray-900">
                  <a href="#" className="hover:underline">{s(`Roel Aufderehar`)}</a>
                </p>
                <div className="flex space-x-1 text-sm text-gray-500">
                  <time dateTime="2020-03-16"> {s(`Mar 16, 2020`)} </time>
                  <span ariaHidden=true> {s(`&middot;`)} </span>
                  <span> {s(`6 min read`)} </span>
                </div>
              </div>
            </div>
          </div>
        </div>

        <div className="flex flex-col rounded-lg shadow-lg overflow-hidden">
          <div className="flex-shrink-0">
            <img className="h-48 w-full object-cover" src="https://images.unsplash.com/photo-1547586696-ea22b4d4235d?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1679&q=80" alt="" />
          </div>
          <div className="flex-1 bg-white p-6 flex flex-col justify-between">
            <div className="flex-1">
              <p className="text-sm font-medium text-orangedark">
                <a href="#" className="hover:underline"> {s(`Blog`)} </a>
              </p>
              <a href="#" className="block mt-2">
                <p className="text-xl font-semibold text-gray-900"> {s(`Programming for a Better World`)} </p>
                <p className="mt-3 text-base text-gray-500"> {s(`Lorem ipsum dolor sit amet consectetur adipisicing elit. Velit facilis asperiores porro quaerat doloribus, eveniet dolore. Adipisci tempora aut inventore optio animi., tempore temporibus quo laudantium.`)} </p>
              </a>
            </div>
            <div className="mt-6 flex items-center">
              <div className="flex-shrink-0">
                <a href="#">
                  <span className="sr-only">{s(`Brenna Goyette`)}</span>
                  <img className="h-10 w-10 rounded-full" src="https://images.unsplash.com/photo-1550525811-e5869dd03032?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=facearea&facepad=2&w=256&h=256&q=80" alt="" />
                </a>
              </div>
              <div className="ml-3">
                <p className="text-sm font-medium text-gray-900">
                  <a href="#" className="hover:underline"> {s(`Brenna Goyette`)} </a>
                </p>
                <div className="flex space-x-1 text-sm text-gray-500">
                  <time dateTime="2020-03-10"> {s(`Mar 10, 2020`)} </time>
                  <span ariaHidden=true> {s(`&middot;`)} </span>
                  <span> {s(`4 min read`)} </span>
                </div>
              </div>
            </div>
          </div>
        </div>

        <div className="flex flex-col rounded-lg shadow-lg overflow-hidden">
          <div className="flex-shrink-0">
            <img className="h-48 w-full object-cover" src="https://images.unsplash.com/photo-1492724441997-5dc865305da7?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1679&q=80" alt="" />
          </div>
          <div className="flex-1 bg-white p-6 flex flex-col justify-between">
            <div className="flex-1">
              <p className="text-sm font-medium text-orangedark">
                <a href="#" className="hover:underline"> {s(`Talk`)} </a>
              </p>
              <a href="#" className="block mt-2">
                <p className="text-xl font-semibold text-gray-900"> {s(`Methods for Irmin V2`)}</p>
                <p className="mt-3 text-base text-gray-500"> {s(`Lorem ipsum dolor sit amet consectetur adipisicing elit. Sint harum rerum voluptatem quo recusandae magni placeat saepe molestiae, sed excepturi cumque corporis perferendis hic.`)}</p>
              </a>
            </div>
            <div className="mt-6 flex items-center">
              <div className="flex-shrink-0">
                <a href="#">
                  <span className="sr-only">{s(`Daniela Metz`)}</span>
                  <img className="h-10 w-10 rounded-full" src="https://images.unsplash.com/photo-1487412720507-e7ab37603c6f?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=facearea&facepad=2&w=256&h=256&q=80" alt="" />
                </a>
              </div>
              <div className="ml-3">
                <p className="text-sm font-medium text-gray-900">
                  <a href="#" className="hover:underline"> {s(`Daniela Metz`)} </a>
                </p>
                <div className="flex space-x-1 text-sm text-gray-500">
                  <time dateTime="2020-02-12"> {s(`Feb 12, 2020`)} </time>
                  <span ariaHidden=true> {s(`&middot;`)} </span>
                  <span> {s(`11 min read`)} </span>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
    <p className="mt-5 text-right">
      <a className="font-semibold text-orangedark" href="">{s(`Go to the blog archive >`)}</a>
    </p>
  </div>

  <div className="bg-graylight">
    <div className="max-w-7xl mx-auto py-6 px-4 sm:py-12 sm:px-6 lg:px-8">
      <div className="text-center">
        <p className="text-3xl tracking-tight font-extrabold text-gray-900 sm:text-4xl">{s(`Looking for More? Try these spaces:`)}</p>
      </div>
    </div>
  </div>

  <div className="bg-graylight">
    <div className="mx-auto max-w-4xl flex pb-14 space-x-24 justify-center">
      <div className="grid grid-cols-1 lg:grid-cols-2 gap-3">
        <div className="text-center bg-white shadow overflow-hidden rounded-md px-36 py-4">{s(`Github.com`)}</div>
        <div className="text-center bg-white shadow overflow-hidden rounded-md px-36 py-4">{s(`Reddit.com`)}</div>
        <div className="text-center bg-white shadow overflow-hidden rounded-md px-36 py-4">{s(`Twitter.com`)}</div>
        <div className="text-center bg-white shadow overflow-hidden rounded-md px-36 py-4">{s(`Discuss.ocaml.org`)}</div>
        <div className="text-center bg-white shadow overflow-hidden rounded-md px-36 py-4">{s(`Github.com`)}</div>
        <div className="text-center bg-white shadow overflow-hidden rounded-md px-36 py-4">{s(`Github.com`)}</div>
      </div>
    </div>
  </div>
  </>

  let default = make