#let environment-factory() = () => metadata(
  "This is a test",
)

#let prop = environment-factory()

// We need to "unpack" content depending on the type of content
// This function unpacks it and calls the callback function onto each of the unpacked elements
#let unpack(callback, content) = {
  let fields = content.fields()

  // For styled
  if content.has("child") {
    fields.child = callback(fields.child)
    return content.func()(..fields.values())
  }

  // For sequence
  if content.has("children") {
    fields.children = fields.children.map(callback)
    return content.func()(..fields.values())
  }

  // Others ...?
}

// This function searches for environments
// and replaces them with content according to the
// type of the environment
#let replace-environment(show-functions, content) = {
  let callback(el) = {
    // Stop recursion when environment was found! No need to go deeper
    if el.func() == text {
      return [Hey]
    }
    return unpack(callback,el)
  }
  return unpack(callback, content)
}

#show: it => replace-environment(none,it)
#set enum(numbering: "a)")
Test
sdf

sdfsdf
sdf

sdf
+ 123
+ 123