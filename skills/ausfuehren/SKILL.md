---
name: ausfuehren
description: >-
  Führt die Aufgabendatei der aktuellen Lektion aus und zeigt Ausgabe und Exit-Code, ohne zu bewerten.
  Verwende diesen Skill, wenn der Nutzer "ausführen", "run" oder "Skript starten" sagt.
argument-hint: "[Programmargumente]"
disable-model-invocation: true
---

# Skill `ausfuehren` (ausführen, nicht bewerten)

Beachte `lernpath:lehrer`. Argumente für das Programm: $ARGUMENTS

1. Aktiven Lernpfad und aktuelle Lektion ermitteln; `Ausführbefehl` und `Dateiendung` aus `LERNPFAD.md` lesen. Ist der Typ nicht `programmieren` oder kein Befehl gesetzt, sage das kurz.
2. Ausführen: `cd <Lektionsordner> && <Ausführbefehl> aufgabe<Endung> <Argumente>`.
3. Ausgabe und Exit-Code zeigen. Fehlt die Datei, nur den erwarteten Pfad nennen.

Nicht bewerten, nichts ändern, keine Lösung verraten. Für die Abgabe: `/lernpath:loesung`.
