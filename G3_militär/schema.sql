-- schema.sql - MySQL compatible
DROP TABLE IF EXISTS `unit`;
DROP TABLE IF EXISTS `country`;

CREATE TABLE `country` (
  id INT PRIMARY KEY,
  code VARCHAR(10) NOT NULL,
  name VARCHAR(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE `unit` (
  id INT PRIMARY KEY,
  country_id INT NOT NULL,
  name VARCHAR(200) NOT NULL,
  parent_id INT DEFAULT NULL,
  level INT NOT NULL,
  role VARCHAR(100),
  FOREIGN KEY (country_id) REFERENCES country(id) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

INSERT INTO country (id, code, name) VALUES
(3, 'IND', 'India');

-- Full India military structure (simplified, educational)
INSERT INTO unit (id,country_id,name,parent_id,level,role) VALUES
(301, 3, 'Integrated Defence Headquarters', NULL, 1, 'High Command'),
(302, 3, 'Chief of Defence Staff (CDS)', 301, 2, 'Supreme Commander'),
(303, 3, 'Department of Military Affairs', 302, 3, 'Planning & Coordination'),
(304, 3, 'Defence Intelligence Agency', 302, 3, 'Intelligence'),
(305, 3, 'Indian Army', 301, 2, 'Land Forces'),
(306, 3, 'Northern Command – Udhampur', 305, 3, 'Army Command'),
(307, 3, 'Eastern Command – Kolkata', 305, 3, 'Army Command'),
(308, 3, 'Southern Command – Pune', 305, 3, 'Army Command'),
(309, 3, 'Western Command – Chandigarh', 305, 3, 'Army Command'),
(310, 3, 'Indian Navy', 301, 2, 'Naval Forces'),
(311, 3, 'Western Naval Command – Mumbai', 310, 3, 'Navy Command'),
(312, 3, 'Eastern Naval Command – Visakhapatnam', 310, 3, 'Navy Command'),
(313, 3, 'Southern Naval Command – Kochi', 310, 3, 'Navy Command'),
(314, 3, 'Indian Air Force', 301, 2, 'Air Forces'),
(315, 3, 'Western Air Command – Delhi', 314, 3, 'Air Command'),
(316, 3, 'Eastern Air Command – Shillong', 314, 3, 'Air Command'),
(317, 3, 'Southern Air Command – Trivandrum', 314, 3, 'Air Command'),
(318, 3, 'Andaman & Nicobar Command – Port Blair', 301, 2, 'Joint Command'),
(319, 3, 'Strategic Forces Command – Delhi', 301, 2, 'Strategic Command'),
(320, 3, 'Cyber Command – Delhi', 301, 2, 'Cyber Defence');
