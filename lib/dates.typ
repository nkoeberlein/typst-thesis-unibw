// =============================================================
// dates.typ – Deutsche Datumsausgabe
// Typsts `datetime.display("[month repr:long]")` liefert englische
// Monatsnamen ("October"); diese Helfer geben sie deutsch aus.
// =============================================================

#let german-months = (
  "Januar", "Februar", "März", "April", "Mai", "Juni",
  "Juli", "August", "September", "Oktober", "November", "Dezember",
)

/// Monat und Jahr, z. B. "Oktober 2026".
/// Manuell als String gesetzte Daten werden unverändert durchgereicht.
#let german-month-year(date) = if type(date) == datetime {
  [#german-months.at(date.month() - 1) #date.year()]
} else {
  [#date]
}

/// Volles Datum, z. B. "3. Oktober 2026".
/// Manuell als String gesetzte Daten werden unverändert durchgereicht.
#let german-date(date) = if type(date) == datetime {
  [#date.day(). #german-month-year(date)]
} else {
  [#date]
}
