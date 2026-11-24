---
name: lernpfad-aufbauen
description: >-
  Baut einen eigenen Lernpfad zum Kurs aus: schreibt ROADMAP.md und FORTSCHRITT.md und legt leere
  Lektionsordner unter kurs/ an. Auch zum späteren Erweitern (neue Kapitel/Stufen).
  Verwende diesen Skill, wenn der Nutzer einen Lernpfad aufbauen, planen, erweitern oder einen Kurs daraus machen will.
argument-hint: "[Lernpfad] [Wunsch, z. B. L2 ergänzen]"
disable-model-invocation: true
---

# Skill `lernpfad-aufbauen`: Roadmap, Kapitel und Lektionen erzeugen

Beachte `lernpath:lehrer` und dessen [Lernpfadmodell](../lehrer/references/lernpfadmodell.md). Argumente: $ARGUMENTS

## Ablauf
1. Aktiven Lernpfad ermitteln, `LERNPFAD.md` lesen (Thema, Typ, Ziel, Vorwissen).
2. **Umfang klären** (kurz fragen): Welche Stufen (nur L1 oder L1–L3)? Gewünschte Schwerpunkte? Bei Erweiterung: was kommt dazu?
3. **Plan vorschlagen** und bestätigen lassen, bevor Dateien entstehen: Stufen → Kapitel (3–8 Lektionen) → Lektionen mit je einem Konzept und Kurzbeschreibung; Projekt-Lektionen am Kapitelende, Meilensteine am Stufenende.
4. Nach Bestätigung schreiben:
   - `ROADMAP.md`: Lernpfad mit Stufen, Kapiteln, Lektionen und Zielen.
   - `FORTSCHRITT.md`: gleiche Struktur als Checkboxen; `**Aktuelle Lektion:**` auf die erste Lektion setzen. Bei Erweiterung bestehende Haken **nie** ändern.
   - `kurs/<Stufe>/<Kapitel>/<Lektion>/`: leere Ordner mit `.gitkeep`.
5. **Prüfen:** Jede Lektion in `FORTSCHRITT.md` hat einen Ordner (`find kurs -type d`) und umgekehrt. Namen nach Modell.
6. **Zusammenfassen:** Anzahl Stufen/Kapitel/Lektionen, nächster Schritt `/lernpath:aufgabe`.

## Regeln
- Lektionsordner bleiben leer, keine Lösungen oder Aufgabentexte vorab schreiben (die entstehen live bei `aufgabe`).
- Bestehende Lektionen, Ordner und Fortschritt nie überschreiben oder löschen.
- Inhalte passen zu Thema, Vorwissen und Ziel aus `LERNPFAD.md`, nichts aus fremden Kursen kopieren.
