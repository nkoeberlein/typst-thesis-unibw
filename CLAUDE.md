# typst-thesis-unibw

Typst-Vorlage für wissenschaftliche Arbeiten (Bachelor/Master/Seminar) an der Universität der Bundeswehr München.
Schwesterprojekt: LaTeX-Version unter `../wissenschaftlArbeit_UniBw_latex` (GitHub `latex-thesis-unibw`).

## Einstiegspunkte

- `main.typ` — Hauptdokument: Paket-Imports, Kapitelreihenfolge, Frontmatter/Backmatter-Struktur
- `metadata.typ` — Alle persönlichen Angaben (Name, Titel, Betreuer); hier beginnt die Anpassung

## Wichtige Dateien

| Datei              | Zweck |
|--------------------|-------|
| `lib/template.typ` | Seiten-Layout, Kopf/Fußzeilen, Heading-Styles, Figure-Formatierung (443 Zeilen – Kernlogik) |
| `lib/styles.typ`   | Theorem-/Callout-Umgebungen, `img`/`tbl`-Wrapper, Hilfsfunktionen |
| `lib/colors.typ`   | Farbpalette: `primary`, `secondary`, `accent`, `headingcolor` |
| `lib/dates.typ`    | Deutsche Datumsausgabe: `german-date`, `german-month-year` |
| `metadata.typ`     | Metadaten-Dictionary `meta` das an `template.with(meta: meta)` übergeben wird |

## Build

```bash
make build          # typst compile --font-path fonts main.typ
make open           # build + PDF direkt öffnen
make watch          # Live-Reload
make format         # typstyle format-all
```

## Muster & Konventionen

- Neue Kapitel unter `chapters/`, einbinden via `#include` in `main.typ`
- Bilder immer über `#img(...)` aus `styles.typ` – setzt Pfad relativ zu `media/` und fügt Quellen-Fußnote an
- Tabellen über `#tbl(...)` statt nacktem `table(...)` für einheitliche Formatierung
- Theorem-Umgebungen: `#definition()`, `#satz()`, `#lemma()`, `#beispiel()` aus `styles.typ`
- Literatur zitieren: `@key` (BibTeX) – Quellen in `bibliography/references.bib`
- Bildquellen zitieren: `@key` in `source:` – Quellen in `bibliography/image-sources.bib`; eigenes
  `#bibliography()` in `main.typ` (mehrere Verzeichnisse erst ab Typst 0.15)
- Zitierstil ist die lokale Datei `bibliography/ieee-grouped.csl`, **nicht** der in
  Typst eingebaute `"ieee"`: Nur so stehen aufeinanderfolgende Quellen in einer
  gemeinsamen Klammer (`[2, 3]` statt `[2], [3]`). Aufsteigend sortiert, mit
  Seitenangaben als `[2, S. 12f., 3]` via `@key[S. 12f.]`
- Querverweise ohne vorangestelltes Wort schreiben: `@chap-x` ergibt „Kapitel 3" (im Anhang
  „Anhang A"), `@fig-x` „Abb. 3.1" – das Supplement setzt `lib/template.typ`
- `is-print = true` in `main.typ` aktiviert Doppelseiten-Layout (Kapitel auf ungerade Seiten); Standard: `false`
- `is-draft = true` in `main.typ` aktiviert ENTWURF-Wasserzeichen; Standard: `false`
- Optionale Titelseiten-Felder (`reviewertwo`, `advisor`) auf `""` setzen → werden automatisch ausgeblendet
- Validierung in `metadata.typ`: assert-Zeilen einkommentieren um Platzhalter-Prüfung zu aktivieren

## Gotchas

- `glossarium` muss NACH `#show: template.with(...)` aktiviert werden (Konflikte mit figure show-rules)
- Schrift ist Libertinus Serif (in Typst eingebaut); `fonts/` ist nur für optionale eigene Schriften.
  Keine proprietären Schriften (z. B. Bookerly) committen – das Repo ist öffentlich und CC BY 4.0
- `lib/template.typ` ist 443 Zeilen (über 300-Limit) – Refactoring-Kandidat; Aufteilung in layout/headings/figures möglich
- Anhang-Nummerierung (`A.1`) wird über `state("is_appendix")` gesteuert – vor dem Anhang auf `true` setzen
- Die `show ref`-Regel in `lib/template.typ` löst Abbildungs-/Tabellen-/Listing-Nummern am Zielort auf;
  ohne sie zeigt ein Verweis die Kapitelnummer der verweisenden Stelle
- `datetime.display("[month repr:long]")` liefert englische Monatsnamen – für ausgeschriebene Daten
  `german-date` aus `lib/dates.typ` nehmen
