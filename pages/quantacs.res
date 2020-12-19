//    <h2 className="font-sans text-2xl font-bold leading-normal mb-2"> children </h2>;

let default = () => {
  let s = React.string
  <>
<div className="bg-gray-300 min-w-full">

<p className="text-center pt-20 mb-4 text-xs">{s(`WHAT'S UP IN`)}</p>
<h1 className="text-center text-5xl font-bold leading-snug mb-16">{s(`Computer Science`)}</h1>

<div className="p-16 bg-white">
  <div className="flex bg-black space-x-20">
    <div className="flex bg-red-200 space-x-8">
      <div className="flex-1">
        <img className="w-64 bg-orange-100" src="static/Jelani-Nelson_520x292-520x292.jpeg"/>
      </div>
      <div className="flex-1">
        <p className="bg-green-200 text-xs">{s(`Q & A`)}</p>
        <h3 className="bg-purple-200 text-xl font-bold">{s(`The Computer Scientist Who Shrinks Big Data`)}</h3>
        <p className="bg-white">
          <span className="italic text-xs">{s(`By`)}</span>
          <span className="text-xs">
          {s(` ALLISON WHITTEN | DECEMBER 7, 2020 | ch-ic | tag-ic`)}
          </span>
        </p>
        <p className="text-sm bg-blue-100">{s(`Jelani Nelson designs clever algorithms that only 
                have to remember slivers of massive data sets. He also
                teaches kids in Ethiopia how to code.`)}</p>
      </div>
    </div>

  </div>
</div>

</div>
  </>
}

/*
    <div className="bg-yellow-100">
      <h2>{s(`Topics`)}</h2>
      <div>{s(`Search`)}</div>
      <h3>{s(`View All Topics`)}</h3>
      <h2>{s(`Follow Quanta`)}</h2>    
    </div>
*/