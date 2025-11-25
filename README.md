# 🇮🇳 Indian Army Organigramm Generator

**Organigramm aus MySQL → PNG & SVG**  
**100% CMD/Terminal | Windows & Linux | Keine Vorkenntnisse nötig**

Repository: https://github.com/PhilipSoran/IndischesMilitaer

---

## 📥 1. Projekt klonen
```bash
git clone https://github.com/PhilipSoran/IndischesMilitaer.git
cd IndischesMilitaer
```

---

## 🗄️ 2. MySQL-Datenbank einrichten
### Windows & Linux:
```bash
mysql -u root -p < schema_indian_army.sql
```

---

## 🐍 3. Python-Abhängigkeiten installieren
```bash
pip install mysql-connector-python graphviz
```

---

## 📦 4. Graphviz installieren
### Linux:
```bash
sudo apt install graphviz
```

### Windows:
1. Download: https://graphviz.org/download/  
2. Haken setzen: **Add Graphviz to PATH**

Test:
```bash
dot -V
```

---

## 🚀 5. Organigramm generieren
```bash
python organigramm_indian_army.py
```

Ergebnis:
- **indian_military_chart.png**
- **indian_military_chart.svg**

---

## 🆘 Häufige Fehler & Lösungen

❌ *ExecutableNotFound: 'dot'*  
✔ Graphviz fehlt oder PATH falsch.

❌ *ModuleNotFoundError: graphviz*  
✔  
```bash
pip install graphviz
```

❌ *MySQL connection error*  
✔ MySQL starten & Passwort prüfen.

---

## 🎉 Fertig!
Ein einziger Befehl – und das komplette Militärorganigramm wird automatisch erstellt.
