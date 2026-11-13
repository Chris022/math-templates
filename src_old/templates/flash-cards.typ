#let flash-cards-show = content => {
  set page(
    margin: (top: 1cm, bottom: 1cm, right: 0.5cm, left: 1.5cm),
    flipped: true,
  )
  show math.equation.where(block: true): set block(above: 9pt, below: 3pt)
  let elements = get-children(content)
  let cards = ()
  let current_section = ""
  let current_subsection = ""
  for element in elements {
    if (get-section(element) != none) {
      current_section = get-section(element)
      current_subsection = ""
    }
    if (get-subsection(element) != none) {
      current_subsection = get-subsection(element)
    }
    if (get-temp-block(element) != none) {
      let element = get-temp-block(element)
      element.insert("section", current_section)
      element.insert("subsection", current_subsection)
      if (element.pre-title != "Ignore" and element.pre-title != "Notiz") {
        cards.push(element)
      }
    }
  }
  for card_pair in cards.chunks(2) {
    for card in card_pair {
      box(stroke: black, width: 50%, height: 33%, inset: (top: 10pt, x: 10pt))[
        #if (card.title != "") {
          text(weight: "bold", size: 13pt, card.title)
          h(1fr)
          if (card.subsection == "") {
            text(card.section)
          } else {
            text(card.subsection)
          }
        }

        #(card.content)
      ]
    }
    v(0pt, weak: true)
  }
}