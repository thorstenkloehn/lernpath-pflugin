---
name: lernpfad-aufbauen
description: >-
  Der Nutzer baut seinen eigenen Kurs (z. B. Rust, Go) selbst: Er trägt Kapitel und Lektionen in ROADME.md ein
  (oder nennt sie im Chat), Claude legt daraus die Ordner unter kurs/ und die Checkboxen in FORTSCHRITT.md an.
  Claude erfindet keine Inhalte. Verwende diesen Skill, wenn der Nutzer seinen Lernpfad aufbauen, erweitern oder
  ROADME.md in Ordner und Fortschritt übernehmen will.
argument-hint: "[Lernpfad] [optional: Stufe Kapitel: Lektion; Lektion]"
disable-model-invocation: true
---

# Skill `lernpfad-aufbauen`: Der Nutzer baut den Kurs selbst

Beachte `lernpath:lehrer` und das [Lernpfadmodell](../lehrer/references/lernpfadmodell.md). Argumente: $ARGUMENTS

**Grundsatz:** `ROADME.md` gehört dem **Nutzer** und ist die einzige Quelle für den Kurs. Du erfindest keine Kapitel oder Lektionen und machst keinen Plan, den niemand verlangt hat. Du bist nur für Anlegen und Konsistenz zuständig.

## Ablauf
1. Aktiven Lernpfad ermitteln; `LERNPFAD.md` und `ROADME.md` lesen.
2. **Nutzer-Eingaben in `ROADME.md` übernehmen:** Nennt der Nutzer Kapitel/Lektionen im Chat oder in den Argumenten, trage sie unter der genannten Stufe (`L1`, `L2`, `L3`; fehlt sie, frage) in `ROADME.md` ein, genau in seinen Worten, im Format der Vorlage:
   ```text
   ### Kapitel NN: <Name>
   - **Lektion NN:** <ein Konzept>
   ```
   Die Stufen heißen `## 🟢 L1 Grundlagen (…)`, `## 🟡 L2 Fortgeschritten (…)`, `## 🟠 L3 Profi (…)`.
   Fehlt bei einer Lektion das Konzept oder ist es ein Platzhalter `<…>`, frage nach, statt zu ergänzen. **Platzhalter `<…>` der Vorlage sind keine Lektionen** und werden nie angelegt; ersetze sie erst, wenn der Nutzer echte Inhalte nennt. **Vorschläge nur, wenn der Nutzer ausdrücklich darum bittet**, und dann erst nach seiner Auswahl eintragen.
   Hat er `ROADME.md` selbst geschrieben, nimm sie, wie sie ist. Ist der Aufbau unklar oder widersprüchlich, frage nach.
3. **Synchronisieren** (nur Fehlendes anlegen):
   - Ordner `kurs/<Stufe>/Kapitel_NN_<thema>/Lektion_NN_<thema>/` mit `.gitkeep` für jede echte Lektion in `ROADME.md` (Ordnername aus dem Konzept abgeleitet; Namensregeln im Modell, ASCII, Umlaute als ae/oe/ue/ss).
   - `FORTSCHRITT.md`: pro Stufe, Kapitel und Lektion Überschriften und Checkboxen `- [ ] \`Lektion_NN_x\` – Beschreibung` ergänzen. Steht `**Aktuelle Lektion:**` noch auf `-`, setze sie auf die erste Lektion. Bestehende Haken **nie** ändern.
4. **Prüfen:** Jede Lektion in `ROADME.md` hat Ordner und Checkbox und umgekehrt (`find kurs -type d`). Abweichungen melden, nicht stillschweigend löschen.
5. **Zusammenfassen:** Was wurde angelegt; nächster Schritt: weitere Lektionen in `ROADME.md` ergänzen und den Befehl wiederholen, oder `/lernpath:aufgabe`.

## Regeln
- Lektionsordner bleiben leer: keine Aufgaben oder Lösungen vorab (die entstehen live bei `aufgabe`).
- Nichts überschreiben oder löschen. Umbenennen, Löschen und Umsortieren nur auf ausdrücklichen Wunsch und nach kurzer Rückfrage.
- Anzahl der Kapitel und Lektionen sowie Projekt-Lektionen sind **Entscheidungen des Nutzers**, keine Pflicht.
