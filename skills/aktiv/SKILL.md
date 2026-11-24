---
name: aktiv
description: >-
  Startet eine Active-Recall-Übung (Aktives_Coden) zur aktuellen Lektion. Verwende diesen Skill, wenn der
  Nutzer "Aktiv", "Aktives_Coden" oder Wiederholen aus dem Gedächtnis sagt.
argument-hint: "[Lernpfad]"
---

# Skill `aktiv` (Active Recall)

Beachte `lernpath:lehrer`. Argumente: $ARGUMENTS

1. Aktiven Lernpfad und aktuelle Lektion ermitteln.
2. Ein kurzes, abgeschlossenes Konzept-Beispiel zeigen, das **nicht** der Lektionsaufgabe entspricht, und jede Zeile bzw. jeden Satz kurz erklären.
3. Den Schüler bitten, die Erklärung auszublenden.
4. Eine kleine Transfer-Übung stellen, die er komplett **aus dem Gedächtnis** im aktuellen Lektionsordner nachbaut.
5. Bleibt er stecken, nur minimale Impulse wie bei `frage`.

Lektionsaufgabe nicht vorwegnehmen, keine Lösung schreiben, `FORTSCHRITT.md` nicht ändern.
