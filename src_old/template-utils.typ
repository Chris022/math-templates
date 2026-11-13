#let get-children(it) = {
  if (it.has("child")) {return (it.child,)}
  if (it.has("children")) {return it.children}
  return false

}

#let has-children(it) = {
  if (it.has("child")) {return true}
  if (it.has("children")) {return true}
  return false
}

#let is-kind(it, kind) = {
  if (it.func() != metadata)  {return false}
  if (not("kind" in it.value.keys())) {return false}
  return it.value.kind == kind
}

#let get-temp-block(it) = {
  // check if sequence includes right metadata
  // We need to be careful here, because the metadata might
  // be pretty deep.
  // Solution - Depth search

  let search-for-temp-block(children) = {
    if (type(children) != array) {
      return none
    }
    for child in children {
      let sub-children = get-children(child)
      if (type(sub-children) == array) {
        return search-for-temp-block(sub-children)
      }

      if (is-kind(child, "uni-template.temp-block")) {
        let temp-block = child.value
        temp-block.insert("content", children.join())
        return temp-block
      }
    }
    return none
  }

  return search-for-temp-block(get-children(it))
}

#let get-section(it) = {
  // check if element is metadata
  if (is-kind(it, "uni-template.section")) {
    let section = it.value.title
    return section
  }
  return none
}

#let get-subsection(it) = {
  // check if element is metadata
  if (is-kind(it, "uni-template.subsection")) {
    let section = it.value.title
    return section
  }
  return none
}