# chapters/

Kapitelinhalte der Arbeit. Jede Datei entspricht einem Hauptkapitel.

## Dateien

| Datei                    | Inhalt |
|--------------------------|--------|
| `einleitung.typ`         | Einleitung: Motivation, Zielsetzung, Forschungsfrage |
| `grundlagen.typ`         | Theoretischer Hintergrund, Definitionen, Stand der Technik |
| `hauptteil.typ`          | Hauptbeitrag der Arbeit (Methode, Implementierung, Analyse) |
| `schluss.typ`            | Zusammenfassung, Limitationen, Ausblick |
| `anhang/`                | Anhang-Material (Glossar, Code-Beispiele) |

## anhang/

| Datei                        | Inhalt |
|------------------------------|--------|
| `glossary-entries.typ`       | Glossar-Einträge als `glossary-entries`-Array (Glossarium-Paket) |
| `glossary.typ`               | Rendert Abkürzungsverzeichnis und Glossar |
| `code-examples.typ`          | Ausführliche Code-Listings für den Anhang |

## Konventionen

- Jedes Kapitel beginnt mit `= Kapitelname` (Level-1-Heading mit Anker-Label `<chap-name>`)
- Imports aus lib immer relativ: `#import "../lib/styles.typ": img, tbl`
- Bilder: `#img("dateiname.jpg", caption: [...], source: [#imgcite("key")])` — Pfad relativ zu `media/`, Key aus `bibliography/image-sources.typ`
- Abkürzungen im Text: `#gls("KEY")` (Glossarium), Plural: `#glspl("KEY")`
- Querverweise auf Kapitel: `@chap-grundlagen`
- Neue Kapitel in `main.typ` via `#include "chapters/neues-kapitel.typ"` einbinden
