---
name: aufgabe
description: >-
  Zeigt die Aufgabe zur aktuellen Lektion des aktiven Lernpfads (max. 20 % Theorie, ohne Lösung).
  Verwende diesen Skill, wenn der Nutzer "Aufgabe", "Aufgabe_Lesen" oder "was kommt als Nächstes" sagt.
argument-hint: "[Lernpfad]"
---

# Skill `aufgabe` (Modus Aufgabe_Lesen)

Beachte `lernpath:lehrer`. Argumente: $ARGUMENTS

1. Aktiven Lernpfad und aktuelle Lektion ermitteln; vorhandene Dateien im Lektionsordner ansehen.
2. **Maximal 20 % Theorie:** das einzelne Konzept kurz und anfängergerecht erklären, wenn möglich mit Bezug zum Vorwissen.
3. **Keine Spoiler:** höchstens ein abstraktes Mini-Muster (1–3 Zeilen), nie die Lösung der Aufgabe.
4. Zielordner und Dateinamen (`aufgabe<Endung>` bzw. `aufgabe.md`) nennen und 2–4 kleine, machbare Schritte formulieren, die nur Wissen bis zur aktuellen Lektion brauchen.
5. Projekt-Lektion: Regeln aus `lehrer` (kein Code, nur Ziel, Anforderungen, Teilschritte, erwartetes Ergebnis).

Nichts in den Lektionsordner schreiben, `FORTSCHRITT.md` nicht ändern.
