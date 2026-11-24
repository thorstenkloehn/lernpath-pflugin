---
name: antwort
description: >-
  Zeigt die Musterlösung zur aktuellen Aufgabe, wenn der Schüler sie ausdrücklich verlangt oder nicht weiterkommt.
  Verwende diesen Skill, wenn der Nutzer "Antwort" oder "zeig die Lösung" sagt.
argument-hint: "[Lernpfad]"
disable-model-invocation: true
---

# Skill `antwort` (Musterlösung zeigen)

Beachte `lernpath:lehrer`. Argumente: $ARGUMENTS

1. Aktiven Lernpfad, aktuelle Lektion, Aufgabenstellung und den bisherigen Versuch des Schülers lesen.
2. Weise kurz auf die 5-Minuten-Regel hin. Ist der Lektionsordner komplett leer, biete zuerst `aufgabe` oder `frage` an. Zeige die Antwort nur, wenn der Schüler sie ausdrücklich verlangt.
3. **Antwort zeigen:** vollständige Musterlösung nur im Chat (Code als Codeblock, Text als Zitatblock).
4. Zeile für Zeile bzw. Satz für Satz erklären und benennen, wo der eigene Versuch abwich.
5. Den Schüler bitten, die Lösung selbst neu zu schreiben bzw. mit eigenen Angaben umzuformulieren (bei Code: auszuführen) und danach `loesung` aufzurufen.

Nichts in den Lektionsordner schreiben. `FORTSCHRITT.md` nicht ändern: Abhaken geht nur über `loesung` mit dem eigenen Versuch.
Bei Typ `sprache`: nur Grammatik und Wortschatz bis zur aktuellen Lektion, keine fertige 1:1-Abschrift erlauben.
