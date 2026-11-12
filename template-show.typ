#import "utils.typ": get-children, is-kind
#import "template-utils.typ": get-section, get-subsection, get-temp-block, section, temp-block


#let header-show(class, semester, author, title) = {
table(
    columns: (2fr, 1fr),
    align: horizon,
    inset: 0pt,
    stroke: none,
    {
      v(8mm)
      h(-2pt)
      text(class, size: 24pt)
      v(6mm, weak: true)
      h(-2pt)
      text(semester, size: 14pt)
      v(6mm, weak: true)
      h(-2pt)
      text(author, size: 12pt)
    },
    align(right)[
      #image("./logo_goethe_uni.png", width: 50mm)
    ],
  )

  line(start: (-2pt, 0pt), length: 100%)

  table(
    columns: (1fr, 1fr),
    align: horizon,
    inset: 0pt,
    stroke: none,
    {
      h(-2pt)
      text(title, size: 20pt)
    },
    align(right)[
      #table(
        columns: (auto, auto),
        stroke: none,
        text("Erstellt: "), datetime.today().display("[day]-[month]-[year]"),
      )
    ],
  )
}

#let generate-reference-list(reference-list) = context {
    if (reference-list.len() != 0) { heading("Referenzen") }
    for reference in reference-list {
      for element in get-children(include ("./../" + reference)) {
        if (get-temp-block(element) != none) {
          let temp-block = get-temp-block(element)
          if (query(metadata.where(value: (kind: "uni-template.reference", to: temp-block.uid))).len() != 0) {
            box(width: 100%, inset: (top: 10pt, x: 10pt))[
              #if (temp-block.title != "") {
                heading([
                  #text(weight: "bold", size: 13pt, temp-block.pre-title + ". ")
                  #text(weight: "regular", size: 13pt, "(" + temp-block.title + ")")
                  #if (temp-block.uid != "") {
                    label(temp-block.uid)
                  }
                ])
                temp-block.content
              }
            ]
          }
        }
      }
    }
  }

#let handle-template-blocks(include-normal-content: true, content) = for element in get-children(content) {
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
        #if (temp-block.title != "") { context{
          let num = "";
          if(temp-block.num){
            let counter = counter(temp-block.pre-title)
            counter.step()
            num = " " + [#{counter.get().first() + 1}]
          }
          text(weight: "bold", size: 13pt, temp-block.pre-title + num + ". ")
          text(weight: "regular", size: 13pt, "(" + temp-block.title +  ")")
        }} else {
          text(weight: "bold", size: 13pt, temp-block.pre-title + ". ")
        } \
        #(temp-block.content)
      ]
      v(15pt, weak: true)
    } else if(include-normal-content) {
      element
    }
  }

#let homework-show(class, semester, author, title, reference-list: ()) = content => {
  set page(paper: "a4", margin: (top: 1cm, bottom: 2cm, left: 2cm, right: 2cm))
  set text(font: "New Computer Modern", size: 11pt)
  
  header-show(class,semester,author,title)
  
  handle-template-blocks(content,include-normal-content: true)

  generate-reference-list(reference-list)
}

#let compact-script-show = content => {
  set page(
    margin: 1cm,
  )

  handle-template-blocks(content, include-normal-content: false)
}

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

#let note-show = content => {
  set page(
    paper: "iso-b5",
    margin: 1cm,
  )
  for element in get-children(content) {
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
          text(weight: "bold", size: 13pt, temp-block.pre-title + ". ")
          text(weight: "regular", size: 13pt, "(" + temp-block.title + ")")
        } else {
          text(weight: "bold", size: 13pt, temp-block.pre-title + ". ")
        } \
        #(temp-block.content)
      ]
      v(15pt, weak: true)
    } else {
      element
    }
  }
}

#let fancy-note-show(title, subtitle, author, logo: "") = content => {
  set page(
    paper: "iso-b5",
    margin: 1cm,
  )
  set text(font: "New Computer Modern", size: 11pt)

  if (logo != "") {
    table(
      columns: (2fr, 1fr),
      align: horizon,
      inset: 0pt,
      stroke: none,
      {
        v(8mm)
        h(-2pt)
        text(subtitle, size: 24pt)
        v(6mm, weak: true)
        h(-2pt)
        text(author, size: 12pt)
      },
      align(right)[
        #image(logo, width: 50mm)
      ],
    )
  } else {
    table(
      columns: 2fr,
      align: center,
      inset: 0pt,
      stroke: none,
      {
        v(8mm)
        h(-2pt)
        text(subtitle, size: 24pt)
      },
      {
        v(5mm)
        text(author, size: 12pt)
      }
    )
  }

  line(start: (-2pt, 0pt), length: 100%)

  align(center)[
    #h(-2pt)
    #text(title, size: 20pt)
  ]
  for element in get-children(content) {
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
          text(weight: "bold", size: 13pt, temp-block.pre-title + ". ")
          text(weight: "regular", size: 13pt, "(" + temp-block.title + ")")
        } else {
          text(weight: "bold", size: 13pt, temp-block.pre-title + ". ")
        } \
        #(temp-block.content)
      ]
      v(15pt, weak: true)
    } else {
      element
    }
  }
}
