# lib/

Kernbibliothek der Vorlage. Wird ausschließlich von `main.typ` und den Kapiteln importiert.

## Dateien

| Datei          | Zweck |
|----------------|-------|
| `template.typ` | Haupt-Template-Funktion `template(meta, is-print, body)`. Enthält: Seiten-Setup, Kopf/Fußzeilen, alle `show`/`set`-Regeln für Headings, Figures, Tabellen, Code-Blöcke, Listen, Links, Outline-Einträge. |
| `styles.typ`   | Wiederverwendbare Environments: Theorem-Boxen (`definition`, `satz`, `lemma`, `beispiel`), Callouts (`important`, `note`, `tip`), `img`/`tbl`-Wrapper, Fußnoten-Helfer, Text-Hervorhebung, `abbr-table`. |
| `colors.typ`   | Einzige Farbdefinitions-Datei. Exportiert: `primary`, `secondary`, `accent`, `headingcolor`, `codebackground`, `codeborder` und weitere. Immer via `#import "colors.typ": *` laden. |

## Muster

- `colors.typ` wird von allen anderen lib-Dateien via `#import "colors.typ": *` importiert
- `template.typ` exportiert: `template`, `toc`, `lof`, `lot`, `loc`, `appendix-start`, `this-page-empty`
- `styles.typ` exportiert: `img`, `tbl`, `definition`, `satz`, `lemma`, `beispiel`, `important`, `note`, `tip`, `code-listing`, `abbr-entry`, `abbr-table`

## Gotchas

- `template.typ` überschreitet mit 402 Zeilen das 300-Zeilen-Limit – Refactoring-Kandidat
- Farbänderungen immer in `colors.typ`, nie direkt in `template.typ` oder `styles.typ` hardcoden
- `def-counter` in `styles.typ` ist dokumentweit geteilt – alle Theorem-Umgebungen teilen sich denselben Zähler
