//    <h2 className="font-sans text-2xl font-bold leading-normal mb-2"> children </h2>;

let default = () => {
  let s = React.string
  <>
<div className="bg-gray-300 min-w-full">

<p className="text-center pt-20 mb-4 text-xs">{s(`WHAT'S UP IN`)}</p>
<h1 className="text-center text-5xl font-bold leading-snug mb-16">{s(`Computer Science`)}</h1>

<div className="p-16 bg-white">
  <div className="bg-black">
    <div className="float-left w-4/6 flex bg-red-200 space-x-8 pr-16">
      <div className="flex-1">
        <img className="bg-orange-100" src="static/Jelani-Nelson_520x292-520x292.jpeg"/>
      </div>
      <div className="flex-1">
        <p className="pb-2 text-xs bg-green-200">{s(`Q & A`)}</p>
        <h3 className="pb-2 text-xl font-bold bg-purple-200">{s(`The Computer Scientist Who Shrinks Big Data`)}</h3>
        <p className="pb-2 bg-white">
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

    <div className="float-left w-2/6 bg-yellow-100 pl-16 border-l-2">
      <h2 className="font-bold text-xl mb-4">{s(`Topics`)}</h2>
      <div className="mb-4"><select className="w-48"/></div>
      <p className="text-sm font-bold text-orange-500 mb-8">{s(`View All Topics`)}</p>
      <h2 className="font-bold text-xl">{s(`Follow Quanta`)}</h2>
    </div>
  </div>
</div>

</div>
  </>
}

     