-- database: ../runtime/db/starwars.db
-- Practical 7: Updating and Deleting Data
-- Student Name: Dylan Cooper
-- Date: 18/12/25
--
-- This script demonstrates UPDATE and DELETE operations
--
-- WARNING: Always use WHERE with UPDATE and DELETE!

-- First, check current data
SELECT id, name, affiliation FROM characters WHERE name = 'R2-D2';
-- Update R2-D2's affiliation
UPDATE characters
SET affiliation = 'Rebel Alliance'
WHERE name = 'R2-D2';
-- Verify the change
SELECT id, name, affiliation FROM characters WHERE name = 'R2-D2';
-- Update multiple columns at once
UPDATE characters
SET species = 'Human (Cyborg)',
affiliation = 'Galactic Empire'
WHERE id = 'Darth Vader';
-- Verify
SELECT name, species, affiliation FROM characters WHERE id = 6;
-- Update all droids to a new affiliation
UPDATE characters
SET affiliation = 'No Affiliation'
WHERE species = 'Droid';
-- Check how many were updated
SELECT name, species, affiliation FROM characters WHERE species = 'Droid';
-- Add 5 cm to everyone's height (growth spurt!)
UPDATE characters
SET height = height + 5
WHERE height IS NOT NULL;
-- View updated heights
SELECT name, height FROM characters ORDER BY height;
-- Update affiliations based on species
UPDATE characters
SET affiliation = CASE
WHEN species = 'Droid' THEN 'No Affiliation'
WHEN species = 'Wookiee' THEN 'Rebel Alliance'
WHEN species LIKE '%Jedi%' OR name LIKE '%Obi-Wan%' THEN 'Jedi Order'
ELSE affiliation
END;
-- View results
SELECT name, species, affiliation FROM characters ORDER BY species;
-- First, check which record you're targeting
SELECT * FROM characters WHERE name = 'Fives';
-- Delete the record
DELETE FROM character_vehicles WHERE character_id = 9;
DELETE FROM characters WHERE id = 9;
SELECT * FROM characters INNER JOIN character_vehicles ON characters.id = character_vehicles.vehicle_id;
SELECT * FROM characters;
-- Let's add a test character first
INSERT INTO characters (name, species, homeworld) VALUES ('Temporary',
'Test', 'Nowhere');
-- Verify it exists
SELECT * FROM characters WHERE name = 'Temporary';
-- Delete it
DELETE FROM characters
WHERE name = 'Temporary' AND species = 'Test';
-- Confirm deletion
SELECT * FROM characters WHERE name = 'Temporary';
-- Try to insert a character without a name (should fail with NOT NULL)
INSERT INTO characters (species, homeworld) VALUES ('Human', 'Earth');
-- Try to set height to negative (if CHECK constraint exists)
UPDATE characters SET height = -100 WHERE name = 'Yoda';
PRAGMA foreign_keys = ON;

-- Try to reference a planet that doesn't exist
UPDATE characters
SET homeworld_id = 1
WHERE name = 'Luke Skywalker';
-- Start a transaction
BEGIN TRANSACTION;
-- Make changes
UPDATE characters SET affiliation = 'Test' WHERE species = 'Human';
UPDATE characters SET height = height * 2 WHERE species = 'Human';
-- Check the changes
SELECT name, affiliation, height FROM characters WHERE species = 'Human';
-- If happy with changes: COMMIT
-- If not happy: ROLLBACK
-- For this practice, let's undo:
ROLLBACK;
-- Verify rollback worked
SELECT name, affiliation, height FROM characters WHERE species = 'Human';
-- Exercise 1: Add 10 years to Yoda's experience
-- (We'll pretend height represents experience level for this exercise)
-- Step 1: Check current value
SELECT name, height FROM characters WHERE name = 'Yoda';
-- Step 2: Update
UPDATE characters
SET height = height + 10
WHERE name = 'Yoda';
-- Step 3: Verify
SELECT name, height FROM characters WHERE name = 'Yoda';
-- Exercise 2: Update all characters from Tatooine to be affiliated with 'Desert Natives'
UPDATE characters
SET affiliation = 'Desert Natives'
WHERE homeworld_id = (SELECT id FROM planets WHERE name = 'Tatooine');
-- Verify
SELECT c.name, p.name AS homeworld, c.affiliation
FROM characters c
JOIN planets p ON c.homeworld_id = p.id
WHERE p.name = 'Tatooine';
-- Exercise 3: Add and then delete a test character
-- Add test character
INSERT INTO characters (name, species, homeworld) VALUES ('Test Delete',
'Test', 'Nowhere');
-- Verify it exists
SELECT * FROM characters WHERE name = 'Test Delete';
-- Delete it
DELETE FROM characters WHERE name = 'Test Delete';
-- Confirm deletion
SELECT * FROM characters WHERE name = 'Test Delete';