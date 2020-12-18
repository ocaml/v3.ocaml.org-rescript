//    <h2 className="font-sans text-2xl font-bold leading-normal mb-2"> children </h2>;

let default = () => {
  let s = React.string
  <>
<div className="bg-gray-300 min-w-full">
<p className="text-center pt-20 mb-4 text-xs">{s(`WHAT'S UP IN`)}</p>
<h1 className="text-center text-5xl font-bold leading-snug mb-16">{s(`Computer Science`)}</h1>

<div>
  <div className="bg-red-200">
    <span className="bg-orange-100">{s(`i1`)}</span>
    <p className="bg-green-200">{s(`Q & A`)}</p>
    <p className="bg-white">{s(`By ALLISON WHITTEN | DECEMBER 7, 2020 | ch-ic | tag-ic`)}</p>
    <p className="bg-blue-100">{s(`Jelani Nelson designs clever algorithms that only 
            have to remember slivers of massive data sets. He also
            teaches kids in Ethiopia how to code.`)}</p>
  </div>

  <div className="bg-yellow-100">
    <h2>{s(`Topics`)}</h2>
    <div>{s(`Search`)}</div>
    <h3>{s(`View All Topics`)}</h3>
    <h2>{s(`Follow Quanta`)}</h2>    
  </div>
</div>

</div>
  </>
}