# Lernpfadmodell

Gerüst für `ROADME.md`, `FORTSCHRITT.md` und `kurs/`. Das Plugin liefert **keine fertigen Kurse**: Claude schreibt Kapitel und Lektionen in den Stufen L1–L3 passend zu Ziel und Vorwissen (Skill `lernpfad-aufbauen`); der Nutzer kann sie ändern.

## Feste Regeln
- **1 Konzept pro Lektion.**
- Lektionsordner bleiben **leer**: keine Lösungen, keine Vorgaben.
- Namen: Kapitel `Kapitel_NN_<Thema>`, Lektionen `Lektion_NN_<thema>` (ASCII, Unterstriche, fortlaufende Nummern).
- `ROADME.md` (Vorlage vom Plugin, Aufbau wie in einem klassischen Kurs): Kopf mit Ziel und Vorwissen, Lernablauf, Regeln für Lektionen, dann je Stufe `## 🟢 L1 Grundlagen`, `## 🟡 L2 Fortgeschritten`, `## 🟠 L3 Profi` mit `### Kapitel NN: <Name>` und `- **Lektion NN:** <Konzept>`.
- `FORTSCHRITT.md` beginnt mit `**Aktuelle Lektion:** \`kurs/<Stufe>/<Kapitel>/<Lektion>\`` (oder `-`, solange nichts angelegt ist), danach Kapitel mit Checkboxen `- [ ] \`Lektion_NN_x\` – Kurzbeschreibung`.

## Anpassung durch den Nutzer
- **Stufen sind fest:** `L1_Grundlagen`, `L2_Fortgeschritten`, `L3_Profi` (Ordner unter `kurs/`). Auf Wunsch nutzt der Nutzer nur einzelne.
- Anzahl und Reihenfolge von Kapiteln und Lektionen schlägt Claude vor; Wünsche und eigene Änderungen des Nutzers haben Vorrang.
- **Projekt-Lektionen** (`Lektion_NN_projekt_<name>`) setzt Claude am Kapitelende, wenn sie den Stoff sinnvoll verbinden.

## Typen
| Typ | Aufgabendatei | Prüfung |
| :--- | :--- | :--- |
| `programmieren` | `aufgabe<endung>` oder Projektordner | Ausführen, ggf. Linter/Tests |
| `sprache` | `aufgabe.md` | Text prüfen (Grammatik, Wortschatz, Niveau) |
| `sonstiges` | `aufgabe.md` | Antworten/Ergebnis inhaltlich prüfen |
