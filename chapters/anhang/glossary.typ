// =============================================================
// glossary.typ – Abkürzungs- und Begriffsverzeichnis
// =============================================================

#import "@preview/glossarium:0.5.10": print-glossary
#import "glossary-entries.typ": glossary-entries

= Abkürzungs- und Begriffsverzeichnis
<app-glossar>

Dieser Anhang erläutert die in der Arbeit verwendeten Abkürzungen und Fachbegriffe.

#v(0.8em)

#print-glossary(
  glossary-entries,
  show-all: true, // Alle Einträge anzeigen, auch die im Text nicht referenzierten
  disable-back-references: true, // Ohne Rückverweise, da die Begriffe im Fließtext ausgeschrieben stehen
)
