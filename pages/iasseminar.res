module Link = Next.Link;

module H2 = {
  @react.component
  let make = (~children) => 
    <h2 className="font-sans text-2xl font-bold leading-normal mb-2"> children </h2>;
};

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

    <div className="flex bg-gray-200">
        <div className="flex-1 text-center bg-gray-400 m-2">
            <p className="text-xs">{s(`JAN`)}</p>
            <p className="text-2xl font-bold">{s(`25`)}</p>
            <p className="text-xs">{s(`2021`)}</p>
        </div>
        <div className="flex-1 text-center bg-gray-400 m-2">{
            s(`IAS GRAPHIC`)}
        </div>
        <div className="flex-1 bg-gray-400 m-2">
          <p className="font-bold">{s(`Computer Sciences/Discrete Mathematics Seminar I`)}</p>
          <p>{s(`TBA`)}</p>
          <p className="italic">{s(`Andrew Drucker`)}</p>
          <p className="italic">{s(`11:15am`)}</p>
        </div>
    </div>

    <div>
        <div>{s(`JAN 26 2021`)}</div>
        <div>{s(`IAS GRAPHIC`)}</div>
        <div>
          <p>{s(`Computer Sciences/Discrete Mathematics Seminar II`)}</p>
          <p>{s(`TBA`)}</p>
          <p>{s(`Cynthia Vinzant`)}</p>
          <p>{s(`10:30am | Simonyi Hall 101 and Remote Access - see Zoom link below`)}</p>
        </div>
    </div>

    <button>{s(`VIEW MORE`)}</button>

  </>
}