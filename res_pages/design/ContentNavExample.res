let s = React.string

let default = () =>
  <>
  <main className="lg:max-w-4xl mx-auto grid grid-cols-5">
    <nav className="col-span-1 sticky self-start top-2 ">
        <a className="block" href="#h0">{s(`Header 0`)}</a>
        <a className="block pl-6" href="#sh0">{s(`Subheader 0`)}</a>
        <a className="block" href="#h1">{s(`Header 1`)}</a>
        <a className="block" href="#h2">{s(`Header 2`)}</a>
        <a className="block pl-6" href="#sh2">{s(`Subheader 2`)}</a>
        <a className="block" href="#h3">{s(`Header 3`)}</a>
    </nav>
    <div className="col-span-4">
        <h2 id="h0">{s(`Header 0`)}</h2>
        <p className="mb-72">{s(`filler`)}</p>
        <h3 id="sh0">{s(`Subheader 0`)}</h3>
        <p className="mb-72">{s(`filler`)}</p>
        <h2 id="h1">{s(`Header 1`)}</h2>
        <p className="mb-72">{s(`filler`)}</p>
        <h2 id="h2">{s(`Header 2`)}</h2>
        <p className="mb-72">{s(`filler`)}</p>
        <h3 id="sh2">{s(`Subheader 2`)}</h3>
        <p className="mb-72">{s(`filler`)}</p>
        <h2 id="h3">{s(`Header 3`)}</h2>
        <p className="mb-72">{s(`filler`)}</p>
    </div>
  </main>
  </>