# 📘 Organigramm -- Indien (Graphviz Version)

## **100% Funktionsgarantiert -- Lehrerfreundlich -- Kein Nachdenken nötig**

Dieses Projekt generiert ein **Organigramm der indischen
Militärstruktur** als **SVG** und **PNG**.\
Die Anleitung ist so geschrieben, dass **jede Person**, auch ohne
IT-Wissen, das Skript **fehlerfrei starten kann**.

------------------------------------------------------------------------

# ✅ 1. Projekt herunterladen

1.  GitHub öffnen\

2.  Auf **Code → Download ZIP** klicken\

3.  ZIP entpacken\

4.  Danach befindet sich ein Ordner wie z. B.:

        C:\Users\NAME\Downloads\military_org\

------------------------------------------------------------------------

# ✅ 2. Nötige Software installieren (einmalig)

### ✔ Python installieren (falls nicht vorhanden)

CMD öffnen:

    python --version

Wenn eine Versionsnummer erscheint → weiter.\
Wenn nicht → Python installieren unter python.org.

### ✔ Graphviz installieren (WICHTIG!)

Download: https://graphviz.org/download/

Während Setup unbedingt anhaken: ✔ **Add Graphviz to PATH**

Testen:

    dot -V

### ✔ Python-Modul installieren

Im CMD (egal wo):

    pip install graphviz

------------------------------------------------------------------------

# 🚀 3. Das Skript starten (WICHTIGSTER TEIL)

Damit das Skript funktioniert, **muss das CMD-Fenster im Ordner des
Skripts geöffnet werden**.

## ⭐ Methode 1 (empfohlen -- ultraleicht)

Öffne den Projektordner →\
In der Adressleiste oben eingeben:

    cmd

→ Enter drücken\
→ CMD öffnet sich **im richtigen Ordner**.

## ⭐ Methode 2 (alternative)

Rechtsklick im Ordner →\
**„Terminal hier öffnen"** oder\
**„Eingabeaufforderung hier öffnen"**

------------------------------------------------------------------------

# 🎯 4. Wichtigster Befehl (funktioniert jetzt zu 100% garantiert)

Im CMD eingeben:

    python generate_org.py

Nach wenigen Sekunden entstehen automatisch:

-   `org_chart_graphviz.svg`
-   `org_chart_graphviz.png`

Beide liegen **im selben Ordner wie die .py Datei**.

------------------------------------------------------------------------

# 🆘 Häufige Fehler -- und perfekte Lösungen

### ❌ Fehler:

    python: can't open file 'C:\\Users\\NAME\\generate_org.py': No such file or directory

### ✔ Lösung:

CMD war **im falschen Ordner**.\
Bitte Schritt **3** befolgen.\
Sobald CMD im richtigen Ordner ist, funktioniert es.

------------------------------------------------------------------------

### ❌ Fehler:

    ExecutableNotFound: failed to execute 'dot'

### ✔ Lösung:

Graphviz ist nicht installiert oder nicht im PATH.\
Neu installieren → „Add Graphviz to PATH" anhaken.

------------------------------------------------------------------------

### ❌ Fehler:

    ModuleNotFoundError: No module named 'graphviz'

### ✔ Lösung:

    pip install graphviz

------------------------------------------------------------------------

# 📌 Hinweise

-   **SVG**: beste Qualität für Ausdruck/Abgabe\
-   **PNG**: Präsentationen\
-   Struktur kann im Skript über das `nodes`-Dictionary angepasst
    werden\
-   Keine zusätzlichen Dateien notwendig

------------------------------------------------------------------------

# 🎉 Fertig!

Jetzt kann **jede Person**, egal ob Schüler oder Lehrer,\
das Projekt **sofort und fehlerfrei** starten.
