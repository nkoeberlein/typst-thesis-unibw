# pages/

Frontmatter-Seiten (vor dem Inhaltsverzeichnis). Alle nutzen `metadata.typ` für persönliche Angaben.

## Dateien

| Datei                  | Inhalt | Pflicht? |
|------------------------|--------|----------|
| `title-page.typ`       | Titelseite mit Uni-Logo, Titel, Autor, Betreuer, Datum | Ja |
| `abstract.typ`         | Zusammenfassung (Deutsch & Englisch) | Empfohlen |
| `declaration.typ`      | Eidesstattliche Erklärung | Ja (für Abgabe) |
| `acknowledgments.typ`  | Danksagung | Optional |
| `task-description.typ` | Aufgabenstellung (hochschulspezifisch) | Optional |

## Konventionen

- Alle Seiten importieren via `#import "../metadata.typ": *` die Metadaten-Variablen
- Seiten werden in `main.typ` via `#include "pages/datei.typ"` eingebunden
- Optionale Seiten in `main.typ` auskommentieren (`// #include "pages/acknowledgments.typ"`)
- Frontmatter verwendet römische Seitennummerierung (I, II, III, ...) — gesetzt in `main.typ`
- Keine eigenen `set page()`-Regeln in diesen Dateien außer für spezielle Seitenränder (Titelseite)
