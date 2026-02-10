-- Auto-generated import for alumnos que son profes
BEGIN;
CREATE EXTENSION IF NOT EXISTS pgcrypto;
WITH u AS (
  INSERT INTO "User" ("id", "dni", "passwordHash", "role", "status", "mustChangePassword", "createdAt", "updatedAt")
  VALUES ('fc400da3-2206-4854-a593-e294e6e0f949', '486075359', '$2a$10$STKa6r1xgFWnnxX3YdBxtOsLG8VU4VcBoXCPFMKk8SfcQyZeOh/3S', 'STUDENT', 'ACTIVE', true, NOW(), NOW())
  ON CONFLICT ("dni") DO NOTHING
  RETURNING "id"
)
INSERT INTO "Student" ("dni", "userId", "firstName", "lastName", "birthDate", "phone", "guardianPhone", "email", "gym", "address", "createdAt", "updatedAt")
SELECT '486075359', COALESCE((SELECT "id" FROM u), (SELECT "id" FROM "User" WHERE "dni" = '486075359')), 'Alma', 'Vargas', NULL, NULL, NULL, NULL, 'CARRODILLA LOS OLIVOS', NULL, NOW(), NOW()
ON CONFLICT ("dni") DO NOTHING;

WITH t AS (
  SELECT "id" FROM "Teacher" WHERE "userId" IN (SELECT "id" FROM "User" WHERE "dni" = '43831454')
), st AS (
  SELECT "dni" FROM "Student" WHERE "dni" = '486075359'
)
INSERT INTO "StudentTeacherAssignment" ("id", "studentDni", "teacherId", "startAt", "active")
SELECT gen_random_uuid(), st."dni", t."id", NOW(), true FROM st, t
WHERE NOT EXISTS (
  SELECT 1 FROM "StudentTeacherAssignment" a
  WHERE a."studentDni" = st."dni" AND a."active" = true
);

WITH u AS (
  INSERT INTO "User" ("id", "dni", "passwordHash", "role", "status", "mustChangePassword", "createdAt", "updatedAt")
  VALUES ('69f04de5-0afb-4010-a1f5-60405819e193', '424218509', '$2a$10$4MMh6QIAX5WyXiwh.kN.wOdbzli8648rrqNL25J3zjpT0urAYf/Aa', 'STUDENT', 'ACTIVE', true, NOW(), NOW())
  ON CONFLICT ("dni") DO NOTHING
  RETURNING "id"
)
INSERT INTO "Student" ("dni", "userId", "firstName", "lastName", "birthDate", "phone", "guardianPhone", "email", "gym", "address", "createdAt", "updatedAt")
SELECT '424218509', COALESCE((SELECT "id" FROM u), (SELECT "id" FROM "User" WHERE "dni" = '424218509')), 'Lautaro', 'Rocamora', NULL, NULL, NULL, NULL, 'nan', NULL, NOW(), NOW()
ON CONFLICT ("dni") DO NOTHING;

WITH u AS (
  INSERT INTO "User" ("id", "dni", "passwordHash", "role", "status", "mustChangePassword", "createdAt", "updatedAt")
  VALUES ('5b75ebcd-3e07-4388-ba06-478389f8a2b0', '238325419', '$2a$10$c.byvFqsdEznzcPt9QTZPe/CrAl85j2LPvpi6u.d5vUM9fo9qOu7S', 'STUDENT', 'ACTIVE', true, NOW(), NOW())
  ON CONFLICT ("dni") DO NOTHING
  RETURNING "id"
)
INSERT INTO "Student" ("dni", "userId", "firstName", "lastName", "birthDate", "phone", "guardianPhone", "email", "gym", "address", "createdAt", "updatedAt")
SELECT '238325419', COALESCE((SELECT "id" FROM u), (SELECT "id" FROM "User" WHERE "dni" = '238325419')), 'Daniel', 'Dierna', NULL, NULL, NULL, NULL, 'nan', NULL, NOW(), NOW()
ON CONFLICT ("dni") DO NOTHING;

WITH u AS (
  INSERT INTO "User" ("id", "dni", "passwordHash", "role", "status", "mustChangePassword", "createdAt", "updatedAt")
  VALUES ('3e4b4f0f-25a1-4260-9641-51102414e86c', '440098729', '$2a$10$z3qye3G5mPDrwMaSQw1lKuXNzB9C9bibJSxm1MX5EzBCJFb5rCxle', 'STUDENT', 'ACTIVE', true, NOW(), NOW())
  ON CONFLICT ("dni") DO NOTHING
  RETURNING "id"
)
INSERT INTO "Student" ("dni", "userId", "firstName", "lastName", "birthDate", "phone", "guardianPhone", "email", "gym", "address", "createdAt", "updatedAt")
SELECT '440098729', COALESCE((SELECT "id" FROM u), (SELECT "id" FROM "User" WHERE "dni" = '440098729')), 'Laura', 'Castellanos', NULL, NULL, NULL, NULL, 'nan', NULL, NOW(), NOW()
ON CONFLICT ("dni") DO NOTHING;

WITH u AS (
  INSERT INTO "User" ("id", "dni", "passwordHash", "role", "status", "mustChangePassword", "createdAt", "updatedAt")
  VALUES ('6dedd4e1-2e69-4048-a635-a8a49f3c5c72', '441394369', '$2a$10$mBA/XVTvgh8LiyRMqHdh3.qyk8SPRgGXrPqGVmzSHh4yZIt2F/wEW', 'STUDENT', 'ACTIVE', true, NOW(), NOW())
  ON CONFLICT ("dni") DO NOTHING
  RETURNING "id"
)
INSERT INTO "Student" ("dni", "userId", "firstName", "lastName", "birthDate", "phone", "guardianPhone", "email", "gym", "address", "createdAt", "updatedAt")
SELECT '441394369', COALESCE((SELECT "id" FROM u), (SELECT "id" FROM "User" WHERE "dni" = '441394369')), 'Ignacio', 'Cornejo', NULL, NULL, NULL, NULL, 'nan', NULL, NOW(), NOW()
ON CONFLICT ("dni") DO NOTHING;

WITH u AS (
  INSERT INTO "User" ("id", "dni", "passwordHash", "role", "status", "mustChangePassword", "createdAt", "updatedAt")
  VALUES ('ef6636c7-b5f6-4f2e-8df0-5927412a14b3', '457189979', '$2a$10$71OrnEhCTw.afiR08ZMRB.LJSRphOCVx.OiHoNkHXIlNQxFbDKDp2', 'STUDENT', 'ACTIVE', true, NOW(), NOW())
  ON CONFLICT ("dni") DO NOTHING
  RETURNING "id"
)
INSERT INTO "Student" ("dni", "userId", "firstName", "lastName", "birthDate", "phone", "guardianPhone", "email", "gym", "address", "createdAt", "updatedAt")
SELECT '457189979', COALESCE((SELECT "id" FROM u), (SELECT "id" FROM "User" WHERE "dni" = '457189979')), 'Pedro', 'Rocamora', NULL, NULL, NULL, NULL, 'nan', NULL, NOW(), NOW()
ON CONFLICT ("dni") DO NOTHING;

WITH u AS (
  INSERT INTO "User" ("id", "dni", "passwordHash", "role", "status", "mustChangePassword", "createdAt", "updatedAt")
  VALUES ('f91f4938-b051-480c-8180-d7adcf042ad0', '484716719', '$2a$10$L.MVvOOBQ8jWqbx5AF4x4usd3RBwI8qFMLNO5RDo4/rNUrqpmfwHO', 'STUDENT', 'ACTIVE', true, NOW(), NOW())
  ON CONFLICT ("dni") DO NOTHING
  RETURNING "id"
)
INSERT INTO "Student" ("dni", "userId", "firstName", "lastName", "birthDate", "phone", "guardianPhone", "email", "gym", "address", "createdAt", "updatedAt")
SELECT '484716719', COALESCE((SELECT "id" FROM u), (SELECT "id" FROM "User" WHERE "dni" = '484716719')), 'Emiliano', 'Gomez', NULL, NULL, NULL, NULL, 'nan', NULL, NOW(), NOW()
ON CONFLICT ("dni") DO NOTHING;

WITH u AS (
  INSERT INTO "User" ("id", "dni", "passwordHash", "role", "status", "mustChangePassword", "createdAt", "updatedAt")
  VALUES ('aa979078-1f94-4200-ba1f-7b1082e4bbac', '466182419', '$2a$10$jjBoA6eg9s4aUzBaT4JjmOHzJhhYh7ceFoRwijgSkmwyVB7j4d/4.', 'STUDENT', 'ACTIVE', true, NOW(), NOW())
  ON CONFLICT ("dni") DO NOTHING
  RETURNING "id"
)
INSERT INTO "Student" ("dni", "userId", "firstName", "lastName", "birthDate", "phone", "guardianPhone", "email", "gym", "address", "createdAt", "updatedAt")
SELECT '466182419', COALESCE((SELECT "id" FROM u), (SELECT "id" FROM "User" WHERE "dni" = '466182419')), 'Nicolas', 'Epifani', NULL, NULL, NULL, NULL, 'nan', NULL, NOW(), NOW()
ON CONFLICT ("dni") DO NOTHING;

WITH u AS (
  INSERT INTO "User" ("id", "dni", "passwordHash", "role", "status", "mustChangePassword", "createdAt", "updatedAt")
  VALUES ('a310d464-ece0-40fb-8328-9ccdd9b3cccc', '480776979', '$2a$10$JD925nMYXZhUaL0QF9W9ReXmc0CJjrPnRp3zRyI5lw7sTcquYnN8u', 'STUDENT', 'ACTIVE', true, NOW(), NOW())
  ON CONFLICT ("dni") DO NOTHING
  RETURNING "id"
)
INSERT INTO "Student" ("dni", "userId", "firstName", "lastName", "birthDate", "phone", "guardianPhone", "email", "gym", "address", "createdAt", "updatedAt")
SELECT '480776979', COALESCE((SELECT "id" FROM u), (SELECT "id" FROM "User" WHERE "dni" = '480776979')), 'Leonel', 'Sosa', NULL, NULL, NULL, NULL, 'nan', NULL, NOW(), NOW()
ON CONFLICT ("dni") DO NOTHING;

COMMIT;