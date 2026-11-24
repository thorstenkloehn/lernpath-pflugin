# lernpath – dein KI-Lehrer für eigene Lernpfade

Ein Claude-Code-Plugin, mit dem du jedes Thema Schritt für Schritt lernst: eine Programmiersprache, eine Fremdsprache oder etwas ganz anderes.

**Claude ist der Lehrer, du bist der Schüler.** Du nennst ein Thema, Claude schreibt den passenden Kurs. Danach lernst du Lektion für Lektion: kurze Erklärung (höchstens 20 % Theorie), eine Aufgabe, die du selbst löst, und Feedback zu deiner Lösung. Fertige Lösungen gibt es nur, wenn du ausdrücklich danach fragst (Spoiler-Verbot).

Das Plugin enthält keine fertigen Kurse. Jeder Lernpfad entsteht für dein Ziel und dein Vorwissen.

## Schnellstart
```text
/plugin install lernpath --marketplace thorstenkloehn/lernpath-pflugin
```
Zum Testen ohne Installation: `claude --plugin-dir <Pfad zu diesem Repository>`

Dann in einem leeren Ordner:
```text
/lernpath:neuer-lernpfad Rust      # Gerüst anlegen (fragt nach Ziel, Vorwissen, Ausführbefehl …)
/lernpath:lernpfad-aufbauen        # Claude schreibt den Kurs (L1–L3)
/lernpath:aufgabe                  # erste Aufgabe lesen
```

## So läuft das Lernen
1. **`neuer-lernpfad <Thema>`** legt den Ordner `<Thema>/` mit `LERNPFAD.md`, `ROADME.md`, `FORTSCHRITT.md`, `README.md` und `kurs/` an. Gefragt werden unter anderem Typ, Ziel, Vorwissen und bei Programmiersprachen die Aufgabenform (einzelne Datei oder Projektordner wie bei Cargo).
2. **`lernpfad-aufbauen`** schreibt aus Ziel und Vorwissen den Kurs in `ROADME.md`, verteilt auf drei Stufen, mit einem Konzept pro Lektion und einer Projekt-Lektion am Kapitelende. Danach legt es die leeren Lektionsordner und die Checkboxen in `FORTSCHRITT.md` an. Du kannst Wünsche nennen (etwa „mehr Ownership“) oder `ROADME.md` selbst ändern und den Befehl wiederholen.
3. **Lernschleife:** `aufgabe` → selbst lösen (mindestens 5 Minuten) → bei Bedarf `frage` oder `aktiv` → `loesung`. Bei Erfolg wird die Lektion abgehakt und die nächste wird aktuell.

| Stufe | Inhalt |
| :--- | :--- |
| 🟢 L1 Grundlagen | Einstieg und Basiswissen |
| 🟡 L2 Fortgeschritten | Aufbauende Konzepte |
| 🟠 L3 Profi | Vertiefung bis zum Ziel |

## Befehle
| Befehl | Wirkung |
| :--- | :--- |
| `/lernpath:neuer-lernpfad <Thema>` | Legt einen neuen, leeren Lernpfad an |
| `/lernpath:lernpfad-aufbauen [Wünsche]` | Claude schreibt oder erweitert den Kurs und legt Ordner und Fortschritt an |
| `/lernpath:aufgabe` | Aufgabe der aktuellen Lektion, höchstens 20 % Theorie, ohne Lösung |
| `/lernpath:aktiv` | Active Recall: Beispiel lesen, ausblenden, aus dem Gedächtnis nachbauen |
| `/lernpath:frage` | Denkanstoß ohne Lösung, wenn du nach mindestens 5 Minuten feststeckst |
| `/lernpath:loesung` | Prüft deine Lösung, gibt Feedback, hakt die Lektion ab |
| `/lernpath:antwort` | Zeigt die Musterlösung (nur auf Wunsch) |
| `/lernpath:ausfuehren` | Führt deine Aufgabendatei aus, ohne zu bewerten |
| `/lernpath:ueberpruefen` | Korrigiert deutsche Texte (Rechtschreibung, Grammatik, Zeichensetzung) |
| `/lernpath:fortschritt` | Zeigt den Stand aller Lernpfade |

## Aufbau eines Lernpfads
```text
<Lernpfad>/
├── LERNPFAD.md      # Thema, Typ, Ziel, Vorwissen, Endung, Ausführbefehl
├── ROADME.md        # der Kurs: Stufen, Kapitel, Lektionen
├── FORTSCHRITT.md   # Checkboxen und aktuelle Lektion
├── README.md
└── kurs/<Stufe>/<Kapitel>/<Lektion>/     # starten leer, hier arbeitest du
```
Mehrere Lernpfade (z. B. `Rust` und `Go`) können nebeneinander liegen. Arbeite im Lernpfad-Ordner, sonst fragt Claude, welcher gemeint ist.

## Aufbau des Plugins
```text
.claude-plugin/plugin.json
skills/lehrer/                         # gemeinsame Regeln und Lernpfadmodell (nicht direkt aufrufbar)
skills/<befehl>/SKILL.md               # ein Skill je Befehl
skills/neuer-lernpfad/scripts/scaffold.sh
```
