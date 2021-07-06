// NOTE: This is a temporary page to display and test components until
//  we adopt StoryBook or a similar technology.

@react.component
let make = () => <>
  <div className="bg-green-100 py-4">
    <SectionContainer.VerySmallCentered>
      <StoryCard.CornerTitleLogo
        title="Mirage OS"
        graphicUrl="/static/ocaml-logo.jpeg"
        body="  Lorem ipsum dolor sit amet, consectetur adipiscing elit. Quisque pellentesque placerat arcu, non tempor nisi ultrices at. Aenean facilisis eleifend velit quis consequat. Sed turpis elit, ultrices et tincidunt nec, gravida et massa. Maecenas hendrerit, ante et imperdiet semper, lorem purus condimentum neque, quis mollis eros augue vel est. Pellentesque id turpis sit amet magna elementum ultricies a id mauris. Nulla ut faucibus dui. Curabitur sit amet consequat nulla."
      />
    </SectionContainer.VerySmallCentered>
  </div>
  <div className="bg-white py-4">
    <SectionContainer.SmallCentered>
      <StoryCard.CornerTitleLogo
        title="2012-2016"
        graphicUrl="/static/rackspacelogo.jpeg"
        body="Rackspace is a hosting provider that Lorem ipsum dolor sit amet, consectetur adipiscing elit. Quisque pellentesque placerat arcu, non tempor nisi ultrices at. Aenean facilisis eleifend velit quis consequat. Sed turpis elit, ultrices et tincidunt nec, gravida et massa. Maecenas hendrerit, ante et imperdiet semper, lorem purus condimentum neque, etcetera."
        colored=true
        bordered=false
      />
    </SectionContainer.SmallCentered>
  </div>
  <div className="bg-green-100 py-4">
    <SectionContainer.SmallCentered>
      <StoryCard.CornerLogoCenterTitle
        title="Software Engineer at Tarides"
        graphicUrl="/static/trd.png"
        body="Lorem ipsum dolor sit amet, consectetur adipiscing elit. Quisque pellentesque placerat arcu, non tempor nisi ultrices at. Aenean facilisis eleifend velit quis consequat. Sed turpis elit, ultrices et tincidunt nec, gravida et massa. Maecenas hendrerit, ante et imperdiet semper, lorem purus condimentum neque, quis mollis eros augue vel est. Pellentesque id turpis sit amet magna elementum ultricies a id mauris. Nulla ut faucibus dui. Curabitur sit amet consequat nulla."
        buttonText="Learn More"
      />
    </SectionContainer.SmallCentered>
  </div>
  <div className="bg-green-100 py-4">
    <LogoCloud
      companies={[
        {
          logoSrc: "/static/oclabs.png",
          name: "OCaml Labs",
          website: "https://ocamllabs.io",
        },
        {
          logoSrc: "/static/trd.png",
          name: "Tarides",
          website: "https://tarides.com",
        },
        {
          logoSrc: "/static/slv2.png",
          name: "Solvuu",
          website: "https://solvuu.com",
        },
        {
          logoSrc: "/static/js2.jpeg",
          name: "Jane Street",
          website: "https://janestreet.com",
        },
        {
          logoSrc: "/static/lxf.png",
          name: "LexiFi",
          website: "https://lexifi.com",
        },
        {
          logoSrc: "/static/tz.png",
          name: "Tezos",
          website: "https://tezos.com",
        },
      ]}
    />
  </div>
  <div className="bg-green-100 py-4">
    <LogoCloud
      companies={[
        {
          logoSrc: "/static/oclabs.png",
          name: "OCaml Labs",
          website: "https://ocamllabs.io",
        },
        {
          logoSrc: "/static/trd.png",
          name: "Tarides",
          website: "https://tarides.com",
        },
        {
          logoSrc: "/static/slv2.png",
          name: "Solvuu",
          website: "https://solvuu.com",
        },
        {
          logoSrc: "/static/js2.jpeg",
          name: "Jane Street",
          website: "https://janestreet.com",
        },
        {
          logoSrc: "/static/lxf.png",
          name: "LexiFi",
          website: "https://lexifi.com",
        },
        {
          logoSrc: "/static/tz.png",
          name: "Tezos dfsdfdsssss",
          website: "https://tezos.com",
        },
      ]}
      addNameText=true
    />
  </div>
</>

let default = make
