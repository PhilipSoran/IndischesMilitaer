# Indian Army Organigramm Generator

Dieses Projekt erstellt automatisch ein visuelles Organigramm der indischen Armee aus einer MySQL-Datenbank.

## Voraussetzungen

### Software
- Python 3.7 oder höher
- MySQL Server 5.7 oder höher
- Graphviz

### Python-Pakete
```bash
pip install mysql-connector-python graphviz
```

### Graphviz Installation

**Windows (CMD):**
```cmd
# Download von https://graphviz.org/download/
# Installer ausführen und Graphviz zum PATH hinzufügen
# Oder mit Chocolatey:
choco install graphviz
```

**Linux (Ubuntu/Debian):**
```bash
sudo apt-get update
sudo apt-get install graphviz
```

**Linux (Fedora/RHEL):**
```bash
sudo dnf install graphviz
```

**macOS:**
```bash
brew install graphviz
```

## Installation

### 1. Datenbank einrichten

**Windows (CMD):**
```cmd
# MySQL-Dienst starten
net start MySQL80

# Datenbank erstellen
mysql -u root -p < schema_indian_army.sql
```

**Linux:**
```bash
# MySQL-Dienst starten
sudo systemctl start mysql
# oder
sudo service mysql start

# Datenbank erstellen
mysql -u root -p < schema_indian_army.sql
```

### 2. Datenbankverbindung konfigurieren

Bearbeiten Sie die Datei `organigramm_indian_army.py` und passen Sie die Verbindungsparameter an:

```python
config = {
    'host': 'localhost',
    'user': 'root',
    'password': 'IhrPasswort',  # ÄNDERN SIE DIES!
    'database': 'indian_military_database'
}
```

## Verwendung

### Organigramm generieren

**Windows (CMD):**
```cmd
# Ins Projektverzeichnis wechseln
cd C:\Pfad\zum\Projekt

# Script ausführen
python organigramm_indian_army.py
```

**Linux:**
```bash
# Ins Projektverzeichnis wechseln
cd /pfad/zum/projekt

# Script ausführen
python3 organigramm_indian_army.py
```

### Ausgabe

Das Script erstellt zwei Dateien:
- `indian_military_chart.png` - PNG-Format
- `indian_military_chart.svg` - SVG-Format (skalierbar)

## Datenbank-Verwaltung

### Daten anzeigen

**Windows (CMD) / Linux:**
```bash
mysql -u root -p indian_military_database
```

**SQL-Befehle:**
```sql
-- Alle Einheiten anzeigen
SELECT * FROM einheiten;

-- Hierarchie anzeigen
SELECT e1.name AS Einheit, e2.name AS Übergeordnet
FROM einheiten e1
LEFT JOIN einheiten e2 ON e1.uebergeordnete_einheit_id = e2.id
ORDER BY e1.ebene;

-- Personen mit Dienstgraden
SELECT p.vorname, p.nachname, d.rang
FROM personen p
JOIN dienstgrade d ON p.dienstgrad_id = d.id;
```

### Neue Einheiten hinzufügen

```sql
USE indian_military_database;

-- Beispiel: Neue Division hinzufügen
INSERT INTO einheiten (name, typ, ebene, uebergeordnete_einheit_id, standort)
VALUES ('1st Armoured Division', 'Division', 3, 2, 'Jhansi');
```

### Datenbank zurücksetzen

**Windows (CMD) / Linux:**
```bash
mysql -u root -p < schema_indian_army.sql
```

## Farbschema

Das Organigramm verwendet Farben inspiriert von der indischen Flagge:

- **Ebene 1** (Oberkommando): #FF9933 (Safran)
- **Ebene 2** (Kommandos): #FFFFFF (Weiß)
- **Ebene 3** (Divisionen): #138808 (Grün)
- **Ebene 4** (Brigaden): #000080 (Navy Blue)

## Fehlerbehebung

### "Module not found" Fehler
```bash
# Pakete installieren
pip install mysql-connector-python graphviz

# Oder mit pip3 unter Linux
pip3 install mysql-connector-python graphviz
```

### "Can't connect to MySQL server"
```bash
# MySQL-Status prüfen (Linux)
sudo systemctl status mysql

# MySQL-Status prüfen (Windows)
net start MySQL80
```

### "Access denied for user"
- Überprüfen Sie Benutzername und Passwort in der `config`-Variablen
- Stellen Sie sicher, dass der MySQL-Benutzer die richtigen Rechte hat

### Graphviz-Fehler
```bash
# Verifizieren Sie die Installation
dot -V

# Wenn nicht gefunden, zur PATH-Variable hinzufügen (Windows)
setx PATH "%PATH%;C:\Program Files\Graphviz\bin"
```

## Projektstruktur

```
projekt/
│
├── organigramm_indian_army.py    # Hauptscript
├── schema_indian_army.sql        # Datenbankschema
├── README.md                     # Diese Datei
├── indian_military_chart.png     # Generierte PNG (nach Ausführung)
└── indian_military_chart.svg     # Generierte SVG (nach Ausführung)
```

## Lizenz

Dieses Projekt ist für Bildungszwecke erstellt.

## Kontakt

Bei Fragen oder Problemen erstellen Sie bitte ein Issue im Repository.