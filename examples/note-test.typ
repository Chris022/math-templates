#import "../lib.typ": *

#show: note-show("Protokoll","Woche 1","Christoph Weberbauer", logo:"/assets/logo_goethe_uni.png")

*Gelesen*: Kapitel 2.1 & 2.2 & 2.3

= Definitionen und Erkenntnisse
- Datentypen: $NN,X,...$
- Elemente $5: NN,x: X,...$
- Familien von Typen: Wenn $x:X$ dann ist $T(x)$ ein Datentyp.
- Familien von Elementen: Wenn $x:X$ dann ist $e(x)$ ein Element in $T(x)$. Anderer Name dafür sind Funktionen
- Der Datentyp einer Familie von Elementen heißt Produkt Typ: $Pi_(x:X)T(x)$.
- Ist $T(x) :equiv Y$ eine konstante Familie, so ist $Pi_(x:X)T(x)$ ein Funktions-Typ und wird als $X->Y$ geschrieben.
- Definitionsgleich $:equiv$ ist ein Konzept auf der Notationsebene (siehe unten) und heißt, dass wir immer wenn wir das auf der linken Seite wo stehen haben, es mit dem auf der Rechten ersetzen können.
- Universen und deren Eigenschaften.

= Beantwortete Fragen
- *Frage*: Ist $:equiv$ hier mit $:=$ oder mit $=$ zu vergleichen und kann man in der Typentheorie zwischen $a^2 + b^2 =^hat c^2$ und $x + x^2 =^! 0$ unterscheiden *Antwort*: Mit $:=$. Zweiteres ist ganz formal sauber keine Aussage - auch nicht in der üblichen Mathematik.
- *Frage*: Ist eine Familie von Typen ein Typ? *Antwort*: Nein! Eine Familie von Typen kann wie es im HoTT Buch gemacht wird, als eine Funktion von $X$ in ein Universum $U$ angesehen werden. Dies ist auch nicht zirkulär, wenn wir Funktionstypen als primitiv voraussetzen und dann erst Familien von Typen definieren (und dann Produkte).

= Unbeantwortete Fragen
- *Frage*: Wieso gibt es kein Universum aller Universen? *Antwort*: Girard's Paradox!
- *Frage*: Sind zwei Datentypen gleich wenn sie die selben Elemente haben? Was bedeutet gleich hier?
- *Frage*: Kann man mit Regeln der Universen herleiten, dass $NN in cal(U)_0$ lebt? *Antwort*: Nein?
