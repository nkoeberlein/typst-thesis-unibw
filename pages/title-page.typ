// =============================================================
// title-page.typ – Titelseite
// =============================================================

#import "../metadata.typ": *
#import "../lib/colors.typ": *
#import "../lib/dates.typ": german-date

#set page(
  header: none,
  footer: none,
  margin: (left: 25mm, right: 25mm, top: 22mm, bottom: 22mm),
  numbering: none,
)

// === Universitäts-Header ===
#align(center)[
  #image("../resources/Signet_UniBw.pdf", width: 80%)

  #v(4mm)

  #text(size: 13pt, style: "normal", fill: secondary)[
    #smallcaps[
      #myfaculty \
      #v(2mm)
      #myinstitute \
      #v(2mm)
      #myprofessur
      #v(2mm)
      #reviewerone
    ]
  ]
]

#v(1fr)

// ── Titelblock ─────────────────────────────────────────────────
#align(center)[
  #text(size: 11pt, fill: secondary)[#mytype]
  #v(2mm)
  #text(size: 10pt, fill: secondary)[zum Thema]
  #v(9mm)
  #line(length: 65%, stroke: 0.4pt + lightgray)
  #v(9mm)
  #text(size: 22pt, weight: "bold")[#mytitle]
  #v(9mm)
  #line(length: 65%, stroke: 0.4pt + lightgray)
  #v(11mm)
  #text(size: 10pt, fill: secondary)[vorgelegt von]
  #v(3mm)
  #text(size: 15pt, weight: "bold")[#myname]
  #v(2mm)
  #text(size: 10.5pt, fill: secondary)[Matrikelnummer: #matricle]
]

#v(1fr)

// ── Betreuungs-Informationen ───────────────────────────────────
// Felder mit "" in metadata.typ werden automatisch ausgeblendet.
#align(center)[
  #grid(
    columns: (120pt, auto),
    row-gutter: 6pt,
    column-gutter: 8pt,
    align: (right, left),
    text(fill: secondary)[Aufgabensteller:], strong[#reviewerone],
    ..(if reviewertwo != "" {
      (text(fill: secondary)[Zweitgutachter:], strong[#reviewertwo])
    } else { () }),
    ..(if advisor != "" {
      (text(fill: secondary)[Betreuer:], strong[#advisor])
    } else { () }),
    [], [],
    text(fill: secondary)[Eingereicht am:], strong[#german-date(timeend), #myplace],
  )
]

// Nummerierung wiederherstellen (wurde für die Titelseite deaktiviert)
#pagebreak()
#set page(numbering: "I")
