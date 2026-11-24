# lernpath – Claude-Code-Plugin für eigene Lernpfade

**Der KI-Lehrer ist Claude, du bist der Schüler.** Das Plugin enthält **keine fertigen Kurse**. Du legst eigene Lernpfade an (Programmiersprache, Fremdsprache, jedes Thema) und baust sie später zu Kursen aus. Claude erklärt kurz (max. 20 % Theorie), gibt Tipps und prüft deine Lösungen. Fertige Lösungen gibt es nur auf ausdrücklichen Wunsch (Spoiler-Verbot).

## Installation
```text
/plugin install lernpath --marketplace thorstenkloehn/lernpath-pflugin
```
Zum Testen ohne Installation: `claude --plugin-dir /home/thorsten/lernpath-pflugin`

## Befehle
| Befehl | Wirkung |
| :--- | :--- |
| `/lernpath:neuer-lernpfad <Thema>` | Legt einen neuen, leeren Lernpfad an (Thema, Typ, Ziel, Vorwissen, Endung, Ausführbefehl) |
| `/lernpath:lernpfad-aufbauen` | Schreibt Roadmap, Kapitel, Lektionen und leere Lektionsordner; auch zum späteren Erweitern |
| `/lernpath:aufgabe` | Aufgabe der aktuellen Lektion, höchstens 20 % Theorie, ohne Lösung |
| `/lernpath:aktiv` | Active Recall: Beispiel lesen, ausblenden, aus dem Gedächtnis nachbauen |
| `/lernpath:frage` | Denkanstoß, wenn du nach mindestens 5 Minuten feststeckst |
| `/lernpath:loesung` | Prüft deine Lösung, gibt Feedback, hakt die Lektion ab |
| `/lernpath:antwort` | Zeigt die Musterlösung (nur auf Wunsch) |
| `/lernpath:ausfuehren` | Führt deine Aufgabendatei aus, ohne zu bewerten |
| `/lernpath:ueberpruefen` | Korrigiert deutsche Texte (Rechtschreibung, Grammatik, Zeichensetzung) |
| `/lernpath:fortschritt` | Zeigt den Stand aller Lernpfade |

## Ablauf
1. `/lernpath:neuer-lernpfad Rust` (fragt u. a. die Aufgabenform: einzelne Datei oder Projektordner wie bei Cargo) erzeugt im aktuellen Ordner `Rust/` mit `LERNPFAD.md`, `ROADMAP.md`, `FORTSCHRITT.md`, `README.md`, `kurs/`.
2. `/lernpath:lernpfad-aufbauen` plant Stufen, Kapitel und Lektionen (1 Konzept pro Lektion, Projekte am Kapitelende) und legt leere Lektionsordner an.
3. Dann im Kreis: `aufgabe` → selbst lösen (ggf. `frage`, `aktiv`) → `loesung`.

## Lernpfad-Aufbau
```text
<Lernpfad>/
├── LERNPFAD.md  ROADMAP.md  FORTSCHRITT.md  README.md
└── kurs/<Stufe>/<Kapitel>/<Lektion>/     # starten leer
```
Mehrere Lernpfade nebeneinander sind möglich. Arbeite im Lernpfad-Ordner, sonst fragt Claude, welcher gemeint ist.

## Aufbau des Plugins
```text
.claude-plugin/plugin.json
skills/lehrer/            # gemeinsame Regeln und Bewertungskriterien (nicht direkt aufrufbar)
skills/<befehl>/SKILL.md  # ein Skill je Befehl
skills/neuer-lernpfad/scripts/scaffold.sh
```
