# Organigramm -- Indien (Graphviz-Version)

## Übersicht

Dieses Projekt generiert ein **übersichtliches Organigramm der indischen
Militärstruktur** als **SVG- und PNG-Datei** mithilfe von **Python +
Graphviz**.

Die Anleitung ist so geschrieben, dass **jeder fremde Benutzer das
Skript ohne Fehler ausführen kann**.

------------------------------------------------------------------------

## 📁 Projektstruktur

-   `generate_org.py` -- Hauptskript (Graphviz)
-   `org_chart_graphviz.svg` -- Ausgabe (SVG)
-   `org_chart_graphviz.png` -- Ausgabe (PNG)
-   `README.md` -- diese Anleitung

------------------------------------------------------------------------

## 🔧 Voraussetzungen

### 1. Python 3 installieren

Prüfen in CMD:

    python --version

### 2. Benötigte Python‑Module installieren

In CMD im Projektordner eingeben:

    pip install graphviz

### 3. Graphviz-Software installieren (WICHTIG)

Ohne Graphviz **funktioniert das Skript NICHT**.

Download-Link:\
https://graphviz.org/download/

➡ Während der Installation **„Add Graphviz to PATH" anhaken**\
➡ Nach Installation testen:

    dot -V

Wenn eine Versionsnummer erscheint → alles korrekt installiert.

------------------------------------------------------------------------

## ▶ Organigramm generieren

### **WICHTIGSTER BEFEHL (CMD im Skript-Ordner öffnen!)**

    python generate_org.py

Danach werden automatisch erstellt: - `org_chart_graphviz.svg` -
`org_chart_graphviz.png`

Alle Dateien erscheinen im gleichen Ordner wie das Skript.

------------------------------------------------------------------------

## ❗ Häufige Fehler + Lösungen

### ❌ Fehler: `ExecutableNotFound: failed to execute 'dot'`

➡ Graphviz ist **nicht installiert** oder **nicht im PATH**\
🔧 Lösung: Graphviz neu installieren → „Add to PATH" anhaken

### ❌ Fehler: `ModuleNotFoundError: No module named 'graphviz'`

➡ Python-Modul fehlt\
🔧 Lösung:

    pip install graphviz

------------------------------------------------------------------------

## 👍 Hinweise

-   **SVG** ist perfekt für Ausdruck und Abgabe\
-   **PNG** eignet sich für Präsentationen\
-   Struktur anpassbar → einfach im Skript das `nodes`‑Dictionary ändern

------------------------------------------------------------------------

Fertig! Jetzt kannst du das Skript überall problemlos verwenden.
