Indian Army Organigramm Generator
Dieses Projekt erstellt ein hierarchisches Organigramm der Indian Army basierend auf einer MySQL-Datenbank mit Entity-Relationship-Modell (ERM).

📋 Projektübersicht
Das Projekt modelliert die vollständige hierarchische Struktur der Indian Army und ermöglicht die Abfrage und Visualisierung der Kommandostrukturen über alle Ebenen hinweg.

📁 Projektstruktur
indian-army-org/
├── README_Indian_Army.md           # Projektdokumentation
├── schema_indian_army.sql          # MySQL Datenbankschema mit Beispieldaten
└── organigramm_indian_army.py      # Python-Script für hierarchische Abfragen
🗄️ Datenbankschema
Das ERM modelliert folgende Entitäten:

Haupttabellen
einheiten: Organisationseinheiten der Armee (selbstreferenziell)
Hierarchische Struktur über uebergeordnete_einheit_id
Ebenen 1-5: Indian Army → Command → Corps → Division → Regiment
dienstgrade: Militärische Ränge (Field Marshal bis Lieutenant)
Kategorisiert nach: Höhere Stabsoffiziere, Stabsoffiziere, Subalternoffiziere
personen: Militärangehörige mit Dienstgrad
positionen: Funktionen innerhalb der Hierarchie
Verknüpft Personen mit Einheiten
Zeitliche Zuordnung (von/bis Datum)
Kennzeichnung als Kommandant
kommandostrukturen: Befehls- und Stabsbeziehungen
Direkte und indirekte Unterstellungsverhältnisse
🚀 Installation
Voraussetzungen
Python 3.8 oder höher
MySQL 8.0+ (für rekursive CTEs)
MySQL Connector für Python
Setup Schritt-für-Schritt
Python Virtual Environment erstellen
bash
python -m venv venv
source venv/bin/activate  # Linux/Mac
venv\Scripts\activate     # Windows
MySQL Connector installieren
bash
pip install mysql-connector-python
MySQL Datenbank erstellen
bash
mysql -u root -p < schema_indian_army.sql
Die Datenbank indian_military_database wird automatisch erstellt und mit Beispieldaten gefüllt.

⚙️ Konfiguration
Bearbeite organigramm_indian_army.py und passe die Datenbankverbindung an:

python
config = {
    'host': 'localhost',
    'user': 'root',
    'password': 'dein_passwort',
    'database': 'indian_military_database'
}
📊 Verwendung
Organigramm generieren
bash
python organigramm_indian_army.py
Ausgabe-Beispiel:

Erfolgreich mit MySQL verbunden!
25 Einheiten geladen (max. Ebene 5) – generiere SVG...

Organigramm gespeichert als 'indian_military.svg'
   Größe: 1900 × 1300 Pixel
   Öffne die Datei im Browser
Das generierte SVG zeigt die vollständige Hierarchie von Indian Army bis zu den Regimentern.

🔧 Anpassungen und Erweiterungen
Eigene Daten hinzufügen
Namen in der SQL-Datei ändern - öffne einfach schema_indian_army.sql und bearbeite die INSERT-Statements:

sql
USE indian_military_database;

-- Neue Einheit hinzufügen
INSERT INTO einheiten (name, typ, ebene, uebergeordnete_einheit_id, standort) 
VALUES ('5 Maratha Light Infantry', 'Regiment', 5, 13, 'Belgaum');

-- Namen ändern
UPDATE einheiten SET name = 'Neuer Name' WHERE id = 17;
Weitere Personen und Positionen
sql
-- Neue Person
INSERT INTO personen (vorname, nachname, dienstgrad_id, aktiv) 
VALUES ('Karan', 'Singh', 8, 1);

-- Position zuweisen
INSERT INTO positionen (bezeichnung, einheit_id, person_id, von_datum, ist_kommandant) 
VALUES ('Commanding Officer 5 Maratha LI', 26, 11, '2024-01-01', 1);
📈 Datenmodell-Details
Hierarchie-Ebenen
Ebene	Typ	Beispiele
1	Oberkommando	Indian Army
2	Command	Northern Command, Western Command
3	Corps	1 Corps, 2 Corps
4	Division	1st Armoured Division, 2nd Infantry Division
5	Regiment	43 Armoured Regiment, 1 Rajput Regiment
Command-Struktur
Die Indian Army ist in 7 Commands unterteilt:

Northern Command (Udhampur)
Western Command (Chandimandir)
Eastern Command (Kolkata)
Southern Command (Pune)
Central Command (Lucknow)
South Western Command
Army Training Command
🛠️ Technische Details
Sprache: Python 3.8+
Datenbank: MySQL 8.0+ (UTF-8 mb4)
Libraries:
mysql-connector-python: Datenbankverbindung
Features:
Rekursive Hierarchieabfragen mit CTEs
Selbstreferenzielle Tabellenstruktur
SVG-Generierung mit Indian Army Farben (Orange, Grün, Blau)
Automatische Skalierung basierend auf Hierarchiegröße
📚 Beispieldaten
Die Datenbank enthält:

25 Einheiten (von Indian Army bis zu Regimentern)
10 Dienstgrade (Field Marshal bis Lieutenant)
10 Personen mit aktiven Positionen
10 Positionen inkl. Chief of Army Staff
9 Kommandostrukturen
🎨 SVG-Farben
Das Organigramm verwendet Farben inspiriert von der indischen Flagge:

Orange (#FF9933): Oberkommando
Grün (#138808): Commands
Blau (#000080): Corps
Hellblau: Divisionen und Regimenter
🔍 Häufige Probleme
Verbindungsfehler
Fehler bei der Verbindung: Access denied for user 'root'@'localhost'
Lösung: Überprüfe Benutzername und Passwort in der config

Datenbank existiert nicht
Lösung: Führe schema_indian_army.sql aus:

bash
mysql -u root -p < schema_indian_army.sql
Python-Modul fehlt
bash
pip install mysql-connector-python
📝 Lizenz
Dieses Projekt dient zu Bildungszwecken.

📌 Hinweise
Die Struktur basiert auf der Organisation der Indian Army (Stand 2024). Die Daten sind vereinfacht und dienen als Beispiel für die Modellierung militärischer Hierarchien.

Stand: November 2025

