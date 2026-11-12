#let temp-block(uid: "", pre-title: "", title: "", num: false, content) = [
  #metadata((kind: "uni-template.temp-block", title: title, pre-title: pre-title, uid: uid, num: num))
  #content
]

#let section(title) = metadata((kind: "uni-template.section", title: title))

#let subsection(title) = metadata((kind: "uni-template.subsection", title: title))

#let prop(title, uid: "", c) = temp-block(pre-title: "Satz", title: title,uid: uid, c)
#let lem(title,uid: "", c) = temp-block(pre-title: "Lemma", title: title,uid: uid, c)
#let def(title,uid: "", c) = temp-block(pre-title: "Definition", title: title,uid: uid, c)
#let thm(title,uid: "", c) = temp-block(pre-title: "Theorem", title: title,uid: uid, c)
#let ex(title,uid: "", c) = temp-block(pre-title: "Beispiel", title: title,uid: uid, c)
#let cor(title,uid: "", c) = temp-block(pre-title: "Korrolar", title: title,uid: uid, c)
#let bem(title,uid: "", c) = temp-block(pre-title: "Bemerkung", title: title,uid: uid, c)
#let rem(title,uid: "", c) = temp-block(pre-title: "Erinnerung", title: title,uid: uid, c)
#let prob(title,uid: "", c) = temp-block(pre-title: "Problem", title: title,uid: uid, c)
#let note(title,uid:"",c) = temp-block(pre-title: "Notiz", title: title,uid: uid, c)
#let auf(title,uid:"",c) = temp-block(pre-title: "Aufgabe", title: title,uid: uid,num:true, c)
#let algo(title,uid:"",c) = temp-block(pre-title: "Algorithmus", title: title,uid: uid, c)
#let loe(c) = temp-block(pre-title: "Lösung", title: "",uid: "", c)
#let ignore(c) = temp-block(pre-title: "Ignore", title: "ignore",uid: "", c)
#let bew(c) = [
  #v(-6pt)
  _BEWEIS.
  #c 
  _
  #align(right)[#sym.square.filled]
  #v(15pt, weak: true)
]
#let idea(c) = [
  #v(-6pt)
  _IDEE.
  #c 
  _
  #align(right)[#sym.square]
  #v(15pt, weak: true)
]
#let conjecture(content) = [
    #v(-6pt)
  _Vermutung.
  #content
  _
  #align(right)[#sym.square]
  #v(15pt, weak: true)
]