---
name: neuer-lernpfad
description: >-
  Legt einen neuen, eigenen Lernpfad an (Ordner mit LERNPFAD.md, ROADMAP.md, FORTSCHRITT.md, kurs/).
  Verwende diesen Skill, wenn der Nutzer einen neuen Lernpfad, ein neues Lernthema oder "neuer Kurs" anlegen will.
argument-hint: "<Thema, z. B. Rust>"
disable-model-invocation: true
---

# Skill `neuer-lernpfad`: eigenen Lernpfad anlegen

Erzeugt nur das **leere Gerüst**. Kapitel und Lektionen kommen später mit `/lernpath:lernpfad-aufbauen`. Beachte `lernpath:lehrer`.

Thema aus den Argumenten: $ARGUMENTS (falls leer, frage danach).

## Ablauf
1. **Eingaben klären** (nur fragen, was fehlt; mit AskUserQuestion, wenn möglich):
   - **Thema/Name** (z. B. `Rust`, `Deutsch A1`, `Steuerrecht`). Ordnername = Name ohne Leerzeichen/Sonderzeichen (`Deutsch_A1`).
   - **Typ:** `programmieren`, `sprache` oder `sonstiges`.
   - **Ziel** (was soll der Schüler am Ende können?).
   - **Vorwissen** (z. B. „Bash-Entwickler“, „Anfänger“).
   - Bei `programmieren`: **Dateiendung** (`.rs`) und **Ausführbefehl** (`cargo run`, `python3`, `bash` …).
   - **Aufgabenform:** `datei` (eine Datei `aufgabe<Endung>`, z. B. Python, Bash) oder `projekt` (ein Projektordner mit Build-Werkzeug, z. B. Cargo, npm, Go-Module, Maven). Vorschlag aus dem Ausführbefehl ableiten (`cargo`, `npm`, `go`, `mvn`, `gradle`, `dotnet` → `projekt`), sonst `datei`; bei Typ `sprache`/`sonstiges` immer `datei`.
   - **Sprache der Erklärungen** (Standard Deutsch).
2. **Zielort:** das Arbeitsverzeichnis. Existiert `<Ordner>` dort schon, **abbrechen und nachfragen**, nichts überschreiben.
3. **Gerüst erzeugen:**
   ```bash
   bash "${CLAUDE_PLUGIN_ROOT}/skills/neuer-lernpfad/scripts/scaffold.sh" "<Ordner>" "<Thema>" "<typ>" "<Ziel>" "<Vorwissen>" "<.endung oder ->" "<Ausführbefehl oder ->" "<Sprache>" "<datei|projekt>"
   ```
4. **Zusammenfassen:** Ordner, Metadaten und nächster Schritt: `/lernpath:lernpfad-aufbauen`.

## Regeln
- Kein `git init`, kein Commit ohne Wunsch.
- Keine Inhalte erfinden: Das Gerüst enthält keine Lektionen.
