// TODO: define scanleft (https://github.com/reazen/relude/blob/e733128d0df8022448398a44c80cba6f28443b94/src/list/Relude_List_Base.re#L487)
// and use it below

// TODO: factor out the core algorithm from other concerns, and
//  write unit tests for the core algorithm.

let transformer = (rootnode: Unified.rootnode, file: Unified.vfile) => {
  let rec collect = (nodes, inProgress) => {
    switch nodes {
    | list{} =>
      switch inProgress {
      | None => list{}
      | Some(_, entry) => list{entry}
      }
    | list{h: Unified.headingnode, ...tail} =>
      let d = h.depth
      if d >= 2 || d <= 3 {
        let entry = {
          Unified.MarkdownTableOfContents.label: Unified.MdastUtilToString.toString(h),
          id: h.data.id,
          children: list{},
        } // add node.data.id and children = []
        switch inProgress {
        | None => collect(tail, Some(d, entry))
        | Some(lastRootDepth, inProgress) if d <= lastRootDepth => list{
            inProgress,
            ...collect(tail, Some(d, entry)),
          }
        | Some(lastRootDepth, inProgress) =>
          let inProgress = {
            ...inProgress,
            children: Belt.List.concat(inProgress.children, list{entry}),
          }
          collect(tail, Some(lastRootDepth, inProgress))
        }
      } else {
        // TODO: guard against unusual jumps in depth?
        collect(tail, inProgress)
      }
    }
  }
  let headings = collect(
    Array.to_list(
      Belt.Array.keepMap(rootnode.children, ch =>
        switch ch {
        | {\"type": "heading", depth: Some(_)} => Some(Unified.asHeadingNode(ch))
        | _ => None
        }
      ),
    ),
    None,
  )

  file.toc = headings
}

let plugin = () => {
  transformer
}
