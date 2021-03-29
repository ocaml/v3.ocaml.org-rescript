let s = React.string

module UserLevelIntroduction = {
  type t = {
    level: string,
    introduction: string,
  }

  @react.component
  let make = (~content, ~margins) =>
    <div className={"flex mx-auto max-w-4xl items-center space-x-20 " ++ margins}>
      <div className="text-5xl font-bold text-orangedark flex-shrink-0">
        {s(content.level ++ ` -`)}
      </div>
      <div className="font-bold text-xl"> {s(content.introduction)} </div>
    </div>
}

module Books = {
  @react.component
  let make = (~margins) =>
    // TODO: define content type; extract content
    <div
      className={"bg-white overflow-hidden shadow rounded-lg mx-10 mx-auto max-w-5xl " ++ margins}>
      <div className="px-4 py-5 sm:px-6 sm:py-9">
        <h2 className="text-center text-orangedark text-7xl font-bold mb-8"> {s(`BOOKS`)} </h2>
        <div className="grid grid-cols-5 items-center mb-8 px-6">
          <div className="flex justify-center">
            // TODO: define state to track location within books list, activate navigation
            <svg
              className="h-24 center"
              viewBox="0 0 90 159"
              fill="none"
              xmlns="http://www.w3.org/2000/svg">
              <path
                fillRule="evenodd"
                clipRule="evenodd"
                d="M2.84806 86.0991L72.1515 155.595C76.1863 159.39 82.3571 159.39 86.1546 155.595C89.952 151.8 89.952 145.396 86.1546 141.601L23.734 79.2206L86.1546 16.8403C89.952 12.8081 89.952 6.64125 86.1546 2.84625C82.3571 -0.94875 76.1863 -0.94875 72.1515 2.84625L2.84806 72.105C-0.949387 76.1372 -0.949387 82.3041 2.84806 86.0991Z"
                fill="#ED7109"
              />
            </svg>
          </div>
          <div className="flex justify-center">
            <img className="h-36 w-28" src="/static/real-world-ocaml.jpg" />
          </div>
          <div className="flex justify-center">
            <img className="h-36 w-28" src="/static/oc-beg.png" />
          </div>
          <div className="flex justify-center">
            <img className="h-36 w-28" src="/static/more-oc.png" />
          </div>
          <div className="flex justify-center">
            <svg
              className="h-24" viewBox="0 0 90 159" fill="none" xmlns="http://www.w3.org/2000/svg">
              <path
                fillRule="evenodd"
                clipRule="evenodd"
                d="M86.1546 72.3423L16.8512 2.84625C12.8164 -0.948746 6.64553 -0.948746 2.84809 2.84625C-0.949362 6.64127 -0.949362 13.0453 2.84809 16.8403L65.2686 79.2207L2.84809 141.601C-0.949362 145.633 -0.949362 151.8 2.84809 155.595C6.64553 159.39 12.8164 159.39 16.8512 155.595L86.1546 86.3363C89.952 82.3041 89.952 76.1373 86.1546 72.3423Z"
                fill="#ED7109"
              />
            </svg>
          </div>
        </div>
      </div>
    </div>
}

type t = {
  title: string,
  pageDescription: string,
  beginning: UserLevelIntroduction.t,
  growing: UserLevelIntroduction.t,
  expanding: UserLevelIntroduction.t,
  diversifying: UserLevelIntroduction.t,
  researching: UserLevelIntroduction.t,
}

let contentEn = {
  title: `Language`,
  pageDescription: `This is the home of learning and tutorials. Whether you're a beginner, a teacher, or a seasoned researcher, this is where you can find the resources you need to accomplish your goals in OCaml.`,
  beginning: {
    level: `Beginning`,
    introduction: `Are you a beginner? Or just someone who wants to brush up on the fundamentals? In either case, the OFronds tutorial system has you covered!`,
  },
  growing: {
    level: `Growing`,
    introduction: `Familiar with the basics and looking to get a more robust understanding of OCaml? Or just curious? Check out the books available on OCaml:`,
  },
  expanding: {
    level: `Expanding`,
    introduction: `Have a strong foundation in OCaml? Time to get involved! Prepare by getting familiar with the OCaml Manual:`,
  },
  diversifying: {
    level: `Diversifying`,
    introduction: `Now that you're familiar with the building blocks of OCaml, you may want to diversify your portfolio and have a look at the many applications that operate using OCaml.`,
  },
  researching: {
    level: `Researching`,
    introduction: `Aspiring towards greater understanding of the language? Want to push the limits and discover brand new things? Check out papers written by leading OCaml researchers:`,
  },
}

@react.component
let make = (~content=contentEn) => <>
  <ConstructionBanner
    figmaLink=`https://www.figma.com/file/36JnfpPe1Qoc8PaJq8mGMd/V1-Pages-Next-Step?node-id=1085%3A121`
    playgroundLink=`/play/resources/language`
  />
  <TitleHeading.LandingTitleHeading
    title=content.title
    pageDescription=content.pageDescription
    marginTop=`mt-1`
    marginBottom=`mb-24`
  />
  <UserLevelIntroduction content=content.beginning margins=`mb-20` />
  <UserLevelIntroduction content=content.growing margins=`mb-20` />
  <Books margins=`mb-16` />
  <UserLevelIntroduction content=content.expanding margins=`mb-20` />
  <UserLevelIntroduction content=content.diversifying margins=`mb-20` />
  <UserLevelIntroduction content=content.researching margins=`mb-20` />
</>

let default = make
