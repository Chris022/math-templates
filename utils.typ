#let get-children(it) = {
  // check if element is a sequence
  //if (type(it) != content) {return false}
  if (it.has("child")) {return (it.child,)}
  if (it.has("children")) {return it.children}
  return false

}

#let has-children(it) = {
  // check if element is metadata
  if (it.has("child")) {return true}
  if (it.has("children")) {return true}
  return false
}

#let is-kind(it, kind) = {
  if (it.func() != metadata)  {return false}
  if (not("kind" in it.value.keys())) {return false}
  return it.value.kind == kind
}