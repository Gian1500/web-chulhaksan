-- Auto-generated import for users/teachers/students
BEGIN;
WITH u AS (
  INSERT INTO "User" ("id", "dni", "passwordHash", "role", "status", "mustChangePassword", "createdAt", "updatedAt")
  VALUES ('f46326c7-f6ff-496c-a59d-ddda28cda181', '55926268', '$2a$10$QM/MvQJ/1q7sO25vVZKcE.wMJime1PPj4KQZMs7ihqeLMpkWk9Jq2', 'STUDENT', 'ACTIVE', true, NOW(), NOW())
  ON CONFLICT ("dni") DO NOTHING
  RETURNING "id"
)
INSERT INTO "Student" ("dni", "userId", "firstName", "lastName", "birthDate", "phone", "guardianPhone", "email", "gym", "address", "createdAt", "updatedAt")
SELECT '55926268', COALESCE((SELECT "id" FROM u), (SELECT "id" FROM "User" WHERE "dni" = '55926268')), 'Emma', 'Carnicel', NULL, NULL, NULL, NULL, NULL, NULL, NOW(), NOW()
ON CONFLICT ("dni") DO NOTHING;

WITH u AS (
  INSERT INTO "User" ("id", "dni", "passwordHash", "role", "status", "mustChangePassword", "createdAt", "updatedAt")
  VALUES ('7241c139-d960-48b1-b091-5500a6bc21ca', '57370540', '$2a$10$98s8GNo9GHarTP9gJKpvwugcp.VJbMvzeadTP/DoqZShpLyV/m/9W', 'STUDENT', 'ACTIVE', true, NOW(), NOW())
  ON CONFLICT ("dni") DO NOTHING
  RETURNING "id"
)
INSERT INTO "Student" ("dni", "userId", "firstName", "lastName", "birthDate", "phone", "guardianPhone", "email", "gym", "address", "createdAt", "updatedAt")
SELECT '57370540', COALESCE((SELECT "id" FROM u), (SELECT "id" FROM "User" WHERE "dni" = '57370540')), 'Tadeo', 'Sinastra', NULL, NULL, NULL, NULL, NULL, NULL, NOW(), NOW()
ON CONFLICT ("dni") DO NOTHING;

WITH u AS (
  INSERT INTO "User" ("id", "dni", "passwordHash", "role", "status", "mustChangePassword", "createdAt", "updatedAt")
  VALUES ('b3df0a1b-b82b-4e13-af72-4313540739ff', '49400559', '$2a$10$xDAyhvAOC6C6pueNpdvN4.YDACTU3Ui8751.gRz14fl6/At1bimwS', 'STUDENT', 'ACTIVE', true, NOW(), NOW())
  ON CONFLICT ("dni") DO NOTHING
  RETURNING "id"
)
INSERT INTO "Student" ("dni", "userId", "firstName", "lastName", "birthDate", "phone", "guardianPhone", "email", "gym", "address", "createdAt", "updatedAt")
SELECT '49400559', COALESCE((SELECT "id" FROM u), (SELECT "id" FROM "User" WHERE "dni" = '49400559')), 'Mario', 'Baños', NULL, NULL, NULL, NULL, NULL, NULL, NOW(), NOW()
ON CONFLICT ("dni") DO NOTHING;

WITH u AS (
  INSERT INTO "User" ("id", "dni", "passwordHash", "role", "status", "mustChangePassword", "createdAt", "updatedAt")
  VALUES ('7a30258c-6847-488c-abe6-103b042498c0', '51189443', '$2a$10$YYR68LsyuD67dBJyATWK7uWm7lLy.NGMjmGi2WBomiTJYFv8qGh1q', 'STUDENT', 'ACTIVE', true, NOW(), NOW())
  ON CONFLICT ("dni") DO NOTHING
  RETURNING "id"
)
INSERT INTO "Student" ("dni", "userId", "firstName", "lastName", "birthDate", "phone", "guardianPhone", "email", "gym", "address", "createdAt", "updatedAt")
SELECT '51189443', COALESCE((SELECT "id" FROM u), (SELECT "id" FROM "User" WHERE "dni" = '51189443')), 'Leonardo', 'Baños', NULL, NULL, NULL, NULL, NULL, NULL, NOW(), NOW()
ON CONFLICT ("dni") DO NOTHING;

WITH u AS (
  INSERT INTO "User" ("id", "dni", "passwordHash", "role", "status", "mustChangePassword", "createdAt", "updatedAt")
  VALUES ('4f6454d4-a464-4c14-b911-bf837e67351d', '55545110', '$2a$10$KG8bUvI8/RznVC24nDZFJennwBvrv4la.HMshLinp9n77RRheNV16', 'STUDENT', 'ACTIVE', true, NOW(), NOW())
  ON CONFLICT ("dni") DO NOTHING
  RETURNING "id"
)
INSERT INTO "Student" ("dni", "userId", "firstName", "lastName", "birthDate", "phone", "guardianPhone", "email", "gym", "address", "createdAt", "updatedAt")
SELECT '55545110', COALESCE((SELECT "id" FROM u), (SELECT "id" FROM "User" WHERE "dni" = '55545110')), 'Federico', 'Funes', NULL, NULL, NULL, NULL, NULL, NULL, NOW(), NOW()
ON CONFLICT ("dni") DO NOTHING;

WITH u AS (
  INSERT INTO "User" ("id", "dni", "passwordHash", "role", "status", "mustChangePassword", "createdAt", "updatedAt")
  VALUES ('923ebb0a-1b83-4079-894a-a3a8a8ad8890', '55380219', '$2a$10$BWaReVbiaNQpWUvMoHin9uGKOn.UbE9wonXS.lq3xXrr961JjfOOS', 'STUDENT', 'ACTIVE', true, NOW(), NOW())
  ON CONFLICT ("dni") DO NOTHING
  RETURNING "id"
)
INSERT INTO "Student" ("dni", "userId", "firstName", "lastName", "birthDate", "phone", "guardianPhone", "email", "gym", "address", "createdAt", "updatedAt")
SELECT '55380219', COALESCE((SELECT "id" FROM u), (SELECT "id" FROM "User" WHERE "dni" = '55380219')), 'Lorenzo', 'Funes', NULL, NULL, NULL, NULL, NULL, NULL, NOW(), NOW()
ON CONFLICT ("dni") DO NOTHING;

WITH u AS (
  INSERT INTO "User" ("id", "dni", "passwordHash", "role", "status", "mustChangePassword", "createdAt", "updatedAt")
  VALUES ('5f574e6d-be3a-41dc-90f2-6e68c8f5c8e1', '55380220', '$2a$10$btbvMoz/hcViZRCnz7hU9OHF2n0uhP0Al7vyG.RIcyOOauPKawpP2', 'STUDENT', 'ACTIVE', true, NOW(), NOW())
  ON CONFLICT ("dni") DO NOTHING
  RETURNING "id"
)
INSERT INTO "Student" ("dni", "userId", "firstName", "lastName", "birthDate", "phone", "guardianPhone", "email", "gym", "address", "createdAt", "updatedAt")
SELECT '55380220', COALESCE((SELECT "id" FROM u), (SELECT "id" FROM "User" WHERE "dni" = '55380220')), 'Lisandro', 'Funes', NULL, NULL, NULL, NULL, NULL, NULL, NOW(), NOW()
ON CONFLICT ("dni") DO NOTHING;

WITH u AS (
  INSERT INTO "User" ("id", "dni", "passwordHash", "role", "status", "mustChangePassword", "createdAt", "updatedAt")
  VALUES ('a93fa004-9069-4e95-afae-15fbf095e6d1', '53942626', '$2a$10$hDINP3REEcbQEfV7qJoXwO8J509sE3HvuX08IAH3uEEbC5KSepMka', 'STUDENT', 'ACTIVE', true, NOW(), NOW())
  ON CONFLICT ("dni") DO NOTHING
  RETURNING "id"
)
INSERT INTO "Student" ("dni", "userId", "firstName", "lastName", "birthDate", "phone", "guardianPhone", "email", "gym", "address", "createdAt", "updatedAt")
SELECT '53942626', COALESCE((SELECT "id" FROM u), (SELECT "id" FROM "User" WHERE "dni" = '53942626')), 'Facundo', 'Perez', NULL, NULL, NULL, NULL, NULL, NULL, NOW(), NOW()
ON CONFLICT ("dni") DO NOTHING;

WITH u AS (
  INSERT INTO "User" ("id", "dni", "passwordHash", "role", "status", "mustChangePassword", "createdAt", "updatedAt")
  VALUES ('6028ccb4-ebff-4136-ad8c-059029e576f5', '54923846', '$2a$10$5SpWy6SLf8.F4AfsHacaFuoud0eXEgM449gH0wQ434q9QOIvyDrHW', 'STUDENT', 'ACTIVE', true, NOW(), NOW())
  ON CONFLICT ("dni") DO NOTHING
  RETURNING "id"
)
INSERT INTO "Student" ("dni", "userId", "firstName", "lastName", "birthDate", "phone", "guardianPhone", "email", "gym", "address", "createdAt", "updatedAt")
SELECT '54923846', COALESCE((SELECT "id" FROM u), (SELECT "id" FROM "User" WHERE "dni" = '54923846')), 'Lautaro', 'Prado', NULL, NULL, NULL, NULL, NULL, NULL, NOW(), NOW()
ON CONFLICT ("dni") DO NOTHING;

WITH u AS (
  INSERT INTO "User" ("id", "dni", "passwordHash", "role", "status", "mustChangePassword", "createdAt", "updatedAt")
  VALUES ('bceb1dd2-8bdd-4374-86ab-58464010ecd4', '56086377', '$2a$10$WbVUYeV8vAkPlsAJUSKyKu2HYPiNsyYMFBgy72tEyWSKY/2SVNDPW', 'STUDENT', 'ACTIVE', true, NOW(), NOW())
  ON CONFLICT ("dni") DO NOTHING
  RETURNING "id"
)
INSERT INTO "Student" ("dni", "userId", "firstName", "lastName", "birthDate", "phone", "guardianPhone", "email", "gym", "address", "createdAt", "updatedAt")
SELECT '56086377', COALESCE((SELECT "id" FROM u), (SELECT "id" FROM "User" WHERE "dni" = '56086377')), 'Valentin', 'Chavez', NULL, NULL, NULL, NULL, NULL, NULL, NOW(), NOW()
ON CONFLICT ("dni") DO NOTHING;

WITH u AS (
  INSERT INTO "User" ("id", "dni", "passwordHash", "role", "status", "mustChangePassword", "createdAt", "updatedAt")
  VALUES ('5238bd32-fa39-4b7b-87c9-7eb046df27a8', '45529902', '$2a$10$TlhNtw0.vGgArhKYTSbztOjCp0ex0OvdEo0bLd.ZQ5W8pV6hzasKq', 'STUDENT', 'ACTIVE', true, NOW(), NOW())
  ON CONFLICT ("dni") DO NOTHING
  RETURNING "id"
)
INSERT INTO "Student" ("dni", "userId", "firstName", "lastName", "birthDate", "phone", "guardianPhone", "email", "gym", "address", "createdAt", "updatedAt")
SELECT '45529902', COALESCE((SELECT "id" FROM u), (SELECT "id" FROM "User" WHERE "dni" = '45529902')), 'Fernando', 'Palacios', NULL, NULL, NULL, NULL, NULL, NULL, NOW(), NOW()
ON CONFLICT ("dni") DO NOTHING;

WITH u AS (
  INSERT INTO "User" ("id", "dni", "passwordHash", "role", "status", "mustChangePassword", "createdAt", "updatedAt")
  VALUES ('86e90dc9-8e37-42f7-a7fa-e605a4a0498b', '46172388', '$2a$10$Hfe1jPInBzjM4HCfmqzkDeoCiiFP6LtJ.fQ.R7CvV7vEAk/wL9lAy', 'STUDENT', 'ACTIVE', true, NOW(), NOW())
  ON CONFLICT ("dni") DO NOTHING
  RETURNING "id"
)
INSERT INTO "Student" ("dni", "userId", "firstName", "lastName", "birthDate", "phone", "guardianPhone", "email", "gym", "address", "createdAt", "updatedAt")
SELECT '46172388', COALESCE((SELECT "id" FROM u), (SELECT "id" FROM "User" WHERE "dni" = '46172388')), 'Samuel', 'Serrano', NULL, NULL, NULL, NULL, NULL, NULL, NOW(), NOW()
ON CONFLICT ("dni") DO NOTHING;

WITH u AS (
  INSERT INTO "User" ("id", "dni", "passwordHash", "role", "status", "mustChangePassword", "createdAt", "updatedAt")
  VALUES ('8600420a-0f9f-45e8-8bc0-ff4d16ad2853', '44986637', '$2a$10$TlU8/QxMih55HUN95.miieOGRKwY5UyU/tqFbvMXSO03b5Lhh3P/a', 'STUDENT', 'ACTIVE', true, NOW(), NOW())
  ON CONFLICT ("dni") DO NOTHING
  RETURNING "id"
)
INSERT INTO "Student" ("dni", "userId", "firstName", "lastName", "birthDate", "phone", "guardianPhone", "email", "gym", "address", "createdAt", "updatedAt")
SELECT '44986637', COALESCE((SELECT "id" FROM u), (SELECT "id" FROM "User" WHERE "dni" = '44986637')), 'Mercedes', 'Murri', NULL, NULL, NULL, NULL, NULL, NULL, NOW(), NOW()
ON CONFLICT ("dni") DO NOTHING;

WITH u AS (
  INSERT INTO "User" ("id", "dni", "passwordHash", "role", "status", "mustChangePassword", "createdAt", "updatedAt")
  VALUES ('c6bd208e-c139-4c13-ae78-dcf39df1f3ff', '52940656', '$2a$10$K0lDINNaHGmr3entX4HWUe9//wyV7wKgITb9JYIWUuq1CIgjn3xZC', 'STUDENT', 'ACTIVE', true, NOW(), NOW())
  ON CONFLICT ("dni") DO NOTHING
  RETURNING "id"
)
INSERT INTO "Student" ("dni", "userId", "firstName", "lastName", "birthDate", "phone", "guardianPhone", "email", "gym", "address", "createdAt", "updatedAt")
SELECT '52940656', COALESCE((SELECT "id" FROM u), (SELECT "id" FROM "User" WHERE "dni" = '52940656')), 'Angelina', 'Bazan', NULL, NULL, NULL, NULL, NULL, NULL, NOW(), NOW()
ON CONFLICT ("dni") DO NOTHING;

WITH u AS (
  INSERT INTO "User" ("id", "dni", "passwordHash", "role", "status", "mustChangePassword", "createdAt", "updatedAt")
  VALUES ('67294ad9-3e3e-4ff6-9ded-773f7ce7c2b8', '51187268', '$2a$10$3lswwj7y4qjY2M.TvcRyRelJRKIO0.Nwzvthb2SpGBiP2uOgRiFg2', 'STUDENT', 'ACTIVE', true, NOW(), NOW())
  ON CONFLICT ("dni") DO NOTHING
  RETURNING "id"
)
INSERT INTO "Student" ("dni", "userId", "firstName", "lastName", "birthDate", "phone", "guardianPhone", "email", "gym", "address", "createdAt", "updatedAt")
SELECT '51187268', COALESCE((SELECT "id" FROM u), (SELECT "id" FROM "User" WHERE "dni" = '51187268')), 'Rocio', 'Barrionuevo', NULL, NULL, NULL, NULL, NULL, NULL, NOW(), NOW()
ON CONFLICT ("dni") DO NOTHING;

WITH u AS (
  INSERT INTO "User" ("id", "dni", "passwordHash", "role", "status", "mustChangePassword", "createdAt", "updatedAt")
  VALUES ('3d0611c7-4fc9-4613-8cd5-b493f875584f', '39603413', '$2a$10$c2347Ot91GoSUQcFnZLGaeNCydyCBBs9LffeH9iPs6zamXm7g6g8m', 'STUDENT', 'ACTIVE', true, NOW(), NOW())
  ON CONFLICT ("dni") DO NOTHING
  RETURNING "id"
)
INSERT INTO "Student" ("dni", "userId", "firstName", "lastName", "birthDate", "phone", "guardianPhone", "email", "gym", "address", "createdAt", "updatedAt")
SELECT '39603413', COALESCE((SELECT "id" FROM u), (SELECT "id" FROM "User" WHERE "dni" = '39603413')), 'Gabriel', 'Medina', NULL, NULL, NULL, NULL, NULL, NULL, NOW(), NOW()
ON CONFLICT ("dni") DO NOTHING;

WITH u AS (
  INSERT INTO "User" ("id", "dni", "passwordHash", "role", "status", "mustChangePassword", "createdAt", "updatedAt")
  VALUES ('8630f10f-1dbe-47c1-bd84-a1cfc19d0632', '48725704', '$2a$10$FDW0Ck0pHjyX7OYRRP9QN.WRsriR86lzL99CtMXAXpuQuN4GidiD.', 'STUDENT', 'ACTIVE', true, NOW(), NOW())
  ON CONFLICT ("dni") DO NOTHING
  RETURNING "id"
)
INSERT INTO "Student" ("dni", "userId", "firstName", "lastName", "birthDate", "phone", "guardianPhone", "email", "gym", "address", "createdAt", "updatedAt")
SELECT '48725704', COALESCE((SELECT "id" FROM u), (SELECT "id" FROM "User" WHERE "dni" = '48725704')), 'Selena', 'Zarate', NULL, NULL, NULL, NULL, NULL, NULL, NOW(), NOW()
ON CONFLICT ("dni") DO NOTHING;

WITH u AS (
  INSERT INTO "User" ("id", "dni", "passwordHash", "role", "status", "mustChangePassword", "createdAt", "updatedAt")
  VALUES ('4977d977-4811-4a29-a636-065b9123e1c4', '53313626', '$2a$10$A2mOHR4b6IYlrPH4N4zc0.WoFO2aoH8JscpNrrFB0gG/BdoOTNRBK', 'STUDENT', 'ACTIVE', true, NOW(), NOW())
  ON CONFLICT ("dni") DO NOTHING
  RETURNING "id"
)
INSERT INTO "Student" ("dni", "userId", "firstName", "lastName", "birthDate", "phone", "guardianPhone", "email", "gym", "address", "createdAt", "updatedAt")
SELECT '53313626', COALESCE((SELECT "id" FROM u), (SELECT "id" FROM "User" WHERE "dni" = '53313626')), 'Brandon', 'Subelza', NULL, NULL, NULL, NULL, NULL, NULL, NOW(), NOW()
ON CONFLICT ("dni") DO NOTHING;

WITH u AS (
  INSERT INTO "User" ("id", "dni", "passwordHash", "role", "status", "mustChangePassword", "createdAt", "updatedAt")
  VALUES ('cb4e0094-39bb-4bbd-806f-9daea9fc8917', '50812930', '$2a$10$yiAakUiu39zrI2BcLea64O41WY/LAZWvs5yo3i8/fi4ts.yz79A0S', 'STUDENT', 'ACTIVE', true, NOW(), NOW())
  ON CONFLICT ("dni") DO NOTHING
  RETURNING "id"
)
INSERT INTO "Student" ("dni", "userId", "firstName", "lastName", "birthDate", "phone", "guardianPhone", "email", "gym", "address", "createdAt", "updatedAt")
SELECT '50812930', COALESCE((SELECT "id" FROM u), (SELECT "id" FROM "User" WHERE "dni" = '50812930')), 'Carla', 'Innocente', NULL, NULL, NULL, NULL, NULL, NULL, NOW(), NOW()
ON CONFLICT ("dni") DO NOTHING;

WITH u AS (
  INSERT INTO "User" ("id", "dni", "passwordHash", "role", "status", "mustChangePassword", "createdAt", "updatedAt")
  VALUES ('039afa4e-dd85-4a2b-a8f5-8205183cc699', '13513965', '$2a$10$IATcjr0mGllywVBR87vOQuluqVtsuNuEHcbpI6s8A0DLTapWC.iae', 'STUDENT', 'ACTIVE', true, NOW(), NOW())
  ON CONFLICT ("dni") DO NOTHING
  RETURNING "id"
)
INSERT INTO "Student" ("dni", "userId", "firstName", "lastName", "birthDate", "phone", "guardianPhone", "email", "gym", "address", "createdAt", "updatedAt")
SELECT '13513965', COALESCE((SELECT "id" FROM u), (SELECT "id" FROM "User" WHERE "dni" = '13513965')), 'Daniel', 'Villegas', NULL, NULL, NULL, NULL, NULL, NULL, NOW(), NOW()
ON CONFLICT ("dni") DO NOTHING;

WITH u AS (
  INSERT INTO "User" ("id", "dni", "passwordHash", "role", "status", "mustChangePassword", "createdAt", "updatedAt")
  VALUES ('f7d9d554-6372-4761-8439-0547c5a76da0', '45024344', '$2a$10$4p7BaENbVtqnz3B3e7W.rOZcI2Zs7D1TxDz7og0Bxy1B9NO3diFaK', 'STUDENT', 'ACTIVE', true, NOW(), NOW())
  ON CONFLICT ("dni") DO NOTHING
  RETURNING "id"
)
INSERT INTO "Student" ("dni", "userId", "firstName", "lastName", "birthDate", "phone", "guardianPhone", "email", "gym", "address", "createdAt", "updatedAt")
SELECT '45024344', COALESCE((SELECT "id" FROM u), (SELECT "id" FROM "User" WHERE "dni" = '45024344')), 'Gabriel', 'Cabeda', NULL, NULL, NULL, NULL, NULL, NULL, NOW(), NOW()
ON CONFLICT ("dni") DO NOTHING;

WITH u AS (
  INSERT INTO "User" ("id", "dni", "passwordHash", "role", "status", "mustChangePassword", "createdAt", "updatedAt")
  VALUES ('00349f5a-fd88-4b33-91e0-02ce8de8208f', '46549409', '$2a$10$CcMOjU6DpWlTZblEAHXizOK3AMwX9LaE7IYTCHk2lzRNQSjtdMaJi', 'STUDENT', 'ACTIVE', true, NOW(), NOW())
  ON CONFLICT ("dni") DO NOTHING
  RETURNING "id"
)
INSERT INTO "Student" ("dni", "userId", "firstName", "lastName", "birthDate", "phone", "guardianPhone", "email", "gym", "address", "createdAt", "updatedAt")
SELECT '46549409', COALESCE((SELECT "id" FROM u), (SELECT "id" FROM "User" WHERE "dni" = '46549409')), 'Brisa', 'Cabeda', NULL, NULL, NULL, NULL, NULL, NULL, NOW(), NOW()
ON CONFLICT ("dni") DO NOTHING;

WITH u AS (
  INSERT INTO "User" ("id", "dni", "passwordHash", "role", "status", "mustChangePassword", "createdAt", "updatedAt")
  VALUES ('08def7f4-ec83-41a8-8c56-7bbb8de2c0ae', '23712041', '$2a$10$ZNyF8VekURUKd3Sw6Te6Iu7B8ZzprSs3Hpc3lhyGvqzfPFIu.QAuK', 'STUDENT', 'ACTIVE', true, NOW(), NOW())
  ON CONFLICT ("dni") DO NOTHING
  RETURNING "id"
)
INSERT INTO "Student" ("dni", "userId", "firstName", "lastName", "birthDate", "phone", "guardianPhone", "email", "gym", "address", "createdAt", "updatedAt")
SELECT '23712041', COALESCE((SELECT "id" FROM u), (SELECT "id" FROM "User" WHERE "dni" = '23712041')), 'Andrea', 'Bustamante', NULL, NULL, NULL, NULL, NULL, NULL, NOW(), NOW()
ON CONFLICT ("dni") DO NOTHING;

WITH u AS (
  INSERT INTO "User" ("id", "dni", "passwordHash", "role", "status", "mustChangePassword", "createdAt", "updatedAt")
  VALUES ('f70a8ee5-f7e9-4a9f-9dd5-a80055876028', '53662411', '$2a$10$RSlaUPpsqML8bTqvOiSHOOWW3nGw1Gdf6fgWzHPrPeamEcJ2auIF2', 'STUDENT', 'ACTIVE', true, NOW(), NOW())
  ON CONFLICT ("dni") DO NOTHING
  RETURNING "id"
)
INSERT INTO "Student" ("dni", "userId", "firstName", "lastName", "birthDate", "phone", "guardianPhone", "email", "gym", "address", "createdAt", "updatedAt")
SELECT '53662411', COALESCE((SELECT "id" FROM u), (SELECT "id" FROM "User" WHERE "dni" = '53662411')), 'Benjamin', 'Gimenez', NULL, NULL, NULL, NULL, NULL, NULL, NOW(), NOW()
ON CONFLICT ("dni") DO NOTHING;

WITH u AS (
  INSERT INTO "User" ("id", "dni", "passwordHash", "role", "status", "mustChangePassword", "createdAt", "updatedAt")
  VALUES ('0162dc69-bd5f-43fa-837b-38c986054ac4', '42421850', '$2a$10$2rxHkhyKz/3nZgRAYApqau12spvRn6z0.MPlsMXvhB4KSmMwj05Qy', 'TEACHER', 'ACTIVE', true, NOW(), NOW())
  ON CONFLICT ("dni") DO NOTHING
  RETURNING "id"
)
INSERT INTO "Teacher" ("id", "userId", "firstName", "lastName", "phone", "email", "birthDate", "address", "gyms", "createdAt", "updatedAt")
SELECT 'c18546bb-57cb-4e09-b251-9a3777476006', COALESCE((SELECT "id" FROM u), (SELECT "id" FROM "User" WHERE "dni" = '42421850')), 'Lautaro', 'Rocamora', NULL, 'Lautarorocamorachs123@gmail.com', NULL, NULL, '{}', NOW(), NOW()
ON CONFLICT ("userId") DO NOTHING;

WITH u AS (
  INSERT INTO "User" ("id", "dni", "passwordHash", "role", "status", "mustChangePassword", "createdAt", "updatedAt")
  VALUES ('f56a5f0a-b4eb-466b-8ae0-7dc963ee15dc', '23832541', '$2a$10$JK2G3ggbnzW3ei5jv4kwt.vLb3oIlORooNr4c/JUJ6hQ1.nO29v0G', 'TEACHER', 'ACTIVE', true, NOW(), NOW())
  ON CONFLICT ("dni") DO NOTHING
  RETURNING "id"
)
INSERT INTO "Teacher" ("id", "userId", "firstName", "lastName", "phone", "email", "birthDate", "address", "gyms", "createdAt", "updatedAt")
SELECT '8a6f0f21-a9ca-443d-aec3-182f5d874bee', COALESCE((SELECT "id" FROM u), (SELECT "id" FROM "User" WHERE "dni" = '23832541')), 'Daniel', 'Dierna', NULL, 'nan', NULL, NULL, '{}', NOW(), NOW()
ON CONFLICT ("userId") DO NOTHING;

WITH u AS (
  INSERT INTO "User" ("id", "dni", "passwordHash", "role", "status", "mustChangePassword", "createdAt", "updatedAt")
  VALUES ('bf71a4ae-f128-44cb-891d-e4f60b2b22f7', '44009872', '$2a$10$ZM5q82SbgdjIZ.dK8rOQB.KfqUrHz0aiuKUZ2kxmQi2jDO5JWyF8.', 'TEACHER', 'ACTIVE', true, NOW(), NOW())
  ON CONFLICT ("dni") DO NOTHING
  RETURNING "id"
)
INSERT INTO "Teacher" ("id", "userId", "firstName", "lastName", "phone", "email", "birthDate", "address", "gyms", "createdAt", "updatedAt")
SELECT '266b6e95-e8f3-4c8b-bfbe-46a112431226', COALESCE((SELECT "id" FROM u), (SELECT "id" FROM "User" WHERE "dni" = '44009872')), 'Laura', 'Castellanos', NULL, 'mlauracastel@gmail.com', NULL, NULL, '{}', NOW(), NOW()
ON CONFLICT ("userId") DO NOTHING;

WITH u AS (
  INSERT INTO "User" ("id", "dni", "passwordHash", "role", "status", "mustChangePassword", "createdAt", "updatedAt")
  VALUES ('9da45823-9c75-486d-a5eb-5dccf0a404eb', '44139436', '$2a$10$r6xWi2E0D6gvBWK3mDcfOu2lDwmRogWYvRMCeW1648QU/VPbeX2Ni', 'TEACHER', 'ACTIVE', true, NOW(), NOW())
  ON CONFLICT ("dni") DO NOTHING
  RETURNING "id"
)
INSERT INTO "Teacher" ("id", "userId", "firstName", "lastName", "phone", "email", "birthDate", "address", "gyms", "createdAt", "updatedAt")
SELECT 'e1032c1d-74bd-4bea-87da-23ef1847e33c', COALESCE((SELECT "id" FROM u), (SELECT "id" FROM "User" WHERE "dni" = '44139436')), 'Ignacio', 'Cornejo', NULL, 'ignacio.cornejo.01.f@gmail.com', NULL, NULL, '{}', NOW(), NOW()
ON CONFLICT ("userId") DO NOTHING;

WITH u AS (
  INSERT INTO "User" ("id", "dni", "passwordHash", "role", "status", "mustChangePassword", "createdAt", "updatedAt")
  VALUES ('2676ad43-1376-4de3-9cb7-bd6fb2a313cc', '45718997', '$2a$10$AwwucIYa0IfbkLm2tAy.vOXJGb8/9ALm1Ml9Mo8MXoY2Z0D2CP.Xa', 'TEACHER', 'ACTIVE', true, NOW(), NOW())
  ON CONFLICT ("dni") DO NOTHING
  RETURNING "id"
)
INSERT INTO "Teacher" ("id", "userId", "firstName", "lastName", "phone", "email", "birthDate", "address", "gyms", "createdAt", "updatedAt")
SELECT '1b6efb94-c3e8-40bd-a857-6917c7d58e36', COALESCE((SELECT "id" FROM u), (SELECT "id" FROM "User" WHERE "dni" = '45718997')), 'Pedro', 'Rocamora', NULL, 'pedrito1rocamora@gmail.com', NULL, NULL, '{}', NOW(), NOW()
ON CONFLICT ("userId") DO NOTHING;

WITH u AS (
  INSERT INTO "User" ("id", "dni", "passwordHash", "role", "status", "mustChangePassword", "createdAt", "updatedAt")
  VALUES ('04052d2f-d445-49be-95c0-22042aecf57d', '48471671', '$2a$10$aVGah9PQC7VtWaDR0XdmVOxqz7ujHEcULmT88XmVfm29.iK80NFXe', 'TEACHER', 'ACTIVE', true, NOW(), NOW())
  ON CONFLICT ("dni") DO NOTHING
  RETURNING "id"
)
INSERT INTO "Teacher" ("id", "userId", "firstName", "lastName", "phone", "email", "birthDate", "address", "gyms", "createdAt", "updatedAt")
SELECT '44e26351-50df-465e-9d63-579a5c8271e7', COALESCE((SELECT "id" FROM u), (SELECT "id" FROM "User" WHERE "dni" = '48471671')), 'Emiliano', 'Gomez', NULL, 'emilianomartingomez277@gmail.com', NULL, NULL, '{}', NOW(), NOW()
ON CONFLICT ("userId") DO NOTHING;

WITH u AS (
  INSERT INTO "User" ("id", "dni", "passwordHash", "role", "status", "mustChangePassword", "createdAt", "updatedAt")
  VALUES ('89bb1931-afad-46dd-8846-13b81cdee52d', '43831454', '$2a$10$.E6vOsS9lI284HMb/LDosOIefD3PzVOiv2dKRfhYniocSh4SSlf/C', 'TEACHER', 'ACTIVE', true, NOW(), NOW())
  ON CONFLICT ("dni") DO NOTHING
  RETURNING "id"
)
INSERT INTO "Teacher" ("id", "userId", "firstName", "lastName", "phone", "email", "birthDate", "address", "gyms", "createdAt", "updatedAt")
SELECT 'd6a68108-4a29-4871-977c-9221469d945a', COALESCE((SELECT "id" FROM u), (SELECT "id" FROM "User" WHERE "dni" = '43831454')), 'Federico', 'Mamaní', NULL, 'nan', NULL, NULL, '{}', NOW(), NOW()
ON CONFLICT ("userId") DO NOTHING;

WITH u AS (
  INSERT INTO "User" ("id", "dni", "passwordHash", "role", "status", "mustChangePassword", "createdAt", "updatedAt")
  VALUES ('aab16241-8aa8-47da-8bed-ee8ebab9ae44', '46618241', '$2a$10$kRgQ9eZHGclki8zt08Z3we60okAHxmI.fSRocxdMJ2PbAUtHE1U22', 'TEACHER', 'ACTIVE', true, NOW(), NOW())
  ON CONFLICT ("dni") DO NOTHING
  RETURNING "id"
)
INSERT INTO "Teacher" ("id", "userId", "firstName", "lastName", "phone", "email", "birthDate", "address", "gyms", "createdAt", "updatedAt")
SELECT '97c7973a-55bb-4e95-84d0-213541d83a56', COALESCE((SELECT "id" FROM u), (SELECT "id" FROM "User" WHERE "dni" = '46618241')), 'Nicolas', 'Epifani', NULL, 'nepifanis@gmail.com', NULL, NULL, '{}', NOW(), NOW()
ON CONFLICT ("userId") DO NOTHING;

WITH u AS (
  INSERT INTO "User" ("id", "dni", "passwordHash", "role", "status", "mustChangePassword", "createdAt", "updatedAt")
  VALUES ('b390bf1d-606e-48a1-ac00-a636bb4e6733', '48052184', '$2a$10$j3v2DENQenVtG8cvCUa6G.Vgcwi7lEviHfdZpMVwlII74uTt7FU1G', 'TEACHER', 'ACTIVE', true, NOW(), NOW())
  ON CONFLICT ("dni") DO NOTHING
  RETURNING "id"
)
INSERT INTO "Teacher" ("id", "userId", "firstName", "lastName", "phone", "email", "birthDate", "address", "gyms", "createdAt", "updatedAt")
SELECT '47fdb253-8762-423f-bfcb-6a24b046827a', COALESCE((SELECT "id" FROM u), (SELECT "id" FROM "User" WHERE "dni" = '48052184')), 'Lucia', 'Genaulas', NULL, 'lulagenaulas14@gmail.com', NULL, NULL, '{}', NOW(), NOW()
ON CONFLICT ("userId") DO NOTHING;

WITH u AS (
  INSERT INTO "User" ("id", "dni", "passwordHash", "role", "status", "mustChangePassword", "createdAt", "updatedAt")
  VALUES ('f2fb99c3-895d-4042-a18f-b43a7482c56f', '45256482', '$2a$10$lQFE8rVLbDr/eYg0bvJ1k.XlIqfPMQNvOK97amOkrrxuPehathRCy', 'TEACHER', 'ACTIVE', true, NOW(), NOW())
  ON CONFLICT ("dni") DO NOTHING
  RETURNING "id"
)
INSERT INTO "Teacher" ("id", "userId", "firstName", "lastName", "phone", "email", "birthDate", "address", "gyms", "createdAt", "updatedAt")
SELECT '8704b1e5-5eaf-402b-9ff7-8552ef5d3626', COALESCE((SELECT "id" FROM u), (SELECT "id" FROM "User" WHERE "dni" = '45256482')), 'Javier', 'Barrozo', NULL, 'leojavibarrozo@gmail.com', NULL, NULL, '{}', NOW(), NOW()
ON CONFLICT ("userId") DO NOTHING;

WITH u AS (
  INSERT INTO "User" ("id", "dni", "passwordHash", "role", "status", "mustChangePassword", "createdAt", "updatedAt")
  VALUES ('46e99bbf-b19d-45bb-9a7d-c492b8dd73fc', '47611267', '$2a$10$iYvYLxIM2.5RywPZTAEXOuwgss7aegAALSz1RClqqSBBvo2abXWbe', 'TEACHER', 'ACTIVE', true, NOW(), NOW())
  ON CONFLICT ("dni") DO NOTHING
  RETURNING "id"
)
INSERT INTO "Teacher" ("id", "userId", "firstName", "lastName", "phone", "email", "birthDate", "address", "gyms", "createdAt", "updatedAt")
SELECT '40e185ba-0191-4f3d-adcc-6f7201c2d551', COALESCE((SELECT "id" FROM u), (SELECT "id" FROM "User" WHERE "dni" = '47611267')), 'Benjamin', 'Luzuriaga', NULL, 'luzuriagabenjamin@gmail.com', NULL, NULL, '{}', NOW(), NOW()
ON CONFLICT ("userId") DO NOTHING;

WITH u AS (
  INSERT INTO "User" ("id", "dni", "passwordHash", "role", "status", "mustChangePassword", "createdAt", "updatedAt")
  VALUES ('ed203b66-d705-428b-bcea-1b849ff1f622', '48076512', '$2a$10$wyDJifE11KBoAm0xpnQLYefwSpywr57brY2ltQOEbtwHHmVlBlc3a', 'TEACHER', 'ACTIVE', true, NOW(), NOW())
  ON CONFLICT ("dni") DO NOTHING
  RETURNING "id"
)
INSERT INTO "Teacher" ("id", "userId", "firstName", "lastName", "phone", "email", "birthDate", "address", "gyms", "createdAt", "updatedAt")
SELECT 'ef8b7a8d-ab4a-4b77-9f5f-add9834faac0', COALESCE((SELECT "id" FROM u), (SELECT "id" FROM "User" WHERE "dni" = '48076512')), 'Pablo', 'Muñoz', NULL, 'pabmanmu@gmail.com', NULL, NULL, '{}', NOW(), NOW()
ON CONFLICT ("userId") DO NOTHING;

WITH u AS (
  INSERT INTO "User" ("id", "dni", "passwordHash", "role", "status", "mustChangePassword", "createdAt", "updatedAt")
  VALUES ('58865407-a324-417f-8885-a0ad800a8ffd', '45717540', '$2a$10$Nivocih3co9GVbrrTkM8x.RojHtgs0c6SnxCmr5SccVLe0JAE8fIS', 'TEACHER', 'ACTIVE', true, NOW(), NOW())
  ON CONFLICT ("dni") DO NOTHING
  RETURNING "id"
)
INSERT INTO "Teacher" ("id", "userId", "firstName", "lastName", "phone", "email", "birthDate", "address", "gyms", "createdAt", "updatedAt")
SELECT '3a00e358-741d-45b1-8c8c-a268120e2448', COALESCE((SELECT "id" FROM u), (SELECT "id" FROM "User" WHERE "dni" = '45717540')), 'Sara', 'Serrano', NULL, 'saraserrano298@gmail.com', NULL, NULL, '{}', NOW(), NOW()
ON CONFLICT ("userId") DO NOTHING;

WITH u AS (
  INSERT INTO "User" ("id", "dni", "passwordHash", "role", "status", "mustChangePassword", "createdAt", "updatedAt")
  VALUES ('6bc243cb-bd30-482d-a8a7-af2b4e0bcea8', '45724004', '$2a$10$xRV4vNNESU2po4MqaaSY9Oy73N.lC3L1TXMy1oO.Kf0vuHOXib81m', 'TEACHER', 'ACTIVE', true, NOW(), NOW())
  ON CONFLICT ("dni") DO NOTHING
  RETURNING "id"
)
INSERT INTO "Teacher" ("id", "userId", "firstName", "lastName", "phone", "email", "birthDate", "address", "gyms", "createdAt", "updatedAt")
SELECT '9d5f4270-0d02-4ec3-8a13-06108caeceb7', COALESCE((SELECT "id" FROM u), (SELECT "id" FROM "User" WHERE "dni" = '45724004')), 'Agustina', 'Obredor', NULL, 'agustinaobredor9@gmail.com', NULL, NULL, '{}', NOW(), NOW()
ON CONFLICT ("userId") DO NOTHING;

WITH u AS (
  INSERT INTO "User" ("id", "dni", "passwordHash", "role", "status", "mustChangePassword", "createdAt", "updatedAt")
  VALUES ('4e486b6d-1232-417b-bb13-af04dcfe53c3', '36513578', '$2a$10$lEGbA/fOCgJ5kbGwPbqAbOHoa2Tu9Zwx3ISG56K68O8rJuziUhALe', 'TEACHER', 'ACTIVE', true, NOW(), NOW())
  ON CONFLICT ("dni") DO NOTHING
  RETURNING "id"
)
INSERT INTO "Teacher" ("id", "userId", "firstName", "lastName", "phone", "email", "birthDate", "address", "gyms", "createdAt", "updatedAt")
SELECT '2bc5e267-1bd2-45d9-8cab-dd98ac8db446', COALESCE((SELECT "id" FROM u), (SELECT "id" FROM "User" WHERE "dni" = '36513578')), 'Leonardo', 'Obredor', NULL, 'leonardoobredor91@gmail.com', NULL, NULL, '{}', NOW(), NOW()
ON CONFLICT ("userId") DO NOTHING;

WITH u AS (
  INSERT INTO "User" ("id", "dni", "passwordHash", "role", "status", "mustChangePassword", "createdAt", "updatedAt")
  VALUES ('b941ac33-ae6c-40fd-9410-97c68c458e29', '48607535', '$2a$10$iQ70hPgx30O.WDTsNnai9OQxS.K55Jm8nRGeGF41tq4MoLblunkWe', 'TEACHER', 'ACTIVE', true, NOW(), NOW())
  ON CONFLICT ("dni") DO NOTHING
  RETURNING "id"
)
INSERT INTO "Teacher" ("id", "userId", "firstName", "lastName", "phone", "email", "birthDate", "address", "gyms", "createdAt", "updatedAt")
SELECT 'fbebceb9-5097-40e9-83da-53910b28e4dd', COALESCE((SELECT "id" FROM u), (SELECT "id" FROM "User" WHERE "dni" = '48607535')), 'Alma', 'Vargas', NULL, 'almavalenvargas0901@gmail.com', NULL, NULL, '{}', NOW(), NOW()
ON CONFLICT ("userId") DO NOTHING;

WITH u AS (
  INSERT INTO "User" ("id", "dni", "passwordHash", "role", "status", "mustChangePassword", "createdAt", "updatedAt")
  VALUES ('35880ee8-b875-485b-8545-32f6c89e5929', '24442147', '$2a$10$DENd0DHDgQITfBFN..XiteZx0spC32P2wkCTI175rDd64OCJBdmma', 'TEACHER', 'ACTIVE', true, NOW(), NOW())
  ON CONFLICT ("dni") DO NOTHING
  RETURNING "id"
)
INSERT INTO "Teacher" ("id", "userId", "firstName", "lastName", "phone", "email", "birthDate", "address", "gyms", "createdAt", "updatedAt")
SELECT '4c1ad57a-901a-4164-b3be-ffcef530a7d0', COALESCE((SELECT "id" FROM u), (SELECT "id" FROM "User" WHERE "dni" = '24442147')), 'Patricia', 'Ramos', NULL, 'patri024ramos@gmail.com', NULL, NULL, '{}', NOW(), NOW()
ON CONFLICT ("userId") DO NOTHING;

WITH u AS (
  INSERT INTO "User" ("id", "dni", "passwordHash", "role", "status", "mustChangePassword", "createdAt", "updatedAt")
  VALUES ('b0709402-54ff-48e2-a376-25654454df38', '27496726', '$2a$10$vLCyqOGGcFB5zA2s7JWVyu1tzxRX0AkgZS2E8pay8n9AMRjHS/VPG', 'TEACHER', 'ACTIVE', true, NOW(), NOW())
  ON CONFLICT ("dni") DO NOTHING
  RETURNING "id"
)
INSERT INTO "Teacher" ("id", "userId", "firstName", "lastName", "phone", "email", "birthDate", "address", "gyms", "createdAt", "updatedAt")
SELECT '65fcedb5-738c-4d39-beab-7538eeabef0c', COALESCE((SELECT "id" FROM u), (SELECT "id" FROM "User" WHERE "dni" = '27496726')), 'Carina', 'Lucero', NULL, 'nan', NULL, NULL, '{}', NOW(), NOW()
ON CONFLICT ("userId") DO NOTHING;

WITH u AS (
  INSERT INTO "User" ("id", "dni", "passwordHash", "role", "status", "mustChangePassword", "createdAt", "updatedAt")
  VALUES ('b797141c-0ae0-4640-96e8-32cf01df94d9', '48077697', '$2a$10$2eBKPslG8gUI7UJfjNDhJuQTrCY9US9IGBLRPQpeG9JaBx9AMzwna', 'TEACHER', 'ACTIVE', true, NOW(), NOW())
  ON CONFLICT ("dni") DO NOTHING
  RETURNING "id"
)
INSERT INTO "Teacher" ("id", "userId", "firstName", "lastName", "phone", "email", "birthDate", "address", "gyms", "createdAt", "updatedAt")
SELECT 'ca9f4c59-04ff-40bb-acab-50ff18765178', COALESCE((SELECT "id" FROM u), (SELECT "id" FROM "User" WHERE "dni" = '48077697')), 'Leonel', 'Sosa', NULL, 'nan', NULL, NULL, '{}', NOW(), NOW()
ON CONFLICT ("userId") DO NOTHING;

WITH u AS (
  INSERT INTO "User" ("id", "dni", "passwordHash", "role", "status", "mustChangePassword", "createdAt", "updatedAt")
  VALUES ('d8b47be1-e32a-4cec-814d-7aaa7bd2320e', '25034785', '$2a$10$hC7azMyHSzw.c8GPC4xV3.7p4cuIvGlvEsYMtmZL68zjuLU7hGMS6', 'TEACHER', 'ACTIVE', true, NOW(), NOW())
  ON CONFLICT ("dni") DO NOTHING
  RETURNING "id"
)
INSERT INTO "Teacher" ("id", "userId", "firstName", "lastName", "phone", "email", "birthDate", "address", "gyms", "createdAt", "updatedAt")
SELECT 'ec29b131-6618-449f-b4f8-41c504f9ae1b', COALESCE((SELECT "id" FROM u), (SELECT "id" FROM "User" WHERE "dni" = '25034785')), 'Javier', 'Rocamora', NULL, 'Serviciosriodorado@gmail.com', NULL, NULL, '{}', NOW(), NOW()
ON CONFLICT ("userId") DO NOTHING;

WITH u AS (
  INSERT INTO "User" ("id", "dni", "passwordHash", "role", "status", "mustChangePassword", "createdAt", "updatedAt")
  VALUES ('c8928045-229e-435c-a621-b0577d8c7a4d', '23184735', '$2a$10$ORrqTJJxxqsv.CckDRGkY.aYrbSAAwmTlKwJ0nwpl4J0glriHlKuO', 'TEACHER', 'ACTIVE', true, NOW(), NOW())
  ON CONFLICT ("dni") DO NOTHING
  RETURNING "id"
)
INSERT INTO "Teacher" ("id", "userId", "firstName", "lastName", "phone", "email", "birthDate", "address", "gyms", "createdAt", "updatedAt")
SELECT 'ed61e614-0ca1-4c97-8e57-48ddc94d35b0', COALESCE((SELECT "id" FROM u), (SELECT "id" FROM "User" WHERE "dni" = '23184735')), 'Carina', 'Ag?ero', NULL, 'Carinaaguerochs@gmail.com', NULL, NULL, '{}', NOW(), NOW()
ON CONFLICT ("userId") DO NOTHING;

COMMIT;