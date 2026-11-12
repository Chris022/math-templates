#import "../components/header.typ": header-logo-v1
#import "../components/template-block.typ": view-template-blocks

#let homework-show(class, semester, author, title, reference-list: ()) = content => {
  set page(paper: "a4", margin: (top: 1cm, bottom: 2cm, left: 2cm, right: 2cm))
  set text(font: "New Computer Modern", size: 11pt)
  
  header-logo-v1(class,semester,author,title,"../../assets/logo_goethe_uni.png")
  
  view-template-blocks(content,include-normal-content: true)
}