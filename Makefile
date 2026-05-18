# Makefile – wissenschaftlicheArbeit_UniR_typst
# Verwendung: make [target]

MAIN     := main.typ
OUTPUT   := main.pdf
FONTPATH := fonts

.PHONY: all build watch open clean format lint help

all: build

## build: Einmalig kompilieren
build:
	typst compile --font-path $(FONTPATH) $(MAIN)

## watch: Automatisch neu kompilieren bei Änderungen
watch:
	typst watch --font-path $(FONTPATH) $(MAIN)

## open: Kompilieren und PDF öffnen
open: build
	xdg-open $(OUTPUT)

## format: Alle .typ-Dateien automatisch formatieren (typstyle)
format:
	typstyle format-all

## lint: Formatierung prüfen ohne Dateien zu ändern
lint:
	typstyle format-all --check

## clean: Kompilierten Output löschen
clean:
	rm -f $(OUTPUT)

## help: Diese Hilfe anzeigen
help:
	@grep -E '^## ' Makefile | sed 's/## /  make /'
