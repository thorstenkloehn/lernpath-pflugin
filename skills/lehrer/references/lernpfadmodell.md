# Lernpfadmodell

Gerüst für `ROADMAP.md`, `FORTSCHRITT.md` und `kurs/`. Das Plugin liefert keine Inhalte: Themen, Kapitel und Lektionen entstehen pro Lernpfad im Skill `lernpfad-aufbauen`.

## Regeln
- **1 Konzept pro Lektion**, 3–8 Lektionen pro Kapitel, vom Einfachen zum Komplexen.
- Stufen: `L1_Grundlagen`, `L2_Fortgeschritten`, `L3_Profi` (Namen anpassbar; mindestens L1). Kleine Themen dürfen bei L1 bleiben.
- Kapitel: `Kapitel_NN_<Thema>`, Lektionen: `Lektion_NN_<thema>` (ASCII, Unterstriche, klein bei Lektionen).
- Lektionsordner bleiben **leer**: keine Lösungen, keine Vorgaben.
- Jede Lektion knüpft an das Vorwissen aus `LERNPFAD.md` an und nennt, wenn sinnvoll, das bekannte Pendant.
- `FORTSCHRITT.md` beginnt mit `**Aktuelle Lektion:** \`kurs/<Stufe>/<Kapitel>/<Lektion>\``, danach Kapitel mit Checkboxen `- [ ] \`Lektion_NN_x\` – Kurzbeschreibung`.

## Projekte
| Wann | Was | Umfang |
| :--- | :--- | :--- |
| Ende jedes L1-Kapitels | Mini-Projekt, nur Stoff dieses Kapitels | 1 Lektion `Lektion_NN_projekt_<name>`, 20–30 Min. |
| Ende von L1 und L2 | Meilenstein-Projekt über alle Kapitel der Stufe | 2–4 Lektionen |
| Ende des Lernpfads | Abschlussprojekt mit realem Nutzen | eigenes Kapitel |

Projekt-Lektionen stehen am Kapitelende, nie davor.

## Typen
| Typ | Aufgabendatei | Prüfung |
| :--- | :--- | :--- |
| `programmieren` | `aufgabe<endung>` | Ausführen, ggf. Linter/Tests |
| `sprache` | `aufgabe.md` | Text prüfen (Grammatik, Wortschatz, Niveau) |
| `sonstiges` | `aufgabe.md` | Antworten/Ergebnis inhaltlich prüfen |
