#import "/lib.typ": *

#set enum(numbering: "i)")

#show: compact-script-show

#section("Computerzahlen")

#subsection("Rundung")

#def("Nachbar")[
    Jeder reellen Zahl $x in RR$ kann in $MM$ ein linker und rechter Nachbar zugeordnet werden
    $ m_l (x) = max{m in MM: m <= x} " und " m_r (x) = min {m in MM : m >= x}. $
]

#def("Rundungsarten")[
    Wir definieren die folgenden Abbildungen $RR -> MM$:
    $ "Abrunden":& "rd"_-: x mapsto m_l(x)\
      "Aufrunden":& "rd"_+: x mapsto m_r (x)\
      "Abhacken":& "rd"_0: x mapsto cases(m_l (x) " falls " x>= 0, m_r (x) " falls " x<0 ) \
      "korrektes Runden":& "rd"_*: x mapsto cases(m_l (x) "falls " x<= 1/2 (m_l(x)+m_r(x)), m_r (x) "sonst"). $
]

#prop("Eigenschaften vom Runden")[
    Alle Rundungsarten haben die folgenden Eigenschaften
    - Idempotenz: $x in MM => "rd"(x)=x$.
    - Monotonie: $x <= y => "rd"(x)<="rd"(y)$.
    - Projektion: $"rd"("rd"(x))="rd"(x)$.
]


#subsection("Ganze Zahlen")

#def("Natürliche Zahlen")[
    Eine natürliche Zahl $z in NN_0$ wird unter Verwendung von $N$ Bits wie folgt als Dualzahl dargestellt
    $ d_(N-1) space d_(N-2) space dots space d_1 space d_0 eq.est sum_(i = 0)^(N-1) d_i dot 2^i " mit " d_i in {0,1}.  $
]
