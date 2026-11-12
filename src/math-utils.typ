#import "@preview/ouset:0.2.0": ouset

#let disjunion = ouset(sym.union,sym.dot)
#let Union = sym.union.big
#let Inter = sym.inter.big
#let eval = sym.bar
#let int(a,b) = $bracket.l #a,#b bracket.r$
#let inthl(a,b) = $bracket.r #a,#b bracket.r$
#let inthr(a,b) = $bracket.l #a,#b bracket.l$
#let into(a,b) = $bracket.r #a,#b bracket.l$
#let res = $#h(-0pt) bar.v$
#let res(a,c) = $#a #h(-0pt) bar.v #h(-3pt) _#c$
#let iso = sym.tilde.equiv
#let ToDo(note: []) = block([
  #set text(fill: red)
  #text("TODO: ")
  (#note)
])

#let list(name, content) = [
  #set enum(numbering: (n) =>"("+ name + str(n) +")")
  #content
]

#let ideal = sym.triangle.small.l
