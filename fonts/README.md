# fonts/

Optionaler Ordner für **eigene** Schriften. Die Vorlage nutzt standardmäßig
*Libertinus Serif*, die in Typst bereits enthalten ist – hier muss nichts liegen.

Eigene Schrift verwenden:

1. `.ttf`/`.otf`-Dateien hier ablegen
2. Schriftnamen in `lib/template.typ` vorne in die `font:`-Liste eintragen
3. Mit `make build` bzw. `typst compile --font-path fonts main.typ` kompilieren

Bitte nur Schriften committen, deren Lizenz die Weitergabe erlaubt (z. B. SIL Open Font License).
Kommerzielle Schriften wie Bookerly dürfen nicht ins Repository.
