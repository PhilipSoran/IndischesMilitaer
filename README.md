# 📘 Organigramm -- Indien (Graphviz Version)

**100% Funktionsgarantiert -- Lehrerfreundlich -- Kein Nachdenken nötig**  
Dieses Projekt generiert ein Organigramm der indischen Militärstruktur als SVG und PNG.  
Die Anleitung ist so geschrieben, dass jede Person, auch ohne IT-Wissen, das Skript fehlerfrei starten kann.

---

## ✅ 1. Projekt herunterladen

```bash
# GitHub Repository klonen
git clone https://github.com/DEIN_USERNAME/military_org.git
cd military_org
```

> Alternativ: GitHub öffnen → Code → Download ZIP → ZIP entpacken → in den entpackten Ordner wechseln

---

## ✅ 2. Nötige Software installieren (einmalig)

### ✔ Python prüfen / installieren
```bash
python --version
```
- Wenn eine Versionsnummer erscheint → weiter  
- Wenn nicht → Python installieren unter [python.org](https://www.python.org/downloads/)

### ✔ Graphviz installieren
- Download: [Graphviz](https://graphviz.org/download/)  
- Während Setup unbedingt anhaken: ✔ *Add Graphviz to PATH*  

Testen:
```bash
dot -V
```

### ✔ Python-Modul installieren
```bash
pip install graphviz
```

---

## 🚀 3. Skript starten

Damit das Skript funktioniert, muss das Terminal im Ordner des Skripts geöffnet werden.

### ⭐ Methode 1 (empfohlen)
```bash
# Im Projektordner Adressleiste oben eingeben:
cmd
# Enter drücken → CMD öffnet sich im richtigen Ordner
```

### ⭐ Methode 2 (Alternative)
- Rechtsklick im Ordner → „Terminal hier öffnen“ oder „Eingabeaufforderung hier öffnen“

---

## 🎯 4. Skript ausführen
```bash
python generate_org.py
```
Nach wenigen Sekunden entstehen automatisch:
- `org_chart_graphviz.svg`
- `org_chart_graphviz.png`

Beide liegen im selben Ordner wie die `.py` Datei.

---

## 🆘 Häufige Fehler & Lösungen

❌ **Fehler:**
```
python: can't open file 'C:\Users\NAME\generate_org.py': No such file or directory
```
✔ **Lösung:** CMD war im falschen Ordner. Bitte Schritt 3 befolgen.

❌ **Fehler:**
```
ExecutableNotFound: failed to execute 'dot'
```
✔ **Lösung:** Graphviz ist nicht installiert oder nicht im PATH. Neu installieren → „Add Graphviz to PATH“ anhaken.

❌ **Fehler:**
```
ModuleNotFoundError: No module named 'graphviz'
```
✔ **Lösung:**
```bash
pip install graphviz
```

---

## 📌 Hinweise
- SVG: beste Qualität für Ausdruck/Abgabe  
- PNG: Präsentationen  
- Struktur kann im Skript über das `nodes`-Dictionary angepasst werden  
- Keine zusätzlichen Dateien notwendig

---

## 🎉 Fertig!
Jetzt kann jede Person, egal ob Schüler oder Lehrer, das Projekt sofort und fehlerfrei starten.
