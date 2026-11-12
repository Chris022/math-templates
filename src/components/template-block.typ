#import "../template-utils.typ": get-section, get-subsection, get-temp-block, get-children

#let view-template-blocks(include-normal-content: true, content) = for element in get-children(content) {
  if (get-section(element) != none) {
    let section = get-section(element)
    heading(depth: 2, section)
  } else if (get-subsection(element) != none) {
    let section = get-subsection(element)
    heading(depth: 3, section)
  } else if (get-temp-block(element) != none) {
    let temp-block = get-temp-block(element)
    box(width: 100%)[
      #if (temp-block.title == "ignore") {
        continue
      }
      #if (temp-block.title != "") {
        context {
          let num = ""
          if (temp-block.num) {
            let counter = counter(temp-block.pre-title)
            counter.step()
            num = " " + [#{ counter.get().first() + 1 }]
          }
          text(weight: "bold", size: 13pt, temp-block.pre-title + num + ". ")
          text(weight: "regular", size: 13pt, "(" + temp-block.title + ")")
        }
      } else {
        text(weight: "bold", size: 13pt, temp-block.pre-title + ". ")
      } \
      #(temp-block.content)
    ]
    v(15pt, weak: true)
  } else if (include-normal-content) {
    element
  }
}
