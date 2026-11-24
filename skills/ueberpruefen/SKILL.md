---
name: ueberpruefen
description: >-
  Überprüft und korrigiert deutsche Texte auf Rechtschreibung, Grammatik und Zeichensetzung.
  Verwende diesen Skill, wenn der Nutzer "Ueberprüfen", "Überprüfen" oder eine Korrektur eines deutschen Textes verlangt.
argument-hint: "[Text oder Dateipfad]"
---

# Skill `ueberpruefen` (Rechtschreibung, Grammatik & Zeichensetzung)

Prüft **deutsche** Texte nach aktueller Duden-Empfehlung. Argumente: $ARGUMENTS

1. **Prüfgegenstand:** Text aus den Argumenten bzw. dem Chat; bei einem Dateipfad die Datei lesen; sonst kurz fragen oder den letzten Textbeitrag des Nutzers prüfen.
2. **Schwerpunkte:**
   - Rechtschreibung: Tippfehler, Groß-/Kleinschreibung, Getrennt-/Zusammenschreibung, `das`/`dass`, `ss`/`ß`.
   - Grammatik: Kasus, Kongruenz, Zeitformen, Satzbau, Wortstellung.
   - Zeichensetzung: Kommas bei Nebensätzen, Infinitivgruppen, Aufzählungen, Schluss- und Anführungszeichen.
   - Code und Markdown bewahren: Befehle, Variablen und Syntax unverändert, nur Fließtext und Kommentare korrigieren.
3. **Ausgabe:**
   - **Korrigierte Version** (direkt kopierbar; Datei nur auf Wunsch ändern).
   - **Wichtigste Korrekturen:** `Vorher` → `Nachher` mit kurzer Begründung.
   - **Fazit:** Ist der Text fehlerfrei, kurz bestätigen.

Im Lernpfad-Typ `sprache` bei Lernenden zusätzlich die Regel beachten: Hinweise geben, damit der Schüler selbst verbessern kann, statt nur fertig zu korrigieren, außer er verlangt die Korrektur ausdrücklich.
