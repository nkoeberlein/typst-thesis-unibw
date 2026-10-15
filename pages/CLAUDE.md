# pages/

Frontmatter-Seiten (vor dem Inhaltsverzeichnis). Alle nutzen `metadata.typ` für persönliche Angaben.

## Dateien

| Datei                  | Inhalt | Pflicht? |
|------------------------|--------|----------|
| `title-page.typ`       | Titelseite: Signet, Fakultät/Institut/Professur/Aufgabensteller im Kopf, Titel, Autor, Betreuer, Datum | Ja |
| `title-page_alternative.typ` | Schlichtere Variante der Titelseite; statt `title-page.typ` in `main.typ` einbinden | Alternativ |
| `abstract.typ`         | Zusammenfassung (Deutsch & Englisch) | Empfohlen |
| `declaration.typ`      | Eigenständigkeitserklärung nach UniBw-Muster (Mai 2026), wortgleich mit LaTeX `default_frame/Eigenstaendigkeitserklaerung.tex` – Änderungen in beiden Vorlagen nachziehen | Ja (für Abgabe) |
| `acknowledgments.typ`  | Danksagung | Optional |
| `task-description.typ` | Aufgabenstellung: Überschrift + ein Platzhalter-Absatz (hochschulspezifisch) | Optional |

## Konventionen

- Alle Seiten importieren via `#import "../metadata.typ": *` die Metadaten-Variablen
- Seiten werden in `main.typ` via `#include "pages/datei.typ"` eingebunden
- Optionale Seiten in `main.typ` auskommentieren (`// #include "pages/acknowledgments.typ"`)
- Frontmatter verwendet römische Seitennummerierung (I, II, III, ...) — gesetzt in `main.typ`
- Keine eigenen `set page()`-Regeln in diesen Dateien außer für spezielle Seitenränder (Titelseite)
