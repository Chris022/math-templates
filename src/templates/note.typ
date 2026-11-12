#import "../components/header.typ": header, header-logo-v2
#import "../components/template-block.typ":  view-template-blocks

#let note-show(title, subtitle, author, logo: "") = content => {
  set page(
    paper: "iso-b5",
    margin: 1cm,
  )
  set text(font: "New Computer Modern", size: 11pt)

  if(logo != ""){
    header-logo-v2(title, subtitle, author, logo)
  }else{
    header(title,subtitle,author)
  }
  
  line(start: (-2pt, 0pt), length: 100%)

  align(center)[
    #h(-2pt)
    #text(title, size: 20pt)
  ]

  view-template-blocks(content,include-normal-content: true)
}