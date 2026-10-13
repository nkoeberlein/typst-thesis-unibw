# lib/

Kernbibliothek der Vorlage. Wird ausschließlich von `main.typ` und den Kapiteln importiert.

## Dateien

| Datei          | Zweck |
|----------------|-------|
| `template.typ` | Haupt-Template-Funktion `template(meta, is-print, body)`. Enthält: Seiten-Setup, Kopf/Fußzeilen, alle `show`/`set`-Regeln für Headings, Figures, Tabellen, Code-Blöcke, Listen, Links, Outline-Einträge. |
| `styles.typ`   | Wiederverwendbare Environments: Theorem-Boxen (`definition`, `satz`, `lemma`, `beispiel`), Callouts (`important`, `note`, `tip`), `img`/`tbl`-Wrapper, Fußnoten-Helfer, Text-Hervorhebung, `abbr-table`. |
| `dates.typ`    | Deutsche Datumsausgabe: `german-date(date)` („3. Oktober 2026") und `german-month-year(date)` („Oktober 2026"). Strings werden unverändert durchgereicht. |
| `colors.typ`   | Einzige Farbdefinitions-Datei. Exportiert: `primary`, `secondary`, `accent`, `headingcolor`, `codebackground`, `codeborder` und weitere. Immer via `#import "colors.typ": *` laden. |

## Muster

- `colors.typ` wird von allen anderen lib-Dateien via `#import "colors.typ": *` importiert
- `template.typ` exportiert: `template`, `toc`, `lof`, `lot`, `loc`, `appendix-start`, `this-page-empty`
- `styles.typ` enthält kein Bildquellen-System mehr (`imgcite`/`print-img-sources` entfernt) – Bildquellen laufen über `@key` und ein zweites `#bibliography()`
- `styles.typ` exportiert: `img`, `tbl`, `definition`, `satz`, `lemma`, `beispiel`, `important`, `note`, `tip`, `code-listing`, `abbr-entry`, `abbr-table`

## Gotchas

- `template.typ` überschreitet mit 443 Zeilen das 300-Zeilen-Limit – Refactoring-Kandidat
- `show ref` in `template.typ` greift nur für Figures der Art `image`/`table`/`raw` und baut die Nummer über die Location des Ziels – Glossarium-Verweise und Literaturzitate bleiben unberührt
- `show raw: set par(...)` nur mit `.where(block: true)` – auf Inline-Code angewendet erzwingt die Regel einen Zeilenumbruch nach jedem Code-Schnipsel
- Farbänderungen immer in `colors.typ`, nie direkt in `template.typ` oder `styles.typ` hardcoden
- `def-counter` in `styles.typ` ist dokumentweit geteilt – alle Theorem-Umgebungen teilen sich denselben Zähler
