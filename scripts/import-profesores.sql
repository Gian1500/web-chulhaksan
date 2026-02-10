-- Auto-generated import for profesores
BEGIN;
CREATE EXTENSION IF NOT EXISTS pgcrypto;
WITH u AS (
  INSERT INTO "User" ("id", "dni", "passwordHash", "role", "status", "mustChangePassword", "createdAt", "updatedAt")
  VALUES ('c5bdc88e-eed9-4e2e-a29d-ea43c990c87f', '25034785', '$2a$10$uIqhJD7sdT6PCUyJdbjnp.U2vSWdb3WEb/M8ZYtSlkAMzA8jsTJX2', 'TEACHER', 'ACTIVE', true, NOW(), NOW())
  ON CONFLICT ("dni") DO NOTHING
  RETURNING "id"
)
INSERT INTO "Teacher" ("id", "userId", "firstName", "lastName", "phone", "email", "birthDate", "address", "gyms", "createdAt", "updatedAt")
SELECT gen_random_uuid(), COALESCE((SELECT "id" FROM u), (SELECT "id" FROM "User" WHERE "dni" = '25034785')), 'Javier', 'Rocamora', NULL, NULL, NULL, NULL, ARRAY[]::text[], NOW(), NOW()
ON CONFLICT ("userId") DO NOTHING;

WITH u AS (
  INSERT INTO "User" ("id", "dni", "passwordHash", "role", "status", "mustChangePassword", "createdAt", "updatedAt")
  VALUES ('460dc9f7-145c-4d11-b077-ca4fdb125335', '23184735', '$2a$10$IjXKr/ofhyVdUXmT/cNCNe1WCFph/jis3HUd2FX2bU8wSz0jEyapq', 'TEACHER', 'ACTIVE', true, NOW(), NOW())
  ON CONFLICT ("dni") DO NOTHING
  RETURNING "id"
)
INSERT INTO "Teacher" ("id", "userId", "firstName", "lastName", "phone", "email", "birthDate", "address", "gyms", "createdAt", "updatedAt")
SELECT gen_random_uuid(), COALESCE((SELECT "id" FROM u), (SELECT "id" FROM "User" WHERE "dni" = '23184735')), 'Carina', 'Agüero', NULL, NULL, NULL, NULL, ARRAY[]::text[], NOW(), NOW()
ON CONFLICT ("userId") DO NOTHING;

WITH u AS (
  INSERT INTO "User" ("id", "dni", "passwordHash", "role", "status", "mustChangePassword", "createdAt", "updatedAt")
  VALUES ('e81e4e20-a062-42c3-ad14-6c585f0bd180', '42421850', '$2a$10$NRup4f7OIVNAA/Bc7WvzXeF0BWfs0kVGcavPFlgPBeSOB3DrYr.72', 'TEACHER', 'ACTIVE', true, NOW(), NOW())
  ON CONFLICT ("dni") DO NOTHING
  RETURNING "id"
)
INSERT INTO "Teacher" ("id", "userId", "firstName", "lastName", "phone", "email", "birthDate", "address", "gyms", "createdAt", "updatedAt")
SELECT gen_random_uuid(), COALESCE((SELECT "id" FROM u), (SELECT "id" FROM "User" WHERE "dni" = '42421850')), 'Lautaro', 'Rocamora', NULL, NULL, NULL, NULL, ARRAY[]::text[], NOW(), NOW()
ON CONFLICT ("userId") DO NOTHING;

WITH u AS (
  INSERT INTO "User" ("id", "dni", "passwordHash", "role", "status", "mustChangePassword", "createdAt", "updatedAt")
  VALUES ('80f69af6-14ab-40e3-9a2c-02b0a38259bf', '23832541', '$2a$10$Fp8dl.fnydqGuXYV5WKhMOgV.yfA3VBNIwtwKtf/rrl7fBRcwxQLS', 'TEACHER', 'ACTIVE', true, NOW(), NOW())
  ON CONFLICT ("dni") DO NOTHING
  RETURNING "id"
)
INSERT INTO "Teacher" ("id", "userId", "firstName", "lastName", "phone", "email", "birthDate", "address", "gyms", "createdAt", "updatedAt")
SELECT gen_random_uuid(), COALESCE((SELECT "id" FROM u), (SELECT "id" FROM "User" WHERE "dni" = '23832541')), 'Daniel', 'Dierna', NULL, NULL, NULL, NULL, ARRAY[]::text[], NOW(), NOW()
ON CONFLICT ("userId") DO NOTHING;

WITH u AS (
  INSERT INTO "User" ("id", "dni", "passwordHash", "role", "status", "mustChangePassword", "createdAt", "updatedAt")
  VALUES ('2e91087f-bb7e-4cfe-afde-213d8371b764', '44009872', '$2a$10$7SzQiaUzlkKGm6qWOUsoAO3JgLZDBtHcwO.WvYno31fUZhrLFeEhK', 'TEACHER', 'ACTIVE', true, NOW(), NOW())
  ON CONFLICT ("dni") DO NOTHING
  RETURNING "id"
)
INSERT INTO "Teacher" ("id", "userId", "firstName", "lastName", "phone", "email", "birthDate", "address", "gyms", "createdAt", "updatedAt")
SELECT gen_random_uuid(), COALESCE((SELECT "id" FROM u), (SELECT "id" FROM "User" WHERE "dni" = '44009872')), 'Laura', 'Castellanos', NULL, 'mlauracastel@gmail.com', NULL, NULL, ARRAY[]::text[], NOW(), NOW()
ON CONFLICT ("userId") DO NOTHING;

WITH u AS (
  INSERT INTO "User" ("id", "dni", "passwordHash", "role", "status", "mustChangePassword", "createdAt", "updatedAt")
  VALUES ('ac7dd8da-f4f0-43be-a01b-dcff2f455255', '44139436', '$2a$10$QW6VJGAYcI.Nz0zisi0PPOpe6WdGUQmhalSa0TcNxdrDVGfLem8Am', 'TEACHER', 'ACTIVE', true, NOW(), NOW())
  ON CONFLICT ("dni") DO NOTHING
  RETURNING "id"
)
INSERT INTO "Teacher" ("id", "userId", "firstName", "lastName", "phone", "email", "birthDate", "address", "gyms", "createdAt", "updatedAt")
SELECT gen_random_uuid(), COALESCE((SELECT "id" FROM u), (SELECT "id" FROM "User" WHERE "dni" = '44139436')), 'Ignacio', 'Cornejo', NULL, 'ignacio.cornejo.01.f@gmail.com', NULL, NULL, ARRAY[]::text[], NOW(), NOW()
ON CONFLICT ("userId") DO NOTHING;

WITH u AS (
  INSERT INTO "User" ("id", "dni", "passwordHash", "role", "status", "mustChangePassword", "createdAt", "updatedAt")
  VALUES ('94bc3b8c-aa77-4d36-aaf7-e326cd72cd90', '45718997', '$2a$10$cru/0phWf2BUwxhYj2C8Ue.x7DD4OdpUR89DujQGvmE6azaSA4jXO', 'TEACHER', 'ACTIVE', true, NOW(), NOW())
  ON CONFLICT ("dni") DO NOTHING
  RETURNING "id"
)
INSERT INTO "Teacher" ("id", "userId", "firstName", "lastName", "phone", "email", "birthDate", "address", "gyms", "createdAt", "updatedAt")
SELECT gen_random_uuid(), COALESCE((SELECT "id" FROM u), (SELECT "id" FROM "User" WHERE "dni" = '45718997')), 'Pedro', 'Rocamora', NULL, 'pedrito1rocamora@gmail.com', NULL, NULL, ARRAY[]::text[], NOW(), NOW()
ON CONFLICT ("userId") DO NOTHING;

WITH u AS (
  INSERT INTO "User" ("id", "dni", "passwordHash", "role", "status", "mustChangePassword", "createdAt", "updatedAt")
  VALUES ('45d8e0f6-fa80-4e74-90a3-35923933181f', '48471671', '$2a$10$BsuSDwYoyWm81q.fYl2LlOTADTocXLoBP2ix1QUA09nvXgahKvH.G', 'TEACHER', 'ACTIVE', true, NOW(), NOW())
  ON CONFLICT ("dni") DO NOTHING
  RETURNING "id"
)
INSERT INTO "Teacher" ("id", "userId", "firstName", "lastName", "phone", "email", "birthDate", "address", "gyms", "createdAt", "updatedAt")
SELECT gen_random_uuid(), COALESCE((SELECT "id" FROM u), (SELECT "id" FROM "User" WHERE "dni" = '48471671')), 'Emiliano', 'Gomez', NULL, 'emilianomartingomez277@gmail.com', NULL, NULL, ARRAY[]::text[], NOW(), NOW()
ON CONFLICT ("userId") DO NOTHING;

WITH u AS (
  INSERT INTO "User" ("id", "dni", "passwordHash", "role", "status", "mustChangePassword", "createdAt", "updatedAt")
  VALUES ('093cdad9-583a-4c31-88c7-1be586e287dc', '43831454', '$2a$10$UVlidGVlJUQHFlGEoNIsR.pvFLCoyVgSwGETDUmPJ2HsJyvlea8A6', 'TEACHER', 'ACTIVE', true, NOW(), NOW())
  ON CONFLICT ("dni") DO NOTHING
  RETURNING "id"
)
INSERT INTO "Teacher" ("id", "userId", "firstName", "lastName", "phone", "email", "birthDate", "address", "gyms", "createdAt", "updatedAt")
SELECT gen_random_uuid(), COALESCE((SELECT "id" FROM u), (SELECT "id" FROM "User" WHERE "dni" = '43831454')), 'Federico', 'Mamaní', NULL, NULL, NULL, NULL, ARRAY[]::text[], NOW(), NOW()
ON CONFLICT ("userId") DO NOTHING;

WITH u AS (
  INSERT INTO "User" ("id", "dni", "passwordHash", "role", "status", "mustChangePassword", "createdAt", "updatedAt")
  VALUES ('c348d1f1-f72b-47ff-ae86-8e8ce7362850', '46618241', '$2a$10$sutNC9AYsr9PVxzTBBRrqu88KED7koZd4uTPdQ94I1jNjfcwp7xyy', 'TEACHER', 'ACTIVE', true, NOW(), NOW())
  ON CONFLICT ("dni") DO NOTHING
  RETURNING "id"
)
INSERT INTO "Teacher" ("id", "userId", "firstName", "lastName", "phone", "email", "birthDate", "address", "gyms", "createdAt", "updatedAt")
SELECT gen_random_uuid(), COALESCE((SELECT "id" FROM u), (SELECT "id" FROM "User" WHERE "dni" = '46618241')), 'Nicolas', 'Epifani', NULL, 'nepifanis@gmail.com', NULL, NULL, ARRAY[]::text[], NOW(), NOW()
ON CONFLICT ("userId") DO NOTHING;

WITH u AS (
  INSERT INTO "User" ("id", "dni", "passwordHash", "role", "status", "mustChangePassword", "createdAt", "updatedAt")
  VALUES ('61509266-99aa-49a9-bc3e-a634b1d4bc51', '48052184', '$2a$10$yEDmFPL2.yxHXGj4FXdPX.B0l1aacmbMiQl4HL.jAeYNSBeNnckI2', 'TEACHER', 'ACTIVE', true, NOW(), NOW())
  ON CONFLICT ("dni") DO NOTHING
  RETURNING "id"
)
INSERT INTO "Teacher" ("id", "userId", "firstName", "lastName", "phone", "email", "birthDate", "address", "gyms", "createdAt", "updatedAt")
SELECT gen_random_uuid(), COALESCE((SELECT "id" FROM u), (SELECT "id" FROM "User" WHERE "dni" = '48052184')), 'Lucia', 'Genaulas', NULL, 'lulagenaulas14@gmail.com', NULL, NULL, ARRAY[]::text[], NOW(), NOW()
ON CONFLICT ("userId") DO NOTHING;

WITH u AS (
  INSERT INTO "User" ("id", "dni", "passwordHash", "role", "status", "mustChangePassword", "createdAt", "updatedAt")
  VALUES ('8b4eb2b2-9faa-4f54-bd64-675c15a86c4c', '45256482', '$2a$10$ksl.v9L5w8vwITgKlwZupeS9y734FmTxl2TI.FLcinFAkEN3l7oDy', 'TEACHER', 'ACTIVE', true, NOW(), NOW())
  ON CONFLICT ("dni") DO NOTHING
  RETURNING "id"
)
INSERT INTO "Teacher" ("id", "userId", "firstName", "lastName", "phone", "email", "birthDate", "address", "gyms", "createdAt", "updatedAt")
SELECT gen_random_uuid(), COALESCE((SELECT "id" FROM u), (SELECT "id" FROM "User" WHERE "dni" = '45256482')), 'Javier', 'Barrozo', NULL, 'leojavibarrozo@gmail.com', NULL, NULL, ARRAY[]::text[], NOW(), NOW()
ON CONFLICT ("userId") DO NOTHING;

WITH u AS (
  INSERT INTO "User" ("id", "dni", "passwordHash", "role", "status", "mustChangePassword", "createdAt", "updatedAt")
  VALUES ('0d50ac5c-836e-47f4-91cd-af59520dcb4c', '47611267', '$2a$10$V.sDK5qWy7Phh31Y5q3RyOIRalgwXAvHtH/.R9Uq23BhGa.swUtpK', 'TEACHER', 'ACTIVE', true, NOW(), NOW())
  ON CONFLICT ("dni") DO NOTHING
  RETURNING "id"
)
INSERT INTO "Teacher" ("id", "userId", "firstName", "lastName", "phone", "email", "birthDate", "address", "gyms", "createdAt", "updatedAt")
SELECT gen_random_uuid(), COALESCE((SELECT "id" FROM u), (SELECT "id" FROM "User" WHERE "dni" = '47611267')), 'Benjamin', 'Luzuriaga', NULL, 'luzuriagabenjamin@gmail.com', NULL, NULL, ARRAY[]::text[], NOW(), NOW()
ON CONFLICT ("userId") DO NOTHING;

WITH u AS (
  INSERT INTO "User" ("id", "dni", "passwordHash", "role", "status", "mustChangePassword", "createdAt", "updatedAt")
  VALUES ('c71f500d-7490-4b8a-bbea-1bca6ba1584b', '48076512', '$2a$10$VCLmbmrLddduwUaByO6XtOOulkOqsMxy7QPfib3C0Iwa13IccsMz6', 'TEACHER', 'ACTIVE', true, NOW(), NOW())
  ON CONFLICT ("dni") DO NOTHING
  RETURNING "id"
)
INSERT INTO "Teacher" ("id", "userId", "firstName", "lastName", "phone", "email", "birthDate", "address", "gyms", "createdAt", "updatedAt")
SELECT gen_random_uuid(), COALESCE((SELECT "id" FROM u), (SELECT "id" FROM "User" WHERE "dni" = '48076512')), 'Pablo', 'Muñoz', NULL, 'pabmanmu@gmail.com', NULL, NULL, ARRAY[]::text[], NOW(), NOW()
ON CONFLICT ("userId") DO NOTHING;

WITH u AS (
  INSERT INTO "User" ("id", "dni", "passwordHash", "role", "status", "mustChangePassword", "createdAt", "updatedAt")
  VALUES ('03ab742b-2dc5-4637-8bbd-c56a2f7cff4a', '45717540', '$2a$10$Nb.JfgA84.7Mb5nvLu2f5ub9LP5IQeIK.X//mlQjImjEjbBosX3y6', 'TEACHER', 'ACTIVE', true, NOW(), NOW())
  ON CONFLICT ("dni") DO NOTHING
  RETURNING "id"
)
INSERT INTO "Teacher" ("id", "userId", "firstName", "lastName", "phone", "email", "birthDate", "address", "gyms", "createdAt", "updatedAt")
SELECT gen_random_uuid(), COALESCE((SELECT "id" FROM u), (SELECT "id" FROM "User" WHERE "dni" = '45717540')), 'Sara', 'Serrano', NULL, 'saraserrano298@gmail.com', NULL, NULL, ARRAY[]::text[], NOW(), NOW()
ON CONFLICT ("userId") DO NOTHING;

WITH u AS (
  INSERT INTO "User" ("id", "dni", "passwordHash", "role", "status", "mustChangePassword", "createdAt", "updatedAt")
  VALUES ('385534ac-da7c-4b45-bbb7-00dd6bdc53f4', '45724004', '$2a$10$yQnsTexXjqYJWLsIP1FCHeZ0HrOob/NxPHxkRNpIidB1m.NGiz44G', 'TEACHER', 'ACTIVE', true, NOW(), NOW())
  ON CONFLICT ("dni") DO NOTHING
  RETURNING "id"
)
INSERT INTO "Teacher" ("id", "userId", "firstName", "lastName", "phone", "email", "birthDate", "address", "gyms", "createdAt", "updatedAt")
SELECT gen_random_uuid(), COALESCE((SELECT "id" FROM u), (SELECT "id" FROM "User" WHERE "dni" = '45724004')), 'Agustina', 'Obredor', NULL, 'agustinaobredor9@gmail.com', NULL, NULL, ARRAY[]::text[], NOW(), NOW()
ON CONFLICT ("userId") DO NOTHING;

WITH u AS (
  INSERT INTO "User" ("id", "dni", "passwordHash", "role", "status", "mustChangePassword", "createdAt", "updatedAt")
  VALUES ('d4f2e4e9-f06e-47f6-98c3-6653f511418b', '36513578', '$2a$10$HQ4ImqfRHj27eCs.kyYW5OaA0iIGY7KBTeF9kWO..mk8sw67KAQ8C', 'TEACHER', 'ACTIVE', true, NOW(), NOW())
  ON CONFLICT ("dni") DO NOTHING
  RETURNING "id"
)
INSERT INTO "Teacher" ("id", "userId", "firstName", "lastName", "phone", "email", "birthDate", "address", "gyms", "createdAt", "updatedAt")
SELECT gen_random_uuid(), COALESCE((SELECT "id" FROM u), (SELECT "id" FROM "User" WHERE "dni" = '36513578')), 'Leonardo', 'Obredor', NULL, 'leonardoobredor91@gmail.com', NULL, NULL, ARRAY[]::text[], NOW(), NOW()
ON CONFLICT ("userId") DO NOTHING;

WITH u AS (
  INSERT INTO "User" ("id", "dni", "passwordHash", "role", "status", "mustChangePassword", "createdAt", "updatedAt")
  VALUES ('fedd90e4-2be3-446f-bfb6-d4c3f75b5b1f', '48607535', '$2a$10$h7C/ZLaZGMzjuqH0Ui9xieDPAlTYlzXVJXkNEMcNeYQNbvsRWxh6e', 'TEACHER', 'ACTIVE', true, NOW(), NOW())
  ON CONFLICT ("dni") DO NOTHING
  RETURNING "id"
)
INSERT INTO "Teacher" ("id", "userId", "firstName", "lastName", "phone", "email", "birthDate", "address", "gyms", "createdAt", "updatedAt")
SELECT gen_random_uuid(), COALESCE((SELECT "id" FROM u), (SELECT "id" FROM "User" WHERE "dni" = '48607535')), 'Alma', 'Vargas', NULL, 'almavalenvargas0901@gmail.com', NULL, NULL, ARRAY[]::text[], NOW(), NOW()
ON CONFLICT ("userId") DO NOTHING;

WITH u AS (
  INSERT INTO "User" ("id", "dni", "passwordHash", "role", "status", "mustChangePassword", "createdAt", "updatedAt")
  VALUES ('bf8d2c55-44bf-4814-9e20-8334bd370740', '24442147', '$2a$10$PV/Hjj1j0VnJeViHJD.zl.kiFoi1VnsWnnfgT/bZ0qwkZRkiO4vlW', 'TEACHER', 'ACTIVE', true, NOW(), NOW())
  ON CONFLICT ("dni") DO NOTHING
  RETURNING "id"
)
INSERT INTO "Teacher" ("id", "userId", "firstName", "lastName", "phone", "email", "birthDate", "address", "gyms", "createdAt", "updatedAt")
SELECT gen_random_uuid(), COALESCE((SELECT "id" FROM u), (SELECT "id" FROM "User" WHERE "dni" = '24442147')), 'Patricia', 'Ramos', NULL, 'patri024ramos@gmail.com', NULL, NULL, ARRAY[]::text[], NOW(), NOW()
ON CONFLICT ("userId") DO NOTHING;

WITH u AS (
  INSERT INTO "User" ("id", "dni", "passwordHash", "role", "status", "mustChangePassword", "createdAt", "updatedAt")
  VALUES ('3bb89acf-9be1-4075-8568-fd512553992e', '27496726', '$2a$10$GJmo0qLzSMe/bw84EyfMmuFe6Z5iGUgELDSAJX2DAxoYSWHUb3UpG', 'TEACHER', 'ACTIVE', true, NOW(), NOW())
  ON CONFLICT ("dni") DO NOTHING
  RETURNING "id"
)
INSERT INTO "Teacher" ("id", "userId", "firstName", "lastName", "phone", "email", "birthDate", "address", "gyms", "createdAt", "updatedAt")
SELECT gen_random_uuid(), COALESCE((SELECT "id" FROM u), (SELECT "id" FROM "User" WHERE "dni" = '27496726')), 'Carina', 'Lucero', NULL, NULL, NULL, NULL, ARRAY[]::text[], NOW(), NOW()
ON CONFLICT ("userId") DO NOTHING;

WITH u AS (
  INSERT INTO "User" ("id", "dni", "passwordHash", "role", "status", "mustChangePassword", "createdAt", "updatedAt")
  VALUES ('18654d90-c8d0-4442-ab6d-648fd1646867', '48077697', '$2a$10$Can24BV2zGcIphw8NSfqK.ZGizBASs9rNKnxBDuYK0s5QyqynT5ZO', 'TEACHER', 'ACTIVE', true, NOW(), NOW())
  ON CONFLICT ("dni") DO NOTHING
  RETURNING "id"
)
INSERT INTO "Teacher" ("id", "userId", "firstName", "lastName", "phone", "email", "birthDate", "address", "gyms", "createdAt", "updatedAt")
SELECT gen_random_uuid(), COALESCE((SELECT "id" FROM u), (SELECT "id" FROM "User" WHERE "dni" = '48077697')), 'Leonel', 'Sosa', NULL, NULL, NULL, NULL, ARRAY[]::text[], NOW(), NOW()
ON CONFLICT ("userId") DO NOTHING;

COMMIT;