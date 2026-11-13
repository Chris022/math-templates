#let header-logo-v1(class, semester, author, title, logo) = {
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
      #image(logo, width: 50mm)
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

#let header(title, subtitle, author) = {
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

#let header-logo-v2(title, subtitle, author, logo) = {
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
}
