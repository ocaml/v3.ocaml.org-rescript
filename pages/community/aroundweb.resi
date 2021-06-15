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

module BlogEntry: {
  type t = {
    title: string,
    excerpt: string,
    author: string,
    dateValue: string,
    date: string,
    readingTime: string,
  }
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
  blogEntries: array<BlogEntry.t>,
  blogArchiveText: string,
  spacesSectionHeader: string,
  spaces: array<string>,
}

include Page2.S
