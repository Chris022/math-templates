#import "../lib.typ": auf, bew, homework-show, loe

#show: homework-show("Numerik", "Wintersemester 26/27", "Spingler Joshua & Christoph Weberbauer", "Blatt 3")


#auf("Lagrange-Interpolation")[
  #set enum(numbering: "a)")
  + Zeigen Sie für die Lagrange-Polynome
    $ L_i (x)= product_(j=0,dots,n\j != i)(x-x_j)/(x_i-x_j) $
    die Identität
    $ L_i (x)=omega(x)/((x-x_i)omega'(x_i)) $
    mit $omega(x)=product_(k=0)^n (x-x_k)$.
  + Stellen sie die Lagrange-Interpolationsformel für die Stützstellen $x_0$, $x_0+ epsilon$ und $x_1$ auf und untersuchen sie den Grenzfall $epsilon->0$. Welchen Grad hat das resultierende Interpolationspolynom.
]

#[
  *Lösung.* (Rechne ich gerne vor)
  Zu a).

  Wir zeigen zuerst mit Induktion über $n$
  $ omega'(x_i)= product_(j=0,dots,n\ i!= j) (x_i - x_j) "für alle" i<=n $
  Für $n = 0$ ist $omega(x)=(x-x_0)$ und somit $omega'(x_0)=1$. Rechts haben wir auch das leere Produkt.
  Sei nun $n$ beliebig. Dann ist $omega(x)=product_(i=0)^(n-1)(x-x_i) dot (x-x_n)$. nach Produktregel ist die Ableitung
  $ omega'(x)=(product_(i=0)^(n-1)(x-x_i))' dot (x-x_(n+1)) + (product_(j=0)^(n-1)(x-x_j)) dot 1. $ Einsetzen von $x_i$ mit $i<=n$ lässt den zweiten Term wegfallen, weil sicher $(x_i-x_i)$ im Produkt vorkommt und mit der Induktionsbehauptung erhalten wir $omega'(x_i)=(product_(j=0,dots,n; j != j)(x_i-x_j)) dot (x_i - x_(n+1))$.
  Falls $i=n+1$ ist, so fällt der erste Term weg und es bleibt $omega'(x_(n+1))=product_(j=0)^(n-1)(x_(n+1)-x_j)$.
  Beides ist gleich
  $ omega'(x_i)= product_(j=0,dots,n\ i!= j) (x_i - x_j). $

  Nun kann man $(x-x_i)$ mit einem Term aus $omega(x)$ kürzen und erhält mit vereinfachen:
  $
    omega(x)/((x-x_i)omega'(x_i))=(product_(j=0,dots,n\ i != j) (x - x_j))/(product_(j=0,dots,n\ i!= j) (x_i - x_j)) = product_(j=0,dots,n\ i != j) (x - x_j)/(x_i-x_j) = L_i (x).
  $
]

#auf("Newton-Interpolation")[
  #set enum(numbering: "a)")

  + Aus der folgenden Messtafel ist leider ein Wert verloren gegangen:
    #align(center)[
      #table(
        columns: 6,
        $x_i$, $0$, $1$, $2$, $3$, $4$,
        $y_i$, $1$, $1$, $2$, $?$, $5$,
      )
    ]
    Werten Sie das durch die ¨ubrigen Daten definierte Interpolationspolynom an der fehlenden Stelle 3 aus ohne das Polynom explizit aufzustellen. Verwenden Sie den Aitken-Neville-Algo.
  + Stellen Sie jetzt das Interpolationspolynom mit Hilfe des Newton-Algorithmus auf und werten Sie es an der Stelle 3 mit dem Horner-Schema aus.
  + Verwenden Sie nun dividierte Differenzen zur Berechnung der Polynomkoeffizienten.
  + Im Nachhinein stellt sich heraus, dass der fehlende Wert 3 ist. Erg¨anzen Sie Ihr Differenzenschema um den neuen Punkt (ohne es komplett neu aufzustellen) und werten Sie das durch alle Punkte gehende Interpolationspolynom an einer anderen Stelle Ihrer Wahl aus.
]

#[
  *Lösung.* (Rechne ich gerne vor)
  Zu a)

  Wir füllen die folgende Tabelle aus, wobei ein Wert entsteht "indem man die Pyramide mit Spitze diesem Wert bis zur basis verfolgt und dann den obersten $x$-wert $a$ und den untersten $x$-wert $b$ nennt". Außerdem sei $c$ der $y$-Eintrag links oberhalb des Wertes und $d$ der links unterhalb. Dann ist der Wert
  $ ((x-a) dot d - (x-b) dot c)/ (b-a). $
  #align(center)[#table(
    stroke: none,
    columns: 5,
    align(horizon)[
      $x_0=0$ \ $x_1=1$ \ $x_2=2$ \ $x_3=4$
    ],
    align(horizon)[
      $y_0=1$ \ $y_1=1$ \ $y_2 =2$ \ $y_3=5$
    ],
    align(horizon)[
      $(3 dot 1 - 2 dot 1)/1=1$ \ $(2 dot 2 - 1 dot 1)/1=3$ \ $(1 dot 5 + 1 dot 2)/2=3.5$
    ],
    align(horizon)[
      $(3 dot 3-1 dot 1)/2=4$ \ $(2 dot 5 + 3 dot 1)/3=10/3$
    ],
    align(horizon)[
      $(3 dot 10/3 + 4)/4=3.5$
    ],
  )]

  Zu b)

  Ich stelle zuerst die ohnehin benötigte Matrix auf:
  $
    mat(1, 0, 0, 0; 1, N_1 (x_1), 0, 0; 1, N_1(x_2), N_2(x_2), 0; 1, N_1(x_3), N_2(x_2), N_3(x_3)) = mat(1, 0, 0, 0; 1, (1-0)=1, 0, 0; 1, (2-0)=2, (2-0)(2-1)&=2, 0; 1, (4-0)=4, (4-0)(4-1)&=12, (4-0)(4-1)(4-2)=24).
  $

  Nun kann man einfach das Gleichungssystem beschrieben von dieser Matrix lösen indem man die Formel
  $ a_j = (y_j - sum_(i=0)^(j-1)a_i N_i (x_j))dot 1/(N_j (x_j)). $
  nutzt
  - $a_0 = y_0 = 1$
  - $a_1 = (y_1 - a_0 dot 1)/1=0$
  - $a_2 = (y_2 - a_0 dot 1 - a_1 dot 2)/2=0.5$
  - $a_3 = (y_3 - a_0 dot 1 - a_1 dot 4 - a_2 dot 12)/24 = -1/12$

  Unser Polynom ist also im Horner-Schema:
  $ P(x) = a_0 + (x-x_0)(a_1 + (x-x_1)(a_2 + (x - x_2)(a_3))) = 1 + x (0 + (x-1)(0.5 + (x-2)(-1/12))) $
  also
  $
    P(3) = 1 + 3 (0 + (3-1)(0.5 + (3-2)(-1/12))) = 1 + 3 (0 + 2(6/12 + 1(-1/12))) \ = 1 + 3 (0 + 2(6/12 - 1/12))=1 + 3(0 + 10/12)= 1 + 30/12 = 3.5
  $

  Zu c)

  Wir füllen folgende Tabelle nach folgendem Schema aus: Wir nehmen den Eintrag links unterhalb und ziehen den Eintrag links unterhalb ab. Dann verfolgen wir die Pyramide mit Spitze dem Wert den wir berechnen wollen bis zur Basis und teilen durch den $x$-Wert unten minus $x$-Wert oben.

  #align(center)[#table(
    stroke: none,
    columns: 5,
    align(horizon)[
      $x_0=0$ \ $x_1=1$ \ $x_2 = 2$ \ $x_3=4$
    ],
    align(horizon)[
      $y_0=1$ \ $y_1=1$ \ $y_2 = 2$ \ $y_3=5$
    ],
    align(horizon)[
      $(1-1)/(1-0)=0$ \ $(2-1)/(2-1)=1$ \ $(5-2)/(4-2)=1.5$
    ],
    align(horizon)[
      $(1-0)/(2-0)=1 slash 2$ \ $(1.5-1)/(4-1)=1 slash 6$
    ],
    align(horizon)[
      $(1 slash 6-1 slash 2)/(4-0)=-1/12$
    ],
  )]
]


#auf("Polynominterpolation")[
  Schreiben Sie folgende MATLAB Programme
  #set enum(numbering: "a)")

  + Das dividierte Differenzenverfahren zur Bestimmung der Polynomkoeffizienten in Newton-Darstellung.
  + Das Horner-Schema zur Auswertung des Interpolationspolynoms in Newton-Darstellung an einer beliebigen Stelle $overline(x)$.
  + Uberprüfen Sie die Korrektheit ihrer beiden Programme anhand der Lösung von Aufgabe 2.
  + Plotten Sie die Stützpunkte von Aufgabe 2 und die beiden sich ergebenden Interpolationspolynome in einen gemeinsamen Graphen.
]
