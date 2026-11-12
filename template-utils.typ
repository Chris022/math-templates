#import "utils.typ": get-children, is-kind, has-children


#let search-for-temp-block(children) = {
  if (type(children) != array){
    return none
  }
  for child in children {
    let sub-children = get-children(child)
    if (type(sub-children) == array){
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


#let get-temp-block(it) = {

  // check if sequence includes right metadata
  // We need to be careful here, because the metadata might
  // be pretty deep.
  // Solution - Depth search

  return search-for-temp-block(get-children(it))
}

#let get-reference(it) = {
  // check if element is metadata
  if (is-kind(it, "uni-template.reference")) {
    let to = it.value.to
    return to
  }
  return none
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

#let temp-block(uid:"", pre-title: "", title: "", num:false, content) = [
  #metadata((kind: "uni-template.temp-block", title: title, pre-title: pre-title, uid: uid, num: num))
  #content
]

#let reference(to) = metadata((kind: "uni-template.reference", to: to))

#let section(title) = metadata((kind: "uni-template.section", title: title))

#let subsection(title) = metadata((kind: "uni-template.subsection", title: title))

#let ref-link(title, to) = [
  #reference(to)
  #link(label(to))[
    #text(fill:red)[#title]
  ]
]