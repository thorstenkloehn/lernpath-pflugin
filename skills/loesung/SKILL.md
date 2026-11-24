---
name: loesung
description: >-
  Prüft die Lösung des Schülers im aktuellen Lektionsordner, gibt Feedback und hakt die Lektion bei Erfolg in
  FORTSCHRITT.md ab. Verwende diesen Skill, wenn der Nutzer "Loesung", "Lösung" sagt und seine Aufgabe prüfen lassen will.
argument-hint: "[Lernpfad]"
---

# Skill `loesung` (Lösung prüfen)

Beachte `lernpath:lehrer`. Kriterien: [bewertungs_kriterien.md](../lehrer/references/bewertungs_kriterien.md). Argumente: $ARGUMENTS

1. Aktiven Lernpfad, aktuelle Lektion und Typ ermitteln; Aufgabendatei(en) im Lektionsordner lesen. Fehlt sie, nur den erwarteten Pfad nennen.
2. **Prüfen:**
   - `programmieren`: mit dem Ausführbefehl aus `LERNPFAD.md` ausführen; ab L2 Linter/Tests der Sprache, falls installiert.
   - `sprache` / `sonstiges`: Text bzw. Antworten inhaltlich prüfen.
   - Projekt-Lektion: zusätzlich die Projekt-Checkliste.
3. **Strukturiertes Feedback:**
   1. Was gut gelungen ist.
   2. Fehler und Verbesserungen als gezielte Hinweise, ohne die fertige Lösung zu verraten.
   3. Sind alle Kriterien erfüllt: gratulieren, optional ein kurzer Profi-Tipp, die Lektion in `FORTSCHRITT.md` mit `[x]` abhaken und `**Aktuelle Lektion:**` auf die nächste Lektion setzen (am Ende des Lernpfads: Abschluss feiern).

Keine Lösungsdateien schreiben. `FORTSCHRITT.md` nur bei wirklich bestandener Lektion ändern.
