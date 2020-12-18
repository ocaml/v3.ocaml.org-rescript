//    <h2 className="font-sans text-2xl font-bold leading-normal mb-2"> children </h2>;
let default = () => {
  let s = React.string
  <>
    <h1 className="ml-10 text-4xl font-bold leading-snug mb-2">{s(`Seminars`)}</h1>
    <p className="mb-3 ml-20">{s(`The Theoretical Computer Science and Discrete Mathematics 
    Seminars will take place every Monday at 11:15 a.m. - 12:15 p.m. and every 
    Tuesday at 10:30 a.m. - 12:30 p.m. at the Institute for Advanced Study. 
    The lectures will be held in S-101, the seminar room in Simonyi Hall, 
    unless stated otherwise.`)}
    </p>
    <p className="mb-3 ml-20">{s(`If you are interested in attending future seminars and are 
    not already on our mailing list from previous years, please send an e-mail 
    to Andrea Lass and ask to be added.`)}
    </p>

    <h2 className="text-2xl font-bold leading-normal mb-2">
      {s(`Upcoming Seminar Titles Include:`)}
    </h2>

    <div className="flex border-b border-grey-200">
        <div className="">
          <div className="text-center mt-2 mr-4 py-1 px-2 border-r border-grey-200 ">
              <p className="text-xs tracking-wider">{s(`JAN`)}</p>
              <p className="text-3xl font-bold">{s(`25`)}</p>
              <p className="text-xs tracking-widest">{s(`2021`)}</p>
          </div>
        </div>
        <div className="flex-none m-2">
            <img src="/static/sm_default.jpeg" className="w-48" />
        </div>
        <div className="m-2 max-w-lg">
          <p className="font-bold text-2xl mb-1">{s(`Computer Sciences/Discrete Mathematics Seminar I`)}</p>
          <p className="text-sm mb-1">{s(`TBA`)}</p>
          <p className="italic text-sm mb-1">{s(`Andrew Drucker`)}</p>
          <p className="italic text-sm mb-3">{s(`11:15am`)}</p>
        </div>
    </div>


    <div className="flex border-b border-grey-200">
        <div className="">
          <div className="text-center mt-2 mr-4 py-1 px-2 border-r border-grey-200 ">
              <p className="text-xs tracking-wider">{s(`JAN`)}</p>
              <p className="text-3xl font-bold">{s(`26`)}</p>
              <p className="text-xs tracking-widest">{s(`2021`)}</p>
          </div>
        </div>
        <div className="flex-none m-2">
            <img src="/static/sm_default.jpeg" className="w-48" />
        </div>
        <div className="m-2 max-w-lg">
          <p className="font-bold text-2xl mb-1">{s(`Computer Sciences/Discrete Mathematics Seminar II`)}</p>
          <p className="text-sm mb-1">{s(`TBA`)}</p>
          <p className="italic text-sm mb-1">{s(`Cynthia Vinzant`)}</p>
          <p className="italic text-sm mb-3">{s(`10:30am | Simonyi Hall 101 and Remote Access - see Zoom link below`)}</p>
        </div>
    </div>

    <button>{s(`VIEW MORE`)}</button>

  </>
}