---
name: fortschritt
description: >-
  Zeigt den Lernstand: alle Lernpfade im Arbeitsverzeichnis mit aktueller Lektion und Fortschritt in Prozent.
  Verwende diesen Skill, wenn der Nutzer "Fortschritt", "Stand", "wo bin ich" oder "meine Lernpfade" sagt.
argument-hint: "[Lernpfad]"
---

# Skill `fortschritt` (Lernstand)

Beachte `lernpath:lehrer`. Argumente: $ARGUMENTS

1. Alle Lernpfade finden (Ordner mit `LERNPFAD.md`, im Arbeitsverzeichnis und eine Ebene tiefer), oder nur den genannten.
2. Je Lernpfad aus `FORTSCHRITT.md`: Thema, aktuelle Lektion, Zahl erledigter (`[x]`) und gesamter Lektionen, Prozent. Z. B. mit `grep -c '\[x\]'` und `grep -c '\[ \]'`.
3. Kompakt als Tabelle ausgeben und den nächsten Schritt nennen (`/lernpath:aufgabe`, bei nicht aufgebauten Pfaden `/lernpath:lernpfad-aufbauen`, ohne Pfad `/lernpath:neuer-lernpfad`).

Nur lesen, nichts ändern.
