let percent_complete = "30%"

@react.component
let make = () => {
  <div className="flex flex-col md:flex-row items-center text-center bg-yellowdark text-white">
    <div className="w-full md:w-3/12 font-bold text-2xl">
      {React.string("The next OCaml.org")}
    </div>
    <div className="w-full md:w-8/12">
      <div className="h-4 relative rounded-full overflow-hidden ring-8 ring-white m-8">
        <div className="w-full h-full bg-white absolute" />
        <div
          className="h-full rounded-full bg-yellowdark absolute"
          style={ReactDOM.Style.make(~width="30%", ())}
        />
      </div>
    </div>
    <div className="w-full md:w-1/12 font-bold text-2xl"> {React.string("30%")} </div>
  </div>
}
