// =============================================================
// acknowledgments.typ – Vorwort und Danksagung (optional)
// In main.typ aktivieren: '// #include "pages/acknowledgments.typ"'
// einkommentieren.
// =============================================================

#import "../metadata.typ": myname, myplace, timeend

// ── Vorwort ──────────────────────────────────────────────────
// Das Vorwort ist optional. Es beschreibt den persönlichen Zugang
// zum Thema, die Entstehungsgeschichte der Arbeit oder gibt dem
// Leser einen ersten Orientierungsrahmen.
// Länge: typisch 0,5–1 Seite. Kann auch weggelassen werden.

#heading(level: 1, numbering: none)[Vorwort]
<vorwort>

_[Beschreibe hier kurz, wie du zum Thema gekommen bist, was dich daran interessiert
und welchen persönlichen oder fachlichen Hintergrund du mitbringst. Das Vorwort ist
kein Teil der wissenschaftlichen Argumentation – es darf persönlicher und informeller
sein als der Rest der Arbeit.]_

// ── Danksagung ───────────────────────────────────────────────
// Bedanke dich bei allen, die zur Entstehung der Arbeit beigetragen
// haben: Betreuer, Kollegen, Interviewpartner, Familie.
// Reihenfolge: fachliche Unterstützung → persönliche Unterstützung.
// Länge: typisch 0,25–0,5 Seite.

#heading(level: 1, numbering: none)[Danksagung]
<danksagung>

_[Bedanke dich zuerst bei deinem Betreuer/deiner Betreuerin für die fachliche
Begleitung und Unterstützung während der Arbeit.]_

_[Falls Kommilitonen, Interviewpartner oder Kolleg:innen geholfen haben, erwähne
sie hier ebenfalls.]_

_[Abschließend kannst du dich bei deiner Familie oder engen Freunden bedanken,
die dich während der Entstehungszeit unterstützt haben.]_

#v(1cm)

#myplace, im #timeend.display("[month repr:long] [year]")

#v(1.5cm)

#text(fill: rgb(150, 150, 150), style: "italic")[#myname]

#pagebreak()
