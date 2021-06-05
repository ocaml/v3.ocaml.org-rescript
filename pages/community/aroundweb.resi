module LatestNews: {
  type t = {
    latest: string,
    news: array<NewsItem.t>,
    newsArchive: string,
  }
}

module Events: {
  type t = {
    title: string,
    description: string,
    callToAction: string,
    latestEvents: array<Event.t>,
  }
}

type blogEntry = {
  title: string,
  excerpt: string,
  author: string,
  dateValue: string,
  date: string,
  readingTime: string,
}

type t = {
  title: string,
  pageDescription: string,
  engageHeader: string,
  engageBody: string,
  engageButtonText: string,
  latestNewsContent: LatestNews.t,
  events: Events.t,
  blogSectionHeader: string,
  blogSectionDescription: string,
  blog: string,
  blogEntries: array<blogEntry>,
  blogArchiveText: string,
  spacesSectionHeader: string,
  spaces: array<string>,
}

@react.component
let make: (~content: t) => React.element

type props = {content: t}

let getStaticProps: Next.GetStaticProps.t<props, unit, unit>

let default: {"content": t} => React.element
