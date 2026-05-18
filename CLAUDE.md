# wissenschaftlicheArbeit_UniR_typst

Typst-Vorlage für wissenschaftliche Arbeiten (Bachelor/Master/Seminar) an der Universität Regensburg.

## Einstiegspunkte

- `main.typ` — Hauptdokument: Paket-Imports, Kapitelreihenfolge, Frontmatter/Backmatter-Struktur
- `metadata.typ` — Alle persönlichen Angaben (Name, Titel, Betreuer); hier beginnt die Anpassung

## Wichtige Dateien

| Datei              | Zweck |
|--------------------|-------|
| `lib/template.typ` | Seiten-Layout, Kopf/Fußzeilen, Heading-Styles, Figure-Formatierung (402 Zeilen – Kernlogik) |
| `lib/styles.typ`   | Theorem-/Callout-Umgebungen, `img`/`tbl`-Wrapper, Hilfsfunktionen |
| `lib/colors.typ`   | Farbpalette: `primary`, `secondary`, `accent`, `headingcolor` |
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
- Abbildungen zitieren: `@img:key` (Alexandria-Paket), Literatur: `@key` (BibTeX)
- `is-print = true` in `main.typ` aktiviert Doppelseiten-Layout (Kapitel auf ungerade Seiten); Standard: `false`
- `is-draft = true` in `main.typ` aktiviert ENTWURF-Wasserzeichen; Standard: `false`
- Optionale Titelseiten-Felder (`reviewertwo`, `advisor`) auf `""` setzen → werden automatisch ausgeblendet
- Validierung in `metadata.typ`: assert-Zeilen einkommentieren um Platzhalter-Prüfung zu aktivieren

## Gotchas

- `glossarium` muss NACH `#show: template.with(...)` aktiviert werden (Konflikte mit figure show-rules)
- `--font-path fonts` beim Kompilieren ist Pflicht für Bookerly; ohne Flag fällt Typst auf Libertinus zurück
- `lib/template.typ` ist 402 Zeilen (über 300-Limit) – Refactoring-Kandidat; Aufteilung in layout/headings/figures möglich
- Anhang-Nummerierung (`A.1`) wird über `state("is_appendix")` gesteuert – vor dem Anhang auf `true` setzen
