-- database: ../runtime/db/starwars.db
-- Practical 1: Datbases and Tables
-- Student Name: Dylan Cooper
-- Date: 10/12/25
--
-- This script creates the Star Wars characters database


-- Create the characters table
CREATE TABLE IF NOT EXISTS characters (
id INTEGER PRIMARY KEY AUTOINCREMENT,
name TEXT NOT NULL,
species TEXT,
homeworld TEXT
);

-- Insert Star Wars characters
INSERT INTO characters (name, species, homeworld) VALUES
('Luke Skywalker', 'Human', 'Tatooine'),
('Leia Organa', 'Human', 'Alderaan'),
('Han Solo', 'Human', 'Corellia'),
('Chewbacca', 'Wookiee', 'Kashyyyk'),
('Obi-Wan Kenobi', 'Human', 'Stewjon'),
('Darth Vader', 'Human', 'Tatooine'),
('Yoda', 'Yoda''s species', 'Unknown'),
('R2-D2', 'Droid', 'Naboo');
-- View all characters
SELECT * FROM characters;
-- Additional characters (Practice Exercise)
INSERT INTO characters (name, species, homeworld) VALUES
('Fives', 'Clone', 'Kamino'),
('Rex', 'Clone', 'Kamino'),
('Hunter', 'Clone', 'Kamino');

