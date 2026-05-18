# Typst-Vorlage für wissenschaftliche Arbeiten (Anfänger-freundlich)

[![License: CC BY 4.0](https://img.shields.io/badge/License-CC%20BY%204.0-lightgrey.svg)](https://creativecommons.org/licenses/by/4.0/)

Eine moderne, gut dokumentierte Typst-Vorlage für Bachelor-, Master- und Seminararbeiten – optimiert für Studierende, die zum ersten Mal mit Typst arbeiten.

> **Was ist Typst?** Typst ist ein alternatives Textsatzsystem zu LaTeX. Es ist schneller, die Syntax ist einfacher (wie Markdown) und Fehlermeldungen sind verständlicher.

---

## Voraussetzungen

- [Typst](https://typst.app/) >= 0.13 installiert (`typst --version`)
- Optional: [typstyle](https://github.com/Enter-tainer/typstyle) für automatische Formatierung

> **Installation von Typst (Linux/macOS):**
> ```bash
> curl -fsSL https://typst.community/install.sh | sh
> ```

---

## Schnellstart in 3 Schritten

### Schritt 1: Persönliche Daten eintragen

Öffne `metadata.typ` und trage deine Daten ein. Das ist die **einzige Datei**, die du zu Beginn anpassen musst.

```typst
#let myname = "Max Mustermann"
#let matricle = "12345678"
#let mytitle = "Meine tolle Abschlussarbeit"
#let myseminar = "Software Engineering"   // oder leer lassen: ""
#let mytype = "Bachelorarbeit"
```

| Variable       | Bedeutung                          | Beispiel |
|----------------|------------------------------------|----------|
| `myname`       | Dein vollständiger Name            | Anna Schmidt |
| `matricle`     | Deine Matrikelnummer               | 12345678 |
| `mytitle`      | Titel der Arbeit                   | KI in der Medizin |
| `myseminar`    | Seminar/Oberbegriff (optional)     | Machine Learning |
| `mytype`       | Art der Arbeit                     | Bachelorarbeit |
| `myuniversity` | Name der Uni                       | Universität der Bundeswehr München |
| `myfaculty`    | Fakultät                           | Fakultät für Informatik |
| `myinstitute`  | Institut/Lehrstuhl                 | Lehrstuhl für Software Engineering |
| `reviewerone`  | Erstgutachter/Betreuer             | Prof. Dr. Müller |
| `reviewertwo`  | Zweitgutachter (optional, `""` = ausblenden) | Prof. Dr. Schmidt |
| `advisor`      | Betreuer (optional, `""` = ausblenden) | Dr. Mustermann |
| `myplace`      | Ort der Abgabe                     | Neubiberg |

### Schritt 2: Einmalig kompilieren

```bash
# Mit Makefile (empfohlen)
make build

# Oder direkt mit Typst
# WICHTIG: --font-path fonts ist nötig, damit die Bookerly-Schriftart gefunden wird!
typst compile --font-path fonts main.typ

# PDF wird als main.pdf erstellt
```

### Schritt 3: Live-Vorschau (empfohlen!)

```bash
# Kompiliert automatisch neu, wenn du eine Datei speicherst
make watch
# oder
typst watch --font-path fonts main.typ

# Öffne main.pdf in einem PDF-Viewer mit Auto-Reload (z.B. Evince, Okular, Zathura)
```

---

## Projektstruktur

```
main.typ                 # Hauptdokument – HIER werden Kapitel eingebunden
metadata.typ             # DEINE Daten (Name, Titel, Betreuer...)
lib/
  template.typ           # Seitenlayout, Kopf/Fußzeilen (normalerweise NICHT ändern)
  styles.typ             # Farben, Boxen, Theoreme (normalerweise NICHT ändern)
  colors.typ             # Farbpalette
chapters/                # HIER schreibst du deine Kapitel!
  einleitung.typ
  grundlagen.typ
  hauptteil.typ
  schluss.typ
  anhang/
    glossary.typ         # Glossar-Anzeige
    glossary-entries.typ # DEINE Abkürzungen & Begriffe
    code-examples.typ    # Code-Beispiele im Anhang
pages/                   # Frontmatter-Seiten
  title-page.typ         # Titelseite (nutzt metadata.typ)
  abstract.typ           # Zusammenfassung (Deutsch + Englisch)
  declaration.typ        # Eidesstattliche Erklärung
  task-description.typ   # Aufgabenstellung (optional)
  acknowledgments.typ    # Danksagung (optional)
bibliography/
  references.bib         # DEINE Literaturquellen (BibTeX-Format)
  image-sources.bib      # DEINE Bildquellen (BibTeX-Format) ← hier pflegen
  image-sources.typ      # Parser (liest .bib automatisch – NICHT bearbeiten)
fonts/                   # Bookerly-Schriftart (optional)
media/                   # DEINE Bilder und Grafiken
resources/               # Uni-Logo etc.
```

**Wichtige Regel:** Du schreibst Inhalte in `chapters/`, `metadata.typ` und `bibliography/`. Alles andere ist Vorlagen-Code.

---

## Typst-Grundlagen (Crash-Kurs)

### 1. Überschriften

```typst
= Kapitel (Level 1)        // Automatisch nummeriert: 1, 2, 3...
== Abschnitt (Level 2)     // 1.1, 1.2, ...
=== Unterabschnitt (Level 3) // 1.1.1, 1.1.2, ...
==== Überschrift ohne Nummerierung
```

### 2. Textformatierung

```typst
*fett*         // Fettschrift (Sternchen direkt am Wort, kein Leerzeichen!)
_kursiv_       // Kursivschrift
`Code im Fließtext`
"Gänsefüßchen" // Typst macht automatisch schöne Anführungszeichen
```

### 3. Listen

```typst
// Ungeordnete Liste
- Erster Punkt
- Zweiter Punkt
  - Unterpunkt

// Geordnete Liste
+ Erster Schritt
+ Zweiter Schritt
```

### 4. Querverweise und Zitate

```typst
// Auf ein Kapitel verweisen (Label muss existieren!)
Siehe Kapitel @chap-einleitung.

// Literatur zitieren (aus bibliography/references.bib)
Laut @smith2023 ist dies wichtig.

// Bild referenzieren
@fig-meinbild zeigt das Ergebnis.

// Label setzen (anklickbar)
= Mein Kapitel <chap-mein-kapitel>
```

**Wichtig:** Ein Label setzt du mit `<name>` direkt nach einem Element. Du verweist mit `@name` darauf.

### 5. Bilder einfügen

Bilder legst du in den Ordner `media/` ab. Der Pfad wird automatisch ergänzt – nur den Dateinamen angeben.

```typst
// Bild mit Unterschrift und Quellenangabe – empfohlen (aus lib/styles.typ)
#img(
  "MeinBild.png",
  caption: [Beschreibung des Bildes],
  width: 80%,
  source: [#imgcite("quellenkey")],   // Bildquelle angeben (optional)
) <fig-meinbild>
```

Im Text referenzieren: `@fig-meinbild` → wird zu „Abb. 1.1".

`#imgcite("quellenkey")` erzeugt einen anklickbaren Link `[I]`, `[II]`, … der direkt zum Eintrag im **Bildquellenverzeichnis** führt. Den Key definierst du in `bibliography/image-sources.bib` (→ Abschnitt [Bildquellenverzeichnis](#bildquellenverzeichnis-verwalten)).

### 6. Tabellen

```typst
// Tabelle mit Unterschrift – empfohlen (aus lib/styles.typ)
#tbl(
  table(
    columns: (1fr, 2fr, 2fr),  // 3 Spalten mit unterschiedlicher Breite
    [Merkmal], [Spalte A], [Spalte B],
    [Name], [Wert 1], [Wert 2],
    [Typ], [A], [B],
  ),
  caption: [Meine Tabelle],
) <tab-meine-tabelle>
```

### 7. Mathematische Formeln

```typst
// Inline: $...$
Die Formel $E = m c^2$ ist bekannt.

// Abgesetzt (display mode): $ ... $
$
  sum_(i=1)^n x_i = x_1 + x_2 + dots + x_n
$

// Mit Nummerierung
#figure(
  $ E = m c^2 $,
  caption: [Energie-Masse-Äquivalenz],
) <eq-emc2>
```

### 8. Code-Blöcke mit Syntax-Highlighting

Typst unterstützt über 100 Sprachen nativ!

```typst
#figure(
  ```python
  def hello_world():
      print("Hello, Typst!")
  ```,
  caption: [Python-Beispiel],
  kind: raw,
  supplement: [Code],
) <lst-hello>
```

---

## Glossar und Abkürzungen

1. **Eintrag definieren** in `chapters/anhang/glossary-entries.typ`:

```typst
(
  key: "ki",
  short: "KI",
  long: "Künstliche Intelligenz",
  description: [Teilgebiet der Informatik, das sich mit intelligenter Automatisierung befasst.],
  group: "Informatik",
),
```

2. **Im Text verwenden** (nachdem `#register-glossary(glossary-entries)` in `main.typ` geladen ist):

```typst
Die @ki revolutioniert viele Bereiche.   // Erste Nennung: "Künstliche Intelligenz (KI)"
Später: @ki                              // Weitere Nennung: "KI"
```

---

## Literaturverzeichnis verwalten

Die Datei `bibliography/references.bib` enthält deine Quellen im BibTeX-Format:

```bibtex
@article{smith2023,
  author = {John Smith},
  title = {The Future of Research},
  journal = {Journal of Science},
  year = {2023},
  volume = {12},
  number = {4},
  pages = {45--67}
}

@book{doe2024,
  author = {Jane Doe},
  title = {Methodology Basics},
  publisher = {Academic Press},
  year = {2024}
}
```

Zitieren im Text: `Laut @smith2023 ist...` oder `[@doe2024, S. 42]`.

> **Tipp:** Du kannst Zotero, Mendeley oder Citavi zum Verwalten deiner Quellen nutzen und als `.bib` exportieren.

---

## Bildquellenverzeichnis verwalten

Die Vorlage nutzt **zwei getrennte Quellenverzeichnisse**:

| System | Datei | Nummerierung | Verwendung |
|--------|-------|--------------|------------|
| Literatur | `bibliography/references.bib` | Arabisch [1], [2], … | `@key` im Text |
| Bildquellen | `bibliography/image-sources.bib` | Römisch [I], [II], … | `#imgcite("key")` im `source:`-Parameter |

### Eintrag in `image-sources.bib` anlegen

```bibtex
@online{mein-screenshot,
  author = {Max Mustermann},
  title  = {Screenshot des Dashboards},
  url    = {https://example.com/bild.png},
  year   = {2024},
  note   = {Abgerufen am 12. Mai 2024},
}
```

Unterstützte Felder: `author`, `title`, `url`, `year`, `note`. BibTeX-Typen `@online`, `@misc` und `@article` werden alle erkannt.

### Bildquelle im Kapitel zitieren

```typst
// Am Anfang der Kapitel-Datei importieren:
#import "../lib/styles.typ": img, imgcite

// Beim Bild angeben:
#img(
  "dashboard.png",
  caption: [Übersicht des Dashboards],
  source: [#imgcite("mein-screenshot")],
) <fig-dashboard>
```

Das ergibt in der Bildunterschrift: _Quelle: [I]_ – anklickbar und verlinkt zum Eintrag im Bildquellenverzeichnis.

> **Hinweis:** Im generierten PDF führen die Links `[I]`, `[II]` stets zum Bildquellenverzeichnis am Ende des Dokuments – nicht direkt zu einer externen URL.

---

## Häufige Fehler und Lösungen

| Fehler | Lösung |
|--------|--------|
| `unknown variable: myseminar` | In `metadata.typ` den Wert für `myseminar` setzen (auch wenn leer: `""`) |
| `file not found: media/...` | Bild existiert nicht in `media/`-Ordner oder falscher Dateiname |
| `@key` wird nicht erkannt | In `references.bib` prüfen ob der Key existiert |
| Schriftart sieht komisch aus | `--font-path fonts` beim Kompilieren nicht vergessen! |
| `label <...> does not exist` | Prüfen ob das Label mit `<name>` gesetzt wurde |
| `unknown variable: imgcite` | Import fehlt: `#import "../lib/styles.typ": imgcite` am Anfang der Kapitel-Datei |
| `[?]` statt `[I]` im Text | Key in `image-sources.bib` nicht vorhanden oder falsch geschrieben |

---

## Neue Kapitel hinzufügen

1. Datei anlegen: `chapters/meinkapitel.typ`
2. In `main.typ` einbinden (Reihenfolge beachten!):

```typst
#include "chapters/einleitung.typ"
#pagebreak()

#include "chapters/grundlagen.typ"
#pagebreak()

#include "chapters/meinkapitel.typ"    // <-- HIER einfügen
#pagebreak()

#include "chapters/hauptteil.typ"
```

---

## Druck- vs. Online-Modus

In `main.typ` kannst du umschalten:

```typst
#let is-print = false  // Keine leeren Seiten = besser für PDF/Leseansicht (Standard)
#let is-print = true   // Kapitel beginnen immer auf ungerader (rechter) Seite = Druck

#let is-draft = false  // Kein Wasserzeichen (Standard)
#let is-draft = true   // „ENTWURF"-Wasserzeichen auf jeder Seite einblenden
```

---

## Formatierung

```bash
make format   # Alle .typ-Dateien automatisch formatieren
make lint     # Prüft Formatierung (ohne zu schreiben)
```

---

## Empfohlenes Arbeitsumfeld

### IDE: VS Code + Tinymist-Plugin

Das **Tinymist**-Plugin ist der de-facto-Standard für Typst in VS Code. Es bietet:

- **Live-Vorschau** direkt im Editor (Strg+Shift+P → „Typst Preview")
- Syntaxhervorhebung und Fehleranzeige in Echtzeit
- Autovervollständigung für Typst-Funktionen und -Variablen
- Sprung zu Definitionen (z. B. von `#img` direkt zu `styles.typ`)

**Installation:**
1. VS Code öffnen → Erweiterungen (Strg+Shift+X)
2. Nach `Tinymist` suchen → installieren
3. Eine `.typ`-Datei öffnen → oben rechts auf das Vorschau-Symbol klicken

> **Tipp:** Tinymist kompiliert das Dokument im Hintergrund. `make watch` und die Vorschau
> können parallel laufen — Tinymist für schnelle Syntax-Checks, `make watch` für das finale PDF.

### KI-Unterstützung: Claude Code

[Claude Code](https://claude.ai/code) (Anthropic) eignet sich hervorragend zum Anpassen
dieser Vorlage an eigene Anforderungen — ohne Typst-Expertenwissen vorauszusetzen.

**Empfohlenes Modell:** Claude Sonnet 4.6 (Standard in Claude Code)

**Typische Aufgaben, bei denen KI direkt helfen kann:**

| Aufgabe | Beispiel-Prompt |
|---------|-----------------|
| Layout anpassen | „Vergrößere den linken Rand auf 35 mm für Bindung" |
| Neue Umgebung | „Füge eine `hypothese`-Box analog zu `#definition()` hinzu" |
| Titelseite ändern | „Entferne den Seminar-Badge, zeige nur Titel und Autor" |
| Fehler verstehen | Fehlermeldung einfach einfügen und erklären lassen |
| Vorlage portieren | „Passe die Vorlage an die Vorgaben der TU München an" |

**Schnellstart mit Claude Code:**

```bash
# Installation (einmalig)
npm install -g @anthropic-ai/claude-code

# Im Projektverzeichnis starten
cd wissenschaftlArbeit_UniBw_typst2
claude
```

> **Hinweis:** Die Vorlage enthält `CLAUDE.md`-Dateien in jedem Verzeichnis — diese geben
> Claude Code automatisch den nötigen Kontext über die Projektstruktur, sodass Anpassungen
> gezielter und ohne lange Erklärungen funktionieren.

---

## Weiterführende Links

- [Offizielle Typst-Dokumentation](https://typst.app/docs/)
- [Typst-Syntax-Cheatsheet](https://typst.app/docs/reference/syntax/)
- [Typst-Gleichungen](https://typst.app/docs/reference/math/)
- [Glossarium-Paket](https://typst.app/universe/package/glossarium/)

---

Viel Erfolg bei deiner Arbeit!

---

## Lizenz

Diese Vorlage steht unter der [Creative Commons Attribution 4.0 International (CC BY 4.0)](https://creativecommons.org/licenses/by/4.0/) Lizenz.

**Das bedeutet:** Du darfst die Vorlage frei nutzen, anpassen und weitergeben – auch für kommerzielle Zwecke – solange du den Urheber nennst:

> Vorlage von Nikolaus Köberlein (@nkoeberlein) – [CC BY 4.0](https://creativecommons.org/licenses/by/4.0/)

**Empfohlene Nennung in einer Abschlussarbeit** (z. B. in der Danksagung oder einer Fußnote):

> Diese Arbeit wurde mit der Typst-Vorlage von Nikolaus Köberlein erstellt
> (https://github.com/nkoeberlein), lizenziert unter CC BY 4.0.
