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

mkdir -p "$DIR/kurs"

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

cat > "$DIR/ROADMAP.md" <<MD
# Roadmap – $THEMA

Ziel: $ZIEL

> Noch nicht aufgebaut. Mit \`/lernpath:lernpfad-aufbauen\` entstehen hier Stufen, Kapitel und Lektionen.
MD

cat > "$DIR/FORTSCHRITT.md" <<MD
# Lernfortschritt – $THEMA

> **Hinweis für KI-Agenten:** Lies diese Datei zu Beginn jeder Sitzung. Jede Lektion behandelt nur ein Konzept. Hake eine Lektion nur nach erfolgreicher \`loesung\` ab.

**Aktuelle Lektion:** -

---

_Noch keine Lektionen. Starte mit \`/lernpath:lernpfad-aufbauen\`._
MD

cat > "$DIR/README.md" <<MD
# $THEMA – eigener Lernpfad

Ziel: $ZIEL

| Befehl | Wirkung |
| :--- | :--- |
| \`/lernpath:lernpfad-aufbauen\` | Roadmap, Kapitel und leere Lektionsordner erzeugen oder erweitern |
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
