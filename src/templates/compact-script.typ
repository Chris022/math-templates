#import "../components/template-block.typ": view-template-blocks

#let compact-script-show = content => {
  set page(
    margin: 1cm,
  )

  view-template-blocks(content, include-normal-content: false)
}