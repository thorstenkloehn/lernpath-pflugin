---
name: lernpfad-aufbauen
description: >-
  Claude schreibt den Kurs (z. B. Rust, Go) für den Lernpfad: Aus Thema, Ziel und Vorwissen in LERNPFAD.md entwirft
  Claude Kapitel und Lektionen in ROADME.md (L1–L3, 1 Konzept pro Lektion) und legt daraus die Ordner unter kurs/
  und die Checkboxen in FORTSCHRITT.md an. Auch zum Erweitern. Verwende diesen Skill, wenn der Nutzer seinen
  Lernpfad aufbauen, den Kurs schreiben lassen, erweitern oder ROADME.md in Ordner und Fortschritt übernehmen will.
argument-hint: "[Lernpfad] [optional: Wünsche, z. B. Stufe, Schwerpunkt, Umfang]"
disable-model-invocation: true
---

# Skill `lernpfad-aufbauen`: Claude schreibt den Kurs

Beachte `lernpath:lehrer` und das [Lernpfadmodell](../lehrer/references/lernpfadmodell.md). Argumente: $ARGUMENTS

**Grundsatz:** Du (Claude) schreibst den neutralen Kurs in `ROADME.md`, der Schüler muss ihn nicht selbst verfassen. Grundlage sind Thema, Ziel, Vorwissen und Typ aus `LERNPFAD.md`. Schüler-Wünsche (Schwerpunkt, Umfang, Stufen) und von ihm bereits geschriebene Teile von `ROADME.md` haben Vorrang. Du schreibst nur den **Kurs** (Kapitel und Lektionen als Konzeptzeilen), keine Aufgaben und keine Lösungen.

## Ablauf
1. Aktiven Lernpfad ermitteln; `LERNPFAD.md`, `ROADME.md` und `FORTSCHRITT.md` lesen.
2. **Kurs schreiben oder erweitern** (`ROADME.md`):
   - **Platzhalter `<…>` der Vorlage ersetzen.** Bestehende echte Kapitel und Lektionen des Schülers bleiben unverändert und in ihrer Reihenfolge; baue darauf auf.
   - Gibt der Schüler Wünsche an (z. B. „nur L1", „mehr Ownership", „+ Kapitel Fehlerbehandlung"), setze genau das um. Ohne Wunsch schreibe alle drei Stufen passend zum Ziel: `## 🟢 L1 Grundlagen (…)`, `## 🟡 L2 Fortgeschritten (…)`, `## 🟠 L3 Profi (…)`, jeweils mit sinnvollem Untertitel.
   - Format je Kapitel:
     ```text
     ### Kapitel NN: <Name>
     - **Lektion NN:** <ein Konzept>
     ```
   - Qualität: **1 Konzept pro Lektion**, vom Einfachen zum Komplexen, jede Lektion setzt nur Vorheriges voraus; 3–8 Lektionen pro Kapitel; am Kapitelende möglichst eine Projekt-Lektion (`Projekt – <Name>`), die den Kapitelstoff verbindet. Passe Tiefe und Tempo an das Vorwissen an. Bei Typ `sprache`/`sonstiges` entsprechend Themen statt Code.
   - Ist das Ziel unklar oder zu weit, frage kurz nach, statt zu raten.
3. **Synchronisieren** (nur Fehlendes anlegen):
   - Ordner `kurs/<Stufe>/Kapitel_NN_<thema>/Lektion_NN_<thema>/` mit `.gitkeep` für jede echte Lektion in `ROADME.md` (Namen aus dem Konzept abgeleitet; Regeln im Modell, ASCII, Umlaute als ae/oe/ue/ss).
   - `FORTSCHRITT.md`: pro Stufe, Kapitel und Lektion Überschriften und Checkboxen `- [ ] \`Lektion_NN_x\` – Beschreibung` ergänzen. Steht `**Aktuelle Lektion:**` noch auf `-`, setze sie auf die erste Lektion. Bestehende Haken **nie** ändern.
4. **Prüfen:** Jede Lektion in `ROADME.md` hat Ordner und Checkbox und umgekehrt (`find kurs -type d`). Abweichungen melden, nicht stillschweigend löschen.
5. **Zusammenfassen:** Kurze Übersicht (Stufe, Kapitel, Lektionenzahl) und nächster Schritt: `/lernpath:aufgabe`. Der Schüler darf den Kurs jederzeit in `ROADME.md` ändern oder mit diesem Befehl erweitern lassen.

## Regeln
- Lektionsordner bleiben leer: keine Aufgaben oder Lösungen vorab (die entstehen live bei `aufgabe`).
- Nichts überschreiben oder löschen. Umbenennen, Löschen und Umsortieren bestehender Lektionen nur auf ausdrücklichen Wunsch und nach kurzer Rückfrage.
- Bereits abgehakte Lektionen und ihre Ordner bleiben unangetastet.
