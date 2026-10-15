// =============================================================
// declaration.typ – Eigenständigkeitserklärung
// Wortlaut nach dem Muster der UniBw-Richtlinien (Stand Mai 2026),
// identisch mit der LaTeX-Vorlage. Den geforderten Wortlaut ggf.
// beim Prüfungsamt bzw. der betreuenden Professur prüfen.
// =============================================================

#import "../metadata.typ": myname, myplace, mytitle, timeend
#import "../lib/colors.typ": *
#import "../lib/dates.typ": german-date

// Seite ohne Kopfzeile
#set page(header: none)

// Zwei Felder mit Linie und Beschriftung: Ort, Datum (vorausgefüllt) | Unterschrift
#let signature-field(content, label) = {
  block(height: 1.2cm, width: 100%, below: 0.4em, align(bottom, content))
  line(length: 100%, stroke: 0.5pt + rgb(150, 150, 150))
  v(-0.5em)
  text(fill: rgb(150, 150, 150), style: "italic", size: 10pt)[#label]
}

#let signature-block = grid(
  columns: (1fr, 1fr),
  column-gutter: 1.5cm,
  signature-field([#myplace, #german-date(timeend)], [Ort, Datum]),
  signature-field([], [Unterschrift]),
)

#heading(level: 1, numbering: none)[Eigenständigkeitserklärung]
<eigenstaendigkeitserklaerung>

#grid(
  columns: (auto, 1fr),
  column-gutter: 1em,
  row-gutter: 0.6em,
  [Vor- und Nachname:], [#myname],
  [Titel der Arbeit:], emph[#mytitle],
)

#v(0.6em)

Hiermit versichere ich, dass ich die vorliegende Arbeit selbstständig verfasst, noch nicht anderweitig für Prüfungszwecke vorgelegt und keine anderen als die angegebenen Quellen und Hilfsmittel benutzt habe, insbesondere keine anderen als die angegebenen Informationen.

Alle übernommenen sowie mit Unterstützung von KI generierten Inhalte wurden entsprechend den anerkannten wissenschaftlichen Grundsätzen oder entsprechend der Regelungen zur Kennzeichnung von KI-Inhalten kenntlich gemacht. Ausgenommen von der Kenntlichmachung sind orthografische oder grammatikalische Korrekturen, Übersetzungen sowie nicht-sinnverändernde Verbesserungen von Formulierungen.

Ich bin mir bewusst, dass mit KI generierte Texte keine Garantie für die Qualität von Inhalten und Text bieten. Daher erkläre ich, dass ich KI-Werkzeuge lediglich als Hilfsmittel genutzt habe, die von KI generierten Inhalte kritisch überprüft habe und mein eigenständiger kognitiver sowie kreativer Einfluss in dieser Arbeit überwiegt. Ich versichere, dass ich die Inhalte meiner Arbeit vollständig verstanden habe und selbstständig vertreten kann.

Ich versichere, dass ich ausschließlich KI-Werkzeuge verwendet habe, deren Nutzung vom Prüfer oder der Prüferin als Hilfsmittel zugelassen wurden.

#v(0.8cm)
#signature-block
#v(1.2cm)

Der Speicherung meiner Arbeit zum Zweck der Plagiatsprüfung stimme ich zu. Ich versichere, dass die elektronische Version mit der gedruckten Version inhaltlich übereinstimmt.

#v(0.8cm)
#signature-block
