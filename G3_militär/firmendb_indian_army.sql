-- Datenbank erstellen
CREATE DATABASE IF NOT EXISTS firmendb;
USE firmendb;

-- Tabelle Gehaltsstufen
CREATE TABLE g_gehaltsstufen (
    g_stufe INT PRIMARY KEY,
    g_von DECIMAL(10,2),
    g_bis DECIMAL(10,2)
);

-- Tabelle Abteilungen
CREATE TABLE a_abteilungen (
    a_abtid INT PRIMARY KEY,
    a_name VARCHAR(100) NOT NULL,
    a_m_abtleiter INT,
    a_abteilungsleitername VARCHAR(100)
);

-- Tabelle Mitarbeiter
CREATE TABLE m_mitarbeiter (
    m_mitarbnr INT PRIMARY KEY,
    m_fanname VARCHAR(50) NOT NULL,
    m_vorname VARCHAR(50) NOT NULL,
    m_gebdat DATE,
    m_gehalt DECIMAL(10,2),
    m_a_abteilung INT,
    FOREIGN KEY (m_a_abteilung) REFERENCES a_abteilungen(a_abtid)
);

-- Fremdschlüssel für Abteilungsleiter nachträglich hinzufügen
ALTER TABLE a_abteilungen 
ADD FOREIGN KEY (a_m_abtleiter) REFERENCES m_mitarbeiter(m_mitarbnr);

-- Tabelle Projekte
CREATE TABLE p_projekte (
    p_projektnr INT PRIMARY KEY,
    p_projektname VARCHAR(100) NOT NULL,
    p_m_manager INT,
    p_projektstart DATE,
    p_budget DECIMAL(15,2),
    FOREIGN KEY (p_m_manager) REFERENCES m_mitarbeiter(m_mitarbnr)
);

-- Tabelle Mitarbeiter-Abteilungen-Historie
CREATE TABLE ma_mitarbabbhistorisch (
    ma_a_abtid INT,
    ma_m_mitarbnr INT,
    ma_bis DATE,
    PRIMARY KEY (ma_a_abtid, ma_m_mitarbnr),
    FOREIGN KEY (ma_a_abtid) REFERENCES a_abteilungen(a_abtid),
    FOREIGN KEY (ma_m_mitarbnr) REFERENCES m_mitarbeiter(m_mitarbnr)
);

-- Tabelle Abteilungs-Projekt-Zuordnung
CREATE TABLE ap_abtverantwproj (
    ap_a_abtid INT,
    ap_p_projnr INT,
    ap_projektname VARCHAR(100),
    ap_abteilungsname VARCHAR(100),
    PRIMARY KEY (ap_a_abtid, ap_p_projnr),
    FOREIGN KEY (ap_a_abtid) REFERENCES a_abteilungen(a_abtid),
    FOREIGN KEY (ap_p_projnr) REFERENCES p_projekte(p_projektnr)
);