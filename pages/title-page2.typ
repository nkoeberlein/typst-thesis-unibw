// =============================================================
// title-page2.typ – Alternative Titelseite (klassisches UniBw-Layout)
// Aktivieren: In main.typ '#include "pages/title-page.typ"' durch
//             '#include "pages/title-page2.typ"' ersetzen.
// Unterschied: Zeigt Fakultät, Institut und Professur im Header;
//              kein Seminar-Badge; schlichter, traditioneller Stil.
// =============================================================

#import "../metadata.typ": *
#import "../lib/colors.typ": *

#set page(
  header:    none,
  footer:    none,
  margin:    (left: 20mm, right: 20mm, top: 20mm, bottom: 20mm),
  numbering: none,
)

// === Universitäts-Header ===
#align(center)[
  #image("../resources/Signet_UniBw.pdf", width: 80%)

  #v(4mm)

  #text(size: 13pt, style: "normal")[
    #smallcaps[
      #myfaculty \
      #v(2mm)
      #myinstitute \
      #v(2mm)
      #myprofessur
    ]
  ]
]

#v(1fr)

// === Arbeitstitel ===
#align(center)[
  #text(size: 14pt)[#mytype]

  #v(4mm)

  #text(size: 14pt)[zum Thema]

  #v(6mm)

  #text(size: 22pt, weight: "bold", fill: headingcolor)[#mytitle]

  #v(8mm)

  #text(size: 14pt)[von]

  #v(4mm)

  #text(size: 14pt, weight: "bold")[#myname]

  #v(2mm)

  #text(size: 12pt)[
    #myinstitute \
    Matrikelnummer #matricle
  ]
]

#v(1fr)

// === Betreuungs-Informationen ===
// Felder mit "" in metadata.typ werden automatisch ausgeblendet.
#align(center)[
  #table(
    columns: (auto, auto),
    stroke:  none,
    inset:   (x: 8pt, y: 4pt),
    align:   (left, left),
    [Aufgabensteller:], [#reviewerone],
    ..(if reviewertwo != "" { ([Zweitgutachter:], [#reviewertwo]) } else { () }),
    ..(if advisor != "" { ([Betreuer:], [#advisor]) } else { () }),
    [], [],
    [Tag der Einreichung:], [
      #timeend.display("[day]. [month repr:long] [year]"),
      #myplace
    ],
  )
]

// Nummerierung wiederherstellen (wurde für die Titelseite deaktiviert)
#set page(numbering: "I")
#pagebreak()
