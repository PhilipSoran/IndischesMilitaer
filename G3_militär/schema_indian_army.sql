-- Datenbank neu erstellen
DROP DATABASE IF EXISTS indian_military_database;
CREATE DATABASE indian_military_database CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE indian_military_database;

SET FOREIGN_KEY_CHECKS = 0;
DROP TABLE IF EXISTS kommandostrukturen;
DROP TABLE IF EXISTS positionen;
DROP TABLE IF EXISTS personen;
DROP TABLE IF EXISTS einheiten;
DROP TABLE IF EXISTS dienstgrade;
SET FOREIGN_KEY_CHECKS = 1;

-- Dienstgrade
CREATE TABLE dienstgrade (
    id INT AUTO_INCREMENT PRIMARY KEY,
    rang VARCHAR(50) NOT NULL UNIQUE,
    kategorie VARCHAR(30) NOT NULL,
    rang_nr INT NOT NULL
) ENGINE=InnoDB;

-- Einheiten
CREATE TABLE einheiten (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    typ VARCHAR(50) NOT NULL,
    ebene INT NOT NULL,
    uebergeordnete_einheit_id INT NULL,
    standort VARCHAR(100),
    FOREIGN KEY (uebergeordnete_einheit_id) REFERENCES einheiten(id) ON DELETE SET NULL
) ENGINE=InnoDB;

-- Personen
CREATE TABLE personen (
    id INT AUTO_INCREMENT PRIMARY KEY,
    vorname VARCHAR(50) NOT NULL,
    nachname VARCHAR(50) NOT NULL,
    dienstgrad_id INT NOT NULL,
    aktiv BOOLEAN DEFAULT 1,
    FOREIGN KEY (dienstgrad_id) REFERENCES dienstgrade(id) ON DELETE RESTRICT
) ENGINE=InnoDB;

-- Positionen
CREATE TABLE positionen (
    id INT AUTO_INCREMENT PRIMARY KEY,
    bezeichnung VARCHAR(100) NOT NULL,
    einheit_id INT NOT NULL,
    person_id INT NULL,
    von_datum DATE,
    bis_datum DATE,
    ist_kommandant BOOLEAN DEFAULT 0,
    FOREIGN KEY (einheit_id) REFERENCES einheiten(id) ON DELETE CASCADE,
    FOREIGN KEY (person_id) REFERENCES personen(id) ON DELETE SET NULL
) ENGINE=InnoDB;

-- Kommandostrukturen
CREATE TABLE kommandostrukturen (
    id INT AUTO_INCREMENT PRIMARY KEY,
    vorgesetzte_position_id INT NOT NULL,
    untergebene_position_id INT NOT NULL,
    beziehungstyp VARCHAR(50) DEFAULT 'direkt',
    FOREIGN KEY (vorgesetzte_position_id) REFERENCES positionen(id) ON DELETE CASCADE,
    FOREIGN KEY (untergebene_position_id) REFERENCES positionen(id) ON DELETE CASCADE
) ENGINE=InnoDB;

-- Indizes
CREATE INDEX idx_einheiten_ebene ON einheiten(ebene);
CREATE INDEX idx_einheiten_uebergeordnet ON einheiten(uebergeordnete_einheit_id);

-- Dienstgrade befüllen
INSERT INTO dienstgrade (rang, kategorie, rang_nr) VALUES
('Field Marshal', 'Höhere Stabsoffiziere', 1),
('General', 'Höhere Stabsoffiziere', 2),
('Lieutenant General', 'Höhere Stabsoffiziere', 3),
('Major General', 'Höhere Stabsoffiziere', 4),
('Brigadier', 'Höhere Stabsoffiziere', 5),
('Colonel', 'Stabsoffiziere', 6),
('Lieutenant Colonel', 'Stabsoffiziere', 7),
('Major', 'Stabsoffiziere', 8),
('Captain', 'Subalternoffiziere', 9),
('Lieutenant', 'Subalternoffiziere', 10);

-- Einheitenhierarchie
INSERT INTO einheiten (name, typ, ebene, uebergeordnete_einheit_id, standort) VALUES
('Army Headquarters', 'Oberkommando', 1, NULL, 'New Delhi'),
('Northern Command', 'Kommando', 2, 1, 'Udhampur'),
('Western Command', 'Kommando', 2, 1, 'Chandimandir'),
('Eastern Command', 'Kommando', 2, 1, 'Kolkata'),
('Southern Command', 'Kommando', 2, 1, 'Pune'),
('Central Command', 'Kommando', 2, 1, 'Lucknow');

-- Personen
INSERT INTO personen (vorname, nachname, dienstgrad_id, aktiv) VALUES
('Manoj', 'Pande', 2, 1),
('Anil', 'Chauhan', 3, 1);

-- Positionen
INSERT INTO positionen (bezeichnung, einheit_id, person_id, von_datum, ist_kommandant) VALUES
('Chief of Army Staff', 1, 1, '2023-01-01', 1),
('Vice Chief of Army Staff', 1, 2, '2022-02-01', 1);

-- Kommandostrukturen
INSERT INTO kommandostrukturen (vorgesetzte_position_id, untergebene_position_id, beziehungstyp) VALUES
(1, 2, 'direkt');
