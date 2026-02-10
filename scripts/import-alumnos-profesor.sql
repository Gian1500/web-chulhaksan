-- Auto-generated import for alumnos + asignaciones
BEGIN;
CREATE EXTENSION IF NOT EXISTS pgcrypto;
WITH u AS (
  INSERT INTO "User" ("id", "dni", "passwordHash", "role", "status", "mustChangePassword", "createdAt", "updatedAt")
  VALUES ('216d8620-9dae-4cb6-a16d-5c96cba96d70', '55926268', '$2a$10$Ihmleuut7AB0Evmok.amMuwaB/LSczY4asdq3gq.KXkc5L3JCoCLC', 'STUDENT', 'ACTIVE', true, NOW(), NOW())
  ON CONFLICT ("dni") DO NOTHING
  RETURNING "id"
)
INSERT INTO "Student" ("dni", "userId", "firstName", "lastName", "birthDate", "phone", "guardianPhone", "email", "gym", "address", "createdAt", "updatedAt")
SELECT '55926268', COALESCE((SELECT "id" FROM u), (SELECT "id" FROM "User" WHERE "dni" = '55926268')), 'Emma', 'Carnicel', NULL, NULL, NULL, NULL, 'nan', NULL, NOW(), NOW()
ON CONFLICT ("dni") DO NOTHING;

WITH t AS (
  SELECT "id" FROM "Teacher" WHERE "userId" IN (SELECT "id" FROM "User" WHERE "dni" = '44009872')
), st AS (
  SELECT "dni" FROM "Student" WHERE "dni" = '55926268'
)
INSERT INTO "StudentTeacherAssignment" ("id", "studentDni", "teacherId", "startAt", "active")
SELECT gen_random_uuid(), st."dni", t."id", NOW(), true FROM st, t
WHERE NOT EXISTS (
  SELECT 1 FROM "StudentTeacherAssignment" a
  WHERE a."studentDni" = st."dni" AND a."active" = true
);

WITH u AS (
  INSERT INTO "User" ("id", "dni", "passwordHash", "role", "status", "mustChangePassword", "createdAt", "updatedAt")
  VALUES ('ed1d9c06-3bdb-42fc-a204-7896a699db28', '57370540', '$2a$10$w/1inUXE/9v2eqoHj4VZg.oIha1HG6WJHzOHrH7xieBs8QSkN1Wvq', 'STUDENT', 'ACTIVE', true, NOW(), NOW())
  ON CONFLICT ("dni") DO NOTHING
  RETURNING "id"
)
INSERT INTO "Student" ("dni", "userId", "firstName", "lastName", "birthDate", "phone", "guardianPhone", "email", "gym", "address", "createdAt", "updatedAt")
SELECT '57370540', COALESCE((SELECT "id" FROM u), (SELECT "id" FROM "User" WHERE "dni" = '57370540')), 'Tadeo', 'Sinastra', NULL, NULL, NULL, NULL, 'nan', NULL, NOW(), NOW()
ON CONFLICT ("dni") DO NOTHING;

WITH t AS (
  SELECT "id" FROM "Teacher" WHERE "userId" IN (SELECT "id" FROM "User" WHERE "dni" = '44009872')
), st AS (
  SELECT "dni" FROM "Student" WHERE "dni" = '57370540'
)
INSERT INTO "StudentTeacherAssignment" ("id", "studentDni", "teacherId", "startAt", "active")
SELECT gen_random_uuid(), st."dni", t."id", NOW(), true FROM st, t
WHERE NOT EXISTS (
  SELECT 1 FROM "StudentTeacherAssignment" a
  WHERE a."studentDni" = st."dni" AND a."active" = true
);

WITH u AS (
  INSERT INTO "User" ("id", "dni", "passwordHash", "role", "status", "mustChangePassword", "createdAt", "updatedAt")
  VALUES ('67cf5578-f561-4f04-b9d9-3f07e802b3e0', '49400559', '$2a$10$JLghK1NFG5oSImcSnqVraeAMjYpI53/XkB3nYNzRVDCOuK2P.B69y', 'STUDENT', 'ACTIVE', true, NOW(), NOW())
  ON CONFLICT ("dni") DO NOTHING
  RETURNING "id"
)
INSERT INTO "Student" ("dni", "userId", "firstName", "lastName", "birthDate", "phone", "guardianPhone", "email", "gym", "address", "createdAt", "updatedAt")
SELECT '49400559', COALESCE((SELECT "id" FROM u), (SELECT "id" FROM "User" WHERE "dni" = '49400559')), 'Mario', 'Baños', NULL, NULL, NULL, NULL, 'nan', NULL, NOW(), NOW()
ON CONFLICT ("dni") DO NOTHING;

WITH t AS (
  SELECT "id" FROM "Teacher" WHERE "userId" IN (SELECT "id" FROM "User" WHERE "dni" = '44009872')
), st AS (
  SELECT "dni" FROM "Student" WHERE "dni" = '49400559'
)
INSERT INTO "StudentTeacherAssignment" ("id", "studentDni", "teacherId", "startAt", "active")
SELECT gen_random_uuid(), st."dni", t."id", NOW(), true FROM st, t
WHERE NOT EXISTS (
  SELECT 1 FROM "StudentTeacherAssignment" a
  WHERE a."studentDni" = st."dni" AND a."active" = true
);

WITH u AS (
  INSERT INTO "User" ("id", "dni", "passwordHash", "role", "status", "mustChangePassword", "createdAt", "updatedAt")
  VALUES ('fe13d09c-aa83-47a0-9eba-31141bc31a0a', '51189443', '$2a$10$5WMrwdCjVXshausd26bZDO2XGuuQuTfitcWmmXelGcGhIy66FVObC', 'STUDENT', 'ACTIVE', true, NOW(), NOW())
  ON CONFLICT ("dni") DO NOTHING
  RETURNING "id"
)
INSERT INTO "Student" ("dni", "userId", "firstName", "lastName", "birthDate", "phone", "guardianPhone", "email", "gym", "address", "createdAt", "updatedAt")
SELECT '51189443', COALESCE((SELECT "id" FROM u), (SELECT "id" FROM "User" WHERE "dni" = '51189443')), 'Leonardo', 'Baños', NULL, NULL, NULL, NULL, 'nan', NULL, NOW(), NOW()
ON CONFLICT ("dni") DO NOTHING;

WITH t AS (
  SELECT "id" FROM "Teacher" WHERE "userId" IN (SELECT "id" FROM "User" WHERE "dni" = '44009872')
), st AS (
  SELECT "dni" FROM "Student" WHERE "dni" = '51189443'
)
INSERT INTO "StudentTeacherAssignment" ("id", "studentDni", "teacherId", "startAt", "active")
SELECT gen_random_uuid(), st."dni", t."id", NOW(), true FROM st, t
WHERE NOT EXISTS (
  SELECT 1 FROM "StudentTeacherAssignment" a
  WHERE a."studentDni" = st."dni" AND a."active" = true
);

WITH u AS (
  INSERT INTO "User" ("id", "dni", "passwordHash", "role", "status", "mustChangePassword", "createdAt", "updatedAt")
  VALUES ('357ba202-a47c-44be-962a-5f8adb59156e', '55545110', '$2a$10$OZ8bkgAGo.RxURZs8ZGJdeWPHO/zN0XZacap7.BOALBt5oOnTps.2', 'STUDENT', 'ACTIVE', true, NOW(), NOW())
  ON CONFLICT ("dni") DO NOTHING
  RETURNING "id"
)
INSERT INTO "Student" ("dni", "userId", "firstName", "lastName", "birthDate", "phone", "guardianPhone", "email", "gym", "address", "createdAt", "updatedAt")
SELECT '55545110', COALESCE((SELECT "id" FROM u), (SELECT "id" FROM "User" WHERE "dni" = '55545110')), 'Federico', 'Funes', NULL, NULL, NULL, NULL, 'nan', NULL, NOW(), NOW()
ON CONFLICT ("dni") DO NOTHING;

WITH t AS (
  SELECT "id" FROM "Teacher" WHERE "userId" IN (SELECT "id" FROM "User" WHERE "dni" = '44009872')
), st AS (
  SELECT "dni" FROM "Student" WHERE "dni" = '55545110'
)
INSERT INTO "StudentTeacherAssignment" ("id", "studentDni", "teacherId", "startAt", "active")
SELECT gen_random_uuid(), st."dni", t."id", NOW(), true FROM st, t
WHERE NOT EXISTS (
  SELECT 1 FROM "StudentTeacherAssignment" a
  WHERE a."studentDni" = st."dni" AND a."active" = true
);

WITH u AS (
  INSERT INTO "User" ("id", "dni", "passwordHash", "role", "status", "mustChangePassword", "createdAt", "updatedAt")
  VALUES ('5be2536d-69df-4e8c-8982-48b20641d6f6', '55380219', '$2a$10$wM4IOUmWrvwmD3ETIrcl3OIH0fd6IxDsp42scL6JlQuHq.99JT93C', 'STUDENT', 'ACTIVE', true, NOW(), NOW())
  ON CONFLICT ("dni") DO NOTHING
  RETURNING "id"
)
INSERT INTO "Student" ("dni", "userId", "firstName", "lastName", "birthDate", "phone", "guardianPhone", "email", "gym", "address", "createdAt", "updatedAt")
SELECT '55380219', COALESCE((SELECT "id" FROM u), (SELECT "id" FROM "User" WHERE "dni" = '55380219')), 'Lorenzo', 'Funes', NULL, NULL, NULL, NULL, 'nan', NULL, NOW(), NOW()
ON CONFLICT ("dni") DO NOTHING;

WITH t AS (
  SELECT "id" FROM "Teacher" WHERE "userId" IN (SELECT "id" FROM "User" WHERE "dni" = '44009872')
), st AS (
  SELECT "dni" FROM "Student" WHERE "dni" = '55380219'
)
INSERT INTO "StudentTeacherAssignment" ("id", "studentDni", "teacherId", "startAt", "active")
SELECT gen_random_uuid(), st."dni", t."id", NOW(), true FROM st, t
WHERE NOT EXISTS (
  SELECT 1 FROM "StudentTeacherAssignment" a
  WHERE a."studentDni" = st."dni" AND a."active" = true
);

WITH u AS (
  INSERT INTO "User" ("id", "dni", "passwordHash", "role", "status", "mustChangePassword", "createdAt", "updatedAt")
  VALUES ('ae975060-615c-4024-8d17-37ce4937b184', '55380220', '$2a$10$e1CHdsYuSW/WYdNGth7XQeBwIG87fi3bGBvu3jNPDqd/ULHB9t4yG', 'STUDENT', 'ACTIVE', true, NOW(), NOW())
  ON CONFLICT ("dni") DO NOTHING
  RETURNING "id"
)
INSERT INTO "Student" ("dni", "userId", "firstName", "lastName", "birthDate", "phone", "guardianPhone", "email", "gym", "address", "createdAt", "updatedAt")
SELECT '55380220', COALESCE((SELECT "id" FROM u), (SELECT "id" FROM "User" WHERE "dni" = '55380220')), 'Lisandro', 'Funes', NULL, NULL, NULL, NULL, 'nan', NULL, NOW(), NOW()
ON CONFLICT ("dni") DO NOTHING;

WITH t AS (
  SELECT "id" FROM "Teacher" WHERE "userId" IN (SELECT "id" FROM "User" WHERE "dni" = '44009872')
), st AS (
  SELECT "dni" FROM "Student" WHERE "dni" = '55380220'
)
INSERT INTO "StudentTeacherAssignment" ("id", "studentDni", "teacherId", "startAt", "active")
SELECT gen_random_uuid(), st."dni", t."id", NOW(), true FROM st, t
WHERE NOT EXISTS (
  SELECT 1 FROM "StudentTeacherAssignment" a
  WHERE a."studentDni" = st."dni" AND a."active" = true
);

WITH u AS (
  INSERT INTO "User" ("id", "dni", "passwordHash", "role", "status", "mustChangePassword", "createdAt", "updatedAt")
  VALUES ('214070a2-f4a2-47af-ae79-76d69e19e4ef', '53942626', '$2a$10$DovXp2kGjqMIlOz2KryqyOuOoSJtDF.BP5Bb7pSiVYvVv1JBjPuK2', 'STUDENT', 'ACTIVE', true, NOW(), NOW())
  ON CONFLICT ("dni") DO NOTHING
  RETURNING "id"
)
INSERT INTO "Student" ("dni", "userId", "firstName", "lastName", "birthDate", "phone", "guardianPhone", "email", "gym", "address", "createdAt", "updatedAt")
SELECT '53942626', COALESCE((SELECT "id" FROM u), (SELECT "id" FROM "User" WHERE "dni" = '53942626')), 'Facundo', 'Perez', NULL, NULL, NULL, NULL, 'nan', NULL, NOW(), NOW()
ON CONFLICT ("dni") DO NOTHING;

WITH t AS (
  SELECT "id" FROM "Teacher" WHERE "userId" IN (SELECT "id" FROM "User" WHERE "dni" = '44009872')
), st AS (
  SELECT "dni" FROM "Student" WHERE "dni" = '53942626'
)
INSERT INTO "StudentTeacherAssignment" ("id", "studentDni", "teacherId", "startAt", "active")
SELECT gen_random_uuid(), st."dni", t."id", NOW(), true FROM st, t
WHERE NOT EXISTS (
  SELECT 1 FROM "StudentTeacherAssignment" a
  WHERE a."studentDni" = st."dni" AND a."active" = true
);

WITH u AS (
  INSERT INTO "User" ("id", "dni", "passwordHash", "role", "status", "mustChangePassword", "createdAt", "updatedAt")
  VALUES ('675364d4-970e-4505-89ee-f7cdd5879f3a', '54923846', '$2a$10$irnOk.b0rdx0YQru/XSFD.T20d/kKTYfit4caPcV5fdaYU3RUd5G.', 'STUDENT', 'ACTIVE', true, NOW(), NOW())
  ON CONFLICT ("dni") DO NOTHING
  RETURNING "id"
)
INSERT INTO "Student" ("dni", "userId", "firstName", "lastName", "birthDate", "phone", "guardianPhone", "email", "gym", "address", "createdAt", "updatedAt")
SELECT '54923846', COALESCE((SELECT "id" FROM u), (SELECT "id" FROM "User" WHERE "dni" = '54923846')), 'Lautaro', 'Prado', NULL, NULL, NULL, NULL, 'nan', NULL, NOW(), NOW()
ON CONFLICT ("dni") DO NOTHING;

WITH t AS (
  SELECT "id" FROM "Teacher" WHERE "userId" IN (SELECT "id" FROM "User" WHERE "dni" = '44009872')
), st AS (
  SELECT "dni" FROM "Student" WHERE "dni" = '54923846'
)
INSERT INTO "StudentTeacherAssignment" ("id", "studentDni", "teacherId", "startAt", "active")
SELECT gen_random_uuid(), st."dni", t."id", NOW(), true FROM st, t
WHERE NOT EXISTS (
  SELECT 1 FROM "StudentTeacherAssignment" a
  WHERE a."studentDni" = st."dni" AND a."active" = true
);

WITH u AS (
  INSERT INTO "User" ("id", "dni", "passwordHash", "role", "status", "mustChangePassword", "createdAt", "updatedAt")
  VALUES ('3e4bc891-b901-4cce-b03c-235dbc845724', '56086377', '$2a$10$o9PpMpaNp1W6B0ygVFIieeLVIEHmgWtna1GcirvtedVSnnX72qM5O', 'STUDENT', 'ACTIVE', true, NOW(), NOW())
  ON CONFLICT ("dni") DO NOTHING
  RETURNING "id"
)
INSERT INTO "Student" ("dni", "userId", "firstName", "lastName", "birthDate", "phone", "guardianPhone", "email", "gym", "address", "createdAt", "updatedAt")
SELECT '56086377', COALESCE((SELECT "id" FROM u), (SELECT "id" FROM "User" WHERE "dni" = '56086377')), 'Valentin', 'Chavez', NULL, NULL, NULL, NULL, 'nan', NULL, NOW(), NOW()
ON CONFLICT ("dni") DO NOTHING;

WITH t AS (
  SELECT "id" FROM "Teacher" WHERE "userId" IN (SELECT "id" FROM "User" WHERE "dni" = '44009872')
), st AS (
  SELECT "dni" FROM "Student" WHERE "dni" = '56086377'
)
INSERT INTO "StudentTeacherAssignment" ("id", "studentDni", "teacherId", "startAt", "active")
SELECT gen_random_uuid(), st."dni", t."id", NOW(), true FROM st, t
WHERE NOT EXISTS (
  SELECT 1 FROM "StudentTeacherAssignment" a
  WHERE a."studentDni" = st."dni" AND a."active" = true
);

WITH u AS (
  INSERT INTO "User" ("id", "dni", "passwordHash", "role", "status", "mustChangePassword", "createdAt", "updatedAt")
  VALUES ('547071cf-ce86-4d6e-858a-27847e2ce5ad', '45529902', '$2a$10$TgpHHJpQm0rmiSdPnvqkGOB.W/cSLyOOXSB8QC.Vj.2dnNnXkmioe', 'STUDENT', 'ACTIVE', true, NOW(), NOW())
  ON CONFLICT ("dni") DO NOTHING
  RETURNING "id"
)
INSERT INTO "Student" ("dni", "userId", "firstName", "lastName", "birthDate", "phone", "guardianPhone", "email", "gym", "address", "createdAt", "updatedAt")
SELECT '45529902', COALESCE((SELECT "id" FROM u), (SELECT "id" FROM "User" WHERE "dni" = '45529902')), 'Fernando', 'Palacios', NULL, NULL, NULL, NULL, 'nan', NULL, NOW(), NOW()
ON CONFLICT ("dni") DO NOTHING;

WITH t AS (
  SELECT "id" FROM "Teacher" WHERE "userId" IN (SELECT "id" FROM "User" WHERE "dni" = '44009872')
), st AS (
  SELECT "dni" FROM "Student" WHERE "dni" = '45529902'
)
INSERT INTO "StudentTeacherAssignment" ("id", "studentDni", "teacherId", "startAt", "active")
SELECT gen_random_uuid(), st."dni", t."id", NOW(), true FROM st, t
WHERE NOT EXISTS (
  SELECT 1 FROM "StudentTeacherAssignment" a
  WHERE a."studentDni" = st."dni" AND a."active" = true
);

WITH u AS (
  INSERT INTO "User" ("id", "dni", "passwordHash", "role", "status", "mustChangePassword", "createdAt", "updatedAt")
  VALUES ('b78da6bd-8c92-4710-b579-c4cf0627f69a', '46172388', '$2a$10$0PLgoDN58oxofySdnakcjODNfE5fBT2O1R2/ZxKUOGIpsNbHfpPbG', 'STUDENT', 'ACTIVE', true, NOW(), NOW())
  ON CONFLICT ("dni") DO NOTHING
  RETURNING "id"
)
INSERT INTO "Student" ("dni", "userId", "firstName", "lastName", "birthDate", "phone", "guardianPhone", "email", "gym", "address", "createdAt", "updatedAt")
SELECT '46172388', COALESCE((SELECT "id" FROM u), (SELECT "id" FROM "User" WHERE "dni" = '46172388')), 'Samuel', 'Serrano', NULL, NULL, NULL, NULL, 'nan', NULL, NOW(), NOW()
ON CONFLICT ("dni") DO NOTHING;

WITH t AS (
  SELECT "id" FROM "Teacher" WHERE "userId" IN (SELECT "id" FROM "User" WHERE "dni" = '44009872')
), st AS (
  SELECT "dni" FROM "Student" WHERE "dni" = '46172388'
)
INSERT INTO "StudentTeacherAssignment" ("id", "studentDni", "teacherId", "startAt", "active")
SELECT gen_random_uuid(), st."dni", t."id", NOW(), true FROM st, t
WHERE NOT EXISTS (
  SELECT 1 FROM "StudentTeacherAssignment" a
  WHERE a."studentDni" = st."dni" AND a."active" = true
);

WITH u AS (
  INSERT INTO "User" ("id", "dni", "passwordHash", "role", "status", "mustChangePassword", "createdAt", "updatedAt")
  VALUES ('1a32e78f-178d-475a-9f96-86ada9b87161', '44986637', '$2a$10$DoZjs2sKJ9JhntJ2SfjGlO/l3PhjVMNC3D1g6pTNlBK7mxBXX236a', 'STUDENT', 'ACTIVE', true, NOW(), NOW())
  ON CONFLICT ("dni") DO NOTHING
  RETURNING "id"
)
INSERT INTO "Student" ("dni", "userId", "firstName", "lastName", "birthDate", "phone", "guardianPhone", "email", "gym", "address", "createdAt", "updatedAt")
SELECT '44986637', COALESCE((SELECT "id" FROM u), (SELECT "id" FROM "User" WHERE "dni" = '44986637')), 'Mercedes', 'Murri', NULL, NULL, NULL, NULL, 'nan', NULL, NOW(), NOW()
ON CONFLICT ("dni") DO NOTHING;

WITH t AS (
  SELECT "id" FROM "Teacher" WHERE "userId" IN (SELECT "id" FROM "User" WHERE "dni" = '44009872')
), st AS (
  SELECT "dni" FROM "Student" WHERE "dni" = '44986637'
)
INSERT INTO "StudentTeacherAssignment" ("id", "studentDni", "teacherId", "startAt", "active")
SELECT gen_random_uuid(), st."dni", t."id", NOW(), true FROM st, t
WHERE NOT EXISTS (
  SELECT 1 FROM "StudentTeacherAssignment" a
  WHERE a."studentDni" = st."dni" AND a."active" = true
);

WITH u AS (
  INSERT INTO "User" ("id", "dni", "passwordHash", "role", "status", "mustChangePassword", "createdAt", "updatedAt")
  VALUES ('ead73257-a614-4551-b682-09ef396c5c42', '52940656', '$2a$10$p4YeqX4xeojycMsznMgim.aLLIGC8w.fbgSgBEgPCKU6KqB71k60i', 'STUDENT', 'ACTIVE', true, NOW(), NOW())
  ON CONFLICT ("dni") DO NOTHING
  RETURNING "id"
)
INSERT INTO "Student" ("dni", "userId", "firstName", "lastName", "birthDate", "phone", "guardianPhone", "email", "gym", "address", "createdAt", "updatedAt")
SELECT '52940656', COALESCE((SELECT "id" FROM u), (SELECT "id" FROM "User" WHERE "dni" = '52940656')), 'Angelina', 'Bazan', NULL, NULL, NULL, NULL, 'nan', NULL, NOW(), NOW()
ON CONFLICT ("dni") DO NOTHING;

WITH t AS (
  SELECT "id" FROM "Teacher" WHERE "userId" IN (SELECT "id" FROM "User" WHERE "dni" = '44009872')
), st AS (
  SELECT "dni" FROM "Student" WHERE "dni" = '52940656'
)
INSERT INTO "StudentTeacherAssignment" ("id", "studentDni", "teacherId", "startAt", "active")
SELECT gen_random_uuid(), st."dni", t."id", NOW(), true FROM st, t
WHERE NOT EXISTS (
  SELECT 1 FROM "StudentTeacherAssignment" a
  WHERE a."studentDni" = st."dni" AND a."active" = true
);

WITH u AS (
  INSERT INTO "User" ("id", "dni", "passwordHash", "role", "status", "mustChangePassword", "createdAt", "updatedAt")
  VALUES ('0a8538f4-232d-4de9-97a6-e52ddb5d5747', '51187268', '$2a$10$KkwEJ5pJnfFfprp8PHoF7e3Vdw9EXWS0KuJwgvCzK0pwVsoCbw4lK', 'STUDENT', 'ACTIVE', true, NOW(), NOW())
  ON CONFLICT ("dni") DO NOTHING
  RETURNING "id"
)
INSERT INTO "Student" ("dni", "userId", "firstName", "lastName", "birthDate", "phone", "guardianPhone", "email", "gym", "address", "createdAt", "updatedAt")
SELECT '51187268', COALESCE((SELECT "id" FROM u), (SELECT "id" FROM "User" WHERE "dni" = '51187268')), 'Rocio', 'Barrionuevo', NULL, NULL, NULL, NULL, 'nan', NULL, NOW(), NOW()
ON CONFLICT ("dni") DO NOTHING;

WITH t AS (
  SELECT "id" FROM "Teacher" WHERE "userId" IN (SELECT "id" FROM "User" WHERE "dni" = '44009872')
), st AS (
  SELECT "dni" FROM "Student" WHERE "dni" = '51187268'
)
INSERT INTO "StudentTeacherAssignment" ("id", "studentDni", "teacherId", "startAt", "active")
SELECT gen_random_uuid(), st."dni", t."id", NOW(), true FROM st, t
WHERE NOT EXISTS (
  SELECT 1 FROM "StudentTeacherAssignment" a
  WHERE a."studentDni" = st."dni" AND a."active" = true
);

WITH u AS (
  INSERT INTO "User" ("id", "dni", "passwordHash", "role", "status", "mustChangePassword", "createdAt", "updatedAt")
  VALUES ('1073a1bd-6f75-4ffb-8e57-f7326c33f44e', '39603413', '$2a$10$P80v1rU5JUiCP60i8OQfzurclX.4X9W2foET3scTwVf7QGMSGdDVC', 'STUDENT', 'ACTIVE', true, NOW(), NOW())
  ON CONFLICT ("dni") DO NOTHING
  RETURNING "id"
)
INSERT INTO "Student" ("dni", "userId", "firstName", "lastName", "birthDate", "phone", "guardianPhone", "email", "gym", "address", "createdAt", "updatedAt")
SELECT '39603413', COALESCE((SELECT "id" FROM u), (SELECT "id" FROM "User" WHERE "dni" = '39603413')), 'Gabriel', 'Medina', NULL, NULL, NULL, NULL, 'nan', NULL, NOW(), NOW()
ON CONFLICT ("dni") DO NOTHING;

WITH t AS (
  SELECT "id" FROM "Teacher" WHERE "userId" IN (SELECT "id" FROM "User" WHERE "dni" = '44009872')
), st AS (
  SELECT "dni" FROM "Student" WHERE "dni" = '39603413'
)
INSERT INTO "StudentTeacherAssignment" ("id", "studentDni", "teacherId", "startAt", "active")
SELECT gen_random_uuid(), st."dni", t."id", NOW(), true FROM st, t
WHERE NOT EXISTS (
  SELECT 1 FROM "StudentTeacherAssignment" a
  WHERE a."studentDni" = st."dni" AND a."active" = true
);

WITH u AS (
  INSERT INTO "User" ("id", "dni", "passwordHash", "role", "status", "mustChangePassword", "createdAt", "updatedAt")
  VALUES ('c0ccc537-effe-4ca3-82e9-a2e03fb7ea55', '53491133', '$2a$10$l4z8H906p1onN4USyeuEfOCOlcaMPMvVPb4wAfHp1HAft3s7DHz9e', 'STUDENT', 'ACTIVE', true, NOW(), NOW())
  ON CONFLICT ("dni") DO NOTHING
  RETURNING "id"
)
INSERT INTO "Student" ("dni", "userId", "firstName", "lastName", "birthDate", "phone", "guardianPhone", "email", "gym", "address", "createdAt", "updatedAt")
SELECT '53491133', COALESCE((SELECT "id" FROM u), (SELECT "id" FROM "User" WHERE "dni" = '53491133')), 'Sabino', 'Gonzales', NULL, NULL, NULL, NULL, 'nan', NULL, NOW(), NOW()
ON CONFLICT ("dni") DO NOTHING;

WITH t AS (
  SELECT "id" FROM "Teacher" WHERE "userId" IN (SELECT "id" FROM "User" WHERE "dni" = '48077697')
), st AS (
  SELECT "dni" FROM "Student" WHERE "dni" = '53491133'
)
INSERT INTO "StudentTeacherAssignment" ("id", "studentDni", "teacherId", "startAt", "active")
SELECT gen_random_uuid(), st."dni", t."id", NOW(), true FROM st, t
WHERE NOT EXISTS (
  SELECT 1 FROM "StudentTeacherAssignment" a
  WHERE a."studentDni" = st."dni" AND a."active" = true
);

WITH u AS (
  INSERT INTO "User" ("id", "dni", "passwordHash", "role", "status", "mustChangePassword", "createdAt", "updatedAt")
  VALUES ('644e0eba-0072-4ae5-9466-4486888d6d41', '48257060', '$2a$10$hlGd1Vuu5utmL3wX1TM5hODpM7Cfq/8FFu93OUMZ2TG/w7L3TBdla', 'STUDENT', 'ACTIVE', true, NOW(), NOW())
  ON CONFLICT ("dni") DO NOTHING
  RETURNING "id"
)
INSERT INTO "Student" ("dni", "userId", "firstName", "lastName", "birthDate", "phone", "guardianPhone", "email", "gym", "address", "createdAt", "updatedAt")
SELECT '48257060', COALESCE((SELECT "id" FROM u), (SELECT "id" FROM "User" WHERE "dni" = '48257060')), 'Marco', 'Martinez', NULL, NULL, NULL, NULL, 'nan', NULL, NOW(), NOW()
ON CONFLICT ("dni") DO NOTHING;

WITH t AS (
  SELECT "id" FROM "Teacher" WHERE "userId" IN (SELECT "id" FROM "User" WHERE "dni" = '48077697')
), st AS (
  SELECT "dni" FROM "Student" WHERE "dni" = '48257060'
)
INSERT INTO "StudentTeacherAssignment" ("id", "studentDni", "teacherId", "startAt", "active")
SELECT gen_random_uuid(), st."dni", t."id", NOW(), true FROM st, t
WHERE NOT EXISTS (
  SELECT 1 FROM "StudentTeacherAssignment" a
  WHERE a."studentDni" = st."dni" AND a."active" = true
);

WITH u AS (
  INSERT INTO "User" ("id", "dni", "passwordHash", "role", "status", "mustChangePassword", "createdAt", "updatedAt")
  VALUES ('7ef867fc-9944-44fd-b84d-21a78ca94773', '52291679', '$2a$10$qGREIbb0zMogffrbiJb8COI4nKuK1FNsjCuL5O2k2iG8EP1l6LEw6', 'STUDENT', 'ACTIVE', true, NOW(), NOW())
  ON CONFLICT ("dni") DO NOTHING
  RETURNING "id"
)
INSERT INTO "Student" ("dni", "userId", "firstName", "lastName", "birthDate", "phone", "guardianPhone", "email", "gym", "address", "createdAt", "updatedAt")
SELECT '52291679', COALESCE((SELECT "id" FROM u), (SELECT "id" FROM "User" WHERE "dni" = '52291679')), 'Daiana Abigail', 'Gonzales', NULL, NULL, NULL, NULL, 'nan', NULL, NOW(), NOW()
ON CONFLICT ("dni") DO NOTHING;

WITH t AS (
  SELECT "id" FROM "Teacher" WHERE "userId" IN (SELECT "id" FROM "User" WHERE "dni" = '48077697')
), st AS (
  SELECT "dni" FROM "Student" WHERE "dni" = '52291679'
)
INSERT INTO "StudentTeacherAssignment" ("id", "studentDni", "teacherId", "startAt", "active")
SELECT gen_random_uuid(), st."dni", t."id", NOW(), true FROM st, t
WHERE NOT EXISTS (
  SELECT 1 FROM "StudentTeacherAssignment" a
  WHERE a."studentDni" = st."dni" AND a."active" = true
);

WITH u AS (
  INSERT INTO "User" ("id", "dni", "passwordHash", "role", "status", "mustChangePassword", "createdAt", "updatedAt")
  VALUES ('c7b3eda3-56aa-4e0c-89d6-59f18057644f', '47809490', '$2a$10$9jVDEuiiEVuc5ocxXIJ0oe4uE.8tfb5Ujq8tdXz5UZ7HNYofKtrjK', 'STUDENT', 'ACTIVE', true, NOW(), NOW())
  ON CONFLICT ("dni") DO NOTHING
  RETURNING "id"
)
INSERT INTO "Student" ("dni", "userId", "firstName", "lastName", "birthDate", "phone", "guardianPhone", "email", "gym", "address", "createdAt", "updatedAt")
SELECT '47809490', COALESCE((SELECT "id" FROM u), (SELECT "id" FROM "User" WHERE "dni" = '47809490')), 'Alexis', 'Lopez', NULL, NULL, NULL, NULL, 'nan', NULL, NOW(), NOW()
ON CONFLICT ("dni") DO NOTHING;

WITH t AS (
  SELECT "id" FROM "Teacher" WHERE "userId" IN (SELECT "id" FROM "User" WHERE "dni" = '48077697')
), st AS (
  SELECT "dni" FROM "Student" WHERE "dni" = '47809490'
)
INSERT INTO "StudentTeacherAssignment" ("id", "studentDni", "teacherId", "startAt", "active")
SELECT gen_random_uuid(), st."dni", t."id", NOW(), true FROM st, t
WHERE NOT EXISTS (
  SELECT 1 FROM "StudentTeacherAssignment" a
  WHERE a."studentDni" = st."dni" AND a."active" = true
);

WITH u AS (
  INSERT INTO "User" ("id", "dni", "passwordHash", "role", "status", "mustChangePassword", "createdAt", "updatedAt")
  VALUES ('0de2ee94-18b9-4f32-85a7-18826f601398', '56804273', '$2a$10$yoqXFq/.BpkKt.PlglCnaea2dhjgWCTRxX1iQnFMgH0CGPbWqOfkG', 'STUDENT', 'ACTIVE', true, NOW(), NOW())
  ON CONFLICT ("dni") DO NOTHING
  RETURNING "id"
)
INSERT INTO "Student" ("dni", "userId", "firstName", "lastName", "birthDate", "phone", "guardianPhone", "email", "gym", "address", "createdAt", "updatedAt")
SELECT '56804273', COALESCE((SELECT "id" FROM u), (SELECT "id" FROM "User" WHERE "dni" = '56804273')), 'Olivia', 'Lisotto', NULL, NULL, NULL, NULL, 'nan', NULL, NOW(), NOW()
ON CONFLICT ("dni") DO NOTHING;

WITH t AS (
  SELECT "id" FROM "Teacher" WHERE "userId" IN (SELECT "id" FROM "User" WHERE "dni" = '48077697')
), st AS (
  SELECT "dni" FROM "Student" WHERE "dni" = '56804273'
)
INSERT INTO "StudentTeacherAssignment" ("id", "studentDni", "teacherId", "startAt", "active")
SELECT gen_random_uuid(), st."dni", t."id", NOW(), true FROM st, t
WHERE NOT EXISTS (
  SELECT 1 FROM "StudentTeacherAssignment" a
  WHERE a."studentDni" = st."dni" AND a."active" = true
);

WITH u AS (
  INSERT INTO "User" ("id", "dni", "passwordHash", "role", "status", "mustChangePassword", "createdAt", "updatedAt")
  VALUES ('656028c3-ab36-4427-a166-2c42012a12cc', '50711560', '$2a$10$DteBjkEoBbb7KEZ0h48cQua7uW0p1PzElmBvAb78gUOIIhW3phewO', 'STUDENT', 'ACTIVE', true, NOW(), NOW())
  ON CONFLICT ("dni") DO NOTHING
  RETURNING "id"
)
INSERT INTO "Student" ("dni", "userId", "firstName", "lastName", "birthDate", "phone", "guardianPhone", "email", "gym", "address", "createdAt", "updatedAt")
SELECT '50711560', COALESCE((SELECT "id" FROM u), (SELECT "id" FROM "User" WHERE "dni" = '50711560')), 'Valeria', 'Dominguez', NULL, NULL, NULL, NULL, 'nan', NULL, NOW(), NOW()
ON CONFLICT ("dni") DO NOTHING;

WITH t AS (
  SELECT "id" FROM "Teacher" WHERE "userId" IN (SELECT "id" FROM "User" WHERE "dni" = '48077697')
), st AS (
  SELECT "dni" FROM "Student" WHERE "dni" = '50711560'
)
INSERT INTO "StudentTeacherAssignment" ("id", "studentDni", "teacherId", "startAt", "active")
SELECT gen_random_uuid(), st."dni", t."id", NOW(), true FROM st, t
WHERE NOT EXISTS (
  SELECT 1 FROM "StudentTeacherAssignment" a
  WHERE a."studentDni" = st."dni" AND a."active" = true
);

WITH u AS (
  INSERT INTO "User" ("id", "dni", "passwordHash", "role", "status", "mustChangePassword", "createdAt", "updatedAt")
  VALUES ('a62fa4d4-de9e-4511-8e53-a4ebd7fe6411', '52933870', '$2a$10$iI/AY8d7EH/Djzf3cH38VOSkWHJTCvnXt1hvB9i5NwcQ4JPI92Sku', 'STUDENT', 'ACTIVE', true, NOW(), NOW())
  ON CONFLICT ("dni") DO NOTHING
  RETURNING "id"
)
INSERT INTO "Student" ("dni", "userId", "firstName", "lastName", "birthDate", "phone", "guardianPhone", "email", "gym", "address", "createdAt", "updatedAt")
SELECT '52933870', COALESCE((SELECT "id" FROM u), (SELECT "id" FROM "User" WHERE "dni" = '52933870')), 'Augusto', 'Suarez', NULL, NULL, NULL, NULL, 'nan', NULL, NOW(), NOW()
ON CONFLICT ("dni") DO NOTHING;

WITH t AS (
  SELECT "id" FROM "Teacher" WHERE "userId" IN (SELECT "id" FROM "User" WHERE "dni" = '48077697')
), st AS (
  SELECT "dni" FROM "Student" WHERE "dni" = '52933870'
)
INSERT INTO "StudentTeacherAssignment" ("id", "studentDni", "teacherId", "startAt", "active")
SELECT gen_random_uuid(), st."dni", t."id", NOW(), true FROM st, t
WHERE NOT EXISTS (
  SELECT 1 FROM "StudentTeacherAssignment" a
  WHERE a."studentDni" = st."dni" AND a."active" = true
);

WITH u AS (
  INSERT INTO "User" ("id", "dni", "passwordHash", "role", "status", "mustChangePassword", "createdAt", "updatedAt")
  VALUES ('9354a2d6-edd8-4084-a6da-88a5fb86a4b9', '51013051', '$2a$10$8Nhx20ze4okN4H4mLtBdeOsmEr0esFVtRo5U1tEYGwva8H6vN6Ai.', 'STUDENT', 'ACTIVE', true, NOW(), NOW())
  ON CONFLICT ("dni") DO NOTHING
  RETURNING "id"
)
INSERT INTO "Student" ("dni", "userId", "firstName", "lastName", "birthDate", "phone", "guardianPhone", "email", "gym", "address", "createdAt", "updatedAt")
SELECT '51013051', COALESCE((SELECT "id" FROM u), (SELECT "id" FROM "User" WHERE "dni" = '51013051')), 'Aylin Lourde', 'Muñoz', NULL, NULL, NULL, NULL, 'RIVADAVIA', NULL, NOW(), NOW()
ON CONFLICT ("dni") DO NOTHING;

WITH t AS (
  SELECT "id" FROM "Teacher" WHERE "userId" IN (SELECT "id" FROM "User" WHERE "dni" = '24442147')
), st AS (
  SELECT "dni" FROM "Student" WHERE "dni" = '51013051'
)
INSERT INTO "StudentTeacherAssignment" ("id", "studentDni", "teacherId", "startAt", "active")
SELECT gen_random_uuid(), st."dni", t."id", NOW(), true FROM st, t
WHERE NOT EXISTS (
  SELECT 1 FROM "StudentTeacherAssignment" a
  WHERE a."studentDni" = st."dni" AND a."active" = true
);

WITH u AS (
  INSERT INTO "User" ("id", "dni", "passwordHash", "role", "status", "mustChangePassword", "createdAt", "updatedAt")
  VALUES ('a47d5d08-8c6d-4013-9672-a1ce7d0dbf45', '12128733', '$2a$10$O5uh5XvK1nfBOpjYGfuJhe3NU0sCKEC6sG5FKIF0DCNssylqXgT2e', 'STUDENT', 'ACTIVE', true, NOW(), NOW())
  ON CONFLICT ("dni") DO NOTHING
  RETURNING "id"
)
INSERT INTO "Student" ("dni", "userId", "firstName", "lastName", "birthDate", "phone", "guardianPhone", "email", "gym", "address", "createdAt", "updatedAt")
SELECT '12128733', COALESCE((SELECT "id" FROM u), (SELECT "id" FROM "User" WHERE "dni" = '12128733')), 'Ana Cristina', 'Jerez', NULL, NULL, NULL, NULL, 'RIVADAVIA', NULL, NOW(), NOW()
ON CONFLICT ("dni") DO NOTHING;

WITH t AS (
  SELECT "id" FROM "Teacher" WHERE "userId" IN (SELECT "id" FROM "User" WHERE "dni" = '24442147')
), st AS (
  SELECT "dni" FROM "Student" WHERE "dni" = '12128733'
)
INSERT INTO "StudentTeacherAssignment" ("id", "studentDni", "teacherId", "startAt", "active")
SELECT gen_random_uuid(), st."dni", t."id", NOW(), true FROM st, t
WHERE NOT EXISTS (
  SELECT 1 FROM "StudentTeacherAssignment" a
  WHERE a."studentDni" = st."dni" AND a."active" = true
);

WITH u AS (
  INSERT INTO "User" ("id", "dni", "passwordHash", "role", "status", "mustChangePassword", "createdAt", "updatedAt")
  VALUES ('7285d86d-40b7-4712-8f35-fbfcc21401b4', '54689426', '$2a$10$AbTA0ukC.Klsq/.4vIYoJudEgIgDKX27fbLNRF6Ih47fvdTiIWZRG', 'STUDENT', 'ACTIVE', true, NOW(), NOW())
  ON CONFLICT ("dni") DO NOTHING
  RETURNING "id"
)
INSERT INTO "Student" ("dni", "userId", "firstName", "lastName", "birthDate", "phone", "guardianPhone", "email", "gym", "address", "createdAt", "updatedAt")
SELECT '54689426', COALESCE((SELECT "id" FROM u), (SELECT "id" FROM "User" WHERE "dni" = '54689426')), 'Lian Valentin', 'Barzola', NULL, NULL, NULL, NULL, 'SAN MARTIN', NULL, NOW(), NOW()
ON CONFLICT ("dni") DO NOTHING;

WITH t AS (
  SELECT "id" FROM "Teacher" WHERE "userId" IN (SELECT "id" FROM "User" WHERE "dni" = '24442147')
), st AS (
  SELECT "dni" FROM "Student" WHERE "dni" = '54689426'
)
INSERT INTO "StudentTeacherAssignment" ("id", "studentDni", "teacherId", "startAt", "active")
SELECT gen_random_uuid(), st."dni", t."id", NOW(), true FROM st, t
WHERE NOT EXISTS (
  SELECT 1 FROM "StudentTeacherAssignment" a
  WHERE a."studentDni" = st."dni" AND a."active" = true
);

WITH u AS (
  INSERT INTO "User" ("id", "dni", "passwordHash", "role", "status", "mustChangePassword", "createdAt", "updatedAt")
  VALUES ('feb125a7-4e8f-4fa3-8b9e-283764ac3c9e', '56473408', '$2a$10$1EhzpkdJIzeIJAKaBp9ABe6VObT/fFFTO3B/RmOvjdJ4wObgXDgjS', 'STUDENT', 'ACTIVE', true, NOW(), NOW())
  ON CONFLICT ("dni") DO NOTHING
  RETURNING "id"
)
INSERT INTO "Student" ("dni", "userId", "firstName", "lastName", "birthDate", "phone", "guardianPhone", "email", "gym", "address", "createdAt", "updatedAt")
SELECT '56473408', COALESCE((SELECT "id" FROM u), (SELECT "id" FROM "User" WHERE "dni" = '56473408')), 'Giulano', 'Hermoso', NULL, NULL, NULL, NULL, 'SAN MARTIN', NULL, NOW(), NOW()
ON CONFLICT ("dni") DO NOTHING;

WITH t AS (
  SELECT "id" FROM "Teacher" WHERE "userId" IN (SELECT "id" FROM "User" WHERE "dni" = '24442147')
), st AS (
  SELECT "dni" FROM "Student" WHERE "dni" = '56473408'
)
INSERT INTO "StudentTeacherAssignment" ("id", "studentDni", "teacherId", "startAt", "active")
SELECT gen_random_uuid(), st."dni", t."id", NOW(), true FROM st, t
WHERE NOT EXISTS (
  SELECT 1 FROM "StudentTeacherAssignment" a
  WHERE a."studentDni" = st."dni" AND a."active" = true
);

WITH u AS (
  INSERT INTO "User" ("id", "dni", "passwordHash", "role", "status", "mustChangePassword", "createdAt", "updatedAt")
  VALUES ('57c80b87-482a-4c80-a763-4aa2294add93', '56546784', '$2a$10$bt9c3ESyGSYStHg.7AHZ7eMvRjTGY9/u0FyS19bsVsKDrSW4/eS3u', 'STUDENT', 'ACTIVE', true, NOW(), NOW())
  ON CONFLICT ("dni") DO NOTHING
  RETURNING "id"
)
INSERT INTO "Student" ("dni", "userId", "firstName", "lastName", "birthDate", "phone", "guardianPhone", "email", "gym", "address", "createdAt", "updatedAt")
SELECT '56546784', COALESCE((SELECT "id" FROM u), (SELECT "id" FROM "User" WHERE "dni" = '56546784')), 'Matteo Bejamin Perez', 'Devita', NULL, NULL, NULL, NULL, 'nan', NULL, NOW(), NOW()
ON CONFLICT ("dni") DO NOTHING;

WITH t AS (
  SELECT "id" FROM "Teacher" WHERE "userId" IN (SELECT "id" FROM "User" WHERE "dni" = '47611267')
), st AS (
  SELECT "dni" FROM "Student" WHERE "dni" = '56546784'
)
INSERT INTO "StudentTeacherAssignment" ("id", "studentDni", "teacherId", "startAt", "active")
SELECT gen_random_uuid(), st."dni", t."id", NOW(), true FROM st, t
WHERE NOT EXISTS (
  SELECT 1 FROM "StudentTeacherAssignment" a
  WHERE a."studentDni" = st."dni" AND a."active" = true
);

WITH u AS (
  INSERT INTO "User" ("id", "dni", "passwordHash", "role", "status", "mustChangePassword", "createdAt", "updatedAt")
  VALUES ('b6c61979-610f-410d-ae8a-28ec862ad5ec', '53940380', '$2a$10$D1G9s.UO70GcYHkrwy.7lOvPk2h6xFtXjKNGxkzgMBSMXxaTyKEv6', 'STUDENT', 'ACTIVE', true, NOW(), NOW())
  ON CONFLICT ("dni") DO NOTHING
  RETURNING "id"
)
INSERT INTO "Student" ("dni", "userId", "firstName", "lastName", "birthDate", "phone", "guardianPhone", "email", "gym", "address", "createdAt", "updatedAt")
SELECT '53940380', COALESCE((SELECT "id" FROM u), (SELECT "id" FROM "User" WHERE "dni" = '53940380')), 'Gonzalo Miguel', 'Taquichiri', NULL, NULL, NULL, NULL, 'nan', NULL, NOW(), NOW()
ON CONFLICT ("dni") DO NOTHING;

WITH t AS (
  SELECT "id" FROM "Teacher" WHERE "userId" IN (SELECT "id" FROM "User" WHERE "dni" = '47611267')
), st AS (
  SELECT "dni" FROM "Student" WHERE "dni" = '53940380'
)
INSERT INTO "StudentTeacherAssignment" ("id", "studentDni", "teacherId", "startAt", "active")
SELECT gen_random_uuid(), st."dni", t."id", NOW(), true FROM st, t
WHERE NOT EXISTS (
  SELECT 1 FROM "StudentTeacherAssignment" a
  WHERE a."studentDni" = st."dni" AND a."active" = true
);

WITH u AS (
  INSERT INTO "User" ("id", "dni", "passwordHash", "role", "status", "mustChangePassword", "createdAt", "updatedAt")
  VALUES ('7d1b4a50-092f-493e-a148-82c0d32e087c', '53159566', '$2a$10$PkrqtCxvRSgfIqhOv.u65.yd4sLf769.2huZsL3oPJ4DxgDh.vm7O', 'STUDENT', 'ACTIVE', true, NOW(), NOW())
  ON CONFLICT ("dni") DO NOTHING
  RETURNING "id"
)
INSERT INTO "Student" ("dni", "userId", "firstName", "lastName", "birthDate", "phone", "guardianPhone", "email", "gym", "address", "createdAt", "updatedAt")
SELECT '53159566', COALESCE((SELECT "id" FROM u), (SELECT "id" FROM "User" WHERE "dni" = '53159566')), 'Aarón Benjamin Astorga', 'Santillan', NULL, NULL, NULL, NULL, 'nan', NULL, NOW(), NOW()
ON CONFLICT ("dni") DO NOTHING;

WITH t AS (
  SELECT "id" FROM "Teacher" WHERE "userId" IN (SELECT "id" FROM "User" WHERE "dni" = '47611267')
), st AS (
  SELECT "dni" FROM "Student" WHERE "dni" = '53159566'
)
INSERT INTO "StudentTeacherAssignment" ("id", "studentDni", "teacherId", "startAt", "active")
SELECT gen_random_uuid(), st."dni", t."id", NOW(), true FROM st, t
WHERE NOT EXISTS (
  SELECT 1 FROM "StudentTeacherAssignment" a
  WHERE a."studentDni" = st."dni" AND a."active" = true
);

WITH u AS (
  INSERT INTO "User" ("id", "dni", "passwordHash", "role", "status", "mustChangePassword", "createdAt", "updatedAt")
  VALUES ('36d2dd29-dd8f-488b-a96c-10f1e7f14637', '55705051', '$2a$10$ao2snufjCpfmxpJ1RspTq.5oW/7Fy7iB2o19MZ1OSNoXCRo7a/dNa', 'STUDENT', 'ACTIVE', true, NOW(), NOW())
  ON CONFLICT ("dni") DO NOTHING
  RETURNING "id"
)
INSERT INTO "Student" ("dni", "userId", "firstName", "lastName", "birthDate", "phone", "guardianPhone", "email", "gym", "address", "createdAt", "updatedAt")
SELECT '55705051', COALESCE((SELECT "id" FROM u), (SELECT "id" FROM "User" WHERE "dni" = '55705051')), 'Ian', 'Arancibia', NULL, NULL, NULL, NULL, 'nan', NULL, NOW(), NOW()
ON CONFLICT ("dni") DO NOTHING;

WITH t AS (
  SELECT "id" FROM "Teacher" WHERE "userId" IN (SELECT "id" FROM "User" WHERE "dni" = '47611267')
), st AS (
  SELECT "dni" FROM "Student" WHERE "dni" = '55705051'
)
INSERT INTO "StudentTeacherAssignment" ("id", "studentDni", "teacherId", "startAt", "active")
SELECT gen_random_uuid(), st."dni", t."id", NOW(), true FROM st, t
WHERE NOT EXISTS (
  SELECT 1 FROM "StudentTeacherAssignment" a
  WHERE a."studentDni" = st."dni" AND a."active" = true
);

WITH u AS (
  INSERT INTO "User" ("id", "dni", "passwordHash", "role", "status", "mustChangePassword", "createdAt", "updatedAt")
  VALUES ('5314d476-c1d9-4b74-8584-410488623ebe', '53312211', '$2a$10$UABd2zCyjiylKFsqwn1f7ebDyqTnwU3GI0aIKLhoxVbruno/K.bjS', 'STUDENT', 'ACTIVE', true, NOW(), NOW())
  ON CONFLICT ("dni") DO NOTHING
  RETURNING "id"
)
INSERT INTO "Student" ("dni", "userId", "firstName", "lastName", "birthDate", "phone", "guardianPhone", "email", "gym", "address", "createdAt", "updatedAt")
SELECT '53312211', COALESCE((SELECT "id" FROM u), (SELECT "id" FROM "User" WHERE "dni" = '53312211')), 'Azul', 'Ramirez', NULL, NULL, NULL, NULL, 'nan', NULL, NOW(), NOW()
ON CONFLICT ("dni") DO NOTHING;

WITH t AS (
  SELECT "id" FROM "Teacher" WHERE "userId" IN (SELECT "id" FROM "User" WHERE "dni" = '47611267')
), st AS (
  SELECT "dni" FROM "Student" WHERE "dni" = '53312211'
)
INSERT INTO "StudentTeacherAssignment" ("id", "studentDni", "teacherId", "startAt", "active")
SELECT gen_random_uuid(), st."dni", t."id", NOW(), true FROM st, t
WHERE NOT EXISTS (
  SELECT 1 FROM "StudentTeacherAssignment" a
  WHERE a."studentDni" = st."dni" AND a."active" = true
);

WITH u AS (
  INSERT INTO "User" ("id", "dni", "passwordHash", "role", "status", "mustChangePassword", "createdAt", "updatedAt")
  VALUES ('9505dd3f-4837-42ac-b78e-56aeeb0bb18a', '53939772', '$2a$10$RGgkhsAhCTLNiGjSHCGSPOWRjXsVW1OR61KZDeYzWIR8KBgOYRt6q', 'STUDENT', 'ACTIVE', true, NOW(), NOW())
  ON CONFLICT ("dni") DO NOTHING
  RETURNING "id"
)
INSERT INTO "Student" ("dni", "userId", "firstName", "lastName", "birthDate", "phone", "guardianPhone", "email", "gym", "address", "createdAt", "updatedAt")
SELECT '53939772', COALESCE((SELECT "id" FROM u), (SELECT "id" FROM "User" WHERE "dni" = '53939772')), 'Zamira', 'Barrera', NULL, NULL, NULL, NULL, 'nan', NULL, NOW(), NOW()
ON CONFLICT ("dni") DO NOTHING;

WITH t AS (
  SELECT "id" FROM "Teacher" WHERE "userId" IN (SELECT "id" FROM "User" WHERE "dni" = '47611267')
), st AS (
  SELECT "dni" FROM "Student" WHERE "dni" = '53939772'
)
INSERT INTO "StudentTeacherAssignment" ("id", "studentDni", "teacherId", "startAt", "active")
SELECT gen_random_uuid(), st."dni", t."id", NOW(), true FROM st, t
WHERE NOT EXISTS (
  SELECT 1 FROM "StudentTeacherAssignment" a
  WHERE a."studentDni" = st."dni" AND a."active" = true
);

WITH u AS (
  INSERT INTO "User" ("id", "dni", "passwordHash", "role", "status", "mustChangePassword", "createdAt", "updatedAt")
  VALUES ('d616d523-3b2e-4fb9-be63-3b4ab15b340f', '59465501', '$2a$10$oa3xZvEnfVoRtyLH379tNOn3IJ.MC5pMFLpHGSKNBDPHcxuN/S2.O', 'STUDENT', 'ACTIVE', true, NOW(), NOW())
  ON CONFLICT ("dni") DO NOTHING
  RETURNING "id"
)
INSERT INTO "Student" ("dni", "userId", "firstName", "lastName", "birthDate", "phone", "guardianPhone", "email", "gym", "address", "createdAt", "updatedAt")
SELECT '59465501', COALESCE((SELECT "id" FROM u), (SELECT "id" FROM "User" WHERE "dni" = '59465501')), 'Joaquin Gomez', 'belen', NULL, NULL, NULL, NULL, 'nan', NULL, NOW(), NOW()
ON CONFLICT ("dni") DO NOTHING;

WITH t AS (
  SELECT "id" FROM "Teacher" WHERE "userId" IN (SELECT "id" FROM "User" WHERE "dni" = '48471671')
), st AS (
  SELECT "dni" FROM "Student" WHERE "dni" = '59465501'
)
INSERT INTO "StudentTeacherAssignment" ("id", "studentDni", "teacherId", "startAt", "active")
SELECT gen_random_uuid(), st."dni", t."id", NOW(), true FROM st, t
WHERE NOT EXISTS (
  SELECT 1 FROM "StudentTeacherAssignment" a
  WHERE a."studentDni" = st."dni" AND a."active" = true
);

WITH u AS (
  INSERT INTO "User" ("id", "dni", "passwordHash", "role", "status", "mustChangePassword", "createdAt", "updatedAt")
  VALUES ('b5789d64-9e40-4ae3-8c4e-7306f33b97fd', '57365396', '$2a$10$Ce0CiLknnl.wxGfAF9bPJu1bY6BQ4cpQnHep8ESZhtceAXd0Z08dC', 'STUDENT', 'ACTIVE', true, NOW(), NOW())
  ON CONFLICT ("dni") DO NOTHING
  RETURNING "id"
)
INSERT INTO "Student" ("dni", "userId", "firstName", "lastName", "birthDate", "phone", "guardianPhone", "email", "gym", "address", "createdAt", "updatedAt")
SELECT '57365396', COALESCE((SELECT "id" FROM u), (SELECT "id" FROM "User" WHERE "dni" = '57365396')), 'Noah', 'Martinez', NULL, NULL, NULL, NULL, 'nan', NULL, NOW(), NOW()
ON CONFLICT ("dni") DO NOTHING;

WITH t AS (
  SELECT "id" FROM "Teacher" WHERE "userId" IN (SELECT "id" FROM "User" WHERE "dni" = '48471671')
), st AS (
  SELECT "dni" FROM "Student" WHERE "dni" = '57365396'
)
INSERT INTO "StudentTeacherAssignment" ("id", "studentDni", "teacherId", "startAt", "active")
SELECT gen_random_uuid(), st."dni", t."id", NOW(), true FROM st, t
WHERE NOT EXISTS (
  SELECT 1 FROM "StudentTeacherAssignment" a
  WHERE a."studentDni" = st."dni" AND a."active" = true
);

WITH u AS (
  INSERT INTO "User" ("id", "dni", "passwordHash", "role", "status", "mustChangePassword", "createdAt", "updatedAt")
  VALUES ('b9dabb03-d530-4821-bd5c-00f5964eb5a0', '56471048', '$2a$10$kj6mIm3FPZu/fzZNpOIyRu9cqpmGFE010Ul/UPCkDthQkn8ffrYaS', 'STUDENT', 'ACTIVE', true, NOW(), NOW())
  ON CONFLICT ("dni") DO NOTHING
  RETURNING "id"
)
INSERT INTO "Student" ("dni", "userId", "firstName", "lastName", "birthDate", "phone", "guardianPhone", "email", "gym", "address", "createdAt", "updatedAt")
SELECT '56471048', COALESCE((SELECT "id" FROM u), (SELECT "id" FROM "User" WHERE "dni" = '56471048')), 'Ornella Guillermina', 'Falcone', NULL, NULL, NULL, NULL, 'nan', NULL, NOW(), NOW()
ON CONFLICT ("dni") DO NOTHING;

WITH t AS (
  SELECT "id" FROM "Teacher" WHERE "userId" IN (SELECT "id" FROM "User" WHERE "dni" = '48471671')
), st AS (
  SELECT "dni" FROM "Student" WHERE "dni" = '56471048'
)
INSERT INTO "StudentTeacherAssignment" ("id", "studentDni", "teacherId", "startAt", "active")
SELECT gen_random_uuid(), st."dni", t."id", NOW(), true FROM st, t
WHERE NOT EXISTS (
  SELECT 1 FROM "StudentTeacherAssignment" a
  WHERE a."studentDni" = st."dni" AND a."active" = true
);

WITH u AS (
  INSERT INTO "User" ("id", "dni", "passwordHash", "role", "status", "mustChangePassword", "createdAt", "updatedAt")
  VALUES ('6c0ebb8c-c217-42d3-ad05-4db60c637602', '53484307', '$2a$10$0E5MTGsMgEfa3IpHEmX6OO3QMF/WQen0HfbNRp1h9aQIqxN.Dk3te', 'STUDENT', 'ACTIVE', true, NOW(), NOW())
  ON CONFLICT ("dni") DO NOTHING
  RETURNING "id"
)
INSERT INTO "Student" ("dni", "userId", "firstName", "lastName", "birthDate", "phone", "guardianPhone", "email", "gym", "address", "createdAt", "updatedAt")
SELECT '53484307', COALESCE((SELECT "id" FROM u), (SELECT "id" FROM "User" WHERE "dni" = '53484307')), 'Luciano', 'Berducci', NULL, NULL, NULL, NULL, 'nan', NULL, NOW(), NOW()
ON CONFLICT ("dni") DO NOTHING;

WITH u AS (
  INSERT INTO "User" ("id", "dni", "passwordHash", "role", "status", "mustChangePassword", "createdAt", "updatedAt")
  VALUES ('8f89a8c9-b594-4f48-b336-54a8475721eb', '55707753', '$2a$10$2FXyDDcEqwt0MRuXB9Eq6uMbmcUE0qrC5NbffXGGsTB0s3Zj4BF96', 'STUDENT', 'ACTIVE', true, NOW(), NOW())
  ON CONFLICT ("dni") DO NOTHING
  RETURNING "id"
)
INSERT INTO "Student" ("dni", "userId", "firstName", "lastName", "birthDate", "phone", "guardianPhone", "email", "gym", "address", "createdAt", "updatedAt")
SELECT '55707753', COALESCE((SELECT "id" FROM u), (SELECT "id" FROM "User" WHERE "dni" = '55707753')), 'Abril', 'Cordoba', NULL, NULL, NULL, NULL, 'nan', NULL, NOW(), NOW()
ON CONFLICT ("dni") DO NOTHING;

WITH u AS (
  INSERT INTO "User" ("id", "dni", "passwordHash", "role", "status", "mustChangePassword", "createdAt", "updatedAt")
  VALUES ('f290d0b3-4d64-48b3-8cc4-49fee6c6170f', '57114605', '$2a$10$5u5sQ2G/5QgohnTIoXgp1.HhF9egk12umk/dphq4BqI0Ayn0zOzIO', 'STUDENT', 'ACTIVE', true, NOW(), NOW())
  ON CONFLICT ("dni") DO NOTHING
  RETURNING "id"
)
INSERT INTO "Student" ("dni", "userId", "firstName", "lastName", "birthDate", "phone", "guardianPhone", "email", "gym", "address", "createdAt", "updatedAt")
SELECT '57114605', COALESCE((SELECT "id" FROM u), (SELECT "id" FROM "User" WHERE "dni" = '57114605')), 'Maia', 'Cordoba', NULL, NULL, NULL, NULL, 'nan', NULL, NOW(), NOW()
ON CONFLICT ("dni") DO NOTHING;

WITH u AS (
  INSERT INTO "User" ("id", "dni", "passwordHash", "role", "status", "mustChangePassword", "createdAt", "updatedAt")
  VALUES ('ddae7aa5-e7c4-41d2-8995-b95d1eea0117', '57114616', '$2a$10$mAvwMFnBBTauubkU75015uV5W/h8vKvNr4oHM6wrEu8/pSPZMuu0.', 'STUDENT', 'ACTIVE', true, NOW(), NOW())
  ON CONFLICT ("dni") DO NOTHING
  RETURNING "id"
)
INSERT INTO "Student" ("dni", "userId", "firstName", "lastName", "birthDate", "phone", "guardianPhone", "email", "gym", "address", "createdAt", "updatedAt")
SELECT '57114616', COALESCE((SELECT "id" FROM u), (SELECT "id" FROM "User" WHERE "dni" = '57114616')), 'Juliana', 'Manzo', NULL, NULL, NULL, NULL, 'nan', NULL, NOW(), NOW()
ON CONFLICT ("dni") DO NOTHING;

WITH u AS (
  INSERT INTO "User" ("id", "dni", "passwordHash", "role", "status", "mustChangePassword", "createdAt", "updatedAt")
  VALUES ('7dc46200-d008-47b4-8c87-9d70a9f246b7', '56798838', '$2a$10$pQP1Cwu/pKeEzmdPXyClO.CBWnbwQDkIOJR3Na97hFV/NyfRJHYVO', 'STUDENT', 'ACTIVE', true, NOW(), NOW())
  ON CONFLICT ("dni") DO NOTHING
  RETURNING "id"
)
INSERT INTO "Student" ("dni", "userId", "firstName", "lastName", "birthDate", "phone", "guardianPhone", "email", "gym", "address", "createdAt", "updatedAt")
SELECT '56798838', COALESCE((SELECT "id" FROM u), (SELECT "id" FROM "User" WHERE "dni" = '56798838')), 'Isabella', 'Peña', NULL, NULL, NULL, NULL, 'nan', NULL, NOW(), NOW()
ON CONFLICT ("dni") DO NOTHING;

WITH u AS (
  INSERT INTO "User" ("id", "dni", "passwordHash", "role", "status", "mustChangePassword", "createdAt", "updatedAt")
  VALUES ('fc3ca726-6402-4309-87c0-e7e6cc3ef776', '55543841', '$2a$10$xi5VJ6TU.OjPqni3KnzMFulVGW3TN6o5O7AtcqN221pkFVJV1iRWy', 'STUDENT', 'ACTIVE', true, NOW(), NOW())
  ON CONFLICT ("dni") DO NOTHING
  RETURNING "id"
)
INSERT INTO "Student" ("dni", "userId", "firstName", "lastName", "birthDate", "phone", "guardianPhone", "email", "gym", "address", "createdAt", "updatedAt")
SELECT '55543841', COALESCE((SELECT "id" FROM u), (SELECT "id" FROM "User" WHERE "dni" = '55543841')), 'Sofia', 'Burgarelli', NULL, NULL, NULL, NULL, 'nan', NULL, NOW(), NOW()
ON CONFLICT ("dni") DO NOTHING;

WITH u AS (
  INSERT INTO "User" ("id", "dni", "passwordHash", "role", "status", "mustChangePassword", "createdAt", "updatedAt")
  VALUES ('87f3f785-e0c0-4ab8-abd7-8fd592848f75', '53482558', '$2a$10$uoTZvsu92C47q/2elmnXau5EGWHdPQvHafdoxq/7VEoTvWla9Suje', 'STUDENT', 'ACTIVE', true, NOW(), NOW())
  ON CONFLICT ("dni") DO NOTHING
  RETURNING "id"
)
INSERT INTO "Student" ("dni", "userId", "firstName", "lastName", "birthDate", "phone", "guardianPhone", "email", "gym", "address", "createdAt", "updatedAt")
SELECT '53482558', COALESCE((SELECT "id" FROM u), (SELECT "id" FROM "User" WHERE "dni" = '53482558')), 'Julieta', 'Bele', NULL, NULL, NULL, NULL, 'nan', NULL, NOW(), NOW()
ON CONFLICT ("dni") DO NOTHING;

WITH u AS (
  INSERT INTO "User" ("id", "dni", "passwordHash", "role", "status", "mustChangePassword", "createdAt", "updatedAt")
  VALUES ('55711f9a-1850-470d-86a4-a5309a037c79', '57114007', '$2a$10$Tijhyc76Ija1kWh4Uesh1OAGOuqoVnvZX4j0U2wNg5By5t9sQbhz.', 'STUDENT', 'ACTIVE', true, NOW(), NOW())
  ON CONFLICT ("dni") DO NOTHING
  RETURNING "id"
)
INSERT INTO "Student" ("dni", "userId", "firstName", "lastName", "birthDate", "phone", "guardianPhone", "email", "gym", "address", "createdAt", "updatedAt")
SELECT '57114007', COALESCE((SELECT "id" FROM u), (SELECT "id" FROM "User" WHERE "dni" = '57114007')), 'Gino', 'Pereira', NULL, NULL, NULL, NULL, 'nan', NULL, NOW(), NOW()
ON CONFLICT ("dni") DO NOTHING;

WITH u AS (
  INSERT INTO "User" ("id", "dni", "passwordHash", "role", "status", "mustChangePassword", "createdAt", "updatedAt")
  VALUES ('22dc89ad-d2cf-4ecb-a2c2-8fecf592e7b6', '56286708', '$2a$10$hZ9RoRGQHiaSFLRTsTB/8.JXeWUb10OxauETDMJrFze5ueE.FC1vq', 'STUDENT', 'ACTIVE', true, NOW(), NOW())
  ON CONFLICT ("dni") DO NOTHING
  RETURNING "id"
)
INSERT INTO "Student" ("dni", "userId", "firstName", "lastName", "birthDate", "phone", "guardianPhone", "email", "gym", "address", "createdAt", "updatedAt")
SELECT '56286708', COALESCE((SELECT "id" FROM u), (SELECT "id" FROM "User" WHERE "dni" = '56286708')), 'Franccesco', 'Pereira', NULL, NULL, NULL, NULL, 'nan', NULL, NOW(), NOW()
ON CONFLICT ("dni") DO NOTHING;

WITH u AS (
  INSERT INTO "User" ("id", "dni", "passwordHash", "role", "status", "mustChangePassword", "createdAt", "updatedAt")
  VALUES ('3fa2a212-1183-4a64-b00c-e93129a7a3d6', '54539787', '$2a$10$1YTzm./kEKiqOt4m98fYwOT9/1LHqdLUqsv28X9ynmTekiyaD6kM2', 'STUDENT', 'ACTIVE', true, NOW(), NOW())
  ON CONFLICT ("dni") DO NOTHING
  RETURNING "id"
)
INSERT INTO "Student" ("dni", "userId", "firstName", "lastName", "birthDate", "phone", "guardianPhone", "email", "gym", "address", "createdAt", "updatedAt")
SELECT '54539787', COALESCE((SELECT "id" FROM u), (SELECT "id" FROM "User" WHERE "dni" = '54539787')), 'Valentina', 'Biolato', NULL, NULL, NULL, NULL, 'nan', NULL, NOW(), NOW()
ON CONFLICT ("dni") DO NOTHING;

WITH u AS (
  INSERT INTO "User" ("id", "dni", "passwordHash", "role", "status", "mustChangePassword", "createdAt", "updatedAt")
  VALUES ('180249b9-dc75-4405-9705-c1ebe1f29937', '50478449', '$2a$10$fTYsxHYOOxG75UVFWI/Lx.UZF6Voq.h4HxIUo2mHWcUJc0QxnJjHe', 'STUDENT', 'ACTIVE', true, NOW(), NOW())
  ON CONFLICT ("dni") DO NOTHING
  RETURNING "id"
)
INSERT INTO "Student" ("dni", "userId", "firstName", "lastName", "birthDate", "phone", "guardianPhone", "email", "gym", "address", "createdAt", "updatedAt")
SELECT '50478449', COALESCE((SELECT "id" FROM u), (SELECT "id" FROM "User" WHERE "dni" = '50478449')), 'Leonardo', 'Biolato', NULL, NULL, NULL, NULL, 'nan', NULL, NOW(), NOW()
ON CONFLICT ("dni") DO NOTHING;

WITH u AS (
  INSERT INTO "User" ("id", "dni", "passwordHash", "role", "status", "mustChangePassword", "createdAt", "updatedAt")
  VALUES ('d62019f0-4abf-46cb-be69-17c6fd04dc6f', '51090136', '$2a$10$Ew2Z3t2AQspv2CrrnuKBcOWL/hvLrnQNaFDJyvo28ZX6VIeseoNN.', 'STUDENT', 'ACTIVE', true, NOW(), NOW())
  ON CONFLICT ("dni") DO NOTHING
  RETURNING "id"
)
INSERT INTO "Student" ("dni", "userId", "firstName", "lastName", "birthDate", "phone", "guardianPhone", "email", "gym", "address", "createdAt", "updatedAt")
SELECT '51090136', COALESCE((SELECT "id" FROM u), (SELECT "id" FROM "User" WHERE "dni" = '51090136')), 'Daniela', 'Biolato', NULL, NULL, NULL, NULL, 'nan', NULL, NOW(), NOW()
ON CONFLICT ("dni") DO NOTHING;

WITH u AS (
  INSERT INTO "User" ("id", "dni", "passwordHash", "role", "status", "mustChangePassword", "createdAt", "updatedAt")
  VALUES ('e4f17ffb-9b75-4040-85e8-f94fb2b04dde', '52062521', '$2a$10$f.p0DD0VpjjMLawc3w54huNStyl.ehryUBNVym24VdnsZBgGQBfkG', 'STUDENT', 'ACTIVE', true, NOW(), NOW())
  ON CONFLICT ("dni") DO NOTHING
  RETURNING "id"
)
INSERT INTO "Student" ("dni", "userId", "firstName", "lastName", "birthDate", "phone", "guardianPhone", "email", "gym", "address", "createdAt", "updatedAt")
SELECT '52062521', COALESCE((SELECT "id" FROM u), (SELECT "id" FROM "User" WHERE "dni" = '52062521')), 'Thiago', 'Ahumada', NULL, NULL, NULL, NULL, 'nan', NULL, NOW(), NOW()
ON CONFLICT ("dni") DO NOTHING;

WITH u AS (
  INSERT INTO "User" ("id", "dni", "passwordHash", "role", "status", "mustChangePassword", "createdAt", "updatedAt")
  VALUES ('7244607c-8af2-47f3-9c1d-e3e51dc333b8', '50513921', '$2a$10$hUtuOKQH8/zjvvJpw6d6J.IbsdCDwhziBLJaRz74yvUF9zUPKFDTS', 'STUDENT', 'ACTIVE', true, NOW(), NOW())
  ON CONFLICT ("dni") DO NOTHING
  RETURNING "id"
)
INSERT INTO "Student" ("dni", "userId", "firstName", "lastName", "birthDate", "phone", "guardianPhone", "email", "gym", "address", "createdAt", "updatedAt")
SELECT '50513921', COALESCE((SELECT "id" FROM u), (SELECT "id" FROM "User" WHERE "dni" = '50513921')), 'Arenas Ortubia', 'Lautaro', NULL, NULL, NULL, NULL, 'nan', NULL, NOW(), NOW()
ON CONFLICT ("dni") DO NOTHING;

WITH t AS (
  SELECT "id" FROM "Teacher" WHERE "userId" IN (SELECT "id" FROM "User" WHERE "dni" = '45717540')
), st AS (
  SELECT "dni" FROM "Student" WHERE "dni" = '50513921'
)
INSERT INTO "StudentTeacherAssignment" ("id", "studentDni", "teacherId", "startAt", "active")
SELECT gen_random_uuid(), st."dni", t."id", NOW(), true FROM st, t
WHERE NOT EXISTS (
  SELECT 1 FROM "StudentTeacherAssignment" a
  WHERE a."studentDni" = st."dni" AND a."active" = true
);

WITH u AS (
  INSERT INTO "User" ("id", "dni", "passwordHash", "role", "status", "mustChangePassword", "createdAt", "updatedAt")
  VALUES ('258835fe-70b0-4fa3-8756-355bda8c6c76', '55135701', '$2a$10$9DbUBDmShtMmSh2AQ85eYebwtw2aHMnkX2gpHHRvLcB6rfyb2rcCW', 'STUDENT', 'ACTIVE', true, NOW(), NOW())
  ON CONFLICT ("dni") DO NOTHING
  RETURNING "id"
)
INSERT INTO "Student" ("dni", "userId", "firstName", "lastName", "birthDate", "phone", "guardianPhone", "email", "gym", "address", "createdAt", "updatedAt")
SELECT '55135701', COALESCE((SELECT "id" FROM u), (SELECT "id" FROM "User" WHERE "dni" = '55135701')), 'Argañez Giovanni', 'Tiziano', NULL, NULL, NULL, NULL, 'nan', NULL, NOW(), NOW()
ON CONFLICT ("dni") DO NOTHING;

WITH t AS (
  SELECT "id" FROM "Teacher" WHERE "userId" IN (SELECT "id" FROM "User" WHERE "dni" = '45717540')
), st AS (
  SELECT "dni" FROM "Student" WHERE "dni" = '55135701'
)
INSERT INTO "StudentTeacherAssignment" ("id", "studentDni", "teacherId", "startAt", "active")
SELECT gen_random_uuid(), st."dni", t."id", NOW(), true FROM st, t
WHERE NOT EXISTS (
  SELECT 1 FROM "StudentTeacherAssignment" a
  WHERE a."studentDni" = st."dni" AND a."active" = true
);

WITH u AS (
  INSERT INTO "User" ("id", "dni", "passwordHash", "role", "status", "mustChangePassword", "createdAt", "updatedAt")
  VALUES ('3ae1a2e3-1299-44dc-b176-6353c51c3fde', '56083711', '$2a$10$2pLKMKtbGqXB.Tw1trKGC.K97Vmfy.UvOsjOVcaULKWSPj1EaCv9W', 'STUDENT', 'ACTIVE', true, NOW(), NOW())
  ON CONFLICT ("dni") DO NOTHING
  RETURNING "id"
)
INSERT INTO "Student" ("dni", "userId", "firstName", "lastName", "birthDate", "phone", "guardianPhone", "email", "gym", "address", "createdAt", "updatedAt")
SELECT '56083711', COALESCE((SELECT "id" FROM u), (SELECT "id" FROM "User" WHERE "dni" = '56083711')), 'Badiali Ciro', 'Emiliano', NULL, NULL, NULL, NULL, 'nan', NULL, NOW(), NOW()
ON CONFLICT ("dni") DO NOTHING;

WITH t AS (
  SELECT "id" FROM "Teacher" WHERE "userId" IN (SELECT "id" FROM "User" WHERE "dni" = '45717540')
), st AS (
  SELECT "dni" FROM "Student" WHERE "dni" = '56083711'
)
INSERT INTO "StudentTeacherAssignment" ("id", "studentDni", "teacherId", "startAt", "active")
SELECT gen_random_uuid(), st."dni", t."id", NOW(), true FROM st, t
WHERE NOT EXISTS (
  SELECT 1 FROM "StudentTeacherAssignment" a
  WHERE a."studentDni" = st."dni" AND a."active" = true
);

WITH u AS (
  INSERT INTO "User" ("id", "dni", "passwordHash", "role", "status", "mustChangePassword", "createdAt", "updatedAt")
  VALUES ('d4e28934-8dad-4c61-9b3c-5c9e03236f58', '53489485', '$2a$10$vP21FAIDa0gy94HLMaALN.IK.mqLuebEvlGWHQm0qt3SjDvkPmaei', 'STUDENT', 'ACTIVE', true, NOW(), NOW())
  ON CONFLICT ("dni") DO NOTHING
  RETURNING "id"
)
INSERT INTO "Student" ("dni", "userId", "firstName", "lastName", "birthDate", "phone", "guardianPhone", "email", "gym", "address", "createdAt", "updatedAt")
SELECT '53489485', COALESCE((SELECT "id" FROM u), (SELECT "id" FROM "User" WHERE "dni" = '53489485')), 'Diaz Ortubia', 'Gabriel', NULL, NULL, NULL, NULL, 'nan', NULL, NOW(), NOW()
ON CONFLICT ("dni") DO NOTHING;

WITH t AS (
  SELECT "id" FROM "Teacher" WHERE "userId" IN (SELECT "id" FROM "User" WHERE "dni" = '45717540')
), st AS (
  SELECT "dni" FROM "Student" WHERE "dni" = '53489485'
)
INSERT INTO "StudentTeacherAssignment" ("id", "studentDni", "teacherId", "startAt", "active")
SELECT gen_random_uuid(), st."dni", t."id", NOW(), true FROM st, t
WHERE NOT EXISTS (
  SELECT 1 FROM "StudentTeacherAssignment" a
  WHERE a."studentDni" = st."dni" AND a."active" = true
);

WITH u AS (
  INSERT INTO "User" ("id", "dni", "passwordHash", "role", "status", "mustChangePassword", "createdAt", "updatedAt")
  VALUES ('5cd43660-4b45-4ed4-acad-15611cf5b4d6', '56292977', '$2a$10$1SXxZT/GFxtMDYhssmzOxOdtcCyF.dn.L.mxyFAeaktAXnfSOryEO', 'STUDENT', 'ACTIVE', true, NOW(), NOW())
  ON CONFLICT ("dni") DO NOTHING
  RETURNING "id"
)
INSERT INTO "Student" ("dni", "userId", "firstName", "lastName", "birthDate", "phone", "guardianPhone", "email", "gym", "address", "createdAt", "updatedAt")
SELECT '56292977', COALESCE((SELECT "id" FROM u), (SELECT "id" FROM "User" WHERE "dni" = '56292977')), 'Flores', 'Mateo', NULL, NULL, NULL, NULL, 'nan', NULL, NOW(), NOW()
ON CONFLICT ("dni") DO NOTHING;

WITH t AS (
  SELECT "id" FROM "Teacher" WHERE "userId" IN (SELECT "id" FROM "User" WHERE "dni" = '45717540')
), st AS (
  SELECT "dni" FROM "Student" WHERE "dni" = '56292977'
)
INSERT INTO "StudentTeacherAssignment" ("id", "studentDni", "teacherId", "startAt", "active")
SELECT gen_random_uuid(), st."dni", t."id", NOW(), true FROM st, t
WHERE NOT EXISTS (
  SELECT 1 FROM "StudentTeacherAssignment" a
  WHERE a."studentDni" = st."dni" AND a."active" = true
);

WITH u AS (
  INSERT INTO "User" ("id", "dni", "passwordHash", "role", "status", "mustChangePassword", "createdAt", "updatedAt")
  VALUES ('d2899ad0-b49a-4982-8793-747cc1cf6e3b', '53484912', '$2a$10$sNfZJCBCktYw2HGnX/GwbuCx7MgGB3l1wjDiDlrnTj8XTMk5a74GW', 'STUDENT', 'ACTIVE', true, NOW(), NOW())
  ON CONFLICT ("dni") DO NOTHING
  RETURNING "id"
)
INSERT INTO "Student" ("dni", "userId", "firstName", "lastName", "birthDate", "phone", "guardianPhone", "email", "gym", "address", "createdAt", "updatedAt")
SELECT '53484912', COALESCE((SELECT "id" FROM u), (SELECT "id" FROM "User" WHERE "dni" = '53484912')), 'Gil Zoe', 'Nahiara', NULL, NULL, NULL, NULL, 'nan', NULL, NOW(), NOW()
ON CONFLICT ("dni") DO NOTHING;

WITH t AS (
  SELECT "id" FROM "Teacher" WHERE "userId" IN (SELECT "id" FROM "User" WHERE "dni" = '45717540')
), st AS (
  SELECT "dni" FROM "Student" WHERE "dni" = '53484912'
)
INSERT INTO "StudentTeacherAssignment" ("id", "studentDni", "teacherId", "startAt", "active")
SELECT gen_random_uuid(), st."dni", t."id", NOW(), true FROM st, t
WHERE NOT EXISTS (
  SELECT 1 FROM "StudentTeacherAssignment" a
  WHERE a."studentDni" = st."dni" AND a."active" = true
);

WITH u AS (
  INSERT INTO "User" ("id", "dni", "passwordHash", "role", "status", "mustChangePassword", "createdAt", "updatedAt")
  VALUES ('b43c9265-5e36-40aa-b916-a5be89ff1bac', '54169939', '$2a$10$hHNHKMh648dTHZZedzjQOeOy4ltZCEXO/0BO88hNayS/lGaTwrm0q', 'STUDENT', 'ACTIVE', true, NOW(), NOW())
  ON CONFLICT ("dni") DO NOTHING
  RETURNING "id"
)
INSERT INTO "Student" ("dni", "userId", "firstName", "lastName", "birthDate", "phone", "guardianPhone", "email", "gym", "address", "createdAt", "updatedAt")
SELECT '54169939', COALESCE((SELECT "id" FROM u), (SELECT "id" FROM "User" WHERE "dni" = '54169939')), 'Lopez Mahia', 'Sofia', NULL, NULL, NULL, NULL, 'nan', NULL, NOW(), NOW()
ON CONFLICT ("dni") DO NOTHING;

WITH t AS (
  SELECT "id" FROM "Teacher" WHERE "userId" IN (SELECT "id" FROM "User" WHERE "dni" = '45717540')
), st AS (
  SELECT "dni" FROM "Student" WHERE "dni" = '54169939'
)
INSERT INTO "StudentTeacherAssignment" ("id", "studentDni", "teacherId", "startAt", "active")
SELECT gen_random_uuid(), st."dni", t."id", NOW(), true FROM st, t
WHERE NOT EXISTS (
  SELECT 1 FROM "StudentTeacherAssignment" a
  WHERE a."studentDni" = st."dni" AND a."active" = true
);

WITH u AS (
  INSERT INTO "User" ("id", "dni", "passwordHash", "role", "status", "mustChangePassword", "createdAt", "updatedAt")
  VALUES ('7dc79591-eb40-4956-9b73-47b8237face5', '52934195', '$2a$10$CyBgbVKVFUolvN3wrGVpgOvIa7Zg4EpFGt2wCmBWkqBwRTkKA8LG2', 'STUDENT', 'ACTIVE', true, NOW(), NOW())
  ON CONFLICT ("dni") DO NOTHING
  RETURNING "id"
)
INSERT INTO "Student" ("dni", "userId", "firstName", "lastName", "birthDate", "phone", "guardianPhone", "email", "gym", "address", "createdAt", "updatedAt")
SELECT '52934195', COALESCE((SELECT "id" FROM u), (SELECT "id" FROM "User" WHERE "dni" = '52934195')), 'Matucheski Diaz', 'Santino', NULL, NULL, NULL, NULL, 'nan', NULL, NOW(), NOW()
ON CONFLICT ("dni") DO NOTHING;

WITH t AS (
  SELECT "id" FROM "Teacher" WHERE "userId" IN (SELECT "id" FROM "User" WHERE "dni" = '45717540')
), st AS (
  SELECT "dni" FROM "Student" WHERE "dni" = '52934195'
)
INSERT INTO "StudentTeacherAssignment" ("id", "studentDni", "teacherId", "startAt", "active")
SELECT gen_random_uuid(), st."dni", t."id", NOW(), true FROM st, t
WHERE NOT EXISTS (
  SELECT 1 FROM "StudentTeacherAssignment" a
  WHERE a."studentDni" = st."dni" AND a."active" = true
);

WITH u AS (
  INSERT INTO "User" ("id", "dni", "passwordHash", "role", "status", "mustChangePassword", "createdAt", "updatedAt")
  VALUES ('851cfee3-536d-4f63-92b3-57657319a860', '53483330', '$2a$10$Dz77J94NmxNIH6f/TfVECOkUDqOQGBQcJCbgHYZEs4Q0XAy16a0de', 'STUDENT', 'ACTIVE', true, NOW(), NOW())
  ON CONFLICT ("dni") DO NOTHING
  RETURNING "id"
)
INSERT INTO "Student" ("dni", "userId", "firstName", "lastName", "birthDate", "phone", "guardianPhone", "email", "gym", "address", "createdAt", "updatedAt")
SELECT '53483330', COALESCE((SELECT "id" FROM u), (SELECT "id" FROM "User" WHERE "dni" = '53483330')), 'Moyano Ciro', 'Benjamin', NULL, NULL, NULL, NULL, 'nan', NULL, NOW(), NOW()
ON CONFLICT ("dni") DO NOTHING;

WITH t AS (
  SELECT "id" FROM "Teacher" WHERE "userId" IN (SELECT "id" FROM "User" WHERE "dni" = '45717540')
), st AS (
  SELECT "dni" FROM "Student" WHERE "dni" = '53483330'
)
INSERT INTO "StudentTeacherAssignment" ("id", "studentDni", "teacherId", "startAt", "active")
SELECT gen_random_uuid(), st."dni", t."id", NOW(), true FROM st, t
WHERE NOT EXISTS (
  SELECT 1 FROM "StudentTeacherAssignment" a
  WHERE a."studentDni" = st."dni" AND a."active" = true
);

WITH u AS (
  INSERT INTO "User" ("id", "dni", "passwordHash", "role", "status", "mustChangePassword", "createdAt", "updatedAt")
  VALUES ('068320f2-5380-4673-bc55-7b6da99a1def', '53666945', '$2a$10$0BRjgAqATLdOeyaKZAc20uQ8OQQK7P50ALtDMlAVqXEUVIl8TxnNK', 'STUDENT', 'ACTIVE', true, NOW(), NOW())
  ON CONFLICT ("dni") DO NOTHING
  RETURNING "id"
)
INSERT INTO "Student" ("dni", "userId", "firstName", "lastName", "birthDate", "phone", "guardianPhone", "email", "gym", "address", "createdAt", "updatedAt")
SELECT '53666945', COALESCE((SELECT "id" FROM u), (SELECT "id" FROM "User" WHERE "dni" = '53666945')), 'Quiroga Brito', 'Franchesco', NULL, NULL, NULL, NULL, 'nan', NULL, NOW(), NOW()
ON CONFLICT ("dni") DO NOTHING;

WITH t AS (
  SELECT "id" FROM "Teacher" WHERE "userId" IN (SELECT "id" FROM "User" WHERE "dni" = '45717540')
), st AS (
  SELECT "dni" FROM "Student" WHERE "dni" = '53666945'
)
INSERT INTO "StudentTeacherAssignment" ("id", "studentDni", "teacherId", "startAt", "active")
SELECT gen_random_uuid(), st."dni", t."id", NOW(), true FROM st, t
WHERE NOT EXISTS (
  SELECT 1 FROM "StudentTeacherAssignment" a
  WHERE a."studentDni" = st."dni" AND a."active" = true
);

WITH u AS (
  INSERT INTO "User" ("id", "dni", "passwordHash", "role", "status", "mustChangePassword", "createdAt", "updatedAt")
  VALUES ('38e19dd0-25a0-496b-aa5f-c333d515c955', '53153705', '$2a$10$ipzkCMWEf0L34MWM8lpbX.6f5zzb5VwM2O5ekaqMjWG2Xtk8c6Ub.', 'STUDENT', 'ACTIVE', true, NOW(), NOW())
  ON CONFLICT ("dni") DO NOTHING
  RETURNING "id"
)
INSERT INTO "Student" ("dni", "userId", "firstName", "lastName", "birthDate", "phone", "guardianPhone", "email", "gym", "address", "createdAt", "updatedAt")
SELECT '53153705', COALESCE((SELECT "id" FROM u), (SELECT "id" FROM "User" WHERE "dni" = '53153705')), 'Rodriguez', 'Benicio', NULL, NULL, NULL, NULL, 'nan', NULL, NOW(), NOW()
ON CONFLICT ("dni") DO NOTHING;

WITH t AS (
  SELECT "id" FROM "Teacher" WHERE "userId" IN (SELECT "id" FROM "User" WHERE "dni" = '45717540')
), st AS (
  SELECT "dni" FROM "Student" WHERE "dni" = '53153705'
)
INSERT INTO "StudentTeacherAssignment" ("id", "studentDni", "teacherId", "startAt", "active")
SELECT gen_random_uuid(), st."dni", t."id", NOW(), true FROM st, t
WHERE NOT EXISTS (
  SELECT 1 FROM "StudentTeacherAssignment" a
  WHERE a."studentDni" = st."dni" AND a."active" = true
);

WITH u AS (
  INSERT INTO "User" ("id", "dni", "passwordHash", "role", "status", "mustChangePassword", "createdAt", "updatedAt")
  VALUES ('871f5a98-4316-4324-b213-1c74f9307853', '92475846', '$2a$10$3EMsAiqhDdvA8SN9JJAWQuzObcyc3G0U8KYWrJ4Klz4ZH37RdNztW', 'STUDENT', 'ACTIVE', true, NOW(), NOW())
  ON CONFLICT ("dni") DO NOTHING
  RETURNING "id"
)
INSERT INTO "Student" ("dni", "userId", "firstName", "lastName", "birthDate", "phone", "guardianPhone", "email", "gym", "address", "createdAt", "updatedAt")
SELECT '92475846', COALESCE((SELECT "id" FROM u), (SELECT "id" FROM "User" WHERE "dni" = '92475846')), 'Torrico', 'Martha', NULL, NULL, NULL, NULL, 'nan', NULL, NOW(), NOW()
ON CONFLICT ("dni") DO NOTHING;

WITH t AS (
  SELECT "id" FROM "Teacher" WHERE "userId" IN (SELECT "id" FROM "User" WHERE "dni" = '45717540')
), st AS (
  SELECT "dni" FROM "Student" WHERE "dni" = '92475846'
)
INSERT INTO "StudentTeacherAssignment" ("id", "studentDni", "teacherId", "startAt", "active")
SELECT gen_random_uuid(), st."dni", t."id", NOW(), true FROM st, t
WHERE NOT EXISTS (
  SELECT 1 FROM "StudentTeacherAssignment" a
  WHERE a."studentDni" = st."dni" AND a."active" = true
);

WITH u AS (
  INSERT INTO "User" ("id", "dni", "passwordHash", "role", "status", "mustChangePassword", "createdAt", "updatedAt")
  VALUES ('972dcc2e-fdff-43f2-9bc3-7f49ad0d18e0', '55255650', '$2a$10$hfFUJKRN/kO9MhEh0uvZVuimOYjvwIbLR9Sn8td87nYDexM73jzgy', 'STUDENT', 'ACTIVE', true, NOW(), NOW())
  ON CONFLICT ("dni") DO NOTHING
  RETURNING "id"
)
INSERT INTO "Student" ("dni", "userId", "firstName", "lastName", "birthDate", "phone", "guardianPhone", "email", "gym", "address", "createdAt", "updatedAt")
SELECT '55255650', COALESCE((SELECT "id" FROM u), (SELECT "id" FROM "User" WHERE "dni" = '55255650')), 'Varrgas', 'Octavio', NULL, NULL, NULL, NULL, 'nan', NULL, NOW(), NOW()
ON CONFLICT ("dni") DO NOTHING;

WITH t AS (
  SELECT "id" FROM "Teacher" WHERE "userId" IN (SELECT "id" FROM "User" WHERE "dni" = '45717540')
), st AS (
  SELECT "dni" FROM "Student" WHERE "dni" = '55255650'
)
INSERT INTO "StudentTeacherAssignment" ("id", "studentDni", "teacherId", "startAt", "active")
SELECT gen_random_uuid(), st."dni", t."id", NOW(), true FROM st, t
WHERE NOT EXISTS (
  SELECT 1 FROM "StudentTeacherAssignment" a
  WHERE a."studentDni" = st."dni" AND a."active" = true
);

WITH u AS (
  INSERT INTO "User" ("id", "dni", "passwordHash", "role", "status", "mustChangePassword", "createdAt", "updatedAt")
  VALUES ('5d20f780-ae40-4b52-b1f4-03cdc3ec5df5', '47448840', '$2a$10$tnM3VLL9haQ5urbx9Z9imONN3HA71AA4s2WP/bGoSNFsV7ugCBKUK', 'STUDENT', 'ACTIVE', true, NOW(), NOW())
  ON CONFLICT ("dni") DO NOTHING
  RETURNING "id"
)
INSERT INTO "Student" ("dni", "userId", "firstName", "lastName", "birthDate", "phone", "guardianPhone", "email", "gym", "address", "createdAt", "updatedAt")
SELECT '47448840', COALESCE((SELECT "id" FROM u), (SELECT "id" FROM "User" WHERE "dni" = '47448840')), 'Careri', 'Santiago', NULL, NULL, NULL, NULL, 'ACADEMIA FRAPPÉ', NULL, NOW(), NOW()
ON CONFLICT ("dni") DO NOTHING;

WITH t AS (
  SELECT "id" FROM "Teacher" WHERE "userId" IN (SELECT "id" FROM "User" WHERE "dni" = '45717540')
), st AS (
  SELECT "dni" FROM "Student" WHERE "dni" = '47448840'
)
INSERT INTO "StudentTeacherAssignment" ("id", "studentDni", "teacherId", "startAt", "active")
SELECT gen_random_uuid(), st."dni", t."id", NOW(), true FROM st, t
WHERE NOT EXISTS (
  SELECT 1 FROM "StudentTeacherAssignment" a
  WHERE a."studentDni" = st."dni" AND a."active" = true
);

WITH u AS (
  INSERT INTO "User" ("id", "dni", "passwordHash", "role", "status", "mustChangePassword", "createdAt", "updatedAt")
  VALUES ('b32c97ea-e2ee-4317-97b0-9a9d43ca8761', '32652371', '$2a$10$1qQ1vu2ylTbkGVGrK2ktj.y0mIyvUPBGnvwAMPQOKEXcnjhNG/JVG', 'STUDENT', 'ACTIVE', true, NOW(), NOW())
  ON CONFLICT ("dni") DO NOTHING
  RETURNING "id"
)
INSERT INTO "Student" ("dni", "userId", "firstName", "lastName", "birthDate", "phone", "guardianPhone", "email", "gym", "address", "createdAt", "updatedAt")
SELECT '32652371', COALESCE((SELECT "id" FROM u), (SELECT "id" FROM "User" WHERE "dni" = '32652371')), 'Martinez Botticelli', 'Ambar', NULL, NULL, NULL, NULL, 'ACADEMIA FRAPPÉ', NULL, NOW(), NOW()
ON CONFLICT ("dni") DO NOTHING;

WITH t AS (
  SELECT "id" FROM "Teacher" WHERE "userId" IN (SELECT "id" FROM "User" WHERE "dni" = '45717540')
), st AS (
  SELECT "dni" FROM "Student" WHERE "dni" = '32652371'
)
INSERT INTO "StudentTeacherAssignment" ("id", "studentDni", "teacherId", "startAt", "active")
SELECT gen_random_uuid(), st."dni", t."id", NOW(), true FROM st, t
WHERE NOT EXISTS (
  SELECT 1 FROM "StudentTeacherAssignment" a
  WHERE a."studentDni" = st."dni" AND a."active" = true
);

WITH u AS (
  INSERT INTO "User" ("id", "dni", "passwordHash", "role", "status", "mustChangePassword", "createdAt", "updatedAt")
  VALUES ('5ca3bb52-5f66-41a4-8e27-1158ef87bfa4', '56086927', '$2a$10$ZbKvtpqA4f.dS0pqSSKKyuLjkTrVP2fQ5IYDkHKUSrRT8ygEr9Wda', 'STUDENT', 'ACTIVE', true, NOW(), NOW())
  ON CONFLICT ("dni") DO NOTHING
  RETURNING "id"
)
INSERT INTO "Student" ("dni", "userId", "firstName", "lastName", "birthDate", "phone", "guardianPhone", "email", "gym", "address", "createdAt", "updatedAt")
SELECT '56086927', COALESCE((SELECT "id" FROM u), (SELECT "id" FROM "User" WHERE "dni" = '56086927')), 'Olmedo Illesca', 'Morena', NULL, NULL, NULL, NULL, 'ACADEMIA FRAPPÉ', NULL, NOW(), NOW()
ON CONFLICT ("dni") DO NOTHING;

WITH t AS (
  SELECT "id" FROM "Teacher" WHERE "userId" IN (SELECT "id" FROM "User" WHERE "dni" = '45717540')
), st AS (
  SELECT "dni" FROM "Student" WHERE "dni" = '56086927'
)
INSERT INTO "StudentTeacherAssignment" ("id", "studentDni", "teacherId", "startAt", "active")
SELECT gen_random_uuid(), st."dni", t."id", NOW(), true FROM st, t
WHERE NOT EXISTS (
  SELECT 1 FROM "StudentTeacherAssignment" a
  WHERE a."studentDni" = st."dni" AND a."active" = true
);

WITH u AS (
  INSERT INTO "User" ("id", "dni", "passwordHash", "role", "status", "mustChangePassword", "createdAt", "updatedAt")
  VALUES ('976dab8b-f671-474b-8884-408335ab6c42', '94221997', '$2a$10$NdnAWt8dRnDtPKhxD7bre.yi6gX5eiFxedimoZHF.6eywDyHDa5x.', 'STUDENT', 'ACTIVE', true, NOW(), NOW())
  ON CONFLICT ("dni") DO NOTHING
  RETURNING "id"
)
INSERT INTO "Student" ("dni", "userId", "firstName", "lastName", "birthDate", "phone", "guardianPhone", "email", "gym", "address", "createdAt", "updatedAt")
SELECT '94221997', COALESCE((SELECT "id" FROM u), (SELECT "id" FROM "User" WHERE "dni" = '94221997')), 'Soleto Aramayo Vania', 'Olivia', NULL, NULL, NULL, NULL, 'ACADEMIA FRAPPÉ', NULL, NOW(), NOW()
ON CONFLICT ("dni") DO NOTHING;

WITH t AS (
  SELECT "id" FROM "Teacher" WHERE "userId" IN (SELECT "id" FROM "User" WHERE "dni" = '45717540')
), st AS (
  SELECT "dni" FROM "Student" WHERE "dni" = '94221997'
)
INSERT INTO "StudentTeacherAssignment" ("id", "studentDni", "teacherId", "startAt", "active")
SELECT gen_random_uuid(), st."dni", t."id", NOW(), true FROM st, t
WHERE NOT EXISTS (
  SELECT 1 FROM "StudentTeacherAssignment" a
  WHERE a."studentDni" = st."dni" AND a."active" = true
);

WITH u AS (
  INSERT INTO "User" ("id", "dni", "passwordHash", "role", "status", "mustChangePassword", "createdAt", "updatedAt")
  VALUES ('de0fde46-38ad-4dcc-90d7-ccf86a608745', '51189989', '$2a$10$6YHqof0JyzLknOHZFN9QyuhWr7H9Lg4WoryW7.jrbGZRo8k6KVP7y', 'STUDENT', 'ACTIVE', true, NOW(), NOW())
  ON CONFLICT ("dni") DO NOTHING
  RETURNING "id"
)
INSERT INTO "Student" ("dni", "userId", "firstName", "lastName", "birthDate", "phone", "guardianPhone", "email", "gym", "address", "createdAt", "updatedAt")
SELECT '51189989', COALESCE((SELECT "id" FROM u), (SELECT "id" FROM "User" WHERE "dni" = '51189989')), 'Agëro Marcelo', 'Liones', NULL, NULL, NULL, NULL, 'CENTRO DE JUBILADOS 29 DE ENERO', NULL, NOW(), NOW()
ON CONFLICT ("dni") DO NOTHING;

WITH t AS (
  SELECT "id" FROM "Teacher" WHERE "userId" IN (SELECT "id" FROM "User" WHERE "dni" = '45717540')
), st AS (
  SELECT "dni" FROM "Student" WHERE "dni" = '51189989'
)
INSERT INTO "StudentTeacherAssignment" ("id", "studentDni", "teacherId", "startAt", "active")
SELECT gen_random_uuid(), st."dni", t."id", NOW(), true FROM st, t
WHERE NOT EXISTS (
  SELECT 1 FROM "StudentTeacherAssignment" a
  WHERE a."studentDni" = st."dni" AND a."active" = true
);

WITH u AS (
  INSERT INTO "User" ("id", "dni", "passwordHash", "role", "status", "mustChangePassword", "createdAt", "updatedAt")
  VALUES ('e36cbb7d-ffc4-47b4-978e-fedf67e2e2e3', '52518477', '$2a$10$n/xrrZc4J5Y69bX7F6ItAOzaCIah6FrI5gfKhKItQiVxVTJ7k6/h2', 'STUDENT', 'ACTIVE', true, NOW(), NOW())
  ON CONFLICT ("dni") DO NOTHING
  RETURNING "id"
)
INSERT INTO "Student" ("dni", "userId", "firstName", "lastName", "birthDate", "phone", "guardianPhone", "email", "gym", "address", "createdAt", "updatedAt")
SELECT '52518477', COALESCE((SELECT "id" FROM u), (SELECT "id" FROM "User" WHERE "dni" = '52518477')), 'Andrés Joaquin', 'Leonardo', NULL, NULL, NULL, NULL, 'CENTRO DE JUBILADOS 29 DE ENERO', NULL, NOW(), NOW()
ON CONFLICT ("dni") DO NOTHING;

WITH t AS (
  SELECT "id" FROM "Teacher" WHERE "userId" IN (SELECT "id" FROM "User" WHERE "dni" = '45717540')
), st AS (
  SELECT "dni" FROM "Student" WHERE "dni" = '52518477'
)
INSERT INTO "StudentTeacherAssignment" ("id", "studentDni", "teacherId", "startAt", "active")
SELECT gen_random_uuid(), st."dni", t."id", NOW(), true FROM st, t
WHERE NOT EXISTS (
  SELECT 1 FROM "StudentTeacherAssignment" a
  WHERE a."studentDni" = st."dni" AND a."active" = true
);

WITH u AS (
  INSERT INTO "User" ("id", "dni", "passwordHash", "role", "status", "mustChangePassword", "createdAt", "updatedAt")
  VALUES ('e361ff53-2f67-4dae-a13b-688907e02d1d', '54436361', '$2a$10$8iSnwaH7TGCBTvQLV2aYme/gdWvohsciXgJsThAi4xerQK6bK2zNa', 'STUDENT', 'ACTIVE', true, NOW(), NOW())
  ON CONFLICT ("dni") DO NOTHING
  RETURNING "id"
)
INSERT INTO "Student" ("dni", "userId", "firstName", "lastName", "birthDate", "phone", "guardianPhone", "email", "gym", "address", "createdAt", "updatedAt")
SELECT '54436361', COALESCE((SELECT "id" FROM u), (SELECT "id" FROM "User" WHERE "dni" = '54436361')), 'Ariosto Juan', 'Salvador', NULL, NULL, NULL, NULL, 'CENTRO DE JUBILADOS 29 DE ENERO', NULL, NOW(), NOW()
ON CONFLICT ("dni") DO NOTHING;

WITH t AS (
  SELECT "id" FROM "Teacher" WHERE "userId" IN (SELECT "id" FROM "User" WHERE "dni" = '45717540')
), st AS (
  SELECT "dni" FROM "Student" WHERE "dni" = '54436361'
)
INSERT INTO "StudentTeacherAssignment" ("id", "studentDni", "teacherId", "startAt", "active")
SELECT gen_random_uuid(), st."dni", t."id", NOW(), true FROM st, t
WHERE NOT EXISTS (
  SELECT 1 FROM "StudentTeacherAssignment" a
  WHERE a."studentDni" = st."dni" AND a."active" = true
);

WITH u AS (
  INSERT INTO "User" ("id", "dni", "passwordHash", "role", "status", "mustChangePassword", "createdAt", "updatedAt")
  VALUES ('a5a3b0cb-2d79-4dfc-bc86-0d3a75784a2a', '54922715', '$2a$10$mtmF0O75Zl8/JvovLpXPs.w3pt4MnrX7bGhL775SvO.KbSecOreu2', 'STUDENT', 'ACTIVE', true, NOW(), NOW())
  ON CONFLICT ("dni") DO NOTHING
  RETURNING "id"
)
INSERT INTO "Student" ("dni", "userId", "firstName", "lastName", "birthDate", "phone", "guardianPhone", "email", "gym", "address", "createdAt", "updatedAt")
SELECT '54922715', COALESCE((SELECT "id" FROM u), (SELECT "id" FROM "User" WHERE "dni" = '54922715')), 'Baigorria Vega Juan', 'Francisco', NULL, NULL, NULL, NULL, 'CENTRO DE JUBILADOS 29 DE ENERO', NULL, NOW(), NOW()
ON CONFLICT ("dni") DO NOTHING;

WITH t AS (
  SELECT "id" FROM "Teacher" WHERE "userId" IN (SELECT "id" FROM "User" WHERE "dni" = '45717540')
), st AS (
  SELECT "dni" FROM "Student" WHERE "dni" = '54922715'
)
INSERT INTO "StudentTeacherAssignment" ("id", "studentDni", "teacherId", "startAt", "active")
SELECT gen_random_uuid(), st."dni", t."id", NOW(), true FROM st, t
WHERE NOT EXISTS (
  SELECT 1 FROM "StudentTeacherAssignment" a
  WHERE a."studentDni" = st."dni" AND a."active" = true
);

WITH u AS (
  INSERT INTO "User" ("id", "dni", "passwordHash", "role", "status", "mustChangePassword", "createdAt", "updatedAt")
  VALUES ('af0b0d4c-2829-49e6-b351-3cbd324b48d9', '57793939', '$2a$10$asGqu6IgacyBF5w3oUjF1.6tbycya5qfW.ZeLVvEXY.z8SwmQS2DW', 'STUDENT', 'ACTIVE', true, NOW(), NOW())
  ON CONFLICT ("dni") DO NOTHING
  RETURNING "id"
)
INSERT INTO "Student" ("dni", "userId", "firstName", "lastName", "birthDate", "phone", "guardianPhone", "email", "gym", "address", "createdAt", "updatedAt")
SELECT '57793939', COALESCE((SELECT "id" FROM u), (SELECT "id" FROM "User" WHERE "dni" = '57793939')), 'Codagnone', 'Gael', NULL, NULL, NULL, NULL, 'CENTRO DE JUBILADOS 29 DE ENERO', NULL, NOW(), NOW()
ON CONFLICT ("dni") DO NOTHING;

WITH t AS (
  SELECT "id" FROM "Teacher" WHERE "userId" IN (SELECT "id" FROM "User" WHERE "dni" = '45717540')
), st AS (
  SELECT "dni" FROM "Student" WHERE "dni" = '57793939'
)
INSERT INTO "StudentTeacherAssignment" ("id", "studentDni", "teacherId", "startAt", "active")
SELECT gen_random_uuid(), st."dni", t."id", NOW(), true FROM st, t
WHERE NOT EXISTS (
  SELECT 1 FROM "StudentTeacherAssignment" a
  WHERE a."studentDni" = st."dni" AND a."active" = true
);

WITH u AS (
  INSERT INTO "User" ("id", "dni", "passwordHash", "role", "status", "mustChangePassword", "createdAt", "updatedAt")
  VALUES ('15c4c007-f242-46e3-b3c4-fe4a34adc287', '56700350', '$2a$10$g/BHuyl9fTn/2Wuv9LuZwOmDbIoou6IJjrhu7nz7QhNyn2fK8kPMq', 'STUDENT', 'ACTIVE', true, NOW(), NOW())
  ON CONFLICT ("dni") DO NOTHING
  RETURNING "id"
)
INSERT INTO "Student" ("dni", "userId", "firstName", "lastName", "birthDate", "phone", "guardianPhone", "email", "gym", "address", "createdAt", "updatedAt")
SELECT '56700350', COALESCE((SELECT "id" FROM u), (SELECT "id" FROM "User" WHERE "dni" = '56700350')), 'Flores Amadeo', 'Manuel', NULL, NULL, NULL, NULL, 'CENTRO DE JUBILADOS 29 DE ENERO', NULL, NOW(), NOW()
ON CONFLICT ("dni") DO NOTHING;

WITH t AS (
  SELECT "id" FROM "Teacher" WHERE "userId" IN (SELECT "id" FROM "User" WHERE "dni" = '45717540')
), st AS (
  SELECT "dni" FROM "Student" WHERE "dni" = '56700350'
)
INSERT INTO "StudentTeacherAssignment" ("id", "studentDni", "teacherId", "startAt", "active")
SELECT gen_random_uuid(), st."dni", t."id", NOW(), true FROM st, t
WHERE NOT EXISTS (
  SELECT 1 FROM "StudentTeacherAssignment" a
  WHERE a."studentDni" = st."dni" AND a."active" = true
);

WITH u AS (
  INSERT INTO "User" ("id", "dni", "passwordHash", "role", "status", "mustChangePassword", "createdAt", "updatedAt")
  VALUES ('4afc7cb0-ae43-437e-b00c-b683a2222293', '55135185', '$2a$10$spInJCLQoehM0xzrr5bcY.YzApQtZG8pvADO64OX4Ax7AzwIap63i', 'STUDENT', 'ACTIVE', true, NOW(), NOW())
  ON CONFLICT ("dni") DO NOTHING
  RETURNING "id"
)
INSERT INTO "Student" ("dni", "userId", "firstName", "lastName", "birthDate", "phone", "guardianPhone", "email", "gym", "address", "createdAt", "updatedAt")
SELECT '55135185', COALESCE((SELECT "id" FROM u), (SELECT "id" FROM "User" WHERE "dni" = '55135185')), 'Maugeri Vannucci', 'Allegra', NULL, NULL, NULL, NULL, 'CENTRO DE JUBILADOS 29 DE ENERO', NULL, NOW(), NOW()
ON CONFLICT ("dni") DO NOTHING;

WITH t AS (
  SELECT "id" FROM "Teacher" WHERE "userId" IN (SELECT "id" FROM "User" WHERE "dni" = '45717540')
), st AS (
  SELECT "dni" FROM "Student" WHERE "dni" = '55135185'
)
INSERT INTO "StudentTeacherAssignment" ("id", "studentDni", "teacherId", "startAt", "active")
SELECT gen_random_uuid(), st."dni", t."id", NOW(), true FROM st, t
WHERE NOT EXISTS (
  SELECT 1 FROM "StudentTeacherAssignment" a
  WHERE a."studentDni" = st."dni" AND a."active" = true
);

WITH u AS (
  INSERT INTO "User" ("id", "dni", "passwordHash", "role", "status", "mustChangePassword", "createdAt", "updatedAt")
  VALUES ('b821d460-e6cf-4283-9054-3b6e3fa8b68f', '57614825', '$2a$10$w6L.mN96xMTIBkZgDmsgeOYpGKz2kWWaevdlPhLy5D/pjbQh6zEIa', 'STUDENT', 'ACTIVE', true, NOW(), NOW())
  ON CONFLICT ("dni") DO NOTHING
  RETURNING "id"
)
INSERT INTO "Student" ("dni", "userId", "firstName", "lastName", "birthDate", "phone", "guardianPhone", "email", "gym", "address", "createdAt", "updatedAt")
SELECT '57614825', COALESCE((SELECT "id" FROM u), (SELECT "id" FROM "User" WHERE "dni" = '57614825')), 'Morales', 'Kiara', NULL, NULL, NULL, NULL, 'CENTRO DE JUBILADOS 29 DE ENERO', NULL, NOW(), NOW()
ON CONFLICT ("dni") DO NOTHING;

WITH t AS (
  SELECT "id" FROM "Teacher" WHERE "userId" IN (SELECT "id" FROM "User" WHERE "dni" = '45717540')
), st AS (
  SELECT "dni" FROM "Student" WHERE "dni" = '57614825'
)
INSERT INTO "StudentTeacherAssignment" ("id", "studentDni", "teacherId", "startAt", "active")
SELECT gen_random_uuid(), st."dni", t."id", NOW(), true FROM st, t
WHERE NOT EXISTS (
  SELECT 1 FROM "StudentTeacherAssignment" a
  WHERE a."studentDni" = st."dni" AND a."active" = true
);

WITH u AS (
  INSERT INTO "User" ("id", "dni", "passwordHash", "role", "status", "mustChangePassword", "createdAt", "updatedAt")
  VALUES ('36ec9ae3-4aaf-41e3-bdd5-ec5bd6ad8664', '57614824', '$2a$10$SSgM8mSODrQgPipJ1G2aaO1H7UENgnYsUDobIoOKTWToNtTulNiBq', 'STUDENT', 'ACTIVE', true, NOW(), NOW())
  ON CONFLICT ("dni") DO NOTHING
  RETURNING "id"
)
INSERT INTO "Student" ("dni", "userId", "firstName", "lastName", "birthDate", "phone", "guardianPhone", "email", "gym", "address", "createdAt", "updatedAt")
SELECT '57614824', COALESCE((SELECT "id" FROM u), (SELECT "id" FROM "User" WHERE "dni" = '57614824')), 'Morales', 'Lessly', NULL, NULL, NULL, NULL, 'CENTRO DE JUBILADOS 29 DE ENERO', NULL, NOW(), NOW()
ON CONFLICT ("dni") DO NOTHING;

WITH t AS (
  SELECT "id" FROM "Teacher" WHERE "userId" IN (SELECT "id" FROM "User" WHERE "dni" = '45717540')
), st AS (
  SELECT "dni" FROM "Student" WHERE "dni" = '57614824'
)
INSERT INTO "StudentTeacherAssignment" ("id", "studentDni", "teacherId", "startAt", "active")
SELECT gen_random_uuid(), st."dni", t."id", NOW(), true FROM st, t
WHERE NOT EXISTS (
  SELECT 1 FROM "StudentTeacherAssignment" a
  WHERE a."studentDni" = st."dni" AND a."active" = true
);

WITH u AS (
  INSERT INTO "User" ("id", "dni", "passwordHash", "role", "status", "mustChangePassword", "createdAt", "updatedAt")
  VALUES ('79561e84-b45e-405d-917b-a3eee0c62954', '56084893', '$2a$10$NsBJ/IMeKJj8p9Qi7NCurO4zsw0XQRaBvgRjB9dbbFl3M5HxjbOVC', 'STUDENT', 'ACTIVE', true, NOW(), NOW())
  ON CONFLICT ("dni") DO NOTHING
  RETURNING "id"
)
INSERT INTO "Student" ("dni", "userId", "firstName", "lastName", "birthDate", "phone", "guardianPhone", "email", "gym", "address", "createdAt", "updatedAt")
SELECT '56084893', COALESCE((SELECT "id" FROM u), (SELECT "id" FROM "User" WHERE "dni" = '56084893')), 'Perez', 'Aaron', NULL, NULL, NULL, NULL, 'CENTRO DE JUBILADOS 29 DE ENERO', NULL, NOW(), NOW()
ON CONFLICT ("dni") DO NOTHING;

WITH t AS (
  SELECT "id" FROM "Teacher" WHERE "userId" IN (SELECT "id" FROM "User" WHERE "dni" = '45717540')
), st AS (
  SELECT "dni" FROM "Student" WHERE "dni" = '56084893'
)
INSERT INTO "StudentTeacherAssignment" ("id", "studentDni", "teacherId", "startAt", "active")
SELECT gen_random_uuid(), st."dni", t."id", NOW(), true FROM st, t
WHERE NOT EXISTS (
  SELECT 1 FROM "StudentTeacherAssignment" a
  WHERE a."studentDni" = st."dni" AND a."active" = true
);

WITH u AS (
  INSERT INTO "User" ("id", "dni", "passwordHash", "role", "status", "mustChangePassword", "createdAt", "updatedAt")
  VALUES ('42a6c1f6-b505-4c82-8f35-feefd9a16970', '54171434', '$2a$10$DvLVwXeoHs8D/EgN/OPnWOJsT37JvgLlhURxxSu0W/L9uUhhsiPnS', 'STUDENT', 'ACTIVE', true, NOW(), NOW())
  ON CONFLICT ("dni") DO NOTHING
  RETURNING "id"
)
INSERT INTO "Student" ("dni", "userId", "firstName", "lastName", "birthDate", "phone", "guardianPhone", "email", "gym", "address", "createdAt", "updatedAt")
SELECT '54171434', COALESCE((SELECT "id" FROM u), (SELECT "id" FROM "User" WHERE "dni" = '54171434')), 'Portugal Azcurra', 'Lautaro', NULL, NULL, NULL, NULL, 'CENTRO DE JUBILADOS 29 DE ENERO', NULL, NOW(), NOW()
ON CONFLICT ("dni") DO NOTHING;

WITH t AS (
  SELECT "id" FROM "Teacher" WHERE "userId" IN (SELECT "id" FROM "User" WHERE "dni" = '45717540')
), st AS (
  SELECT "dni" FROM "Student" WHERE "dni" = '54171434'
)
INSERT INTO "StudentTeacherAssignment" ("id", "studentDni", "teacherId", "startAt", "active")
SELECT gen_random_uuid(), st."dni", t."id", NOW(), true FROM st, t
WHERE NOT EXISTS (
  SELECT 1 FROM "StudentTeacherAssignment" a
  WHERE a."studentDni" = st."dni" AND a."active" = true
);

WITH u AS (
  INSERT INTO "User" ("id", "dni", "passwordHash", "role", "status", "mustChangePassword", "createdAt", "updatedAt")
  VALUES ('690a9862-7364-45fc-b8d0-c700fb0d7dae', '50377727', '$2a$10$IkeKhFIMfQVF5PQ4K.LS4eR0UnwuC9FuyytH2t2sR6Lz8cvOU/Ida', 'STUDENT', 'ACTIVE', true, NOW(), NOW())
  ON CONFLICT ("dni") DO NOTHING
  RETURNING "id"
)
INSERT INTO "Student" ("dni", "userId", "firstName", "lastName", "birthDate", "phone", "guardianPhone", "email", "gym", "address", "createdAt", "updatedAt")
SELECT '50377727', COALESCE((SELECT "id" FROM u), (SELECT "id" FROM "User" WHERE "dni" = '50377727')), 'Quintero', 'Abril', NULL, NULL, NULL, NULL, 'CENTRO DE JUBILADOS 29 DE ENERO', NULL, NOW(), NOW()
ON CONFLICT ("dni") DO NOTHING;

WITH t AS (
  SELECT "id" FROM "Teacher" WHERE "userId" IN (SELECT "id" FROM "User" WHERE "dni" = '45717540')
), st AS (
  SELECT "dni" FROM "Student" WHERE "dni" = '50377727'
)
INSERT INTO "StudentTeacherAssignment" ("id", "studentDni", "teacherId", "startAt", "active")
SELECT gen_random_uuid(), st."dni", t."id", NOW(), true FROM st, t
WHERE NOT EXISTS (
  SELECT 1 FROM "StudentTeacherAssignment" a
  WHERE a."studentDni" = st."dni" AND a."active" = true
);

WITH u AS (
  INSERT INTO "User" ("id", "dni", "passwordHash", "role", "status", "mustChangePassword", "createdAt", "updatedAt")
  VALUES ('fa5fd239-0b9c-43a3-be60-84449b88e5cc', '57121557', '$2a$10$P977Te0bt68EDJDO21rlbO6N8FC8TvAmVaGFocxkrKinyiU6Lfe1S', 'STUDENT', 'ACTIVE', true, NOW(), NOW())
  ON CONFLICT ("dni") DO NOTHING
  RETURNING "id"
)
INSERT INTO "Student" ("dni", "userId", "firstName", "lastName", "birthDate", "phone", "guardianPhone", "email", "gym", "address", "createdAt", "updatedAt")
SELECT '57121557', COALESCE((SELECT "id" FROM u), (SELECT "id" FROM "User" WHERE "dni" = '57121557')), 'Quiroga Lucarelli', 'Emma', NULL, NULL, NULL, NULL, 'CENTRO DE JUBILADOS 29 DE ENERO', NULL, NOW(), NOW()
ON CONFLICT ("dni") DO NOTHING;

WITH t AS (
  SELECT "id" FROM "Teacher" WHERE "userId" IN (SELECT "id" FROM "User" WHERE "dni" = '45717540')
), st AS (
  SELECT "dni" FROM "Student" WHERE "dni" = '57121557'
)
INSERT INTO "StudentTeacherAssignment" ("id", "studentDni", "teacherId", "startAt", "active")
SELECT gen_random_uuid(), st."dni", t."id", NOW(), true FROM st, t
WHERE NOT EXISTS (
  SELECT 1 FROM "StudentTeacherAssignment" a
  WHERE a."studentDni" = st."dni" AND a."active" = true
);

WITH u AS (
  INSERT INTO "User" ("id", "dni", "passwordHash", "role", "status", "mustChangePassword", "createdAt", "updatedAt")
  VALUES ('6c77bc8a-1a8c-4a41-b69a-9dda4e47fd19', '53938310', '$2a$10$LfnC2KJhsKMrRGAF0gAJH.5J/v7.3Na5TTX8UAFl2NfUE6IBVQ5bW', 'STUDENT', 'ACTIVE', true, NOW(), NOW())
  ON CONFLICT ("dni") DO NOTHING
  RETURNING "id"
)
INSERT INTO "Student" ("dni", "userId", "firstName", "lastName", "birthDate", "phone", "guardianPhone", "email", "gym", "address", "createdAt", "updatedAt")
SELECT '53938310', COALESCE((SELECT "id" FROM u), (SELECT "id" FROM "User" WHERE "dni" = '53938310')), 'Soria', 'Genaro', NULL, NULL, NULL, NULL, 'CENTRO DE JUBILADOS 29 DE ENERO', NULL, NOW(), NOW()
ON CONFLICT ("dni") DO NOTHING;

WITH t AS (
  SELECT "id" FROM "Teacher" WHERE "userId" IN (SELECT "id" FROM "User" WHERE "dni" = '45717540')
), st AS (
  SELECT "dni" FROM "Student" WHERE "dni" = '53938310'
)
INSERT INTO "StudentTeacherAssignment" ("id", "studentDni", "teacherId", "startAt", "active")
SELECT gen_random_uuid(), st."dni", t."id", NOW(), true FROM st, t
WHERE NOT EXISTS (
  SELECT 1 FROM "StudentTeacherAssignment" a
  WHERE a."studentDni" = st."dni" AND a."active" = true
);

WITH u AS (
  INSERT INTO "User" ("id", "dni", "passwordHash", "role", "status", "mustChangePassword", "createdAt", "updatedAt")
  VALUES ('9056f135-405c-4253-ad9f-33912c9cd72f', '47928329', '$2a$10$uHF/srlNcFyLglEHiFd4C.beK2iY1Zqa8yOzJnddIrIt95qnD4XgC', 'STUDENT', 'ACTIVE', true, NOW(), NOW())
  ON CONFLICT ("dni") DO NOTHING
  RETURNING "id"
)
INSERT INTO "Student" ("dni", "userId", "firstName", "lastName", "birthDate", "phone", "guardianPhone", "email", "gym", "address", "createdAt", "updatedAt")
SELECT '47928329', COALESCE((SELECT "id" FROM u), (SELECT "id" FROM "User" WHERE "dni" = '47928329')), 'Celina Ariana', 'Diaz', NULL, NULL, NULL, NULL, 'nan', NULL, NOW(), NOW()
ON CONFLICT ("dni") DO NOTHING;

WITH t AS (
  SELECT "id" FROM "Teacher" WHERE "userId" IN (SELECT "id" FROM "User" WHERE "dni" = '48607535')
), st AS (
  SELECT "dni" FROM "Student" WHERE "dni" = '47928329'
)
INSERT INTO "StudentTeacherAssignment" ("id", "studentDni", "teacherId", "startAt", "active")
SELECT gen_random_uuid(), st."dni", t."id", NOW(), true FROM st, t
WHERE NOT EXISTS (
  SELECT 1 FROM "StudentTeacherAssignment" a
  WHERE a."studentDni" = st."dni" AND a."active" = true
);

WITH u AS (
  INSERT INTO "User" ("id", "dni", "passwordHash", "role", "status", "mustChangePassword", "createdAt", "updatedAt")
  VALUES ('e03705e8-69c3-4536-93df-0b55a8b15824', '57796761', '$2a$10$k8..rZ/uJm8MuqKoIuC9KuAoLNANEAdSrHCPYi9kKfHKoZGt02Jve', 'STUDENT', 'ACTIVE', true, NOW(), NOW())
  ON CONFLICT ("dni") DO NOTHING
  RETURNING "id"
)
INSERT INTO "Student" ("dni", "userId", "firstName", "lastName", "birthDate", "phone", "guardianPhone", "email", "gym", "address", "createdAt", "updatedAt")
SELECT '57796761', COALESCE((SELECT "id" FROM u), (SELECT "id" FROM "User" WHERE "dni" = '57796761')), 'Tyrone', 'Quinteros', NULL, NULL, NULL, NULL, 'nan', NULL, NOW(), NOW()
ON CONFLICT ("dni") DO NOTHING;

WITH t AS (
  SELECT "id" FROM "Teacher" WHERE "userId" IN (SELECT "id" FROM "User" WHERE "dni" = '45718997')
), st AS (
  SELECT "dni" FROM "Student" WHERE "dni" = '57796761'
)
INSERT INTO "StudentTeacherAssignment" ("id", "studentDni", "teacherId", "startAt", "active")
SELECT gen_random_uuid(), st."dni", t."id", NOW(), true FROM st, t
WHERE NOT EXISTS (
  SELECT 1 FROM "StudentTeacherAssignment" a
  WHERE a."studentDni" = st."dni" AND a."active" = true
);

WITH u AS (
  INSERT INTO "User" ("id", "dni", "passwordHash", "role", "status", "mustChangePassword", "createdAt", "updatedAt")
  VALUES ('21731c04-9476-4997-8a0d-71a022e169bf', '56700450', '$2a$10$tzxhwGLmpz8MibtmspLEp.akjyh9NfEh2XsiVl6JfLxGcTwlI9eR6', 'STUDENT', 'ACTIVE', true, NOW(), NOW())
  ON CONFLICT ("dni") DO NOTHING
  RETURNING "id"
)
INSERT INTO "Student" ("dni", "userId", "firstName", "lastName", "birthDate", "phone", "guardianPhone", "email", "gym", "address", "createdAt", "updatedAt")
SELECT '56700450', COALESCE((SELECT "id" FROM u), (SELECT "id" FROM "User" WHERE "dni" = '56700450')), 'Fabricio', 'Cabrera', NULL, NULL, NULL, NULL, 'nan', NULL, NOW(), NOW()
ON CONFLICT ("dni") DO NOTHING;

WITH t AS (
  SELECT "id" FROM "Teacher" WHERE "userId" IN (SELECT "id" FROM "User" WHERE "dni" = '45718997')
), st AS (
  SELECT "dni" FROM "Student" WHERE "dni" = '56700450'
)
INSERT INTO "StudentTeacherAssignment" ("id", "studentDni", "teacherId", "startAt", "active")
SELECT gen_random_uuid(), st."dni", t."id", NOW(), true FROM st, t
WHERE NOT EXISTS (
  SELECT 1 FROM "StudentTeacherAssignment" a
  WHERE a."studentDni" = st."dni" AND a."active" = true
);

WITH u AS (
  INSERT INTO "User" ("id", "dni", "passwordHash", "role", "status", "mustChangePassword", "createdAt", "updatedAt")
  VALUES ('2675b4a6-3809-476c-b2fd-1f1999ef7e75', '49923174', '$2a$10$rXxNvrGM5lGB8NV2hYPgIuMjJHUvhzWY.uhDtt6fjUtMrM5uq0Fpi', 'STUDENT', 'ACTIVE', true, NOW(), NOW())
  ON CONFLICT ("dni") DO NOTHING
  RETURNING "id"
)
INSERT INTO "Student" ("dni", "userId", "firstName", "lastName", "birthDate", "phone", "guardianPhone", "email", "gym", "address", "createdAt", "updatedAt")
SELECT '49923174', COALESCE((SELECT "id" FROM u), (SELECT "id" FROM "User" WHERE "dni" = '49923174')), 'Celeste', 'Choquetilla', NULL, NULL, NULL, NULL, 'nan', NULL, NOW(), NOW()
ON CONFLICT ("dni") DO NOTHING;

WITH t AS (
  SELECT "id" FROM "Teacher" WHERE "userId" IN (SELECT "id" FROM "User" WHERE "dni" = '45718997')
), st AS (
  SELECT "dni" FROM "Student" WHERE "dni" = '49923174'
)
INSERT INTO "StudentTeacherAssignment" ("id", "studentDni", "teacherId", "startAt", "active")
SELECT gen_random_uuid(), st."dni", t."id", NOW(), true FROM st, t
WHERE NOT EXISTS (
  SELECT 1 FROM "StudentTeacherAssignment" a
  WHERE a."studentDni" = st."dni" AND a."active" = true
);

WITH u AS (
  INSERT INTO "User" ("id", "dni", "passwordHash", "role", "status", "mustChangePassword", "createdAt", "updatedAt")
  VALUES ('c63fc3e6-1218-4eb4-98e2-4991a29bb76f', '51318581', '$2a$10$DUtjNZledU.z8.Rjb4D4iO03jW4keiSrPmad6PpyJgd8kwfwBo1dm', 'STUDENT', 'ACTIVE', true, NOW(), NOW())
  ON CONFLICT ("dni") DO NOTHING
  RETURNING "id"
)
INSERT INTO "Student" ("dni", "userId", "firstName", "lastName", "birthDate", "phone", "guardianPhone", "email", "gym", "address", "createdAt", "updatedAt")
SELECT '51318581', COALESCE((SELECT "id" FROM u), (SELECT "id" FROM "User" WHERE "dni" = '51318581')), 'Benjamin', 'Choquetilla', NULL, NULL, NULL, NULL, 'nan', NULL, NOW(), NOW()
ON CONFLICT ("dni") DO NOTHING;

WITH t AS (
  SELECT "id" FROM "Teacher" WHERE "userId" IN (SELECT "id" FROM "User" WHERE "dni" = '45718997')
), st AS (
  SELECT "dni" FROM "Student" WHERE "dni" = '51318581'
)
INSERT INTO "StudentTeacherAssignment" ("id", "studentDni", "teacherId", "startAt", "active")
SELECT gen_random_uuid(), st."dni", t."id", NOW(), true FROM st, t
WHERE NOT EXISTS (
  SELECT 1 FROM "StudentTeacherAssignment" a
  WHERE a."studentDni" = st."dni" AND a."active" = true
);

WITH u AS (
  INSERT INTO "User" ("id", "dni", "passwordHash", "role", "status", "mustChangePassword", "createdAt", "updatedAt")
  VALUES ('06d13f07-5725-4a3e-834e-053292063765', '53484003', '$2a$10$titM1hIakXFg7jMEihPbz.t40sd.oVk44.SoNCRL4FOSH0guZ2IG.', 'STUDENT', 'ACTIVE', true, NOW(), NOW())
  ON CONFLICT ("dni") DO NOTHING
  RETURNING "id"
)
INSERT INTO "Student" ("dni", "userId", "firstName", "lastName", "birthDate", "phone", "guardianPhone", "email", "gym", "address", "createdAt", "updatedAt")
SELECT '53484003', COALESCE((SELECT "id" FROM u), (SELECT "id" FROM "User" WHERE "dni" = '53484003')), 'Rocio', 'Choquetilla', NULL, NULL, NULL, NULL, 'nan', NULL, NOW(), NOW()
ON CONFLICT ("dni") DO NOTHING;

WITH t AS (
  SELECT "id" FROM "Teacher" WHERE "userId" IN (SELECT "id" FROM "User" WHERE "dni" = '45718997')
), st AS (
  SELECT "dni" FROM "Student" WHERE "dni" = '53484003'
)
INSERT INTO "StudentTeacherAssignment" ("id", "studentDni", "teacherId", "startAt", "active")
SELECT gen_random_uuid(), st."dni", t."id", NOW(), true FROM st, t
WHERE NOT EXISTS (
  SELECT 1 FROM "StudentTeacherAssignment" a
  WHERE a."studentDni" = st."dni" AND a."active" = true
);

WITH u AS (
  INSERT INTO "User" ("id", "dni", "passwordHash", "role", "status", "mustChangePassword", "createdAt", "updatedAt")
  VALUES ('dbf86f64-eaab-4aec-8046-a8d623ad06bb', '34370493', '$2a$10$bJ8zUuBpU7pTFrIqWcRKZ.DKdKHyS6BkOBUBdwgBuVh19TETzvdZS', 'STUDENT', 'ACTIVE', true, NOW(), NOW())
  ON CONFLICT ("dni") DO NOTHING
  RETURNING "id"
)
INSERT INTO "Student" ("dni", "userId", "firstName", "lastName", "birthDate", "phone", "guardianPhone", "email", "gym", "address", "createdAt", "updatedAt")
SELECT '34370493', COALESCE((SELECT "id" FROM u), (SELECT "id" FROM "User" WHERE "dni" = '34370493')), 'Sofia', 'Geronimo', NULL, NULL, NULL, NULL, 'nan', NULL, NOW(), NOW()
ON CONFLICT ("dni") DO NOTHING;

WITH t AS (
  SELECT "id" FROM "Teacher" WHERE "userId" IN (SELECT "id" FROM "User" WHERE "dni" = '45718997')
), st AS (
  SELECT "dni" FROM "Student" WHERE "dni" = '34370493'
)
INSERT INTO "StudentTeacherAssignment" ("id", "studentDni", "teacherId", "startAt", "active")
SELECT gen_random_uuid(), st."dni", t."id", NOW(), true FROM st, t
WHERE NOT EXISTS (
  SELECT 1 FROM "StudentTeacherAssignment" a
  WHERE a."studentDni" = st."dni" AND a."active" = true
);

WITH u AS (
  INSERT INTO "User" ("id", "dni", "passwordHash", "role", "status", "mustChangePassword", "createdAt", "updatedAt")
  VALUES ('444c006f-b541-4287-b912-dc6ace7112e1', '49787262', '$2a$10$zan3gMABwo67l15SWs2BduX0rNGIBLalojdGCaIIlEzE3UDnupp1a', 'STUDENT', 'ACTIVE', true, NOW(), NOW())
  ON CONFLICT ("dni") DO NOTHING
  RETURNING "id"
)
INSERT INTO "Student" ("dni", "userId", "firstName", "lastName", "birthDate", "phone", "guardianPhone", "email", "gym", "address", "createdAt", "updatedAt")
SELECT '49787262', COALESCE((SELECT "id" FROM u), (SELECT "id" FROM "User" WHERE "dni" = '49787262')), 'Selena', 'Olivares', NULL, NULL, NULL, NULL, 'nan', NULL, NOW(), NOW()
ON CONFLICT ("dni") DO NOTHING;

WITH t AS (
  SELECT "id" FROM "Teacher" WHERE "userId" IN (SELECT "id" FROM "User" WHERE "dni" = '45718997')
), st AS (
  SELECT "dni" FROM "Student" WHERE "dni" = '49787262'
)
INSERT INTO "StudentTeacherAssignment" ("id", "studentDni", "teacherId", "startAt", "active")
SELECT gen_random_uuid(), st."dni", t."id", NOW(), true FROM st, t
WHERE NOT EXISTS (
  SELECT 1 FROM "StudentTeacherAssignment" a
  WHERE a."studentDni" = st."dni" AND a."active" = true
);

WITH u AS (
  INSERT INTO "User" ("id", "dni", "passwordHash", "role", "status", "mustChangePassword", "createdAt", "updatedAt")
  VALUES ('264e57ee-d8ca-4182-860b-1f4118cb415c', '51090502', '$2a$10$VtN//cDGKvyBqc1c0IgmKO/hSGy/tZaKH5Lc.I8xO2nWjNQEYxCm6', 'STUDENT', 'ACTIVE', true, NOW(), NOW())
  ON CONFLICT ("dni") DO NOTHING
  RETURNING "id"
)
INSERT INTO "Student" ("dni", "userId", "firstName", "lastName", "birthDate", "phone", "guardianPhone", "email", "gym", "address", "createdAt", "updatedAt")
SELECT '51090502', COALESCE((SELECT "id" FROM u), (SELECT "id" FROM "User" WHERE "dni" = '51090502')), 'Ximena', 'Aguilera', NULL, NULL, NULL, NULL, 'nan', NULL, NOW(), NOW()
ON CONFLICT ("dni") DO NOTHING;

WITH t AS (
  SELECT "id" FROM "Teacher" WHERE "userId" IN (SELECT "id" FROM "User" WHERE "dni" = '45718997')
), st AS (
  SELECT "dni" FROM "Student" WHERE "dni" = '51090502'
)
INSERT INTO "StudentTeacherAssignment" ("id", "studentDni", "teacherId", "startAt", "active")
SELECT gen_random_uuid(), st."dni", t."id", NOW(), true FROM st, t
WHERE NOT EXISTS (
  SELECT 1 FROM "StudentTeacherAssignment" a
  WHERE a."studentDni" = st."dni" AND a."active" = true
);

WITH u AS (
  INSERT INTO "User" ("id", "dni", "passwordHash", "role", "status", "mustChangePassword", "createdAt", "updatedAt")
  VALUES ('9d0efc7f-4046-4c02-8a60-49ac9bf3d92f', '52292246', '$2a$10$PaOjo/SM5hA6fXUJ.4yBZOtJQFLcCOzpOfJkEimp/n9i7DeMDYaOO', 'STUDENT', 'ACTIVE', true, NOW(), NOW())
  ON CONFLICT ("dni") DO NOTHING
  RETURNING "id"
)
INSERT INTO "Student" ("dni", "userId", "firstName", "lastName", "birthDate", "phone", "guardianPhone", "email", "gym", "address", "createdAt", "updatedAt")
SELECT '52292246', COALESCE((SELECT "id" FROM u), (SELECT "id" FROM "User" WHERE "dni" = '52292246')), 'Milena', 'Estrada', NULL, NULL, NULL, NULL, 'nan', NULL, NOW(), NOW()
ON CONFLICT ("dni") DO NOTHING;

WITH t AS (
  SELECT "id" FROM "Teacher" WHERE "userId" IN (SELECT "id" FROM "User" WHERE "dni" = '45718997')
), st AS (
  SELECT "dni" FROM "Student" WHERE "dni" = '52292246'
)
INSERT INTO "StudentTeacherAssignment" ("id", "studentDni", "teacherId", "startAt", "active")
SELECT gen_random_uuid(), st."dni", t."id", NOW(), true FROM st, t
WHERE NOT EXISTS (
  SELECT 1 FROM "StudentTeacherAssignment" a
  WHERE a."studentDni" = st."dni" AND a."active" = true
);

WITH u AS (
  INSERT INTO "User" ("id", "dni", "passwordHash", "role", "status", "mustChangePassword", "createdAt", "updatedAt")
  VALUES ('d4a5a6cf-001a-4860-b186-db3fabf829db', '54922503', '$2a$10$AhQISRD0.n3G4EEqTgG.y.af67GjyRMDFGb1Y1jMGgCrVZBwNWABe', 'STUDENT', 'ACTIVE', true, NOW(), NOW())
  ON CONFLICT ("dni") DO NOTHING
  RETURNING "id"
)
INSERT INTO "Student" ("dni", "userId", "firstName", "lastName", "birthDate", "phone", "guardianPhone", "email", "gym", "address", "createdAt", "updatedAt")
SELECT '54922503', COALESCE((SELECT "id" FROM u), (SELECT "id" FROM "User" WHERE "dni" = '54922503')), 'Reta', 'Catalina', NULL, NULL, NULL, NULL, 'nan', NULL, NOW(), NOW()
ON CONFLICT ("dni") DO NOTHING;

WITH t AS (
  SELECT "id" FROM "Teacher" WHERE "userId" IN (SELECT "id" FROM "User" WHERE "dni" = '45724004')
), st AS (
  SELECT "dni" FROM "Student" WHERE "dni" = '54922503'
)
INSERT INTO "StudentTeacherAssignment" ("id", "studentDni", "teacherId", "startAt", "active")
SELECT gen_random_uuid(), st."dni", t."id", NOW(), true FROM st, t
WHERE NOT EXISTS (
  SELECT 1 FROM "StudentTeacherAssignment" a
  WHERE a."studentDni" = st."dni" AND a."active" = true
);

WITH u AS (
  INSERT INTO "User" ("id", "dni", "passwordHash", "role", "status", "mustChangePassword", "createdAt", "updatedAt")
  VALUES ('d68912c8-5648-4d1c-b520-437a93fa7804', '52684003', '$2a$10$IKU332Cae5VAjySQiBoVPuBni5EUR3HfZPvwkDF4IG.1t1NVPw9v2', 'STUDENT', 'ACTIVE', true, NOW(), NOW())
  ON CONFLICT ("dni") DO NOTHING
  RETURNING "id"
)
INSERT INTO "Student" ("dni", "userId", "firstName", "lastName", "birthDate", "phone", "guardianPhone", "email", "gym", "address", "createdAt", "updatedAt")
SELECT '52684003', COALESCE((SELECT "id" FROM u), (SELECT "id" FROM "User" WHERE "dni" = '52684003')), 'Santiago', 'Reynoso', NULL, NULL, NULL, NULL, 'nan', NULL, NOW(), NOW()
ON CONFLICT ("dni") DO NOTHING;

WITH t AS (
  SELECT "id" FROM "Teacher" WHERE "userId" IN (SELECT "id" FROM "User" WHERE "dni" = '45724004')
), st AS (
  SELECT "dni" FROM "Student" WHERE "dni" = '52684003'
)
INSERT INTO "StudentTeacherAssignment" ("id", "studentDni", "teacherId", "startAt", "active")
SELECT gen_random_uuid(), st."dni", t."id", NOW(), true FROM st, t
WHERE NOT EXISTS (
  SELECT 1 FROM "StudentTeacherAssignment" a
  WHERE a."studentDni" = st."dni" AND a."active" = true
);

WITH u AS (
  INSERT INTO "User" ("id", "dni", "passwordHash", "role", "status", "mustChangePassword", "createdAt", "updatedAt")
  VALUES ('5721f009-ed63-4455-8c84-9f810b781a8c', '52812193', '$2a$10$T14n30zkA8qu1a6e6boggusXDB3uXL7KEwNLBml7O7hHqr7aqEwUu', 'STUDENT', 'ACTIVE', true, NOW(), NOW())
  ON CONFLICT ("dni") DO NOTHING
  RETURNING "id"
)
INSERT INTO "Student" ("dni", "userId", "firstName", "lastName", "birthDate", "phone", "guardianPhone", "email", "gym", "address", "createdAt", "updatedAt")
SELECT '52812193', COALESCE((SELECT "id" FROM u), (SELECT "id" FROM "User" WHERE "dni" = '52812193')), 'Stefanici', 'Bastian', NULL, NULL, NULL, NULL, 'nan', NULL, NOW(), NOW()
ON CONFLICT ("dni") DO NOTHING;

WITH t AS (
  SELECT "id" FROM "Teacher" WHERE "userId" IN (SELECT "id" FROM "User" WHERE "dni" = '45724004')
), st AS (
  SELECT "dni" FROM "Student" WHERE "dni" = '52812193'
)
INSERT INTO "StudentTeacherAssignment" ("id", "studentDni", "teacherId", "startAt", "active")
SELECT gen_random_uuid(), st."dni", t."id", NOW(), true FROM st, t
WHERE NOT EXISTS (
  SELECT 1 FROM "StudentTeacherAssignment" a
  WHERE a."studentDni" = st."dni" AND a."active" = true
);

WITH u AS (
  INSERT INTO "User" ("id", "dni", "passwordHash", "role", "status", "mustChangePassword", "createdAt", "updatedAt")
  VALUES ('0544fe8c-a7c7-41af-8afa-070ab5949461', '55384692', '$2a$10$hkEuge3wExlsG.Pz/9ae8.nbCoBl7njyXdOF0zHIZwX95iz/kfK7y', 'STUDENT', 'ACTIVE', true, NOW(), NOW())
  ON CONFLICT ("dni") DO NOTHING
  RETURNING "id"
)
INSERT INTO "Student" ("dni", "userId", "firstName", "lastName", "birthDate", "phone", "guardianPhone", "email", "gym", "address", "createdAt", "updatedAt")
SELECT '55384692', COALESCE((SELECT "id" FROM u), (SELECT "id" FROM "User" WHERE "dni" = '55384692')), 'Guillermo Pierro', 'Molina', NULL, NULL, NULL, NULL, 'nan', NULL, NOW(), NOW()
ON CONFLICT ("dni") DO NOTHING;

WITH t AS (
  SELECT "id" FROM "Teacher" WHERE "userId" IN (SELECT "id" FROM "User" WHERE "dni" = '45724004')
), st AS (
  SELECT "dni" FROM "Student" WHERE "dni" = '55384692'
)
INSERT INTO "StudentTeacherAssignment" ("id", "studentDni", "teacherId", "startAt", "active")
SELECT gen_random_uuid(), st."dni", t."id", NOW(), true FROM st, t
WHERE NOT EXISTS (
  SELECT 1 FROM "StudentTeacherAssignment" a
  WHERE a."studentDni" = st."dni" AND a."active" = true
);

WITH u AS (
  INSERT INTO "User" ("id", "dni", "passwordHash", "role", "status", "mustChangePassword", "createdAt", "updatedAt")
  VALUES ('f8b64528-257a-4682-a74d-4b1751e68cd9', '55924578', '$2a$10$qnL0Xk0szcsyfEulnciSMOxkNaxHau1P8lPldFueuZ7Ub95STrqk2', 'STUDENT', 'ACTIVE', true, NOW(), NOW())
  ON CONFLICT ("dni") DO NOTHING
  RETURNING "id"
)
INSERT INTO "Student" ("dni", "userId", "firstName", "lastName", "birthDate", "phone", "guardianPhone", "email", "gym", "address", "createdAt", "updatedAt")
SELECT '55924578', COALESCE((SELECT "id" FROM u), (SELECT "id" FROM "User" WHERE "dni" = '55924578')), 'Pedro', 'Pizzuolo', NULL, NULL, NULL, NULL, 'nan', NULL, NOW(), NOW()
ON CONFLICT ("dni") DO NOTHING;

WITH t AS (
  SELECT "id" FROM "Teacher" WHERE "userId" IN (SELECT "id" FROM "User" WHERE "dni" = '45724004')
), st AS (
  SELECT "dni" FROM "Student" WHERE "dni" = '55924578'
)
INSERT INTO "StudentTeacherAssignment" ("id", "studentDni", "teacherId", "startAt", "active")
SELECT gen_random_uuid(), st."dni", t."id", NOW(), true FROM st, t
WHERE NOT EXISTS (
  SELECT 1 FROM "StudentTeacherAssignment" a
  WHERE a."studentDni" = st."dni" AND a."active" = true
);

WITH u AS (
  INSERT INTO "User" ("id", "dni", "passwordHash", "role", "status", "mustChangePassword", "createdAt", "updatedAt")
  VALUES ('cef825d9-def7-4dc9-9c5a-3bafda49a3d2', '51183171', '$2a$10$uF63Bukpuh3tTMDoVwS8E.6q7Iwy/EZD1udUFRATobVmt5/Xa6bfe', 'STUDENT', 'ACTIVE', true, NOW(), NOW())
  ON CONFLICT ("dni") DO NOTHING
  RETURNING "id"
)
INSERT INTO "Student" ("dni", "userId", "firstName", "lastName", "birthDate", "phone", "guardianPhone", "email", "gym", "address", "createdAt", "updatedAt")
SELECT '51183171', COALESCE((SELECT "id" FROM u), (SELECT "id" FROM "User" WHERE "dni" = '51183171')), 'Ema', 'Jarulakis', NULL, NULL, NULL, NULL, 'nan', NULL, NOW(), NOW()
ON CONFLICT ("dni") DO NOTHING;

WITH t AS (
  SELECT "id" FROM "Teacher" WHERE "userId" IN (SELECT "id" FROM "User" WHERE "dni" = '45724004')
), st AS (
  SELECT "dni" FROM "Student" WHERE "dni" = '51183171'
)
INSERT INTO "StudentTeacherAssignment" ("id", "studentDni", "teacherId", "startAt", "active")
SELECT gen_random_uuid(), st."dni", t."id", NOW(), true FROM st, t
WHERE NOT EXISTS (
  SELECT 1 FROM "StudentTeacherAssignment" a
  WHERE a."studentDni" = st."dni" AND a."active" = true
);

WITH u AS (
  INSERT INTO "User" ("id", "dni", "passwordHash", "role", "status", "mustChangePassword", "createdAt", "updatedAt")
  VALUES ('465ad553-2a4e-46ca-8a24-d379b99c5461', '52292577', '$2a$10$USRqnuXaCAm9jJ82bu7.f.H.z2Cj/HfKiOU.oadg4Ezn2RlpsRdii', 'STUDENT', 'ACTIVE', true, NOW(), NOW())
  ON CONFLICT ("dni") DO NOTHING
  RETURNING "id"
)
INSERT INTO "Student" ("dni", "userId", "firstName", "lastName", "birthDate", "phone", "guardianPhone", "email", "gym", "address", "createdAt", "updatedAt")
SELECT '52292577', COALESCE((SELECT "id" FROM u), (SELECT "id" FROM "User" WHERE "dni" = '52292577')), 'Angelina', 'Ventrice', NULL, NULL, NULL, NULL, 'nan', NULL, NOW(), NOW()
ON CONFLICT ("dni") DO NOTHING;

WITH t AS (
  SELECT "id" FROM "Teacher" WHERE "userId" IN (SELECT "id" FROM "User" WHERE "dni" = '45724004')
), st AS (
  SELECT "dni" FROM "Student" WHERE "dni" = '52292577'
)
INSERT INTO "StudentTeacherAssignment" ("id", "studentDni", "teacherId", "startAt", "active")
SELECT gen_random_uuid(), st."dni", t."id", NOW(), true FROM st, t
WHERE NOT EXISTS (
  SELECT 1 FROM "StudentTeacherAssignment" a
  WHERE a."studentDni" = st."dni" AND a."active" = true
);

WITH u AS (
  INSERT INTO "User" ("id", "dni", "passwordHash", "role", "status", "mustChangePassword", "createdAt", "updatedAt")
  VALUES ('5f571deb-80f3-4fa1-8164-a42a6204cada', '43543568', '$2a$10$174Vzzh6VNTpDIV96bQmROajKSqLDK7jCXA2yumgIyuL7PFIycEMK', 'STUDENT', 'ACTIVE', true, NOW(), NOW())
  ON CONFLICT ("dni") DO NOTHING
  RETURNING "id"
)
INSERT INTO "Student" ("dni", "userId", "firstName", "lastName", "birthDate", "phone", "guardianPhone", "email", "gym", "address", "createdAt", "updatedAt")
SELECT '43543568', COALESCE((SELECT "id" FROM u), (SELECT "id" FROM "User" WHERE "dni" = '43543568')), 'Nicol', 'Belmonte', NULL, NULL, NULL, NULL, 'nan', NULL, NOW(), NOW()
ON CONFLICT ("dni") DO NOTHING;

WITH t AS (
  SELECT "id" FROM "Teacher" WHERE "userId" IN (SELECT "id" FROM "User" WHERE "dni" = '45724004')
), st AS (
  SELECT "dni" FROM "Student" WHERE "dni" = '43543568'
)
INSERT INTO "StudentTeacherAssignment" ("id", "studentDni", "teacherId", "startAt", "active")
SELECT gen_random_uuid(), st."dni", t."id", NOW(), true FROM st, t
WHERE NOT EXISTS (
  SELECT 1 FROM "StudentTeacherAssignment" a
  WHERE a."studentDni" = st."dni" AND a."active" = true
);

WITH u AS (
  INSERT INTO "User" ("id", "dni", "passwordHash", "role", "status", "mustChangePassword", "createdAt", "updatedAt")
  VALUES ('cd5a4141-6bdb-4697-a716-c5d513c73195', '57583742', '$2a$10$cY6jk1wfYQLS/y2a.58/p.E4GPV3SHVmRVKu4wOo2tjCl1x18MHPG', 'STUDENT', 'ACTIVE', true, NOW(), NOW())
  ON CONFLICT ("dni") DO NOTHING
  RETURNING "id"
)
INSERT INTO "Student" ("dni", "userId", "firstName", "lastName", "birthDate", "phone", "guardianPhone", "email", "gym", "address", "createdAt", "updatedAt")
SELECT '57583742', COALESCE((SELECT "id" FROM u), (SELECT "id" FROM "User" WHERE "dni" = '57583742')), 'Helena', 'Dinatale', NULL, NULL, NULL, NULL, 'nan', NULL, NOW(), NOW()
ON CONFLICT ("dni") DO NOTHING;

WITH t AS (
  SELECT "id" FROM "Teacher" WHERE "userId" IN (SELECT "id" FROM "User" WHERE "dni" = '45724004')
), st AS (
  SELECT "dni" FROM "Student" WHERE "dni" = '57583742'
)
INSERT INTO "StudentTeacherAssignment" ("id", "studentDni", "teacherId", "startAt", "active")
SELECT gen_random_uuid(), st."dni", t."id", NOW(), true FROM st, t
WHERE NOT EXISTS (
  SELECT 1 FROM "StudentTeacherAssignment" a
  WHERE a."studentDni" = st."dni" AND a."active" = true
);

WITH u AS (
  INSERT INTO "User" ("id", "dni", "passwordHash", "role", "status", "mustChangePassword", "createdAt", "updatedAt")
  VALUES ('f7360d2c-1d4d-4b5b-86c7-d0cba73ba16b', '57119337', '$2a$10$4GLwypSHMn//hv9UO4by3OHFyBZecvCFue1rAqkGDq5CmGyCyK6Yi', 'STUDENT', 'ACTIVE', true, NOW(), NOW())
  ON CONFLICT ("dni") DO NOTHING
  RETURNING "id"
)
INSERT INTO "Student" ("dni", "userId", "firstName", "lastName", "birthDate", "phone", "guardianPhone", "email", "gym", "address", "createdAt", "updatedAt")
SELECT '57119337', COALESCE((SELECT "id" FROM u), (SELECT "id" FROM "User" WHERE "dni" = '57119337')), 'Sofia', 'Tejada', NULL, NULL, NULL, NULL, 'nan', NULL, NOW(), NOW()
ON CONFLICT ("dni") DO NOTHING;

WITH t AS (
  SELECT "id" FROM "Teacher" WHERE "userId" IN (SELECT "id" FROM "User" WHERE "dni" = '45724004')
), st AS (
  SELECT "dni" FROM "Student" WHERE "dni" = '57119337'
)
INSERT INTO "StudentTeacherAssignment" ("id", "studentDni", "teacherId", "startAt", "active")
SELECT gen_random_uuid(), st."dni", t."id", NOW(), true FROM st, t
WHERE NOT EXISTS (
  SELECT 1 FROM "StudentTeacherAssignment" a
  WHERE a."studentDni" = st."dni" AND a."active" = true
);

WITH u AS (
  INSERT INTO "User" ("id", "dni", "passwordHash", "role", "status", "mustChangePassword", "createdAt", "updatedAt")
  VALUES ('57666592-ecc7-4771-8ad7-64cf5bd1e66b', '44122856', '$2a$10$orDxxzCEDh5dFm6aB19wZOToj7AEevmE.foOVoS/Ip3PunpHY5wW2', 'STUDENT', 'ACTIVE', true, NOW(), NOW())
  ON CONFLICT ("dni") DO NOTHING
  RETURNING "id"
)
INSERT INTO "Student" ("dni", "userId", "firstName", "lastName", "birthDate", "phone", "guardianPhone", "email", "gym", "address", "createdAt", "updatedAt")
SELECT '44122856', COALESCE((SELECT "id" FROM u), (SELECT "id" FROM "User" WHERE "dni" = '44122856')), 'Celeste', 'Agüero', NULL, NULL, NULL, NULL, 'nan', NULL, NOW(), NOW()
ON CONFLICT ("dni") DO NOTHING;

WITH t AS (
  SELECT "id" FROM "Teacher" WHERE "userId" IN (SELECT "id" FROM "User" WHERE "dni" = '45724004')
), st AS (
  SELECT "dni" FROM "Student" WHERE "dni" = '44122856'
)
INSERT INTO "StudentTeacherAssignment" ("id", "studentDni", "teacherId", "startAt", "active")
SELECT gen_random_uuid(), st."dni", t."id", NOW(), true FROM st, t
WHERE NOT EXISTS (
  SELECT 1 FROM "StudentTeacherAssignment" a
  WHERE a."studentDni" = st."dni" AND a."active" = true
);

WITH u AS (
  INSERT INTO "User" ("id", "dni", "passwordHash", "role", "status", "mustChangePassword", "createdAt", "updatedAt")
  VALUES ('4d84eecf-8bff-48d3-8824-fd979186d660', '42749536', '$2a$10$LxmzSc02lRwWotczj./DeOs0qHGsqX1BqTcTZod5AYHR9edXHN/Ie', 'STUDENT', 'ACTIVE', true, NOW(), NOW())
  ON CONFLICT ("dni") DO NOTHING
  RETURNING "id"
)
INSERT INTO "Student" ("dni", "userId", "firstName", "lastName", "birthDate", "phone", "guardianPhone", "email", "gym", "address", "createdAt", "updatedAt")
SELECT '42749536', COALESCE((SELECT "id" FROM u), (SELECT "id" FROM "User" WHERE "dni" = '42749536')), 'Leandro', 'Agüero', NULL, NULL, NULL, NULL, 'nan', NULL, NOW(), NOW()
ON CONFLICT ("dni") DO NOTHING;

WITH t AS (
  SELECT "id" FROM "Teacher" WHERE "userId" IN (SELECT "id" FROM "User" WHERE "dni" = '45724004')
), st AS (
  SELECT "dni" FROM "Student" WHERE "dni" = '42749536'
)
INSERT INTO "StudentTeacherAssignment" ("id", "studentDni", "teacherId", "startAt", "active")
SELECT gen_random_uuid(), st."dni", t."id", NOW(), true FROM st, t
WHERE NOT EXISTS (
  SELECT 1 FROM "StudentTeacherAssignment" a
  WHERE a."studentDni" = st."dni" AND a."active" = true
);

WITH u AS (
  INSERT INTO "User" ("id", "dni", "passwordHash", "role", "status", "mustChangePassword", "createdAt", "updatedAt")
  VALUES ('b41c570d-dd45-4cdf-a3a5-b5be2ee16a60', '54690607', '$2a$10$f3X8rbWs20bUnipKjVc1teQeaPgvbXJCDJ3KrwecVAIlCZHynfjB2', 'STUDENT', 'ACTIVE', true, NOW(), NOW())
  ON CONFLICT ("dni") DO NOTHING
  RETURNING "id"
)
INSERT INTO "Student" ("dni", "userId", "firstName", "lastName", "birthDate", "phone", "guardianPhone", "email", "gym", "address", "createdAt", "updatedAt")
SELECT '54690607', COALESCE((SELECT "id" FROM u), (SELECT "id" FROM "User" WHERE "dni" = '54690607')), 'Luana', 'Fernandez', NULL, NULL, NULL, NULL, 'nan', NULL, NOW(), NOW()
ON CONFLICT ("dni") DO NOTHING;

WITH t AS (
  SELECT "id" FROM "Teacher" WHERE "userId" IN (SELECT "id" FROM "User" WHERE "dni" = '45724004')
), st AS (
  SELECT "dni" FROM "Student" WHERE "dni" = '54690607'
)
INSERT INTO "StudentTeacherAssignment" ("id", "studentDni", "teacherId", "startAt", "active")
SELECT gen_random_uuid(), st."dni", t."id", NOW(), true FROM st, t
WHERE NOT EXISTS (
  SELECT 1 FROM "StudentTeacherAssignment" a
  WHERE a."studentDni" = st."dni" AND a."active" = true
);

WITH u AS (
  INSERT INTO "User" ("id", "dni", "passwordHash", "role", "status", "mustChangePassword", "createdAt", "updatedAt")
  VALUES ('200c31a2-c86c-47f3-9253-dce85cbe3e9c', '56700205', '$2a$10$cV7js2PwulJLUFqwHgpiuOBncJB4VLG4EZQThp11Nh0Q1ZxQXnFF2', 'STUDENT', 'ACTIVE', true, NOW(), NOW())
  ON CONFLICT ("dni") DO NOTHING
  RETURNING "id"
)
INSERT INTO "Student" ("dni", "userId", "firstName", "lastName", "birthDate", "phone", "guardianPhone", "email", "gym", "address", "createdAt", "updatedAt")
SELECT '56700205', COALESCE((SELECT "id" FROM u), (SELECT "id" FROM "User" WHERE "dni" = '56700205')), 'Delfina', 'Aguilera', NULL, NULL, NULL, NULL, 'nan', NULL, NOW(), NOW()
ON CONFLICT ("dni") DO NOTHING;

WITH t AS (
  SELECT "id" FROM "Teacher" WHERE "userId" IN (SELECT "id" FROM "User" WHERE "dni" = '45724004')
), st AS (
  SELECT "dni" FROM "Student" WHERE "dni" = '56700205'
)
INSERT INTO "StudentTeacherAssignment" ("id", "studentDni", "teacherId", "startAt", "active")
SELECT gen_random_uuid(), st."dni", t."id", NOW(), true FROM st, t
WHERE NOT EXISTS (
  SELECT 1 FROM "StudentTeacherAssignment" a
  WHERE a."studentDni" = st."dni" AND a."active" = true
);

WITH u AS (
  INSERT INTO "User" ("id", "dni", "passwordHash", "role", "status", "mustChangePassword", "createdAt", "updatedAt")
  VALUES ('fc89a750-fbd9-4416-b468-1d4e87e8452a', '57792489', '$2a$10$hrdSc74UGCy7NBmxckBxGOWeIZMC8ssb4nXJPR9E/uRklXU.EpiDW', 'STUDENT', 'ACTIVE', true, NOW(), NOW())
  ON CONFLICT ("dni") DO NOTHING
  RETURNING "id"
)
INSERT INTO "Student" ("dni", "userId", "firstName", "lastName", "birthDate", "phone", "guardianPhone", "email", "gym", "address", "createdAt", "updatedAt")
SELECT '57792489', COALESCE((SELECT "id" FROM u), (SELECT "id" FROM "User" WHERE "dni" = '57792489')), 'Lisandro', 'Aguilera', NULL, NULL, NULL, NULL, 'nan', NULL, NOW(), NOW()
ON CONFLICT ("dni") DO NOTHING;

WITH t AS (
  SELECT "id" FROM "Teacher" WHERE "userId" IN (SELECT "id" FROM "User" WHERE "dni" = '45724004')
), st AS (
  SELECT "dni" FROM "Student" WHERE "dni" = '57792489'
)
INSERT INTO "StudentTeacherAssignment" ("id", "studentDni", "teacherId", "startAt", "active")
SELECT gen_random_uuid(), st."dni", t."id", NOW(), true FROM st, t
WHERE NOT EXISTS (
  SELECT 1 FROM "StudentTeacherAssignment" a
  WHERE a."studentDni" = st."dni" AND a."active" = true
);

WITH u AS (
  INSERT INTO "User" ("id", "dni", "passwordHash", "role", "status", "mustChangePassword", "createdAt", "updatedAt")
  VALUES ('af524889-4d3d-4fca-8b20-68ad2c82e490', '57792490', '$2a$10$5Uxln7yumhQ/Dhg6lcHxfOGlIj.id36ke5I5h3vx8rVu6vsqzkRGy', 'STUDENT', 'ACTIVE', true, NOW(), NOW())
  ON CONFLICT ("dni") DO NOTHING
  RETURNING "id"
)
INSERT INTO "Student" ("dni", "userId", "firstName", "lastName", "birthDate", "phone", "guardianPhone", "email", "gym", "address", "createdAt", "updatedAt")
SELECT '57792490', COALESCE((SELECT "id" FROM u), (SELECT "id" FROM "User" WHERE "dni" = '57792490')), 'Benicio', 'Aguilera', NULL, NULL, NULL, NULL, 'nan', NULL, NOW(), NOW()
ON CONFLICT ("dni") DO NOTHING;

WITH t AS (
  SELECT "id" FROM "Teacher" WHERE "userId" IN (SELECT "id" FROM "User" WHERE "dni" = '45724004')
), st AS (
  SELECT "dni" FROM "Student" WHERE "dni" = '57792490'
)
INSERT INTO "StudentTeacherAssignment" ("id", "studentDni", "teacherId", "startAt", "active")
SELECT gen_random_uuid(), st."dni", t."id", NOW(), true FROM st, t
WHERE NOT EXISTS (
  SELECT 1 FROM "StudentTeacherAssignment" a
  WHERE a."studentDni" = st."dni" AND a."active" = true
);

WITH u AS (
  INSERT INTO "User" ("id", "dni", "passwordHash", "role", "status", "mustChangePassword", "createdAt", "updatedAt")
  VALUES ('4cd16c94-fdda-4819-8c10-1505f0f6995c', '55923248', '$2a$10$q2jIxMlv.4lIeZ2nmI4mJebOL2RxuwaC2rj.hsIFw0/elPPMPulkm', 'STUDENT', 'ACTIVE', true, NOW(), NOW())
  ON CONFLICT ("dni") DO NOTHING
  RETURNING "id"
)
INSERT INTO "Student" ("dni", "userId", "firstName", "lastName", "birthDate", "phone", "guardianPhone", "email", "gym", "address", "createdAt", "updatedAt")
SELECT '55923248', COALESCE((SELECT "id" FROM u), (SELECT "id" FROM "User" WHERE "dni" = '55923248')), 'Tiziano', 'Paez', NULL, NULL, NULL, NULL, 'nan', NULL, NOW(), NOW()
ON CONFLICT ("dni") DO NOTHING;

WITH t AS (
  SELECT "id" FROM "Teacher" WHERE "userId" IN (SELECT "id" FROM "User" WHERE "dni" = '45724004')
), st AS (
  SELECT "dni" FROM "Student" WHERE "dni" = '55923248'
)
INSERT INTO "StudentTeacherAssignment" ("id", "studentDni", "teacherId", "startAt", "active")
SELECT gen_random_uuid(), st."dni", t."id", NOW(), true FROM st, t
WHERE NOT EXISTS (
  SELECT 1 FROM "StudentTeacherAssignment" a
  WHERE a."studentDni" = st."dni" AND a."active" = true
);

WITH u AS (
  INSERT INTO "User" ("id", "dni", "passwordHash", "role", "status", "mustChangePassword", "createdAt", "updatedAt")
  VALUES ('f4e92f66-8825-4ad8-b21d-1727ccb51c6b', '57792329', '$2a$10$4oxJlJrmmFJaBDH.ulqNH.XJdDOF78d0z0pkgiIdrtUDgWybXRIxG', 'STUDENT', 'ACTIVE', true, NOW(), NOW())
  ON CONFLICT ("dni") DO NOTHING
  RETURNING "id"
)
INSERT INTO "Student" ("dni", "userId", "firstName", "lastName", "birthDate", "phone", "guardianPhone", "email", "gym", "address", "createdAt", "updatedAt")
SELECT '57792329', COALESCE((SELECT "id" FROM u), (SELECT "id" FROM "User" WHERE "dni" = '57792329')), 'Julian', 'Robles', NULL, NULL, NULL, NULL, 'nan', NULL, NOW(), NOW()
ON CONFLICT ("dni") DO NOTHING;

WITH t AS (
  SELECT "id" FROM "Teacher" WHERE "userId" IN (SELECT "id" FROM "User" WHERE "dni" = '45724004')
), st AS (
  SELECT "dni" FROM "Student" WHERE "dni" = '57792329'
)
INSERT INTO "StudentTeacherAssignment" ("id", "studentDni", "teacherId", "startAt", "active")
SELECT gen_random_uuid(), st."dni", t."id", NOW(), true FROM st, t
WHERE NOT EXISTS (
  SELECT 1 FROM "StudentTeacherAssignment" a
  WHERE a."studentDni" = st."dni" AND a."active" = true
);

WITH u AS (
  INSERT INTO "User" ("id", "dni", "passwordHash", "role", "status", "mustChangePassword", "createdAt", "updatedAt")
  VALUES ('cf004615-7d15-4777-bd2c-9296dfb1a404', '55383522', '$2a$10$3mKDpAVbSwinQiqFaDuJNuwiS.0jktsA2O5K/ZyA3p3PkkgJgKbSG', 'STUDENT', 'ACTIVE', true, NOW(), NOW())
  ON CONFLICT ("dni") DO NOTHING
  RETURNING "id"
)
INSERT INTO "Student" ("dni", "userId", "firstName", "lastName", "birthDate", "phone", "guardianPhone", "email", "gym", "address", "createdAt", "updatedAt")
SELECT '55383522', COALESCE((SELECT "id" FROM u), (SELECT "id" FROM "User" WHERE "dni" = '55383522')), 'Lautario', 'Ciani', NULL, NULL, NULL, NULL, 'nan', NULL, NOW(), NOW()
ON CONFLICT ("dni") DO NOTHING;

WITH t AS (
  SELECT "id" FROM "Teacher" WHERE "userId" IN (SELECT "id" FROM "User" WHERE "dni" = '45724004')
), st AS (
  SELECT "dni" FROM "Student" WHERE "dni" = '55383522'
)
INSERT INTO "StudentTeacherAssignment" ("id", "studentDni", "teacherId", "startAt", "active")
SELECT gen_random_uuid(), st."dni", t."id", NOW(), true FROM st, t
WHERE NOT EXISTS (
  SELECT 1 FROM "StudentTeacherAssignment" a
  WHERE a."studentDni" = st."dni" AND a."active" = true
);

WITH u AS (
  INSERT INTO "User" ("id", "dni", "passwordHash", "role", "status", "mustChangePassword", "createdAt", "updatedAt")
  VALUES ('d5d268b3-605a-4eab-ad32-f2571e32875b', '53485824', '$2a$10$g88QCuCX3m.dHdvvj.k/fegyTNNU8UIan69gJHS9sIHKBzXXMIhvm', 'STUDENT', 'ACTIVE', true, NOW(), NOW())
  ON CONFLICT ("dni") DO NOTHING
  RETURNING "id"
)
INSERT INTO "Student" ("dni", "userId", "firstName", "lastName", "birthDate", "phone", "guardianPhone", "email", "gym", "address", "createdAt", "updatedAt")
SELECT '53485824', COALESCE((SELECT "id" FROM u), (SELECT "id" FROM "User" WHERE "dni" = '53485824')), 'Lorenzo', 'Zalazar', NULL, NULL, NULL, NULL, 'nan', NULL, NOW(), NOW()
ON CONFLICT ("dni") DO NOTHING;

WITH t AS (
  SELECT "id" FROM "Teacher" WHERE "userId" IN (SELECT "id" FROM "User" WHERE "dni" = '45724004')
), st AS (
  SELECT "dni" FROM "Student" WHERE "dni" = '53485824'
)
INSERT INTO "StudentTeacherAssignment" ("id", "studentDni", "teacherId", "startAt", "active")
SELECT gen_random_uuid(), st."dni", t."id", NOW(), true FROM st, t
WHERE NOT EXISTS (
  SELECT 1 FROM "StudentTeacherAssignment" a
  WHERE a."studentDni" = st."dni" AND a."active" = true
);

WITH u AS (
  INSERT INTO "User" ("id", "dni", "passwordHash", "role", "status", "mustChangePassword", "createdAt", "updatedAt")
  VALUES ('1c23f2db-9b0b-4439-a4eb-3fa93158bd4b', '53138994', '$2a$10$NjoarteqDlJg5GZeehDFJeITyckQ7IQFwONUcq8nHoS2xJUMb61JG', 'STUDENT', 'ACTIVE', true, NOW(), NOW())
  ON CONFLICT ("dni") DO NOTHING
  RETURNING "id"
)
INSERT INTO "Student" ("dni", "userId", "firstName", "lastName", "birthDate", "phone", "guardianPhone", "email", "gym", "address", "createdAt", "updatedAt")
SELECT '53138994', COALESCE((SELECT "id" FROM u), (SELECT "id" FROM "User" WHERE "dni" = '53138994')), 'Tiziano', 'Campana', NULL, NULL, NULL, NULL, 'nan', NULL, NOW(), NOW()
ON CONFLICT ("dni") DO NOTHING;

WITH t AS (
  SELECT "id" FROM "Teacher" WHERE "userId" IN (SELECT "id" FROM "User" WHERE "dni" = '48076512')
), st AS (
  SELECT "dni" FROM "Student" WHERE "dni" = '53138994'
)
INSERT INTO "StudentTeacherAssignment" ("id", "studentDni", "teacherId", "startAt", "active")
SELECT gen_random_uuid(), st."dni", t."id", NOW(), true FROM st, t
WHERE NOT EXISTS (
  SELECT 1 FROM "StudentTeacherAssignment" a
  WHERE a."studentDni" = st."dni" AND a."active" = true
);

WITH u AS (
  INSERT INTO "User" ("id", "dni", "passwordHash", "role", "status", "mustChangePassword", "createdAt", "updatedAt")
  VALUES ('7da259f4-4f85-47cd-bf47-b065659f6fff', '57364496', '$2a$10$/GinTsBYostdywo59hAHnOfEX3akmTbF8glzlKBK7co2BmwCPqbge', 'STUDENT', 'ACTIVE', true, NOW(), NOW())
  ON CONFLICT ("dni") DO NOTHING
  RETURNING "id"
)
INSERT INTO "Student" ("dni", "userId", "firstName", "lastName", "birthDate", "phone", "guardianPhone", "email", "gym", "address", "createdAt", "updatedAt")
SELECT '57364496', COALESCE((SELECT "id" FROM u), (SELECT "id" FROM "User" WHERE "dni" = '57364496')), 'Emilia De La', 'Reta', NULL, NULL, NULL, NULL, 'nan', NULL, NOW(), NOW()
ON CONFLICT ("dni") DO NOTHING;

WITH t AS (
  SELECT "id" FROM "Teacher" WHERE "userId" IN (SELECT "id" FROM "User" WHERE "dni" = '48076512')
), st AS (
  SELECT "dni" FROM "Student" WHERE "dni" = '57364496'
)
INSERT INTO "StudentTeacherAssignment" ("id", "studentDni", "teacherId", "startAt", "active")
SELECT gen_random_uuid(), st."dni", t."id", NOW(), true FROM st, t
WHERE NOT EXISTS (
  SELECT 1 FROM "StudentTeacherAssignment" a
  WHERE a."studentDni" = st."dni" AND a."active" = true
);

WITH u AS (
  INSERT INTO "User" ("id", "dni", "passwordHash", "role", "status", "mustChangePassword", "createdAt", "updatedAt")
  VALUES ('8abedbfa-e9b2-49db-97da-19d274160664', '58275103', '$2a$10$8YDKk0rKZnP.H8842YgLkeHKI59PmmpfQaUT.2ITxkFzREGSgSAwa', 'STUDENT', 'ACTIVE', true, NOW(), NOW())
  ON CONFLICT ("dni") DO NOTHING
  RETURNING "id"
)
INSERT INTO "Student" ("dni", "userId", "firstName", "lastName", "birthDate", "phone", "guardianPhone", "email", "gym", "address", "createdAt", "updatedAt")
SELECT '58275103', COALESCE((SELECT "id" FROM u), (SELECT "id" FROM "User" WHERE "dni" = '58275103')), 'Sofia', 'Puglisi', NULL, NULL, NULL, NULL, 'nan', NULL, NOW(), NOW()
ON CONFLICT ("dni") DO NOTHING;

WITH t AS (
  SELECT "id" FROM "Teacher" WHERE "userId" IN (SELECT "id" FROM "User" WHERE "dni" = '48076512')
), st AS (
  SELECT "dni" FROM "Student" WHERE "dni" = '58275103'
)
INSERT INTO "StudentTeacherAssignment" ("id", "studentDni", "teacherId", "startAt", "active")
SELECT gen_random_uuid(), st."dni", t."id", NOW(), true FROM st, t
WHERE NOT EXISTS (
  SELECT 1 FROM "StudentTeacherAssignment" a
  WHERE a."studentDni" = st."dni" AND a."active" = true
);

WITH u AS (
  INSERT INTO "User" ("id", "dni", "passwordHash", "role", "status", "mustChangePassword", "createdAt", "updatedAt")
  VALUES ('0a3e85ac-91c7-4767-93f5-5f7bc0d684b9', '53659388', '$2a$10$a0U.yuJ9f8fH33FDFV002OHCZcmIW8Ox9Yx7WilTtN6Lkyi4LubbG', 'STUDENT', 'ACTIVE', true, NOW(), NOW())
  ON CONFLICT ("dni") DO NOTHING
  RETURNING "id"
)
INSERT INTO "Student" ("dni", "userId", "firstName", "lastName", "birthDate", "phone", "guardianPhone", "email", "gym", "address", "createdAt", "updatedAt")
SELECT '53659388', COALESCE((SELECT "id" FROM u), (SELECT "id" FROM "User" WHERE "dni" = '53659388')), 'Emanuel', 'Muñoz', NULL, NULL, NULL, NULL, 'nan', NULL, NOW(), NOW()
ON CONFLICT ("dni") DO NOTHING;

WITH t AS (
  SELECT "id" FROM "Teacher" WHERE "userId" IN (SELECT "id" FROM "User" WHERE "dni" = '48076512')
), st AS (
  SELECT "dni" FROM "Student" WHERE "dni" = '53659388'
)
INSERT INTO "StudentTeacherAssignment" ("id", "studentDni", "teacherId", "startAt", "active")
SELECT gen_random_uuid(), st."dni", t."id", NOW(), true FROM st, t
WHERE NOT EXISTS (
  SELECT 1 FROM "StudentTeacherAssignment" a
  WHERE a."studentDni" = st."dni" AND a."active" = true
);

WITH u AS (
  INSERT INTO "User" ("id", "dni", "passwordHash", "role", "status", "mustChangePassword", "createdAt", "updatedAt")
  VALUES ('edef075c-41f3-471b-b7ce-471184f349a4', '55383646', '$2a$10$7l0R5e4O2SzWXK1EyIHedeATBGCNYpCKhUT1Mc.ybip5O4MAkC036', 'STUDENT', 'ACTIVE', true, NOW(), NOW())
  ON CONFLICT ("dni") DO NOTHING
  RETURNING "id"
)
INSERT INTO "Student" ("dni", "userId", "firstName", "lastName", "birthDate", "phone", "guardianPhone", "email", "gym", "address", "createdAt", "updatedAt")
SELECT '55383646', COALESCE((SELECT "id" FROM u), (SELECT "id" FROM "User" WHERE "dni" = '55383646')), 'Felipe', 'Morales', NULL, NULL, NULL, NULL, 'nan', NULL, NOW(), NOW()
ON CONFLICT ("dni") DO NOTHING;

WITH t AS (
  SELECT "id" FROM "Teacher" WHERE "userId" IN (SELECT "id" FROM "User" WHERE "dni" = '48076512')
), st AS (
  SELECT "dni" FROM "Student" WHERE "dni" = '55383646'
)
INSERT INTO "StudentTeacherAssignment" ("id", "studentDni", "teacherId", "startAt", "active")
SELECT gen_random_uuid(), st."dni", t."id", NOW(), true FROM st, t
WHERE NOT EXISTS (
  SELECT 1 FROM "StudentTeacherAssignment" a
  WHERE a."studentDni" = st."dni" AND a."active" = true
);

WITH u AS (
  INSERT INTO "User" ("id", "dni", "passwordHash", "role", "status", "mustChangePassword", "createdAt", "updatedAt")
  VALUES ('c3809302-147f-4f37-9af7-92f5920638cd', '55135904', '$2a$10$uAn7Hn8y2/GRVRlRUJra.OQAP0JdZCCk5HudAJcHXdm1G4uS.LoB6', 'STUDENT', 'ACTIVE', true, NOW(), NOW())
  ON CONFLICT ("dni") DO NOTHING
  RETURNING "id"
)
INSERT INTO "Student" ("dni", "userId", "firstName", "lastName", "birthDate", "phone", "guardianPhone", "email", "gym", "address", "createdAt", "updatedAt")
SELECT '55135904', COALESCE((SELECT "id" FROM u), (SELECT "id" FROM "User" WHERE "dni" = '55135904')), 'Isablea', 'Arias', NULL, NULL, NULL, NULL, 'nan', NULL, NOW(), NOW()
ON CONFLICT ("dni") DO NOTHING;

WITH t AS (
  SELECT "id" FROM "Teacher" WHERE "userId" IN (SELECT "id" FROM "User" WHERE "dni" = '44139436')
), st AS (
  SELECT "dni" FROM "Student" WHERE "dni" = '55135904'
)
INSERT INTO "StudentTeacherAssignment" ("id", "studentDni", "teacherId", "startAt", "active")
SELECT gen_random_uuid(), st."dni", t."id", NOW(), true FROM st, t
WHERE NOT EXISTS (
  SELECT 1 FROM "StudentTeacherAssignment" a
  WHERE a."studentDni" = st."dni" AND a."active" = true
);

WITH u AS (
  INSERT INTO "User" ("id", "dni", "passwordHash", "role", "status", "mustChangePassword", "createdAt", "updatedAt")
  VALUES ('04c23e55-05c0-4490-a8d9-4148211e4c71', '50490945', '$2a$10$YozSlHEwN4bEJD3bTbkFiufLaasp4LnwDLiwEvKzu9iBXpuMq1orm', 'STUDENT', 'ACTIVE', true, NOW(), NOW())
  ON CONFLICT ("dni") DO NOTHING
  RETURNING "id"
)
INSERT INTO "Student" ("dni", "userId", "firstName", "lastName", "birthDate", "phone", "guardianPhone", "email", "gym", "address", "createdAt", "updatedAt")
SELECT '50490945', COALESCE((SELECT "id" FROM u), (SELECT "id" FROM "User" WHERE "dni" = '50490945')), 'Nicole', 'Aldavez', NULL, NULL, NULL, NULL, 'nan', NULL, NOW(), NOW()
ON CONFLICT ("dni") DO NOTHING;

WITH t AS (
  SELECT "id" FROM "Teacher" WHERE "userId" IN (SELECT "id" FROM "User" WHERE "dni" = '44139436')
), st AS (
  SELECT "dni" FROM "Student" WHERE "dni" = '50490945'
)
INSERT INTO "StudentTeacherAssignment" ("id", "studentDni", "teacherId", "startAt", "active")
SELECT gen_random_uuid(), st."dni", t."id", NOW(), true FROM st, t
WHERE NOT EXISTS (
  SELECT 1 FROM "StudentTeacherAssignment" a
  WHERE a."studentDni" = st."dni" AND a."active" = true
);

WITH u AS (
  INSERT INTO "User" ("id", "dni", "passwordHash", "role", "status", "mustChangePassword", "createdAt", "updatedAt")
  VALUES ('f42f96b0-bc7a-4a60-8940-4152dca0c9be', '56225225', '$2a$10$CgIcMa07sZDK8MoCPs18dOzdYr9XBlqCWzTrIiNsmJ9.bc5MgA7Mq', 'STUDENT', 'ACTIVE', true, NOW(), NOW())
  ON CONFLICT ("dni") DO NOTHING
  RETURNING "id"
)
INSERT INTO "Student" ("dni", "userId", "firstName", "lastName", "birthDate", "phone", "guardianPhone", "email", "gym", "address", "createdAt", "updatedAt")
SELECT '56225225', COALESCE((SELECT "id" FROM u), (SELECT "id" FROM "User" WHERE "dni" = '56225225')), 'Abigail', 'Castillo', NULL, NULL, NULL, NULL, 'nan', NULL, NOW(), NOW()
ON CONFLICT ("dni") DO NOTHING;

WITH t AS (
  SELECT "id" FROM "Teacher" WHERE "userId" IN (SELECT "id" FROM "User" WHERE "dni" = '44139436')
), st AS (
  SELECT "dni" FROM "Student" WHERE "dni" = '56225225'
)
INSERT INTO "StudentTeacherAssignment" ("id", "studentDni", "teacherId", "startAt", "active")
SELECT gen_random_uuid(), st."dni", t."id", NOW(), true FROM st, t
WHERE NOT EXISTS (
  SELECT 1 FROM "StudentTeacherAssignment" a
  WHERE a."studentDni" = st."dni" AND a."active" = true
);

WITH u AS (
  INSERT INTO "User" ("id", "dni", "passwordHash", "role", "status", "mustChangePassword", "createdAt", "updatedAt")
  VALUES ('dacd3146-6d5b-4073-8722-eb17fb9fac87', '56286188', '$2a$10$7n4gkszJvDrubOONAYHlnOZoLChGMp6cF6YVEgYrupGcDc3qt.fH2', 'STUDENT', 'ACTIVE', true, NOW(), NOW())
  ON CONFLICT ("dni") DO NOTHING
  RETURNING "id"
)
INSERT INTO "Student" ("dni", "userId", "firstName", "lastName", "birthDate", "phone", "guardianPhone", "email", "gym", "address", "createdAt", "updatedAt")
SELECT '56286188', COALESCE((SELECT "id" FROM u), (SELECT "id" FROM "User" WHERE "dni" = '56286188')), 'Sosa', 'Fidel', NULL, NULL, NULL, NULL, 'nan', NULL, NOW(), NOW()
ON CONFLICT ("dni") DO NOTHING;

WITH t AS (
  SELECT "id" FROM "Teacher" WHERE "userId" IN (SELECT "id" FROM "User" WHERE "dni" = '44139436')
), st AS (
  SELECT "dni" FROM "Student" WHERE "dni" = '56286188'
)
INSERT INTO "StudentTeacherAssignment" ("id", "studentDni", "teacherId", "startAt", "active")
SELECT gen_random_uuid(), st."dni", t."id", NOW(), true FROM st, t
WHERE NOT EXISTS (
  SELECT 1 FROM "StudentTeacherAssignment" a
  WHERE a."studentDni" = st."dni" AND a."active" = true
);

WITH u AS (
  INSERT INTO "User" ("id", "dni", "passwordHash", "role", "status", "mustChangePassword", "createdAt", "updatedAt")
  VALUES ('09ff9b5f-cea1-4f30-a0dc-58303f278cc8', '58475676', '$2a$10$3e/az4i0uTyqgAaNOPMyGem0p0tjuYsvyaEy.CBRY4XmiUXsI.zqe', 'STUDENT', 'ACTIVE', true, NOW(), NOW())
  ON CONFLICT ("dni") DO NOTHING
  RETURNING "id"
)
INSERT INTO "Student" ("dni", "userId", "firstName", "lastName", "birthDate", "phone", "guardianPhone", "email", "gym", "address", "createdAt", "updatedAt")
SELECT '58475676', COALESCE((SELECT "id" FROM u), (SELECT "id" FROM "User" WHERE "dni" = '58475676')), 'Rufina', 'Veloche', NULL, NULL, NULL, NULL, 'nan', NULL, NOW(), NOW()
ON CONFLICT ("dni") DO NOTHING;

WITH t AS (
  SELECT "id" FROM "Teacher" WHERE "userId" IN (SELECT "id" FROM "User" WHERE "dni" = '44139436')
), st AS (
  SELECT "dni" FROM "Student" WHERE "dni" = '58475676'
)
INSERT INTO "StudentTeacherAssignment" ("id", "studentDni", "teacherId", "startAt", "active")
SELECT gen_random_uuid(), st."dni", t."id", NOW(), true FROM st, t
WHERE NOT EXISTS (
  SELECT 1 FROM "StudentTeacherAssignment" a
  WHERE a."studentDni" = st."dni" AND a."active" = true
);

WITH u AS (
  INSERT INTO "User" ("id", "dni", "passwordHash", "role", "status", "mustChangePassword", "createdAt", "updatedAt")
  VALUES ('e0abd651-dd7e-4d96-9434-e1aa8f59f2ba', '57121773', '$2a$10$fPcR2sMMNnV78xNj7pdFm.XDf.mb7ZHf3LDdI0WIrfUQcbC9Q9NAi', 'STUDENT', 'ACTIVE', true, NOW(), NOW())
  ON CONFLICT ("dni") DO NOTHING
  RETURNING "id"
)
INSERT INTO "Student" ("dni", "userId", "firstName", "lastName", "birthDate", "phone", "guardianPhone", "email", "gym", "address", "createdAt", "updatedAt")
SELECT '57121773', COALESCE((SELECT "id" FROM u), (SELECT "id" FROM "User" WHERE "dni" = '57121773')), 'Felipe', 'Veloche', NULL, NULL, NULL, NULL, 'nan', NULL, NOW(), NOW()
ON CONFLICT ("dni") DO NOTHING;

WITH t AS (
  SELECT "id" FROM "Teacher" WHERE "userId" IN (SELECT "id" FROM "User" WHERE "dni" = '44139436')
), st AS (
  SELECT "dni" FROM "Student" WHERE "dni" = '57121773'
)
INSERT INTO "StudentTeacherAssignment" ("id", "studentDni", "teacherId", "startAt", "active")
SELECT gen_random_uuid(), st."dni", t."id", NOW(), true FROM st, t
WHERE NOT EXISTS (
  SELECT 1 FROM "StudentTeacherAssignment" a
  WHERE a."studentDni" = st."dni" AND a."active" = true
);

WITH u AS (
  INSERT INTO "User" ("id", "dni", "passwordHash", "role", "status", "mustChangePassword", "createdAt", "updatedAt")
  VALUES ('05af948e-23c3-4a25-8ce5-ac79c77bfc92', '38007722', '$2a$10$EwGhNVtpqNVpovPxkAjKju4R4sTKHR/0y6Ced6/A2xHgTwtGAOMS2', 'STUDENT', 'ACTIVE', true, NOW(), NOW())
  ON CONFLICT ("dni") DO NOTHING
  RETURNING "id"
)
INSERT INTO "Student" ("dni", "userId", "firstName", "lastName", "birthDate", "phone", "guardianPhone", "email", "gym", "address", "createdAt", "updatedAt")
SELECT '38007722', COALESCE((SELECT "id" FROM u), (SELECT "id" FROM "User" WHERE "dni" = '38007722')), 'Mariela', 'Escudero', NULL, NULL, NULL, NULL, 'nan', NULL, NOW(), NOW()
ON CONFLICT ("dni") DO NOTHING;

WITH t AS (
  SELECT "id" FROM "Teacher" WHERE "userId" IN (SELECT "id" FROM "User" WHERE "dni" = '44139436')
), st AS (
  SELECT "dni" FROM "Student" WHERE "dni" = '38007722'
)
INSERT INTO "StudentTeacherAssignment" ("id", "studentDni", "teacherId", "startAt", "active")
SELECT gen_random_uuid(), st."dni", t."id", NOW(), true FROM st, t
WHERE NOT EXISTS (
  SELECT 1 FROM "StudentTeacherAssignment" a
  WHERE a."studentDni" = st."dni" AND a."active" = true
);

WITH u AS (
  INSERT INTO "User" ("id", "dni", "passwordHash", "role", "status", "mustChangePassword", "createdAt", "updatedAt")
  VALUES ('c812b30d-0be1-4e51-acd6-cf5faef82249', '57530137', '$2a$10$pSf1yKq/v5E0STcuzkgdEenuxR3a8RZ0/i4QI0MD/ltqna2jIHK1i', 'STUDENT', 'ACTIVE', true, NOW(), NOW())
  ON CONFLICT ("dni") DO NOTHING
  RETURNING "id"
)
INSERT INTO "Student" ("dni", "userId", "firstName", "lastName", "birthDate", "phone", "guardianPhone", "email", "gym", "address", "createdAt", "updatedAt")
SELECT '57530137', COALESCE((SELECT "id" FROM u), (SELECT "id" FROM "User" WHERE "dni" = '57530137')), 'Eliel', 'Maciel', NULL, NULL, NULL, NULL, 'nan', NULL, NOW(), NOW()
ON CONFLICT ("dni") DO NOTHING;

WITH t AS (
  SELECT "id" FROM "Teacher" WHERE "userId" IN (SELECT "id" FROM "User" WHERE "dni" = '44139436')
), st AS (
  SELECT "dni" FROM "Student" WHERE "dni" = '57530137'
)
INSERT INTO "StudentTeacherAssignment" ("id", "studentDni", "teacherId", "startAt", "active")
SELECT gen_random_uuid(), st."dni", t."id", NOW(), true FROM st, t
WHERE NOT EXISTS (
  SELECT 1 FROM "StudentTeacherAssignment" a
  WHERE a."studentDni" = st."dni" AND a."active" = true
);

WITH u AS (
  INSERT INTO "User" ("id", "dni", "passwordHash", "role", "status", "mustChangePassword", "createdAt", "updatedAt")
  VALUES ('4704d607-11dc-4c32-ba63-8a802fc4cee8', '55255782', '$2a$10$ONjNYoelZ2RMVTh2JP0XIegCP2TvDwiDt3RGHVwCJZpayzj0VKivi', 'STUDENT', 'ACTIVE', true, NOW(), NOW())
  ON CONFLICT ("dni") DO NOTHING
  RETURNING "id"
)
INSERT INTO "Student" ("dni", "userId", "firstName", "lastName", "birthDate", "phone", "guardianPhone", "email", "gym", "address", "createdAt", "updatedAt")
SELECT '55255782', COALESCE((SELECT "id" FROM u), (SELECT "id" FROM "User" WHERE "dni" = '55255782')), 'Julieta', 'Vargas', NULL, NULL, NULL, NULL, 'nan', NULL, NOW(), NOW()
ON CONFLICT ("dni") DO NOTHING;

WITH t AS (
  SELECT "id" FROM "Teacher" WHERE "userId" IN (SELECT "id" FROM "User" WHERE "dni" = '44139436')
), st AS (
  SELECT "dni" FROM "Student" WHERE "dni" = '55255782'
)
INSERT INTO "StudentTeacherAssignment" ("id", "studentDni", "teacherId", "startAt", "active")
SELECT gen_random_uuid(), st."dni", t."id", NOW(), true FROM st, t
WHERE NOT EXISTS (
  SELECT 1 FROM "StudentTeacherAssignment" a
  WHERE a."studentDni" = st."dni" AND a."active" = true
);

WITH u AS (
  INSERT INTO "User" ("id", "dni", "passwordHash", "role", "status", "mustChangePassword", "createdAt", "updatedAt")
  VALUES ('7207a6c6-5ee0-477e-98c3-9aa4e7d29826', '57935558', '$2a$10$cQMrFKUw.wumFFCynwR94.0LsFsGBr8yWDi2MwA5YYOKuakZtVgTy', 'STUDENT', 'ACTIVE', true, NOW(), NOW())
  ON CONFLICT ("dni") DO NOTHING
  RETURNING "id"
)
INSERT INTO "Student" ("dni", "userId", "firstName", "lastName", "birthDate", "phone", "guardianPhone", "email", "gym", "address", "createdAt", "updatedAt")
SELECT '57935558', COALESCE((SELECT "id" FROM u), (SELECT "id" FROM "User" WHERE "dni" = '57935558')), 'Bautista', 'Moral', NULL, NULL, NULL, NULL, 'nan', NULL, NOW(), NOW()
ON CONFLICT ("dni") DO NOTHING;

WITH t AS (
  SELECT "id" FROM "Teacher" WHERE "userId" IN (SELECT "id" FROM "User" WHERE "dni" = '44139436')
), st AS (
  SELECT "dni" FROM "Student" WHERE "dni" = '57935558'
)
INSERT INTO "StudentTeacherAssignment" ("id", "studentDni", "teacherId", "startAt", "active")
SELECT gen_random_uuid(), st."dni", t."id", NOW(), true FROM st, t
WHERE NOT EXISTS (
  SELECT 1 FROM "StudentTeacherAssignment" a
  WHERE a."studentDni" = st."dni" AND a."active" = true
);

WITH u AS (
  INSERT INTO "User" ("id", "dni", "passwordHash", "role", "status", "mustChangePassword", "createdAt", "updatedAt")
  VALUES ('51aea639-26ff-466b-adb2-cbd8f8a7c310', '52514178', '$2a$10$COAJjgRjCeFkdjJir9huNekffAUNQkiI48wUwGbaaz4GvVfplrANi', 'STUDENT', 'ACTIVE', true, NOW(), NOW())
  ON CONFLICT ("dni") DO NOTHING
  RETURNING "id"
)
INSERT INTO "Student" ("dni", "userId", "firstName", "lastName", "birthDate", "phone", "guardianPhone", "email", "gym", "address", "createdAt", "updatedAt")
SELECT '52514178', COALESCE((SELECT "id" FROM u), (SELECT "id" FROM "User" WHERE "dni" = '52514178')), 'Tomas', 'Torres', NULL, NULL, NULL, NULL, 'nan', NULL, NOW(), NOW()
ON CONFLICT ("dni") DO NOTHING;

WITH t AS (
  SELECT "id" FROM "Teacher" WHERE "userId" IN (SELECT "id" FROM "User" WHERE "dni" = '44139436')
), st AS (
  SELECT "dni" FROM "Student" WHERE "dni" = '52514178'
)
INSERT INTO "StudentTeacherAssignment" ("id", "studentDni", "teacherId", "startAt", "active")
SELECT gen_random_uuid(), st."dni", t."id", NOW(), true FROM st, t
WHERE NOT EXISTS (
  SELECT 1 FROM "StudentTeacherAssignment" a
  WHERE a."studentDni" = st."dni" AND a."active" = true
);

WITH u AS (
  INSERT INTO "User" ("id", "dni", "passwordHash", "role", "status", "mustChangePassword", "createdAt", "updatedAt")
  VALUES ('dcee6831-5ddc-413a-a188-15b47acddba8', '49266423', '$2a$10$6k8KjVSfTdCl3ggDBlBHk.bdJVdAbYnKbPLa6u5uZ1x2bePu2Lcg6', 'STUDENT', 'ACTIVE', true, NOW(), NOW())
  ON CONFLICT ("dni") DO NOTHING
  RETURNING "id"
)
INSERT INTO "Student" ("dni", "userId", "firstName", "lastName", "birthDate", "phone", "guardianPhone", "email", "gym", "address", "createdAt", "updatedAt")
SELECT '49266423', COALESCE((SELECT "id" FROM u), (SELECT "id" FROM "User" WHERE "dni" = '49266423')), 'Sebastian', 'Galindo', NULL, NULL, NULL, NULL, 'nan', NULL, NOW(), NOW()
ON CONFLICT ("dni") DO NOTHING;

WITH t AS (
  SELECT "id" FROM "Teacher" WHERE "userId" IN (SELECT "id" FROM "User" WHERE "dni" = '44139436')
), st AS (
  SELECT "dni" FROM "Student" WHERE "dni" = '49266423'
)
INSERT INTO "StudentTeacherAssignment" ("id", "studentDni", "teacherId", "startAt", "active")
SELECT gen_random_uuid(), st."dni", t."id", NOW(), true FROM st, t
WHERE NOT EXISTS (
  SELECT 1 FROM "StudentTeacherAssignment" a
  WHERE a."studentDni" = st."dni" AND a."active" = true
);

WITH u AS (
  INSERT INTO "User" ("id", "dni", "passwordHash", "role", "status", "mustChangePassword", "createdAt", "updatedAt")
  VALUES ('7f4b0a5f-731b-40fb-8791-8837ab29cb4a', '52148830', '$2a$10$N4p9lRZvV.BtcaFjmC.LSOHzucJFReyn0B80bbO8rvg9.FwPytz5q', 'STUDENT', 'ACTIVE', true, NOW(), NOW())
  ON CONFLICT ("dni") DO NOTHING
  RETURNING "id"
)
INSERT INTO "Student" ("dni", "userId", "firstName", "lastName", "birthDate", "phone", "guardianPhone", "email", "gym", "address", "createdAt", "updatedAt")
SELECT '52148830', COALESCE((SELECT "id" FROM u), (SELECT "id" FROM "User" WHERE "dni" = '52148830')), 'Inara', 'Guerrero', NULL, NULL, NULL, NULL, 'nan', NULL, NOW(), NOW()
ON CONFLICT ("dni") DO NOTHING;

WITH t AS (
  SELECT "id" FROM "Teacher" WHERE "userId" IN (SELECT "id" FROM "User" WHERE "dni" = '44139436')
), st AS (
  SELECT "dni" FROM "Student" WHERE "dni" = '52148830'
)
INSERT INTO "StudentTeacherAssignment" ("id", "studentDni", "teacherId", "startAt", "active")
SELECT gen_random_uuid(), st."dni", t."id", NOW(), true FROM st, t
WHERE NOT EXISTS (
  SELECT 1 FROM "StudentTeacherAssignment" a
  WHERE a."studentDni" = st."dni" AND a."active" = true
);

WITH u AS (
  INSERT INTO "User" ("id", "dni", "passwordHash", "role", "status", "mustChangePassword", "createdAt", "updatedAt")
  VALUES ('35cb733a-19c9-4923-8f8a-5ca2f8543278', '55136405', '$2a$10$e0qFZU7k54EbtpOAAGcs7ef5Kw.dGWZxVFJhVWzMy4c9aUa7UXpWq', 'STUDENT', 'ACTIVE', true, NOW(), NOW())
  ON CONFLICT ("dni") DO NOTHING
  RETURNING "id"
)
INSERT INTO "Student" ("dni", "userId", "firstName", "lastName", "birthDate", "phone", "guardianPhone", "email", "gym", "address", "createdAt", "updatedAt")
SELECT '55136405', COALESCE((SELECT "id" FROM u), (SELECT "id" FROM "User" WHERE "dni" = '55136405')), 'Constanza', 'Miranda', NULL, NULL, NULL, NULL, 'nan', NULL, NOW(), NOW()
ON CONFLICT ("dni") DO NOTHING;

WITH t AS (
  SELECT "id" FROM "Teacher" WHERE "userId" IN (SELECT "id" FROM "User" WHERE "dni" = '44139436')
), st AS (
  SELECT "dni" FROM "Student" WHERE "dni" = '55136405'
)
INSERT INTO "StudentTeacherAssignment" ("id", "studentDni", "teacherId", "startAt", "active")
SELECT gen_random_uuid(), st."dni", t."id", NOW(), true FROM st, t
WHERE NOT EXISTS (
  SELECT 1 FROM "StudentTeacherAssignment" a
  WHERE a."studentDni" = st."dni" AND a."active" = true
);

WITH u AS (
  INSERT INTO "User" ("id", "dni", "passwordHash", "role", "status", "mustChangePassword", "createdAt", "updatedAt")
  VALUES ('d3cbecd4-52c9-4038-bc34-0b83f096d6c2', '52940235', '$2a$10$vq8f15EqS.k3GXMZH7wDVu1yg3nWUC2tYS7JUnwmeq/CetM.RLfO.', 'STUDENT', 'ACTIVE', true, NOW(), NOW())
  ON CONFLICT ("dni") DO NOTHING
  RETURNING "id"
)
INSERT INTO "Student" ("dni", "userId", "firstName", "lastName", "birthDate", "phone", "guardianPhone", "email", "gym", "address", "createdAt", "updatedAt")
SELECT '52940235', COALESCE((SELECT "id" FROM u), (SELECT "id" FROM "User" WHERE "dni" = '52940235')), 'Ciro', 'Diaz', NULL, NULL, NULL, NULL, 'nan', NULL, NOW(), NOW()
ON CONFLICT ("dni") DO NOTHING;

WITH t AS (
  SELECT "id" FROM "Teacher" WHERE "userId" IN (SELECT "id" FROM "User" WHERE "dni" = '44139436')
), st AS (
  SELECT "dni" FROM "Student" WHERE "dni" = '52940235'
)
INSERT INTO "StudentTeacherAssignment" ("id", "studentDni", "teacherId", "startAt", "active")
SELECT gen_random_uuid(), st."dni", t."id", NOW(), true FROM st, t
WHERE NOT EXISTS (
  SELECT 1 FROM "StudentTeacherAssignment" a
  WHERE a."studentDni" = st."dni" AND a."active" = true
);

WITH u AS (
  INSERT INTO "User" ("id", "dni", "passwordHash", "role", "status", "mustChangePassword", "createdAt", "updatedAt")
  VALUES ('84e76ea9-10a2-46ff-9a0f-ea1b347e80cf', '54692546', '$2a$10$kZUTeBI47IPsm4/VUqIe3.KulC1iyvJS62ukOAku4oVRmYSapymey', 'STUDENT', 'ACTIVE', true, NOW(), NOW())
  ON CONFLICT ("dni") DO NOTHING
  RETURNING "id"
)
INSERT INTO "Student" ("dni", "userId", "firstName", "lastName", "birthDate", "phone", "guardianPhone", "email", "gym", "address", "createdAt", "updatedAt")
SELECT '54692546', COALESCE((SELECT "id" FROM u), (SELECT "id" FROM "User" WHERE "dni" = '54692546')), 'Logan', 'Guerrero', NULL, NULL, NULL, NULL, 'nan', NULL, NOW(), NOW()
ON CONFLICT ("dni") DO NOTHING;

WITH t AS (
  SELECT "id" FROM "Teacher" WHERE "userId" IN (SELECT "id" FROM "User" WHERE "dni" = '44139436')
), st AS (
  SELECT "dni" FROM "Student" WHERE "dni" = '54692546'
)
INSERT INTO "StudentTeacherAssignment" ("id", "studentDni", "teacherId", "startAt", "active")
SELECT gen_random_uuid(), st."dni", t."id", NOW(), true FROM st, t
WHERE NOT EXISTS (
  SELECT 1 FROM "StudentTeacherAssignment" a
  WHERE a."studentDni" = st."dni" AND a."active" = true
);

WITH u AS (
  INSERT INTO "User" ("id", "dni", "passwordHash", "role", "status", "mustChangePassword", "createdAt", "updatedAt")
  VALUES ('a843eeb2-b077-4076-80e4-66365aeb9289', '51295224', '$2a$10$.Uj1G0IZ6JeIS1lpx1GenexAleo3vNWR2QEzRhhjK0X8PYVt6PJFW', 'STUDENT', 'ACTIVE', true, NOW(), NOW())
  ON CONFLICT ("dni") DO NOTHING
  RETURNING "id"
)
INSERT INTO "Student" ("dni", "userId", "firstName", "lastName", "birthDate", "phone", "guardianPhone", "email", "gym", "address", "createdAt", "updatedAt")
SELECT '51295224', COALESCE((SELECT "id" FROM u), (SELECT "id" FROM "User" WHERE "dni" = '51295224')), 'Axel', 'Moraga', NULL, NULL, NULL, NULL, 'nan', NULL, NOW(), NOW()
ON CONFLICT ("dni") DO NOTHING;

WITH t AS (
  SELECT "id" FROM "Teacher" WHERE "userId" IN (SELECT "id" FROM "User" WHERE "dni" = '44139436')
), st AS (
  SELECT "dni" FROM "Student" WHERE "dni" = '51295224'
)
INSERT INTO "StudentTeacherAssignment" ("id", "studentDni", "teacherId", "startAt", "active")
SELECT gen_random_uuid(), st."dni", t."id", NOW(), true FROM st, t
WHERE NOT EXISTS (
  SELECT 1 FROM "StudentTeacherAssignment" a
  WHERE a."studentDni" = st."dni" AND a."active" = true
);

WITH u AS (
  INSERT INTO "User" ("id", "dni", "passwordHash", "role", "status", "mustChangePassword", "createdAt", "updatedAt")
  VALUES ('92c3329c-0339-4429-a620-acd87d9ad195', '51707157', '$2a$10$Itzaio9mmr2.JJJv6V97heqGFHSUJ6DB1wA/aNz4Z.rGLtEux0Zgi', 'STUDENT', 'ACTIVE', true, NOW(), NOW())
  ON CONFLICT ("dni") DO NOTHING
  RETURNING "id"
)
INSERT INTO "Student" ("dni", "userId", "firstName", "lastName", "birthDate", "phone", "guardianPhone", "email", "gym", "address", "createdAt", "updatedAt")
SELECT '51707157', COALESCE((SELECT "id" FROM u), (SELECT "id" FROM "User" WHERE "dni" = '51707157')), 'Argos', 'O''Laughlin', NULL, NULL, NULL, NULL, 'nan', NULL, NOW(), NOW()
ON CONFLICT ("dni") DO NOTHING;

WITH t AS (
  SELECT "id" FROM "Teacher" WHERE "userId" IN (SELECT "id" FROM "User" WHERE "dni" = '44139436')
), st AS (
  SELECT "dni" FROM "Student" WHERE "dni" = '51707157'
)
INSERT INTO "StudentTeacherAssignment" ("id", "studentDni", "teacherId", "startAt", "active")
SELECT gen_random_uuid(), st."dni", t."id", NOW(), true FROM st, t
WHERE NOT EXISTS (
  SELECT 1 FROM "StudentTeacherAssignment" a
  WHERE a."studentDni" = st."dni" AND a."active" = true
);

WITH u AS (
  INSERT INTO "User" ("id", "dni", "passwordHash", "role", "status", "mustChangePassword", "createdAt", "updatedAt")
  VALUES ('6f060719-5320-40aa-9f54-ab6ce75834dd', '50812957', '$2a$10$vKwoUkqa4Mp7T54BpUye2OQ.eru97IumAR9GyU30MtHkwNb8xbJ9i', 'STUDENT', 'ACTIVE', true, NOW(), NOW())
  ON CONFLICT ("dni") DO NOTHING
  RETURNING "id"
)
INSERT INTO "Student" ("dni", "userId", "firstName", "lastName", "birthDate", "phone", "guardianPhone", "email", "gym", "address", "createdAt", "updatedAt")
SELECT '50812957', COALESCE((SELECT "id" FROM u), (SELECT "id" FROM "User" WHERE "dni" = '50812957')), 'Emiliano', 'Ferrari', NULL, NULL, NULL, NULL, 'nan', NULL, NOW(), NOW()
ON CONFLICT ("dni") DO NOTHING;

WITH t AS (
  SELECT "id" FROM "Teacher" WHERE "userId" IN (SELECT "id" FROM "User" WHERE "dni" = '43831454')
), st AS (
  SELECT "dni" FROM "Student" WHERE "dni" = '50812957'
)
INSERT INTO "StudentTeacherAssignment" ("id", "studentDni", "teacherId", "startAt", "active")
SELECT gen_random_uuid(), st."dni", t."id", NOW(), true FROM st, t
WHERE NOT EXISTS (
  SELECT 1 FROM "StudentTeacherAssignment" a
  WHERE a."studentDni" = st."dni" AND a."active" = true
);

WITH u AS (
  INSERT INTO "User" ("id", "dni", "passwordHash", "role", "status", "mustChangePassword", "createdAt", "updatedAt")
  VALUES ('aa44c29a-70cf-42bf-aa8a-74a132457435', '549210009', '$2a$10$P8F99g/rSkANPAHsvPqzduAiVo.14av6AEYQ4p7RfO77hScC5.KJG', 'STUDENT', 'ACTIVE', true, NOW(), NOW())
  ON CONFLICT ("dni") DO NOTHING
  RETURNING "id"
)
INSERT INTO "Student" ("dni", "userId", "firstName", "lastName", "birthDate", "phone", "guardianPhone", "email", "gym", "address", "createdAt", "updatedAt")
SELECT '549210009', COALESCE((SELECT "id" FROM u), (SELECT "id" FROM "User" WHERE "dni" = '549210009')), 'Velentino', 'Ferrari', NULL, NULL, NULL, NULL, 'nan', NULL, NOW(), NOW()
ON CONFLICT ("dni") DO NOTHING;

WITH t AS (
  SELECT "id" FROM "Teacher" WHERE "userId" IN (SELECT "id" FROM "User" WHERE "dni" = '43831454')
), st AS (
  SELECT "dni" FROM "Student" WHERE "dni" = '549210009'
)
INSERT INTO "StudentTeacherAssignment" ("id", "studentDni", "teacherId", "startAt", "active")
SELECT gen_random_uuid(), st."dni", t."id", NOW(), true FROM st, t
WHERE NOT EXISTS (
  SELECT 1 FROM "StudentTeacherAssignment" a
  WHERE a."studentDni" = st."dni" AND a."active" = true
);

WITH u AS (
  INSERT INTO "User" ("id", "dni", "passwordHash", "role", "status", "mustChangePassword", "createdAt", "updatedAt")
  VALUES ('c4cac927-a144-4128-add3-d5666276570b', '53155146', '$2a$10$zN1LS3Gl6JOfYjyON63g.OKzdhjhHCznmH3GyZbDmN1BdriyOlPgS', 'STUDENT', 'ACTIVE', true, NOW(), NOW())
  ON CONFLICT ("dni") DO NOTHING
  RETURNING "id"
)
INSERT INTO "Student" ("dni", "userId", "firstName", "lastName", "birthDate", "phone", "guardianPhone", "email", "gym", "address", "createdAt", "updatedAt")
SELECT '53155146', COALESCE((SELECT "id" FROM u), (SELECT "id" FROM "User" WHERE "dni" = '53155146')), 'Lara', 'Barrera', NULL, NULL, NULL, NULL, 'nan', NULL, NOW(), NOW()
ON CONFLICT ("dni") DO NOTHING;

WITH t AS (
  SELECT "id" FROM "Teacher" WHERE "userId" IN (SELECT "id" FROM "User" WHERE "dni" = '43831454')
), st AS (
  SELECT "dni" FROM "Student" WHERE "dni" = '53155146'
)
INSERT INTO "StudentTeacherAssignment" ("id", "studentDni", "teacherId", "startAt", "active")
SELECT gen_random_uuid(), st."dni", t."id", NOW(), true FROM st, t
WHERE NOT EXISTS (
  SELECT 1 FROM "StudentTeacherAssignment" a
  WHERE a."studentDni" = st."dni" AND a."active" = true
);

WITH u AS (
  INSERT INTO "User" ("id", "dni", "passwordHash", "role", "status", "mustChangePassword", "createdAt", "updatedAt")
  VALUES ('e4f02b17-b037-45c4-af91-95980f0bce91', '55544509', '$2a$10$3jDx3vo/0ofuNkvE5qk6fON6qRb9/rNqGtd3G7jYadxqUZPqRNiUW', 'STUDENT', 'ACTIVE', true, NOW(), NOW())
  ON CONFLICT ("dni") DO NOTHING
  RETURNING "id"
)
INSERT INTO "Student" ("dni", "userId", "firstName", "lastName", "birthDate", "phone", "guardianPhone", "email", "gym", "address", "createdAt", "updatedAt")
SELECT '55544509', COALESCE((SELECT "id" FROM u), (SELECT "id" FROM "User" WHERE "dni" = '55544509')), 'Fausto', 'Baigorria', NULL, NULL, NULL, NULL, 'nan', NULL, NOW(), NOW()
ON CONFLICT ("dni") DO NOTHING;

WITH t AS (
  SELECT "id" FROM "Teacher" WHERE "userId" IN (SELECT "id" FROM "User" WHERE "dni" = '43831454')
), st AS (
  SELECT "dni" FROM "Student" WHERE "dni" = '55544509'
)
INSERT INTO "StudentTeacherAssignment" ("id", "studentDni", "teacherId", "startAt", "active")
SELECT gen_random_uuid(), st."dni", t."id", NOW(), true FROM st, t
WHERE NOT EXISTS (
  SELECT 1 FROM "StudentTeacherAssignment" a
  WHERE a."studentDni" = st."dni" AND a."active" = true
);

WITH u AS (
  INSERT INTO "User" ("id", "dni", "passwordHash", "role", "status", "mustChangePassword", "createdAt", "updatedAt")
  VALUES ('5532ac47-400b-4b67-846f-b3e67f2eb472', '57583825', '$2a$10$JKUmEF2Ot7bAqA8N/IdcBOe9ss.rwymclm6/YGhvf8CIDT28FQgpW', 'STUDENT', 'ACTIVE', true, NOW(), NOW())
  ON CONFLICT ("dni") DO NOTHING
  RETURNING "id"
)
INSERT INTO "Student" ("dni", "userId", "firstName", "lastName", "birthDate", "phone", "guardianPhone", "email", "gym", "address", "createdAt", "updatedAt")
SELECT '57583825', COALESCE((SELECT "id" FROM u), (SELECT "id" FROM "User" WHERE "dni" = '57583825')), 'Elias', 'Falanga', NULL, NULL, NULL, NULL, 'nan', NULL, NOW(), NOW()
ON CONFLICT ("dni") DO NOTHING;

WITH t AS (
  SELECT "id" FROM "Teacher" WHERE "userId" IN (SELECT "id" FROM "User" WHERE "dni" = '43831454')
), st AS (
  SELECT "dni" FROM "Student" WHERE "dni" = '57583825'
)
INSERT INTO "StudentTeacherAssignment" ("id", "studentDni", "teacherId", "startAt", "active")
SELECT gen_random_uuid(), st."dni", t."id", NOW(), true FROM st, t
WHERE NOT EXISTS (
  SELECT 1 FROM "StudentTeacherAssignment" a
  WHERE a."studentDni" = st."dni" AND a."active" = true
);

WITH u AS (
  INSERT INTO "User" ("id", "dni", "passwordHash", "role", "status", "mustChangePassword", "createdAt", "updatedAt")
  VALUES ('a79919eb-3b67-401e-a984-8140089f7e21', '54924808', '$2a$10$ZXguHIY9JV0iuJDmNFtcBue2JaSOfCQsBQizNnkma5wKKTVqmULJ6', 'STUDENT', 'ACTIVE', true, NOW(), NOW())
  ON CONFLICT ("dni") DO NOTHING
  RETURNING "id"
)
INSERT INTO "Student" ("dni", "userId", "firstName", "lastName", "birthDate", "phone", "guardianPhone", "email", "gym", "address", "createdAt", "updatedAt")
SELECT '54924808', COALESCE((SELECT "id" FROM u), (SELECT "id" FROM "User" WHERE "dni" = '54924808')), 'Humberto', 'Falanga', NULL, NULL, NULL, NULL, 'nan', NULL, NOW(), NOW()
ON CONFLICT ("dni") DO NOTHING;

WITH t AS (
  SELECT "id" FROM "Teacher" WHERE "userId" IN (SELECT "id" FROM "User" WHERE "dni" = '43831454')
), st AS (
  SELECT "dni" FROM "Student" WHERE "dni" = '54924808'
)
INSERT INTO "StudentTeacherAssignment" ("id", "studentDni", "teacherId", "startAt", "active")
SELECT gen_random_uuid(), st."dni", t."id", NOW(), true FROM st, t
WHERE NOT EXISTS (
  SELECT 1 FROM "StudentTeacherAssignment" a
  WHERE a."studentDni" = st."dni" AND a."active" = true
);

WITH u AS (
  INSERT INTO "User" ("id", "dni", "passwordHash", "role", "status", "mustChangePassword", "createdAt", "updatedAt")
  VALUES ('113b03af-f6a3-4dc1-b76a-e4c5cbd7fa68', '56086862', '$2a$10$lJ0zHBGEtbxV.ZZs4zMhzemOHURMhfanjrcGJgY2dea69v4Cx6VOy', 'STUDENT', 'ACTIVE', true, NOW(), NOW())
  ON CONFLICT ("dni") DO NOTHING
  RETURNING "id"
)
INSERT INTO "Student" ("dni", "userId", "firstName", "lastName", "birthDate", "phone", "guardianPhone", "email", "gym", "address", "createdAt", "updatedAt")
SELECT '56086862', COALESCE((SELECT "id" FROM u), (SELECT "id" FROM "User" WHERE "dni" = '56086862')), 'Benicio', 'Makay', NULL, NULL, NULL, NULL, 'nan', NULL, NOW(), NOW()
ON CONFLICT ("dni") DO NOTHING;

WITH t AS (
  SELECT "id" FROM "Teacher" WHERE "userId" IN (SELECT "id" FROM "User" WHERE "dni" = '43831454')
), st AS (
  SELECT "dni" FROM "Student" WHERE "dni" = '56086862'
)
INSERT INTO "StudentTeacherAssignment" ("id", "studentDni", "teacherId", "startAt", "active")
SELECT gen_random_uuid(), st."dni", t."id", NOW(), true FROM st, t
WHERE NOT EXISTS (
  SELECT 1 FROM "StudentTeacherAssignment" a
  WHERE a."studentDni" = st."dni" AND a."active" = true
);

WITH u AS (
  INSERT INTO "User" ("id", "dni", "passwordHash", "role", "status", "mustChangePassword", "createdAt", "updatedAt")
  VALUES ('81755438-0054-4bf9-bb1d-e7ddac395d1d', '54689482', '$2a$10$SqmS/j.AzJ3nYwhD8ciJ/Oaj2rDvwbo6D/GgpjGbP6pZg58p5K1Ie', 'STUDENT', 'ACTIVE', true, NOW(), NOW())
  ON CONFLICT ("dni") DO NOTHING
  RETURNING "id"
)
INSERT INTO "Student" ("dni", "userId", "firstName", "lastName", "birthDate", "phone", "guardianPhone", "email", "gym", "address", "createdAt", "updatedAt")
SELECT '54689482', COALESCE((SELECT "id" FROM u), (SELECT "id" FROM "User" WHERE "dni" = '54689482')), 'Ambar', 'Saez', NULL, NULL, NULL, NULL, 'nan', NULL, NOW(), NOW()
ON CONFLICT ("dni") DO NOTHING;

WITH t AS (
  SELECT "id" FROM "Teacher" WHERE "userId" IN (SELECT "id" FROM "User" WHERE "dni" = '43831454')
), st AS (
  SELECT "dni" FROM "Student" WHERE "dni" = '54689482'
)
INSERT INTO "StudentTeacherAssignment" ("id", "studentDni", "teacherId", "startAt", "active")
SELECT gen_random_uuid(), st."dni", t."id", NOW(), true FROM st, t
WHERE NOT EXISTS (
  SELECT 1 FROM "StudentTeacherAssignment" a
  WHERE a."studentDni" = st."dni" AND a."active" = true
);

WITH u AS (
  INSERT INTO "User" ("id", "dni", "passwordHash", "role", "status", "mustChangePassword", "createdAt", "updatedAt")
  VALUES ('b439e3c2-90b1-466d-82fe-692c43ab1d8e', '53939390', '$2a$10$kvezazHtmYvk7WcPvOMXUOZRP7eCiMVBo3jjPFuRIsw8PsFLAoK7y', 'STUDENT', 'ACTIVE', true, NOW(), NOW())
  ON CONFLICT ("dni") DO NOTHING
  RETURNING "id"
)
INSERT INTO "Student" ("dni", "userId", "firstName", "lastName", "birthDate", "phone", "guardianPhone", "email", "gym", "address", "createdAt", "updatedAt")
SELECT '53939390', COALESCE((SELECT "id" FROM u), (SELECT "id" FROM "User" WHERE "dni" = '53939390')), 'Eugenia', 'Quevedo', NULL, NULL, NULL, NULL, 'nan', NULL, NOW(), NOW()
ON CONFLICT ("dni") DO NOTHING;

WITH t AS (
  SELECT "id" FROM "Teacher" WHERE "userId" IN (SELECT "id" FROM "User" WHERE "dni" = '43831454')
), st AS (
  SELECT "dni" FROM "Student" WHERE "dni" = '53939390'
)
INSERT INTO "StudentTeacherAssignment" ("id", "studentDni", "teacherId", "startAt", "active")
SELECT gen_random_uuid(), st."dni", t."id", NOW(), true FROM st, t
WHERE NOT EXISTS (
  SELECT 1 FROM "StudentTeacherAssignment" a
  WHERE a."studentDni" = st."dni" AND a."active" = true
);

WITH u AS (
  INSERT INTO "User" ("id", "dni", "passwordHash", "role", "status", "mustChangePassword", "createdAt", "updatedAt")
  VALUES ('68e542f8-0223-49b1-9649-354d10dca693', '57367320', '$2a$10$al91rZdWQfFfO3.KoDs9ZOkan4pPsqfDCvK9m7yft.N/KjUp.Z.fe', 'STUDENT', 'ACTIVE', true, NOW(), NOW())
  ON CONFLICT ("dni") DO NOTHING
  RETURNING "id"
)
INSERT INTO "Student" ("dni", "userId", "firstName", "lastName", "birthDate", "phone", "guardianPhone", "email", "gym", "address", "createdAt", "updatedAt")
SELECT '57367320', COALESCE((SELECT "id" FROM u), (SELECT "id" FROM "User" WHERE "dni" = '57367320')), 'Mateo', 'Gouirse', NULL, NULL, NULL, NULL, 'nan', NULL, NOW(), NOW()
ON CONFLICT ("dni") DO NOTHING;

WITH t AS (
  SELECT "id" FROM "Teacher" WHERE "userId" IN (SELECT "id" FROM "User" WHERE "dni" = '43831454')
), st AS (
  SELECT "dni" FROM "Student" WHERE "dni" = '57367320'
)
INSERT INTO "StudentTeacherAssignment" ("id", "studentDni", "teacherId", "startAt", "active")
SELECT gen_random_uuid(), st."dni", t."id", NOW(), true FROM st, t
WHERE NOT EXISTS (
  SELECT 1 FROM "StudentTeacherAssignment" a
  WHERE a."studentDni" = st."dni" AND a."active" = true
);

WITH u AS (
  INSERT INTO "User" ("id", "dni", "passwordHash", "role", "status", "mustChangePassword", "createdAt", "updatedAt")
  VALUES ('385963a5-3ff4-4d2f-a869-002efbcaf194', '54921217', '$2a$10$wTxPBNG/dNr0Jgk0uvE4veS0BNEA0w9OqTJE0pXOgdI6U/oHTSOZC', 'STUDENT', 'ACTIVE', true, NOW(), NOW())
  ON CONFLICT ("dni") DO NOTHING
  RETURNING "id"
)
INSERT INTO "Student" ("dni", "userId", "firstName", "lastName", "birthDate", "phone", "guardianPhone", "email", "gym", "address", "createdAt", "updatedAt")
SELECT '54921217', COALESCE((SELECT "id" FROM u), (SELECT "id" FROM "User" WHERE "dni" = '54921217')), 'Belen', 'Gouirse', NULL, NULL, NULL, NULL, 'nan', NULL, NOW(), NOW()
ON CONFLICT ("dni") DO NOTHING;

WITH t AS (
  SELECT "id" FROM "Teacher" WHERE "userId" IN (SELECT "id" FROM "User" WHERE "dni" = '43831454')
), st AS (
  SELECT "dni" FROM "Student" WHERE "dni" = '54921217'
)
INSERT INTO "StudentTeacherAssignment" ("id", "studentDni", "teacherId", "startAt", "active")
SELECT gen_random_uuid(), st."dni", t."id", NOW(), true FROM st, t
WHERE NOT EXISTS (
  SELECT 1 FROM "StudentTeacherAssignment" a
  WHERE a."studentDni" = st."dni" AND a."active" = true
);

WITH u AS (
  INSERT INTO "User" ("id", "dni", "passwordHash", "role", "status", "mustChangePassword", "createdAt", "updatedAt")
  VALUES ('ebeebc98-7f7f-4d7d-9f81-ce4bba12f475', '49821666', '$2a$10$NyKg3cASd.cQunsz67eRMeu/Z10V.gQCLLdHn.SLVddagrqvAicxG', 'STUDENT', 'ACTIVE', true, NOW(), NOW())
  ON CONFLICT ("dni") DO NOTHING
  RETURNING "id"
)
INSERT INTO "Student" ("dni", "userId", "firstName", "lastName", "birthDate", "phone", "guardianPhone", "email", "gym", "address", "createdAt", "updatedAt")
SELECT '49821666', COALESCE((SELECT "id" FROM u), (SELECT "id" FROM "User" WHERE "dni" = '49821666')), 'Santiago', 'Ruiz', NULL, NULL, NULL, NULL, 'CARRODILLA LOS OLIVOS', NULL, NOW(), NOW()
ON CONFLICT ("dni") DO NOTHING;

WITH t AS (
  SELECT "id" FROM "Teacher" WHERE "userId" IN (SELECT "id" FROM "User" WHERE "dni" = '43831454')
), st AS (
  SELECT "dni" FROM "Student" WHERE "dni" = '49821666'
)
INSERT INTO "StudentTeacherAssignment" ("id", "studentDni", "teacherId", "startAt", "active")
SELECT gen_random_uuid(), st."dni", t."id", NOW(), true FROM st, t
WHERE NOT EXISTS (
  SELECT 1 FROM "StudentTeacherAssignment" a
  WHERE a."studentDni" = st."dni" AND a."active" = true
);

WITH u AS (
  INSERT INTO "User" ("id", "dni", "passwordHash", "role", "status", "mustChangePassword", "createdAt", "updatedAt")
  VALUES ('7397b2a6-c4e3-4c11-ab07-988711635ac4', '54922034', '$2a$10$5uMJAY4Ssc43vRumL3erc.9GPd5Eh2VUv5xz2RH9QdgmPLahjn8tC', 'STUDENT', 'ACTIVE', true, NOW(), NOW())
  ON CONFLICT ("dni") DO NOTHING
  RETURNING "id"
)
INSERT INTO "Student" ("dni", "userId", "firstName", "lastName", "birthDate", "phone", "guardianPhone", "email", "gym", "address", "createdAt", "updatedAt")
SELECT '54922034', COALESCE((SELECT "id" FROM u), (SELECT "id" FROM "User" WHERE "dni" = '54922034')), 'Alexis', 'Ruiz', NULL, NULL, NULL, NULL, 'CARRODILLA LOS OLIVOS', NULL, NOW(), NOW()
ON CONFLICT ("dni") DO NOTHING;

WITH t AS (
  SELECT "id" FROM "Teacher" WHERE "userId" IN (SELECT "id" FROM "User" WHERE "dni" = '43831454')
), st AS (
  SELECT "dni" FROM "Student" WHERE "dni" = '54922034'
)
INSERT INTO "StudentTeacherAssignment" ("id", "studentDni", "teacherId", "startAt", "active")
SELECT gen_random_uuid(), st."dni", t."id", NOW(), true FROM st, t
WHERE NOT EXISTS (
  SELECT 1 FROM "StudentTeacherAssignment" a
  WHERE a."studentDni" = st."dni" AND a."active" = true
);

WITH u AS (
  INSERT INTO "User" ("id", "dni", "passwordHash", "role", "status", "mustChangePassword", "createdAt", "updatedAt")
  VALUES ('e5870c58-1eeb-4475-a61f-81e6641bf9fe', '57582780', '$2a$10$g86tD86bbJnwqJGdVA8kzOBNxzzX9uBLF.hpe1AoJj.4UMxyKlQbq', 'STUDENT', 'ACTIVE', true, NOW(), NOW())
  ON CONFLICT ("dni") DO NOTHING
  RETURNING "id"
)
INSERT INTO "Student" ("dni", "userId", "firstName", "lastName", "birthDate", "phone", "guardianPhone", "email", "gym", "address", "createdAt", "updatedAt")
SELECT '57582780', COALESCE((SELECT "id" FROM u), (SELECT "id" FROM "User" WHERE "dni" = '57582780')), 'Thomas', 'Rodriguez', NULL, NULL, NULL, NULL, 'CARRODILLA LOS OLIVOS', NULL, NOW(), NOW()
ON CONFLICT ("dni") DO NOTHING;

WITH t AS (
  SELECT "id" FROM "Teacher" WHERE "userId" IN (SELECT "id" FROM "User" WHERE "dni" = '43831454')
), st AS (
  SELECT "dni" FROM "Student" WHERE "dni" = '57582780'
)
INSERT INTO "StudentTeacherAssignment" ("id", "studentDni", "teacherId", "startAt", "active")
SELECT gen_random_uuid(), st."dni", t."id", NOW(), true FROM st, t
WHERE NOT EXISTS (
  SELECT 1 FROM "StudentTeacherAssignment" a
  WHERE a."studentDni" = st."dni" AND a."active" = true
);

WITH u AS (
  INSERT INTO "User" ("id", "dni", "passwordHash", "role", "status", "mustChangePassword", "createdAt", "updatedAt")
  VALUES ('1e4b6e0c-e85e-4004-9cdf-d03aa39fab59', '47613328', '$2a$10$IM83PavzvE/QG2c1Mv.TNO6KCSc/eD9qw/Bz02Rk82gfA2tB9X7ku', 'STUDENT', 'ACTIVE', true, NOW(), NOW())
  ON CONFLICT ("dni") DO NOTHING
  RETURNING "id"
)
INSERT INTO "Student" ("dni", "userId", "firstName", "lastName", "birthDate", "phone", "guardianPhone", "email", "gym", "address", "createdAt", "updatedAt")
SELECT '47613328', COALESCE((SELECT "id" FROM u), (SELECT "id" FROM "User" WHERE "dni" = '47613328')), 'Guadalupe', 'Ruiz', NULL, NULL, NULL, NULL, 'CARRODILLA LOS OLIVOS', NULL, NOW(), NOW()
ON CONFLICT ("dni") DO NOTHING;

WITH t AS (
  SELECT "id" FROM "Teacher" WHERE "userId" IN (SELECT "id" FROM "User" WHERE "dni" = '43831454')
), st AS (
  SELECT "dni" FROM "Student" WHERE "dni" = '47613328'
)
INSERT INTO "StudentTeacherAssignment" ("id", "studentDni", "teacherId", "startAt", "active")
SELECT gen_random_uuid(), st."dni", t."id", NOW(), true FROM st, t
WHERE NOT EXISTS (
  SELECT 1 FROM "StudentTeacherAssignment" a
  WHERE a."studentDni" = st."dni" AND a."active" = true
);

WITH u AS (
  INSERT INTO "User" ("id", "dni", "passwordHash", "role", "status", "mustChangePassword", "createdAt", "updatedAt")
  VALUES ('14b45c29-5bc3-4ea1-afd0-c4dcab585c66', '52520393', '$2a$10$BuaYslsJ.wOPOCvC1ZrIhuMDAeMhoQFApuQtmuxjIQwdE81W9vqYe', 'STUDENT', 'ACTIVE', true, NOW(), NOW())
  ON CONFLICT ("dni") DO NOTHING
  RETURNING "id"
)
INSERT INTO "Student" ("dni", "userId", "firstName", "lastName", "birthDate", "phone", "guardianPhone", "email", "gym", "address", "createdAt", "updatedAt")
SELECT '52520393', COALESCE((SELECT "id" FROM u), (SELECT "id" FROM "User" WHERE "dni" = '52520393')), 'Joaquin', 'Rocca', NULL, NULL, NULL, NULL, 'CARRODILLA LOS OLIVOS', NULL, NOW(), NOW()
ON CONFLICT ("dni") DO NOTHING;

WITH t AS (
  SELECT "id" FROM "Teacher" WHERE "userId" IN (SELECT "id" FROM "User" WHERE "dni" = '43831454')
), st AS (
  SELECT "dni" FROM "Student" WHERE "dni" = '52520393'
)
INSERT INTO "StudentTeacherAssignment" ("id", "studentDni", "teacherId", "startAt", "active")
SELECT gen_random_uuid(), st."dni", t."id", NOW(), true FROM st, t
WHERE NOT EXISTS (
  SELECT 1 FROM "StudentTeacherAssignment" a
  WHERE a."studentDni" = st."dni" AND a."active" = true
);

WITH u AS (
  INSERT INTO "User" ("id", "dni", "passwordHash", "role", "status", "mustChangePassword", "createdAt", "updatedAt")
  VALUES ('c4a4d1d0-0493-4853-b341-c395e88e2fc4', '51532369', '$2a$10$f5w/BC/WQrvcETvDESnDfOKrv/zpmj4BO.1MdHOxeEh3Ip0dQ0pa.', 'STUDENT', 'ACTIVE', true, NOW(), NOW())
  ON CONFLICT ("dni") DO NOTHING
  RETURNING "id"
)
INSERT INTO "Student" ("dni", "userId", "firstName", "lastName", "birthDate", "phone", "guardianPhone", "email", "gym", "address", "createdAt", "updatedAt")
SELECT '51532369', COALESCE((SELECT "id" FROM u), (SELECT "id" FROM "User" WHERE "dni" = '51532369')), 'Olivia', 'Moreno', NULL, NULL, NULL, NULL, 'CARRODILLA LOS OLIVOS', NULL, NOW(), NOW()
ON CONFLICT ("dni") DO NOTHING;

WITH t AS (
  SELECT "id" FROM "Teacher" WHERE "userId" IN (SELECT "id" FROM "User" WHERE "dni" = '43831454')
), st AS (
  SELECT "dni" FROM "Student" WHERE "dni" = '51532369'
)
INSERT INTO "StudentTeacherAssignment" ("id", "studentDni", "teacherId", "startAt", "active")
SELECT gen_random_uuid(), st."dni", t."id", NOW(), true FROM st, t
WHERE NOT EXISTS (
  SELECT 1 FROM "StudentTeacherAssignment" a
  WHERE a."studentDni" = st."dni" AND a."active" = true
);

WITH u AS (
  INSERT INTO "User" ("id", "dni", "passwordHash", "role", "status", "mustChangePassword", "createdAt", "updatedAt")
  VALUES ('d0cf63a1-ecd9-4dae-a232-3b13f70f201c', '51189489', '$2a$10$5yex5qHIkEDkfFErKh4B2.ZHnN8BvzqE8AlcVXHNu9ToHN/.MLj2m', 'STUDENT', 'ACTIVE', true, NOW(), NOW())
  ON CONFLICT ("dni") DO NOTHING
  RETURNING "id"
)
INSERT INTO "Student" ("dni", "userId", "firstName", "lastName", "birthDate", "phone", "guardianPhone", "email", "gym", "address", "createdAt", "updatedAt")
SELECT '51189489', COALESCE((SELECT "id" FROM u), (SELECT "id" FROM "User" WHERE "dni" = '51189489')), 'Morena', 'Vargas', NULL, NULL, NULL, NULL, 'CARRODILLA LOS OLIVOS', NULL, NOW(), NOW()
ON CONFLICT ("dni") DO NOTHING;

WITH t AS (
  SELECT "id" FROM "Teacher" WHERE "userId" IN (SELECT "id" FROM "User" WHERE "dni" = '43831454')
), st AS (
  SELECT "dni" FROM "Student" WHERE "dni" = '51189489'
)
INSERT INTO "StudentTeacherAssignment" ("id", "studentDni", "teacherId", "startAt", "active")
SELECT gen_random_uuid(), st."dni", t."id", NOW(), true FROM st, t
WHERE NOT EXISTS (
  SELECT 1 FROM "StudentTeacherAssignment" a
  WHERE a."studentDni" = st."dni" AND a."active" = true
);

WITH u AS (
  INSERT INTO "User" ("id", "dni", "passwordHash", "role", "status", "mustChangePassword", "createdAt", "updatedAt")
  VALUES ('1de1992d-d1cd-4b3e-92d2-b214d072ba45', '53946708', '$2a$10$HPd9Vp78X2S4FJupeWecDurpqAFrz1WdRr/Qcr7NLBqHUzAyMv.X.', 'STUDENT', 'ACTIVE', true, NOW(), NOW())
  ON CONFLICT ("dni") DO NOTHING
  RETURNING "id"
)
INSERT INTO "Student" ("dni", "userId", "firstName", "lastName", "birthDate", "phone", "guardianPhone", "email", "gym", "address", "createdAt", "updatedAt")
SELECT '53946708', COALESCE((SELECT "id" FROM u), (SELECT "id" FROM "User" WHERE "dni" = '53946708')), 'Victoria', 'Vargas', NULL, NULL, NULL, NULL, 'CARRODILLA LOS OLIVOS', NULL, NOW(), NOW()
ON CONFLICT ("dni") DO NOTHING;

WITH t AS (
  SELECT "id" FROM "Teacher" WHERE "userId" IN (SELECT "id" FROM "User" WHERE "dni" = '43831454')
), st AS (
  SELECT "dni" FROM "Student" WHERE "dni" = '53946708'
)
INSERT INTO "StudentTeacherAssignment" ("id", "studentDni", "teacherId", "startAt", "active")
SELECT gen_random_uuid(), st."dni", t."id", NOW(), true FROM st, t
WHERE NOT EXISTS (
  SELECT 1 FROM "StudentTeacherAssignment" a
  WHERE a."studentDni" = st."dni" AND a."active" = true
);

WITH u AS (
  INSERT INTO "User" ("id", "dni", "passwordHash", "role", "status", "mustChangePassword", "createdAt", "updatedAt")
  VALUES ('b5b631c0-0ea5-421b-99c5-c78b118c4ae0', '49335489', '$2a$10$LhvMh6ofOmmk7SoEuKIYeOsQD2Rp9opr19Jqxq0oYdgC0q7C/IIRe', 'STUDENT', 'ACTIVE', true, NOW(), NOW())
  ON CONFLICT ("dni") DO NOTHING
  RETURNING "id"
)
INSERT INTO "Student" ("dni", "userId", "firstName", "lastName", "birthDate", "phone", "guardianPhone", "email", "gym", "address", "createdAt", "updatedAt")
SELECT '49335489', COALESCE((SELECT "id" FROM u), (SELECT "id" FROM "User" WHERE "dni" = '49335489')), 'Jazmin', 'Fernandez', NULL, NULL, NULL, NULL, 'ACADEMIA DE DANZAS FLAMENCAS CATALUÑAS', NULL, NOW(), NOW()
ON CONFLICT ("dni") DO NOTHING;

WITH t AS (
  SELECT "id" FROM "Teacher" WHERE "userId" IN (SELECT "id" FROM "User" WHERE "dni" = '43831454')
), st AS (
  SELECT "dni" FROM "Student" WHERE "dni" = '49335489'
)
INSERT INTO "StudentTeacherAssignment" ("id", "studentDni", "teacherId", "startAt", "active")
SELECT gen_random_uuid(), st."dni", t."id", NOW(), true FROM st, t
WHERE NOT EXISTS (
  SELECT 1 FROM "StudentTeacherAssignment" a
  WHERE a."studentDni" = st."dni" AND a."active" = true
);

WITH u AS (
  INSERT INTO "User" ("id", "dni", "passwordHash", "role", "status", "mustChangePassword", "createdAt", "updatedAt")
  VALUES ('390bc293-b68d-47ec-89c9-342dd049a61d', '53313626', '$2a$10$sDnsB3TplRm5xfqe3iE3ge3QchIi9lgTfSnnO6mfSMBRJxPNCy/1a', 'STUDENT', 'ACTIVE', true, NOW(), NOW())
  ON CONFLICT ("dni") DO NOTHING
  RETURNING "id"
)
INSERT INTO "Student" ("dni", "userId", "firstName", "lastName", "birthDate", "phone", "guardianPhone", "email", "gym", "address", "createdAt", "updatedAt")
SELECT '53313626', COALESCE((SELECT "id" FROM u), (SELECT "id" FROM "User" WHERE "dni" = '53313626')), 'Brandon', 'Subelza', NULL, NULL, NULL, NULL, 'nan', NULL, NOW(), NOW()
ON CONFLICT ("dni") DO NOTHING;

WITH t AS (
  SELECT "id" FROM "Teacher" WHERE "userId" IN (SELECT "id" FROM "User" WHERE "dni" = '42421850')
), st AS (
  SELECT "dni" FROM "Student" WHERE "dni" = '53313626'
)
INSERT INTO "StudentTeacherAssignment" ("id", "studentDni", "teacherId", "startAt", "active")
SELECT gen_random_uuid(), st."dni", t."id", NOW(), true FROM st, t
WHERE NOT EXISTS (
  SELECT 1 FROM "StudentTeacherAssignment" a
  WHERE a."studentDni" = st."dni" AND a."active" = true
);

WITH u AS (
  INSERT INTO "User" ("id", "dni", "passwordHash", "role", "status", "mustChangePassword", "createdAt", "updatedAt")
  VALUES ('f6dfe268-6ef2-42a9-afe6-ed25aa65fc11', '50812930', '$2a$10$GUCl1WxInDJfX9E3ohXxsebU1wq4HLZNcNLfBBqfG9JM2z./6wuVG', 'STUDENT', 'ACTIVE', true, NOW(), NOW())
  ON CONFLICT ("dni") DO NOTHING
  RETURNING "id"
)
INSERT INTO "Student" ("dni", "userId", "firstName", "lastName", "birthDate", "phone", "guardianPhone", "email", "gym", "address", "createdAt", "updatedAt")
SELECT '50812930', COALESCE((SELECT "id" FROM u), (SELECT "id" FROM "User" WHERE "dni" = '50812930')), 'Carla', 'Innocente', NULL, NULL, NULL, NULL, 'nan', NULL, NOW(), NOW()
ON CONFLICT ("dni") DO NOTHING;

WITH t AS (
  SELECT "id" FROM "Teacher" WHERE "userId" IN (SELECT "id" FROM "User" WHERE "dni" = '42421850')
), st AS (
  SELECT "dni" FROM "Student" WHERE "dni" = '50812930'
)
INSERT INTO "StudentTeacherAssignment" ("id", "studentDni", "teacherId", "startAt", "active")
SELECT gen_random_uuid(), st."dni", t."id", NOW(), true FROM st, t
WHERE NOT EXISTS (
  SELECT 1 FROM "StudentTeacherAssignment" a
  WHERE a."studentDni" = st."dni" AND a."active" = true
);

WITH u AS (
  INSERT INTO "User" ("id", "dni", "passwordHash", "role", "status", "mustChangePassword", "createdAt", "updatedAt")
  VALUES ('7fb4c899-1046-4dcf-b72a-6a87167b6f4e', '13513965', '$2a$10$VXg9zDKrCktYOS1N/mLCGuaiNgaqlbssnR5sd5LCmUhBNe39kNNTm', 'STUDENT', 'ACTIVE', true, NOW(), NOW())
  ON CONFLICT ("dni") DO NOTHING
  RETURNING "id"
)
INSERT INTO "Student" ("dni", "userId", "firstName", "lastName", "birthDate", "phone", "guardianPhone", "email", "gym", "address", "createdAt", "updatedAt")
SELECT '13513965', COALESCE((SELECT "id" FROM u), (SELECT "id" FROM "User" WHERE "dni" = '13513965')), 'Daniel', 'Villegas', NULL, NULL, NULL, NULL, 'nan', NULL, NOW(), NOW()
ON CONFLICT ("dni") DO NOTHING;

WITH t AS (
  SELECT "id" FROM "Teacher" WHERE "userId" IN (SELECT "id" FROM "User" WHERE "dni" = '42421850')
), st AS (
  SELECT "dni" FROM "Student" WHERE "dni" = '13513965'
)
INSERT INTO "StudentTeacherAssignment" ("id", "studentDni", "teacherId", "startAt", "active")
SELECT gen_random_uuid(), st."dni", t."id", NOW(), true FROM st, t
WHERE NOT EXISTS (
  SELECT 1 FROM "StudentTeacherAssignment" a
  WHERE a."studentDni" = st."dni" AND a."active" = true
);

WITH u AS (
  INSERT INTO "User" ("id", "dni", "passwordHash", "role", "status", "mustChangePassword", "createdAt", "updatedAt")
  VALUES ('99bc0716-b7d9-4a79-ac50-a86a5aa6d825', '45024344', '$2a$10$kpADJaMYLuo/MEaMmwqMgei4T9ZXKGnunqcjY1pGWgS.ogMI3qVQC', 'STUDENT', 'ACTIVE', true, NOW(), NOW())
  ON CONFLICT ("dni") DO NOTHING
  RETURNING "id"
)
INSERT INTO "Student" ("dni", "userId", "firstName", "lastName", "birthDate", "phone", "guardianPhone", "email", "gym", "address", "createdAt", "updatedAt")
SELECT '45024344', COALESCE((SELECT "id" FROM u), (SELECT "id" FROM "User" WHERE "dni" = '45024344')), 'Gabriel', 'Cabeda', NULL, NULL, NULL, NULL, 'nan', NULL, NOW(), NOW()
ON CONFLICT ("dni") DO NOTHING;

WITH t AS (
  SELECT "id" FROM "Teacher" WHERE "userId" IN (SELECT "id" FROM "User" WHERE "dni" = '42421850')
), st AS (
  SELECT "dni" FROM "Student" WHERE "dni" = '45024344'
)
INSERT INTO "StudentTeacherAssignment" ("id", "studentDni", "teacherId", "startAt", "active")
SELECT gen_random_uuid(), st."dni", t."id", NOW(), true FROM st, t
WHERE NOT EXISTS (
  SELECT 1 FROM "StudentTeacherAssignment" a
  WHERE a."studentDni" = st."dni" AND a."active" = true
);

WITH u AS (
  INSERT INTO "User" ("id", "dni", "passwordHash", "role", "status", "mustChangePassword", "createdAt", "updatedAt")
  VALUES ('fad349aa-6a0e-42c4-b4ff-7f241f89b46e', '46549409', '$2a$10$NfANMxFQl5F.j8z9cyhsK.yDhHDxaasTWrkFVt9XXatdmJwwTCjzi', 'STUDENT', 'ACTIVE', true, NOW(), NOW())
  ON CONFLICT ("dni") DO NOTHING
  RETURNING "id"
)
INSERT INTO "Student" ("dni", "userId", "firstName", "lastName", "birthDate", "phone", "guardianPhone", "email", "gym", "address", "createdAt", "updatedAt")
SELECT '46549409', COALESCE((SELECT "id" FROM u), (SELECT "id" FROM "User" WHERE "dni" = '46549409')), 'Brisa', 'Cabeda', NULL, NULL, NULL, NULL, 'nan', NULL, NOW(), NOW()
ON CONFLICT ("dni") DO NOTHING;

WITH t AS (
  SELECT "id" FROM "Teacher" WHERE "userId" IN (SELECT "id" FROM "User" WHERE "dni" = '42421850')
), st AS (
  SELECT "dni" FROM "Student" WHERE "dni" = '46549409'
)
INSERT INTO "StudentTeacherAssignment" ("id", "studentDni", "teacherId", "startAt", "active")
SELECT gen_random_uuid(), st."dni", t."id", NOW(), true FROM st, t
WHERE NOT EXISTS (
  SELECT 1 FROM "StudentTeacherAssignment" a
  WHERE a."studentDni" = st."dni" AND a."active" = true
);

WITH u AS (
  INSERT INTO "User" ("id", "dni", "passwordHash", "role", "status", "mustChangePassword", "createdAt", "updatedAt")
  VALUES ('f4e00435-d384-4e30-98ba-d79c1801d0f2', '23712041', '$2a$10$aPR.ERmrJPr.P25eXp3HeOL5KyGmiIoB8fY1fByK.qFy90/oIkilS', 'STUDENT', 'ACTIVE', true, NOW(), NOW())
  ON CONFLICT ("dni") DO NOTHING
  RETURNING "id"
)
INSERT INTO "Student" ("dni", "userId", "firstName", "lastName", "birthDate", "phone", "guardianPhone", "email", "gym", "address", "createdAt", "updatedAt")
SELECT '23712041', COALESCE((SELECT "id" FROM u), (SELECT "id" FROM "User" WHERE "dni" = '23712041')), 'Andrea', 'Bustamante', NULL, NULL, NULL, NULL, 'nan', NULL, NOW(), NOW()
ON CONFLICT ("dni") DO NOTHING;

WITH t AS (
  SELECT "id" FROM "Teacher" WHERE "userId" IN (SELECT "id" FROM "User" WHERE "dni" = '42421850')
), st AS (
  SELECT "dni" FROM "Student" WHERE "dni" = '23712041'
)
INSERT INTO "StudentTeacherAssignment" ("id", "studentDni", "teacherId", "startAt", "active")
SELECT gen_random_uuid(), st."dni", t."id", NOW(), true FROM st, t
WHERE NOT EXISTS (
  SELECT 1 FROM "StudentTeacherAssignment" a
  WHERE a."studentDni" = st."dni" AND a."active" = true
);

WITH u AS (
  INSERT INTO "User" ("id", "dni", "passwordHash", "role", "status", "mustChangePassword", "createdAt", "updatedAt")
  VALUES ('c8f34082-c55f-46f5-8672-c606874a3cb1', '53662411', '$2a$10$pfV7iFrsQ4vA7HF.knvH8O7meb3HoAZljjKReT4dClMEtD9bnY0kG', 'STUDENT', 'ACTIVE', true, NOW(), NOW())
  ON CONFLICT ("dni") DO NOTHING
  RETURNING "id"
)
INSERT INTO "Student" ("dni", "userId", "firstName", "lastName", "birthDate", "phone", "guardianPhone", "email", "gym", "address", "createdAt", "updatedAt")
SELECT '53662411', COALESCE((SELECT "id" FROM u), (SELECT "id" FROM "User" WHERE "dni" = '53662411')), 'Benjamin', 'Gimenez', NULL, NULL, NULL, NULL, 'nan', NULL, NOW(), NOW()
ON CONFLICT ("dni") DO NOTHING;

WITH t AS (
  SELECT "id" FROM "Teacher" WHERE "userId" IN (SELECT "id" FROM "User" WHERE "dni" = '42421850')
), st AS (
  SELECT "dni" FROM "Student" WHERE "dni" = '53662411'
)
INSERT INTO "StudentTeacherAssignment" ("id", "studentDni", "teacherId", "startAt", "active")
SELECT gen_random_uuid(), st."dni", t."id", NOW(), true FROM st, t
WHERE NOT EXISTS (
  SELECT 1 FROM "StudentTeacherAssignment" a
  WHERE a."studentDni" = st."dni" AND a."active" = true
);

COMMIT;