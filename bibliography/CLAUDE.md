# bibliography/

Quellendaten und Zitierstil. Wird von `main.typ` eingebunden.

## Dateien

| Datei               | Zweck |
|---------------------|-------|
| `references.bib`    | Literaturquellen (BibTeX), zitiert mit `@key` |
| `ieee-grouped.csl`  | Zitierstil für `#bibliography(style: ...)` in `main.typ` |
| `image-sources.bib` | Bildquellen (BibTeX), zitiert mit `@key` im `source:`-Parameter von `#img(...)` |

## Muster

- Neue Literatur nur in `references.bib` eintragen; nicht zitierte Einträge erscheinen nicht (`full: false`)
- Mehrere Quellen direkt hintereinander zitieren (`@a @b`) ergibt eine gemeinsame Klammer `[1, 2]`
- Seitenangaben: `@key[S. 12f.]`

## Gotchas

- `main.typ` ruft `#bibliography()` zweimal auf (Literatur, Bildquellen) – das geht erst ab Typst 0.15.
  Typst ordnet jede Zitation dem Verzeichnis zu, in dessen Datei der Key steht; die Nummern laufen durch
- Steht ein Key in beiden `.bib`-Dateien, gewinnt ohne Fehlermeldung das Literaturverzeichnis – Keys eindeutig halten

- `ieee-grouped.csl` ist die offizielle IEEE-CSL (Zotero, CC BY-SA 3.0) mit genau einer Änderung:
  `prefix="["`/`suffix="]"` liegen im `<citation>`-Layout statt in der inneren `<group>`. Bei einem
  Update der CSL diese Änderung wieder einpflegen – der Kommentar am Dateianfang beschreibt sie
- Der eingebaute Typst-Stil `"ieee"` gruppiert nicht (`[1], [2]`); deshalb die lokale Kopie
- Der Pfad in `style:` ist relativ zu `main.typ`, nicht zu diesem Ordner
