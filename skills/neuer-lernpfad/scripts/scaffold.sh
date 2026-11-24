#!/usr/bin/env bash
# Erzeugt das leere Gerüst eines eigenen Lernpfads im aktuellen Verzeichnis.
# Aufruf: scaffold.sh <ordner> <thema> <typ> <ziel> <vorwissen> <endung|-> <ausfuehrbefehl|-> <sprache> [datei|projekt]
set -euo pipefail

DIR="${1:?Ordnername fehlt}"; THEMA="${2:?Thema fehlt}"; TYP="${3:?Typ fehlt}"
ZIEL="${4:?Ziel fehlt}"; VORWISSEN="${5:-Anfänger}"; EXT="${6:--}"; RUN="${7:--}"; SPRACHE="${8:-Deutsch}"; FORM="${9:-datei}"

case "$TYP" in programmieren|sprache|sonstiges) ;; *) echo "Fehler: Typ muss programmieren, sprache oder sonstiges sein." >&2; exit 1;; esac
case "$FORM" in datei|projekt) ;; *) echo "Fehler: Aufgabenform muss datei oder projekt sein." >&2; exit 1;; esac
[[ "$DIR" == */* || "$DIR" == .* ]] && { echo "Fehler: Ordnername darf kein / enthalten oder mit . beginnen." >&2; exit 1; }
[[ -e "$DIR" ]] && { echo "Fehler: $DIR existiert bereits." >&2; exit 1; }

mkdir -p "$DIR"/kurs/{L1_Grundlagen,L2_Fortgeschritten,L3_Profi}
touch "$DIR"/kurs/{L1_Grundlagen,L2_Fortgeschritten,L3_Profi}/.gitkeep

cat > "$DIR/LERNPFAD.md" <<MD
# Lernpfad: $THEMA

- **Thema:** $THEMA
- **Typ:** $TYP
- **Ziel:** $ZIEL
- **Vorwissen:** $VORWISSEN
- **Dateiendung:** $EXT
- **Ausführbefehl:** $RUN
- **Aufgabenform:** $FORM
- **Sprache der Erklärungen:** $SPRACHE
MD

cat > "$DIR/ROADME.md" <<MD
# Dein strukturierter Lernpfad – $THEMA
**Ziel:** $ZIEL
**Vorwissen:** $VORWISSEN

Dieser Lernpfad gehört dir: Du baust ihn selbst. Trage unten deine Kapitel und Lektionen ein und starte danach \`/lernpath:lernpfad-aufbauen\`. Claude legt daraus die leeren Lektionsordner unter \`kurs/\` und die Checkboxen in \`FORTSCHRITT.md\` an.

---

## So lernst du (der Lernablauf)

| Schritt | Befehl | Wirkung |
| :--- | :--- | :--- |
| 1 | \`/lernpath:aufgabe\` | Die Aufgabe der aktuellen Lektion lesen (höchstens 20 % Theorie, keine Lösung) |
| 2 | selbst lösen | Mindestens 5 Minuten eigener Versuch im Lektionsordner |
| 3 | \`/lernpath:aktiv\` | Active Recall: Beispiel lesen, ausblenden, aus dem Gedächtnis nachbauen |
| 4 | \`/lernpath:frage\` | Denkanstoß, wenn du feststeckst |
| 5 | \`/lernpath:loesung\` | Deine Lösung prüfen lassen, bei Erfolg wird die Lektion abgehakt |

## So schreibst du deine Lektionen
- **1 Konzept pro Lektion.** Eine Lektion ist ein kleiner Schritt, der in wenigen Minuten machbar ist.
- Ordne vom Einfachen zum Komplexen. Eine Lektion setzt nur voraus, was davor steht.
- Pro Kapitel 3–8 Lektionen. Beschreibe jede Lektion in einem Satz: *Was lerne ich, und was kenne ich schon (Vorwissen)?*
- Optional: Setze am Kapitelende eine **Projekt-Lektion** (\`Lektion NN: Projekt – <Name>\`), die den Stoff des Kapitels verbindet.

---

## 🟢 L1 Grundlagen (<Untertitel: Wo startest du?>)

### Kapitel 01: <Name des Kapitels>
- **Lektion 01:** <ein Konzept>
- **Lektion 02:** <ein Konzept>

### Kapitel 02: <Name des Kapitels>
- **Lektion 01:** <ein Konzept>

---

## 🟡 L2 Fortgeschritten (<Untertitel: Was kommt als Nächstes?>)

### Kapitel 01: <Name des Kapitels>
- **Lektion 01:** <ein Konzept>

---

## 🟠 L3 Profi (<Untertitel: Wohin soll der Lernpfad führen?>)

### Kapitel 01: <Name des Kapitels>
- **Lektion 01:** <ein Konzept>
MD

cat > "$DIR/FORTSCHRITT.md" <<MD
# Lernfortschritt – $THEMA

> **Hinweis für KI-Agenten:** Lies diese Datei zu Beginn jeder Sitzung. Jede Lektion behandelt nur ein Konzept. Hake eine Lektion nur nach erfolgreicher \`loesung\` ab.

**Aktuelle Lektion:** -

---

## 🟢 L1 Grundlagen

## 🟡 L2 Fortgeschritten

## 🟠 L3 Profi
MD

cat > "$DIR/README.md" <<MD
# $THEMA – eigener Lernpfad

Ziel: $ZIEL

| Befehl | Wirkung |
| :--- | :--- |
| \`/lernpath:lernpfad-aufbauen\` | Deine eigenen Kapitel und Lektionen anlegen oder erweitern |
| \`/lernpath:aufgabe\` | Aufgabe der aktuellen Lektion (max. 20 % Theorie) |
| \`/lernpath:aktiv\` | Active Recall |
| \`/lernpath:frage\` | Denkanstoß ohne Lösung |
| \`/lernpath:loesung\` | Lösung prüfen und Fortschritt abhaken |
| \`/lernpath:antwort\` | Musterlösung zeigen |
| \`/lernpath:ausfuehren\` | Aufgabe ausführen, nicht bewerten |
| \`/lernpath:ueberpruefen\` | Deutsche Texte korrigieren |
| \`/lernpath:fortschritt\` | Stand ansehen |
MD

printf '__pycache__/\nnode_modules/\ntarget/\n*.pyc\n.DS_Store\n' > "$DIR/.gitignore"

echo "Lernpfad angelegt: $(pwd)/$DIR"
