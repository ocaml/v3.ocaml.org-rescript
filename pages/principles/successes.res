type t = {
  title: string,
  pageDescription: string,
}

let contentEn = {
  title: `Success Stories`,
  pageDescription: ``,
}

@react.component
let make = (~content=contentEn) => <>
  <ConstructionBanner />
  <Page.Basic title=content.title pageDescription=content.pageDescription>
    <div className="max-w-4xl mx-auto">
      {
        let body = "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec ullamcorper lacinia mi non fringilla. Nulla porttitor consequat diam sed convallis. Maecenas lacus felis, tincidunt eget ipsum sit amet, vestibulum lobortis dolor. Vivamus mollis dignissim cursus. Mauris at metus vitae neque rutrum convallis. Maecenas eget suscipit augue, sed maximus nibh. Maecenas sagittis commodo libero, eget lacinia quam ultrices vitae. Maecenas eu condimentum metus, in hendrerit sapien. Sed facilisis arcu nec enim ornare, a consectetur nisi porttitor. Sed semper in lorem sodales luctus. Aenean gravida, sem eget laoreet vehicula, leo nisi sollicitudin est, vel cursus augue sem eget risus. Quisque elementum tellus ut felis vehicula, eget porttitor tellus consequat. Nunc ipsum tortor, dignissim et risus sit amet, posuere tristique nunc. Donec facilisis venenatis turpis, sed varius dui. Cras sodales magna in convallis tincidunt."
        <StoryCard title="Mirage OS" graphicUrl="/static/opam.png" body />
      }
    </div>
  </Page.Basic>
</>

let default = make
