-- Seed teacher -> gyms mapping.
-- This uses Teacher.gyms (text[]) as a "list of locations" per teacher.
--
-- Notes:
-- - Gym names here are ASCII-normalized on purpose (admin can rename later from the UI).
-- - Teachers are matched by DNI via User.dni to avoid name/encoding mismatches.

BEGIN;

-- Needed for gen_random_uuid() (used by our migrations too).
CREATE EXTENSION IF NOT EXISTS pgcrypto;

-- 1) Ensure gyms exist in the Gym catalog (used by students/attendance filters).
INSERT INTO "Gym" ("id", "name", "createdAt", "updatedAt")
VALUES
  (gen_random_uuid()::text, 'Colegio Goretti', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP),
  (gen_random_uuid()::text, 'Salon Guillermo Nunez', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP),
  (gen_random_uuid()::text, 'Casa Espana', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP),
  (gen_random_uuid()::text, 'Club Obras', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP),
  (gen_random_uuid()::text, 'Centro Civico Palmira', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP),
  (gen_random_uuid()::text, 'Mambo', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP),
  (gen_random_uuid()::text, 'En Ritmo', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP),
  (gen_random_uuid()::text, 'Salon GC', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP),
  (gen_random_uuid()::text, 'Colegio Sagrado Corazon', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP),
  (gen_random_uuid()::text, 'Club Guaymallen', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP),
  (gen_random_uuid()::text, 'Centro de Jubilados Flor de Cuyo', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP),
  (gen_random_uuid()::text, 'Maristas', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP),
  (gen_random_uuid()::text, 'Sociedad Libanesa', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP),
  (gen_random_uuid()::text, 'Latin Gym', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP),
  (gen_random_uuid()::text, 'Hello Gym', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP),
  (gen_random_uuid()::text, 'Salon Comunitario', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP),
  (gen_random_uuid()::text, 'Volatil', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP),
  (gen_random_uuid()::text, 'Colegio San Pablo', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP),
  (gen_random_uuid()::text, 'Club Trebol', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP),
  (gen_random_uuid()::text, 'Sociedad Espanola', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP),
  (gen_random_uuid()::text, 'Academia Cataluna', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP),
  (gen_random_uuid()::text, 'Union Vecinal Villa Franscisca', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP),
  (gen_random_uuid()::text, 'Club Vistalba', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP),
  (gen_random_uuid()::text, 'CRYDAA', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP),
  (gen_random_uuid()::text, 'Club Tres Acequias', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP),
  (gen_random_uuid()::text, 'Salon Soeva', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP),
  (gen_random_uuid()::text, 'Cultural Palmira', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP),
  (gen_random_uuid()::text, 'Bosco GYM', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP),
  (gen_random_uuid()::text, 'Centro Jubilados Barriales', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP),
  (gen_random_uuid()::text, 'Conexion', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP),
  (gen_random_uuid()::text, 'Russel', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP),
  (gen_random_uuid()::text, 'Club Amuppetrol', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP),
  (gen_random_uuid()::text, 'Club Olimpia', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP),
  (gen_random_uuid()::text, 'Union Vecinal Amupe 2', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP),
  (gen_random_uuid()::text, 'Centro Jubilados 29 de Febrero', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP),
  (gen_random_uuid()::text, 'Centro Cultural 34', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP),
  (gen_random_uuid()::text, 'Frappe', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP),
  (gen_random_uuid()::text, 'Salon Nalon', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP),
  (gen_random_uuid()::text, 'Trading 73', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP),
  (gen_random_uuid()::text, 'El Jarillal', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP),
  (gen_random_uuid()::text, 'Las Margaritas Eventos', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP),
  (gen_random_uuid()::text, '0km', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP),
  (gen_random_uuid()::text, 'Union Vecinal Barrio Parque', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP),
  (gen_random_uuid()::text, 'Hola Buenos Momentos', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP),
  (gen_random_uuid()::text, 'Salon Barrio Jardin', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP),
  (gen_random_uuid()::text, 'SUM Barrio Los Olivos', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP)
ON CONFLICT ("name") DO NOTHING;

-- 2) Update Teacher.gyms list per teacher (matched by user DNI).
-- Javier Rocamora (25034785)
UPDATE "Teacher" t
SET "gyms" = ARRAY['Colegio Goretti']::text[]
FROM "User" u
WHERE u."id" = t."userId" AND u."dni" = '25034785';

-- Carina Aguero (23184735)
UPDATE "Teacher" t
SET "gyms" = ARRAY['Salon Guillermo Nunez']::text[]
FROM "User" u
WHERE u."id" = t."userId" AND u."dni" = '23184735';

-- Daniel Dierna (23832541)
UPDATE "Teacher" t
SET "gyms" = ARRAY['Casa Espana']::text[]
FROM "User" u
WHERE u."id" = t."userId" AND u."dni" = '23832541';

-- Lautaro Rocamora (42421850)
UPDATE "Teacher" t
SET "gyms" = ARRAY['Club Obras','Centro Civico Palmira','Mambo']::text[]
FROM "User" u
WHERE u."id" = t."userId" AND u."dni" = '42421850';

-- Laura Castellanos (44009872)
UPDATE "Teacher" t
SET "gyms" = ARRAY['En Ritmo','Salon GC','Colegio Sagrado Corazon']::text[]
FROM "User" u
WHERE u."id" = t."userId" AND u."dni" = '44009872';

-- Pedro Rocamora (45718997)
UPDATE "Teacher" t
SET "gyms" = ARRAY['Club Guaymallen','Centro de Jubilados Flor de Cuyo','Maristas']::text[]
FROM "User" u
WHERE u."id" = t."userId" AND u."dni" = '45718997';

-- Ignacio Cornejo (44139436)
UPDATE "Teacher" t
SET "gyms" = ARRAY['Sociedad Libanesa','Latin Gym','Hello Gym','Salon Comunitario']::text[]
FROM "User" u
WHERE u."id" = t."userId" AND u."dni" = '44139436';

-- Emiliano Gomez (48471671)
UPDATE "Teacher" t
SET "gyms" = ARRAY['Volatil','Colegio San Pablo']::text[]
FROM "User" u
WHERE u."id" = t."userId" AND u."dni" = '48471671';

-- Federico Mamani (43831454)
UPDATE "Teacher" t
SET "gyms" = ARRAY['Club Trebol','Sociedad Espanola','Academia Cataluna']::text[]
FROM "User" u
WHERE u."id" = t."userId" AND u."dni" = '43831454';

-- Nicolas Epifani (46618241)
UPDATE "Teacher" t
SET "gyms" = ARRAY['Union Vecinal Villa Franscisca','Club Vistalba','CRYDAA']::text[]
FROM "User" u
WHERE u."id" = t."userId" AND u."dni" = '46618241';

-- Lucia Genaulas (48052184)
UPDATE "Teacher" t
SET "gyms" = ARRAY['Club Tres Acequias']::text[]
FROM "User" u
WHERE u."id" = t."userId" AND u."dni" = '48052184';

-- Javier Barrozo (45256482)
UPDATE "Teacher" t
SET "gyms" = ARRAY['Salon Soeva','Cultural Palmira','Bosco GYM','Centro Jubilados Barriales']::text[]
FROM "User" u
WHERE u."id" = t."userId" AND u."dni" = '45256482';

-- Agustina Obredor (45724004)
UPDATE "Teacher" t
SET "gyms" = ARRAY['Conexion','Russel','Club Amuppetrol','Sociedad Espanola','Club Olimpia']::text[]
FROM "User" u
WHERE u."id" = t."userId" AND u."dni" = '45724004';

-- Leonardo Obredor (36513578)
UPDATE "Teacher" t
SET "gyms" = ARRAY['Sociedad Espanola','Union Vecinal Amupe 2']::text[]
FROM "User" u
WHERE u."id" = t."userId" AND u."dni" = '36513578';

-- Sara Serrano (45717540)
UPDATE "Teacher" t
SET "gyms" = ARRAY['Centro Jubilados 29 de Febrero','Centro Cultural 34','Frappe','Salon Nalon']::text[]
FROM "User" u
WHERE u."id" = t."userId" AND u."dni" = '45717540';

-- Leonel Sosa (48077697)
UPDATE "Teacher" t
SET "gyms" = ARRAY['Trading 73']::text[]
FROM "User" u
WHERE u."id" = t."userId" AND u."dni" = '48077697';

-- Benjamin Luzuriaga (47611267)
UPDATE "Teacher" t
SET "gyms" = ARRAY['El Jarillal','Las Margaritas Eventos','0km']::text[]
FROM "User" u
WHERE u."id" = t."userId" AND u."dni" = '47611267';

-- Pablo Munoz (48076512)
UPDATE "Teacher" t
SET "gyms" = ARRAY['Union Vecinal Barrio Parque']::text[]
FROM "User" u
WHERE u."id" = t."userId" AND u."dni" = '48076512';

-- Patricia Ramos (24442147)
UPDATE "Teacher" t
SET "gyms" = ARRAY['Hola Buenos Momentos','Salon Barrio Jardin']::text[]
FROM "User" u
WHERE u."id" = t."userId" AND u."dni" = '24442147';

-- Alma Vargas (48607535)
UPDATE "Teacher" t
SET "gyms" = ARRAY['SUM Barrio Los Olivos']::text[]
FROM "User" u
WHERE u."id" = t."userId" AND u."dni" = '48607535';

COMMIT;

-- Optional sanity check:
-- SELECT u."dni", t."firstName", t."lastName", t."gyms"
-- FROM "Teacher" t
-- JOIN "User" u ON u."id" = t."userId"
-- WHERE u."dni" IN (
--   '25034785','23184735','23832541','42421850','44009872','45718997','44139436',
--   '48471671','43831454','46618241','48052184','45256482','45724004','36513578',
--   '45717540','48077697','47611267','48076512','24442147','48607535'
-- )
-- ORDER BY u."dni";
