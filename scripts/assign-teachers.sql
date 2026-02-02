-- Auto-generated assignments
BEGIN;
WITH t AS (
  SELECT "id" FROM "Teacher" WHERE "userId" IN (SELECT "id" FROM "User" WHERE "dni" = '44009872')
), s AS (
  SELECT "dni" FROM "Student" WHERE "dni" = '55926268'
)
INSERT INTO "StudentTeacherAssignment" ("id", "studentDni", "teacherId", "startAt", "active")
SELECT gen_random_uuid(), s."dni", t."id", NOW(), true FROM s, t
ON CONFLICT DO NOTHING;

WITH t AS (
  SELECT "id" FROM "Teacher" WHERE "userId" IN (SELECT "id" FROM "User" WHERE "dni" = '44009872')
), s AS (
  SELECT "dni" FROM "Student" WHERE "dni" = '57370540'
)
INSERT INTO "StudentTeacherAssignment" ("id", "studentDni", "teacherId", "startAt", "active")
SELECT gen_random_uuid(), s."dni", t."id", NOW(), true FROM s, t
ON CONFLICT DO NOTHING;

WITH t AS (
  SELECT "id" FROM "Teacher" WHERE "userId" IN (SELECT "id" FROM "User" WHERE "dni" = '44009872')
), s AS (
  SELECT "dni" FROM "Student" WHERE "dni" = '49400559'
)
INSERT INTO "StudentTeacherAssignment" ("id", "studentDni", "teacherId", "startAt", "active")
SELECT gen_random_uuid(), s."dni", t."id", NOW(), true FROM s, t
ON CONFLICT DO NOTHING;

WITH t AS (
  SELECT "id" FROM "Teacher" WHERE "userId" IN (SELECT "id" FROM "User" WHERE "dni" = '44009872')
), s AS (
  SELECT "dni" FROM "Student" WHERE "dni" = '51189443'
)
INSERT INTO "StudentTeacherAssignment" ("id", "studentDni", "teacherId", "startAt", "active")
SELECT gen_random_uuid(), s."dni", t."id", NOW(), true FROM s, t
ON CONFLICT DO NOTHING;

WITH t AS (
  SELECT "id" FROM "Teacher" WHERE "userId" IN (SELECT "id" FROM "User" WHERE "dni" = '44009872')
), s AS (
  SELECT "dni" FROM "Student" WHERE "dni" = '55545110'
)
INSERT INTO "StudentTeacherAssignment" ("id", "studentDni", "teacherId", "startAt", "active")
SELECT gen_random_uuid(), s."dni", t."id", NOW(), true FROM s, t
ON CONFLICT DO NOTHING;

WITH t AS (
  SELECT "id" FROM "Teacher" WHERE "userId" IN (SELECT "id" FROM "User" WHERE "dni" = '44009872')
), s AS (
  SELECT "dni" FROM "Student" WHERE "dni" = '55380219'
)
INSERT INTO "StudentTeacherAssignment" ("id", "studentDni", "teacherId", "startAt", "active")
SELECT gen_random_uuid(), s."dni", t."id", NOW(), true FROM s, t
ON CONFLICT DO NOTHING;

WITH t AS (
  SELECT "id" FROM "Teacher" WHERE "userId" IN (SELECT "id" FROM "User" WHERE "dni" = '44009872')
), s AS (
  SELECT "dni" FROM "Student" WHERE "dni" = '55380220'
)
INSERT INTO "StudentTeacherAssignment" ("id", "studentDni", "teacherId", "startAt", "active")
SELECT gen_random_uuid(), s."dni", t."id", NOW(), true FROM s, t
ON CONFLICT DO NOTHING;

WITH t AS (
  SELECT "id" FROM "Teacher" WHERE "userId" IN (SELECT "id" FROM "User" WHERE "dni" = '44009872')
), s AS (
  SELECT "dni" FROM "Student" WHERE "dni" = '53942626'
)
INSERT INTO "StudentTeacherAssignment" ("id", "studentDni", "teacherId", "startAt", "active")
SELECT gen_random_uuid(), s."dni", t."id", NOW(), true FROM s, t
ON CONFLICT DO NOTHING;

WITH t AS (
  SELECT "id" FROM "Teacher" WHERE "userId" IN (SELECT "id" FROM "User" WHERE "dni" = '44009872')
), s AS (
  SELECT "dni" FROM "Student" WHERE "dni" = '54923846'
)
INSERT INTO "StudentTeacherAssignment" ("id", "studentDni", "teacherId", "startAt", "active")
SELECT gen_random_uuid(), s."dni", t."id", NOW(), true FROM s, t
ON CONFLICT DO NOTHING;

WITH t AS (
  SELECT "id" FROM "Teacher" WHERE "userId" IN (SELECT "id" FROM "User" WHERE "dni" = '44009872')
), s AS (
  SELECT "dni" FROM "Student" WHERE "dni" = '56086377'
)
INSERT INTO "StudentTeacherAssignment" ("id", "studentDni", "teacherId", "startAt", "active")
SELECT gen_random_uuid(), s."dni", t."id", NOW(), true FROM s, t
ON CONFLICT DO NOTHING;

WITH t AS (
  SELECT "id" FROM "Teacher" WHERE "userId" IN (SELECT "id" FROM "User" WHERE "dni" = '44009872')
), s AS (
  SELECT "dni" FROM "Student" WHERE "dni" = '45529902'
)
INSERT INTO "StudentTeacherAssignment" ("id", "studentDni", "teacherId", "startAt", "active")
SELECT gen_random_uuid(), s."dni", t."id", NOW(), true FROM s, t
ON CONFLICT DO NOTHING;

WITH t AS (
  SELECT "id" FROM "Teacher" WHERE "userId" IN (SELECT "id" FROM "User" WHERE "dni" = '44009872')
), s AS (
  SELECT "dni" FROM "Student" WHERE "dni" = '46172388'
)
INSERT INTO "StudentTeacherAssignment" ("id", "studentDni", "teacherId", "startAt", "active")
SELECT gen_random_uuid(), s."dni", t."id", NOW(), true FROM s, t
ON CONFLICT DO NOTHING;

WITH t AS (
  SELECT "id" FROM "Teacher" WHERE "userId" IN (SELECT "id" FROM "User" WHERE "dni" = '44009872')
), s AS (
  SELECT "dni" FROM "Student" WHERE "dni" = '44986637'
)
INSERT INTO "StudentTeacherAssignment" ("id", "studentDni", "teacherId", "startAt", "active")
SELECT gen_random_uuid(), s."dni", t."id", NOW(), true FROM s, t
ON CONFLICT DO NOTHING;

WITH t AS (
  SELECT "id" FROM "Teacher" WHERE "userId" IN (SELECT "id" FROM "User" WHERE "dni" = '44009872')
), s AS (
  SELECT "dni" FROM "Student" WHERE "dni" = '52940656'
)
INSERT INTO "StudentTeacherAssignment" ("id", "studentDni", "teacherId", "startAt", "active")
SELECT gen_random_uuid(), s."dni", t."id", NOW(), true FROM s, t
ON CONFLICT DO NOTHING;

WITH t AS (
  SELECT "id" FROM "Teacher" WHERE "userId" IN (SELECT "id" FROM "User" WHERE "dni" = '44009872')
), s AS (
  SELECT "dni" FROM "Student" WHERE "dni" = '51187268'
)
INSERT INTO "StudentTeacherAssignment" ("id", "studentDni", "teacherId", "startAt", "active")
SELECT gen_random_uuid(), s."dni", t."id", NOW(), true FROM s, t
ON CONFLICT DO NOTHING;

WITH t AS (
  SELECT "id" FROM "Teacher" WHERE "userId" IN (SELECT "id" FROM "User" WHERE "dni" = '44009872')
), s AS (
  SELECT "dni" FROM "Student" WHERE "dni" = '39603413'
)
INSERT INTO "StudentTeacherAssignment" ("id", "studentDni", "teacherId", "startAt", "active")
SELECT gen_random_uuid(), s."dni", t."id", NOW(), true FROM s, t
ON CONFLICT DO NOTHING;

WITH t AS (
  SELECT "id" FROM "Teacher" WHERE "userId" IN (SELECT "id" FROM "User" WHERE "dni" = '48077697')
), s AS (
  SELECT "dni" FROM "Student" WHERE "dni" = '53491133'
)
INSERT INTO "StudentTeacherAssignment" ("id", "studentDni", "teacherId", "startAt", "active")
SELECT gen_random_uuid(), s."dni", t."id", NOW(), true FROM s, t
ON CONFLICT DO NOTHING;

WITH t AS (
  SELECT "id" FROM "Teacher" WHERE "userId" IN (SELECT "id" FROM "User" WHERE "dni" = '48077697')
), s AS (
  SELECT "dni" FROM "Student" WHERE "dni" = '48257060'
)
INSERT INTO "StudentTeacherAssignment" ("id", "studentDni", "teacherId", "startAt", "active")
SELECT gen_random_uuid(), s."dni", t."id", NOW(), true FROM s, t
ON CONFLICT DO NOTHING;

WITH t AS (
  SELECT "id" FROM "Teacher" WHERE "userId" IN (SELECT "id" FROM "User" WHERE "dni" = '48077697')
), s AS (
  SELECT "dni" FROM "Student" WHERE "dni" = '52291679'
)
INSERT INTO "StudentTeacherAssignment" ("id", "studentDni", "teacherId", "startAt", "active")
SELECT gen_random_uuid(), s."dni", t."id", NOW(), true FROM s, t
ON CONFLICT DO NOTHING;

WITH t AS (
  SELECT "id" FROM "Teacher" WHERE "userId" IN (SELECT "id" FROM "User" WHERE "dni" = '48077697')
), s AS (
  SELECT "dni" FROM "Student" WHERE "dni" = '47809490'
)
INSERT INTO "StudentTeacherAssignment" ("id", "studentDni", "teacherId", "startAt", "active")
SELECT gen_random_uuid(), s."dni", t."id", NOW(), true FROM s, t
ON CONFLICT DO NOTHING;

WITH t AS (
  SELECT "id" FROM "Teacher" WHERE "userId" IN (SELECT "id" FROM "User" WHERE "dni" = '48077697')
), s AS (
  SELECT "dni" FROM "Student" WHERE "dni" = '56804273'
)
INSERT INTO "StudentTeacherAssignment" ("id", "studentDni", "teacherId", "startAt", "active")
SELECT gen_random_uuid(), s."dni", t."id", NOW(), true FROM s, t
ON CONFLICT DO NOTHING;

WITH t AS (
  SELECT "id" FROM "Teacher" WHERE "userId" IN (SELECT "id" FROM "User" WHERE "dni" = '48077697')
), s AS (
  SELECT "dni" FROM "Student" WHERE "dni" = '50711560'
)
INSERT INTO "StudentTeacherAssignment" ("id", "studentDni", "teacherId", "startAt", "active")
SELECT gen_random_uuid(), s."dni", t."id", NOW(), true FROM s, t
ON CONFLICT DO NOTHING;

WITH t AS (
  SELECT "id" FROM "Teacher" WHERE "userId" IN (SELECT "id" FROM "User" WHERE "dni" = '48077697')
), s AS (
  SELECT "dni" FROM "Student" WHERE "dni" = '52933870'
)
INSERT INTO "StudentTeacherAssignment" ("id", "studentDni", "teacherId", "startAt", "active")
SELECT gen_random_uuid(), s."dni", t."id", NOW(), true FROM s, t
ON CONFLICT DO NOTHING;

WITH t AS (
  SELECT "id" FROM "Teacher" WHERE "userId" IN (SELECT "id" FROM "User" WHERE "dni" = '24442147')
), s AS (
  SELECT "dni" FROM "Student" WHERE "dni" = '51013051'
)
INSERT INTO "StudentTeacherAssignment" ("id", "studentDni", "teacherId", "startAt", "active")
SELECT gen_random_uuid(), s."dni", t."id", NOW(), true FROM s, t
ON CONFLICT DO NOTHING;

WITH t AS (
  SELECT "id" FROM "Teacher" WHERE "userId" IN (SELECT "id" FROM "User" WHERE "dni" = '24442147')
), s AS (
  SELECT "dni" FROM "Student" WHERE "dni" = '12128733'
)
INSERT INTO "StudentTeacherAssignment" ("id", "studentDni", "teacherId", "startAt", "active")
SELECT gen_random_uuid(), s."dni", t."id", NOW(), true FROM s, t
ON CONFLICT DO NOTHING;

WITH t AS (
  SELECT "id" FROM "Teacher" WHERE "userId" IN (SELECT "id" FROM "User" WHERE "dni" = '24442147')
), s AS (
  SELECT "dni" FROM "Student" WHERE "dni" = '54689426'
)
INSERT INTO "StudentTeacherAssignment" ("id", "studentDni", "teacherId", "startAt", "active")
SELECT gen_random_uuid(), s."dni", t."id", NOW(), true FROM s, t
ON CONFLICT DO NOTHING;

WITH t AS (
  SELECT "id" FROM "Teacher" WHERE "userId" IN (SELECT "id" FROM "User" WHERE "dni" = '24442147')
), s AS (
  SELECT "dni" FROM "Student" WHERE "dni" = '56473408'
)
INSERT INTO "StudentTeacherAssignment" ("id", "studentDni", "teacherId", "startAt", "active")
SELECT gen_random_uuid(), s."dni", t."id", NOW(), true FROM s, t
ON CONFLICT DO NOTHING;

WITH t AS (
  SELECT "id" FROM "Teacher" WHERE "userId" IN (SELECT "id" FROM "User" WHERE "dni" = '47611267')
), s AS (
  SELECT "dni" FROM "Student" WHERE "dni" = '56546784'
)
INSERT INTO "StudentTeacherAssignment" ("id", "studentDni", "teacherId", "startAt", "active")
SELECT gen_random_uuid(), s."dni", t."id", NOW(), true FROM s, t
ON CONFLICT DO NOTHING;

WITH t AS (
  SELECT "id" FROM "Teacher" WHERE "userId" IN (SELECT "id" FROM "User" WHERE "dni" = '47611267')
), s AS (
  SELECT "dni" FROM "Student" WHERE "dni" = '53940380'
)
INSERT INTO "StudentTeacherAssignment" ("id", "studentDni", "teacherId", "startAt", "active")
SELECT gen_random_uuid(), s."dni", t."id", NOW(), true FROM s, t
ON CONFLICT DO NOTHING;

WITH t AS (
  SELECT "id" FROM "Teacher" WHERE "userId" IN (SELECT "id" FROM "User" WHERE "dni" = '47611267')
), s AS (
  SELECT "dni" FROM "Student" WHERE "dni" = '53159566'
)
INSERT INTO "StudentTeacherAssignment" ("id", "studentDni", "teacherId", "startAt", "active")
SELECT gen_random_uuid(), s."dni", t."id", NOW(), true FROM s, t
ON CONFLICT DO NOTHING;

WITH t AS (
  SELECT "id" FROM "Teacher" WHERE "userId" IN (SELECT "id" FROM "User" WHERE "dni" = '47611267')
), s AS (
  SELECT "dni" FROM "Student" WHERE "dni" = '55705051'
)
INSERT INTO "StudentTeacherAssignment" ("id", "studentDni", "teacherId", "startAt", "active")
SELECT gen_random_uuid(), s."dni", t."id", NOW(), true FROM s, t
ON CONFLICT DO NOTHING;

WITH t AS (
  SELECT "id" FROM "Teacher" WHERE "userId" IN (SELECT "id" FROM "User" WHERE "dni" = '47611267')
), s AS (
  SELECT "dni" FROM "Student" WHERE "dni" = '53312211'
)
INSERT INTO "StudentTeacherAssignment" ("id", "studentDni", "teacherId", "startAt", "active")
SELECT gen_random_uuid(), s."dni", t."id", NOW(), true FROM s, t
ON CONFLICT DO NOTHING;

WITH t AS (
  SELECT "id" FROM "Teacher" WHERE "userId" IN (SELECT "id" FROM "User" WHERE "dni" = '47611267')
), s AS (
  SELECT "dni" FROM "Student" WHERE "dni" = '53939772'
)
INSERT INTO "StudentTeacherAssignment" ("id", "studentDni", "teacherId", "startAt", "active")
SELECT gen_random_uuid(), s."dni", t."id", NOW(), true FROM s, t
ON CONFLICT DO NOTHING;

WITH t AS (
  SELECT "id" FROM "Teacher" WHERE "userId" IN (SELECT "id" FROM "User" WHERE "dni" = '48471671')
), s AS (
  SELECT "dni" FROM "Student" WHERE "dni" = '59465501'
)
INSERT INTO "StudentTeacherAssignment" ("id", "studentDni", "teacherId", "startAt", "active")
SELECT gen_random_uuid(), s."dni", t."id", NOW(), true FROM s, t
ON CONFLICT DO NOTHING;

WITH t AS (
  SELECT "id" FROM "Teacher" WHERE "userId" IN (SELECT "id" FROM "User" WHERE "dni" = '48471671')
), s AS (
  SELECT "dni" FROM "Student" WHERE "dni" = '57365396'
)
INSERT INTO "StudentTeacherAssignment" ("id", "studentDni", "teacherId", "startAt", "active")
SELECT gen_random_uuid(), s."dni", t."id", NOW(), true FROM s, t
ON CONFLICT DO NOTHING;

WITH t AS (
  SELECT "id" FROM "Teacher" WHERE "userId" IN (SELECT "id" FROM "User" WHERE "dni" = '48471671')
), s AS (
  SELECT "dni" FROM "Student" WHERE "dni" = '56471048'
)
INSERT INTO "StudentTeacherAssignment" ("id", "studentDni", "teacherId", "startAt", "active")
SELECT gen_random_uuid(), s."dni", t."id", NOW(), true FROM s, t
ON CONFLICT DO NOTHING;

WITH t AS (
  SELECT "id" FROM "Teacher" WHERE "userId" IN (SELECT "id" FROM "User" WHERE "dni" = '45717540')
), s AS (
  SELECT "dni" FROM "Student" WHERE "dni" = '50513921'
)
INSERT INTO "StudentTeacherAssignment" ("id", "studentDni", "teacherId", "startAt", "active")
SELECT gen_random_uuid(), s."dni", t."id", NOW(), true FROM s, t
ON CONFLICT DO NOTHING;

WITH t AS (
  SELECT "id" FROM "Teacher" WHERE "userId" IN (SELECT "id" FROM "User" WHERE "dni" = '45717540')
), s AS (
  SELECT "dni" FROM "Student" WHERE "dni" = '55135701'
)
INSERT INTO "StudentTeacherAssignment" ("id", "studentDni", "teacherId", "startAt", "active")
SELECT gen_random_uuid(), s."dni", t."id", NOW(), true FROM s, t
ON CONFLICT DO NOTHING;

WITH t AS (
  SELECT "id" FROM "Teacher" WHERE "userId" IN (SELECT "id" FROM "User" WHERE "dni" = '45717540')
), s AS (
  SELECT "dni" FROM "Student" WHERE "dni" = '56083711'
)
INSERT INTO "StudentTeacherAssignment" ("id", "studentDni", "teacherId", "startAt", "active")
SELECT gen_random_uuid(), s."dni", t."id", NOW(), true FROM s, t
ON CONFLICT DO NOTHING;

WITH t AS (
  SELECT "id" FROM "Teacher" WHERE "userId" IN (SELECT "id" FROM "User" WHERE "dni" = '45717540')
), s AS (
  SELECT "dni" FROM "Student" WHERE "dni" = '53489485'
)
INSERT INTO "StudentTeacherAssignment" ("id", "studentDni", "teacherId", "startAt", "active")
SELECT gen_random_uuid(), s."dni", t."id", NOW(), true FROM s, t
ON CONFLICT DO NOTHING;

WITH t AS (
  SELECT "id" FROM "Teacher" WHERE "userId" IN (SELECT "id" FROM "User" WHERE "dni" = '45717540')
), s AS (
  SELECT "dni" FROM "Student" WHERE "dni" = '56292977'
)
INSERT INTO "StudentTeacherAssignment" ("id", "studentDni", "teacherId", "startAt", "active")
SELECT gen_random_uuid(), s."dni", t."id", NOW(), true FROM s, t
ON CONFLICT DO NOTHING;

WITH t AS (
  SELECT "id" FROM "Teacher" WHERE "userId" IN (SELECT "id" FROM "User" WHERE "dni" = '45717540')
), s AS (
  SELECT "dni" FROM "Student" WHERE "dni" = '53484912'
)
INSERT INTO "StudentTeacherAssignment" ("id", "studentDni", "teacherId", "startAt", "active")
SELECT gen_random_uuid(), s."dni", t."id", NOW(), true FROM s, t
ON CONFLICT DO NOTHING;

WITH t AS (
  SELECT "id" FROM "Teacher" WHERE "userId" IN (SELECT "id" FROM "User" WHERE "dni" = '45717540')
), s AS (
  SELECT "dni" FROM "Student" WHERE "dni" = '54169939'
)
INSERT INTO "StudentTeacherAssignment" ("id", "studentDni", "teacherId", "startAt", "active")
SELECT gen_random_uuid(), s."dni", t."id", NOW(), true FROM s, t
ON CONFLICT DO NOTHING;

WITH t AS (
  SELECT "id" FROM "Teacher" WHERE "userId" IN (SELECT "id" FROM "User" WHERE "dni" = '45717540')
), s AS (
  SELECT "dni" FROM "Student" WHERE "dni" = '52934195'
)
INSERT INTO "StudentTeacherAssignment" ("id", "studentDni", "teacherId", "startAt", "active")
SELECT gen_random_uuid(), s."dni", t."id", NOW(), true FROM s, t
ON CONFLICT DO NOTHING;

WITH t AS (
  SELECT "id" FROM "Teacher" WHERE "userId" IN (SELECT "id" FROM "User" WHERE "dni" = '45717540')
), s AS (
  SELECT "dni" FROM "Student" WHERE "dni" = '53483330'
)
INSERT INTO "StudentTeacherAssignment" ("id", "studentDni", "teacherId", "startAt", "active")
SELECT gen_random_uuid(), s."dni", t."id", NOW(), true FROM s, t
ON CONFLICT DO NOTHING;

WITH t AS (
  SELECT "id" FROM "Teacher" WHERE "userId" IN (SELECT "id" FROM "User" WHERE "dni" = '45717540')
), s AS (
  SELECT "dni" FROM "Student" WHERE "dni" = '53666945'
)
INSERT INTO "StudentTeacherAssignment" ("id", "studentDni", "teacherId", "startAt", "active")
SELECT gen_random_uuid(), s."dni", t."id", NOW(), true FROM s, t
ON CONFLICT DO NOTHING;

WITH t AS (
  SELECT "id" FROM "Teacher" WHERE "userId" IN (SELECT "id" FROM "User" WHERE "dni" = '45717540')
), s AS (
  SELECT "dni" FROM "Student" WHERE "dni" = '53153705'
)
INSERT INTO "StudentTeacherAssignment" ("id", "studentDni", "teacherId", "startAt", "active")
SELECT gen_random_uuid(), s."dni", t."id", NOW(), true FROM s, t
ON CONFLICT DO NOTHING;

WITH t AS (
  SELECT "id" FROM "Teacher" WHERE "userId" IN (SELECT "id" FROM "User" WHERE "dni" = '45717540')
), s AS (
  SELECT "dni" FROM "Student" WHERE "dni" = '92475846'
)
INSERT INTO "StudentTeacherAssignment" ("id", "studentDni", "teacherId", "startAt", "active")
SELECT gen_random_uuid(), s."dni", t."id", NOW(), true FROM s, t
ON CONFLICT DO NOTHING;

WITH t AS (
  SELECT "id" FROM "Teacher" WHERE "userId" IN (SELECT "id" FROM "User" WHERE "dni" = '45717540')
), s AS (
  SELECT "dni" FROM "Student" WHERE "dni" = '55255650'
)
INSERT INTO "StudentTeacherAssignment" ("id", "studentDni", "teacherId", "startAt", "active")
SELECT gen_random_uuid(), s."dni", t."id", NOW(), true FROM s, t
ON CONFLICT DO NOTHING;

WITH t AS (
  SELECT "id" FROM "Teacher" WHERE "userId" IN (SELECT "id" FROM "User" WHERE "dni" = '45717540')
), s AS (
  SELECT "dni" FROM "Student" WHERE "dni" = '47448840'
)
INSERT INTO "StudentTeacherAssignment" ("id", "studentDni", "teacherId", "startAt", "active")
SELECT gen_random_uuid(), s."dni", t."id", NOW(), true FROM s, t
ON CONFLICT DO NOTHING;

WITH t AS (
  SELECT "id" FROM "Teacher" WHERE "userId" IN (SELECT "id" FROM "User" WHERE "dni" = '45717540')
), s AS (
  SELECT "dni" FROM "Student" WHERE "dni" = '32652371'
)
INSERT INTO "StudentTeacherAssignment" ("id", "studentDni", "teacherId", "startAt", "active")
SELECT gen_random_uuid(), s."dni", t."id", NOW(), true FROM s, t
ON CONFLICT DO NOTHING;

WITH t AS (
  SELECT "id" FROM "Teacher" WHERE "userId" IN (SELECT "id" FROM "User" WHERE "dni" = '45717540')
), s AS (
  SELECT "dni" FROM "Student" WHERE "dni" = '56086927'
)
INSERT INTO "StudentTeacherAssignment" ("id", "studentDni", "teacherId", "startAt", "active")
SELECT gen_random_uuid(), s."dni", t."id", NOW(), true FROM s, t
ON CONFLICT DO NOTHING;

WITH t AS (
  SELECT "id" FROM "Teacher" WHERE "userId" IN (SELECT "id" FROM "User" WHERE "dni" = '45717540')
), s AS (
  SELECT "dni" FROM "Student" WHERE "dni" = '94221997'
)
INSERT INTO "StudentTeacherAssignment" ("id", "studentDni", "teacherId", "startAt", "active")
SELECT gen_random_uuid(), s."dni", t."id", NOW(), true FROM s, t
ON CONFLICT DO NOTHING;

WITH t AS (
  SELECT "id" FROM "Teacher" WHERE "userId" IN (SELECT "id" FROM "User" WHERE "dni" = '45717540')
), s AS (
  SELECT "dni" FROM "Student" WHERE "dni" = '51189989'
)
INSERT INTO "StudentTeacherAssignment" ("id", "studentDni", "teacherId", "startAt", "active")
SELECT gen_random_uuid(), s."dni", t."id", NOW(), true FROM s, t
ON CONFLICT DO NOTHING;

WITH t AS (
  SELECT "id" FROM "Teacher" WHERE "userId" IN (SELECT "id" FROM "User" WHERE "dni" = '45717540')
), s AS (
  SELECT "dni" FROM "Student" WHERE "dni" = '52518477'
)
INSERT INTO "StudentTeacherAssignment" ("id", "studentDni", "teacherId", "startAt", "active")
SELECT gen_random_uuid(), s."dni", t."id", NOW(), true FROM s, t
ON CONFLICT DO NOTHING;

WITH t AS (
  SELECT "id" FROM "Teacher" WHERE "userId" IN (SELECT "id" FROM "User" WHERE "dni" = '45717540')
), s AS (
  SELECT "dni" FROM "Student" WHERE "dni" = '54436361'
)
INSERT INTO "StudentTeacherAssignment" ("id", "studentDni", "teacherId", "startAt", "active")
SELECT gen_random_uuid(), s."dni", t."id", NOW(), true FROM s, t
ON CONFLICT DO NOTHING;

WITH t AS (
  SELECT "id" FROM "Teacher" WHERE "userId" IN (SELECT "id" FROM "User" WHERE "dni" = '45717540')
), s AS (
  SELECT "dni" FROM "Student" WHERE "dni" = '54922715'
)
INSERT INTO "StudentTeacherAssignment" ("id", "studentDni", "teacherId", "startAt", "active")
SELECT gen_random_uuid(), s."dni", t."id", NOW(), true FROM s, t
ON CONFLICT DO NOTHING;

WITH t AS (
  SELECT "id" FROM "Teacher" WHERE "userId" IN (SELECT "id" FROM "User" WHERE "dni" = '45717540')
), s AS (
  SELECT "dni" FROM "Student" WHERE "dni" = '57793939'
)
INSERT INTO "StudentTeacherAssignment" ("id", "studentDni", "teacherId", "startAt", "active")
SELECT gen_random_uuid(), s."dni", t."id", NOW(), true FROM s, t
ON CONFLICT DO NOTHING;

WITH t AS (
  SELECT "id" FROM "Teacher" WHERE "userId" IN (SELECT "id" FROM "User" WHERE "dni" = '45717540')
), s AS (
  SELECT "dni" FROM "Student" WHERE "dni" = '56700350'
)
INSERT INTO "StudentTeacherAssignment" ("id", "studentDni", "teacherId", "startAt", "active")
SELECT gen_random_uuid(), s."dni", t."id", NOW(), true FROM s, t
ON CONFLICT DO NOTHING;

WITH t AS (
  SELECT "id" FROM "Teacher" WHERE "userId" IN (SELECT "id" FROM "User" WHERE "dni" = '45717540')
), s AS (
  SELECT "dni" FROM "Student" WHERE "dni" = '55135185'
)
INSERT INTO "StudentTeacherAssignment" ("id", "studentDni", "teacherId", "startAt", "active")
SELECT gen_random_uuid(), s."dni", t."id", NOW(), true FROM s, t
ON CONFLICT DO NOTHING;

WITH t AS (
  SELECT "id" FROM "Teacher" WHERE "userId" IN (SELECT "id" FROM "User" WHERE "dni" = '45717540')
), s AS (
  SELECT "dni" FROM "Student" WHERE "dni" = '57614825'
)
INSERT INTO "StudentTeacherAssignment" ("id", "studentDni", "teacherId", "startAt", "active")
SELECT gen_random_uuid(), s."dni", t."id", NOW(), true FROM s, t
ON CONFLICT DO NOTHING;

WITH t AS (
  SELECT "id" FROM "Teacher" WHERE "userId" IN (SELECT "id" FROM "User" WHERE "dni" = '45717540')
), s AS (
  SELECT "dni" FROM "Student" WHERE "dni" = '57614824'
)
INSERT INTO "StudentTeacherAssignment" ("id", "studentDni", "teacherId", "startAt", "active")
SELECT gen_random_uuid(), s."dni", t."id", NOW(), true FROM s, t
ON CONFLICT DO NOTHING;

WITH t AS (
  SELECT "id" FROM "Teacher" WHERE "userId" IN (SELECT "id" FROM "User" WHERE "dni" = '45717540')
), s AS (
  SELECT "dni" FROM "Student" WHERE "dni" = '56084893'
)
INSERT INTO "StudentTeacherAssignment" ("id", "studentDni", "teacherId", "startAt", "active")
SELECT gen_random_uuid(), s."dni", t."id", NOW(), true FROM s, t
ON CONFLICT DO NOTHING;

WITH t AS (
  SELECT "id" FROM "Teacher" WHERE "userId" IN (SELECT "id" FROM "User" WHERE "dni" = '45717540')
), s AS (
  SELECT "dni" FROM "Student" WHERE "dni" = '54171434'
)
INSERT INTO "StudentTeacherAssignment" ("id", "studentDni", "teacherId", "startAt", "active")
SELECT gen_random_uuid(), s."dni", t."id", NOW(), true FROM s, t
ON CONFLICT DO NOTHING;

WITH t AS (
  SELECT "id" FROM "Teacher" WHERE "userId" IN (SELECT "id" FROM "User" WHERE "dni" = '45717540')
), s AS (
  SELECT "dni" FROM "Student" WHERE "dni" = '50377727'
)
INSERT INTO "StudentTeacherAssignment" ("id", "studentDni", "teacherId", "startAt", "active")
SELECT gen_random_uuid(), s."dni", t."id", NOW(), true FROM s, t
ON CONFLICT DO NOTHING;

WITH t AS (
  SELECT "id" FROM "Teacher" WHERE "userId" IN (SELECT "id" FROM "User" WHERE "dni" = '45717540')
), s AS (
  SELECT "dni" FROM "Student" WHERE "dni" = '57121557'
)
INSERT INTO "StudentTeacherAssignment" ("id", "studentDni", "teacherId", "startAt", "active")
SELECT gen_random_uuid(), s."dni", t."id", NOW(), true FROM s, t
ON CONFLICT DO NOTHING;

WITH t AS (
  SELECT "id" FROM "Teacher" WHERE "userId" IN (SELECT "id" FROM "User" WHERE "dni" = '45717540')
), s AS (
  SELECT "dni" FROM "Student" WHERE "dni" = '53938310'
)
INSERT INTO "StudentTeacherAssignment" ("id", "studentDni", "teacherId", "startAt", "active")
SELECT gen_random_uuid(), s."dni", t."id", NOW(), true FROM s, t
ON CONFLICT DO NOTHING;

WITH t AS (
  SELECT "id" FROM "Teacher" WHERE "userId" IN (SELECT "id" FROM "User" WHERE "dni" = '48607535')
), s AS (
  SELECT "dni" FROM "Student" WHERE "dni" = '47928329'
)
INSERT INTO "StudentTeacherAssignment" ("id", "studentDni", "teacherId", "startAt", "active")
SELECT gen_random_uuid(), s."dni", t."id", NOW(), true FROM s, t
ON CONFLICT DO NOTHING;

WITH t AS (
  SELECT "id" FROM "Teacher" WHERE "userId" IN (SELECT "id" FROM "User" WHERE "dni" = '45718997')
), s AS (
  SELECT "dni" FROM "Student" WHERE "dni" = '57796761'
)
INSERT INTO "StudentTeacherAssignment" ("id", "studentDni", "teacherId", "startAt", "active")
SELECT gen_random_uuid(), s."dni", t."id", NOW(), true FROM s, t
ON CONFLICT DO NOTHING;

WITH t AS (
  SELECT "id" FROM "Teacher" WHERE "userId" IN (SELECT "id" FROM "User" WHERE "dni" = '45718997')
), s AS (
  SELECT "dni" FROM "Student" WHERE "dni" = '56700450'
)
INSERT INTO "StudentTeacherAssignment" ("id", "studentDni", "teacherId", "startAt", "active")
SELECT gen_random_uuid(), s."dni", t."id", NOW(), true FROM s, t
ON CONFLICT DO NOTHING;

WITH t AS (
  SELECT "id" FROM "Teacher" WHERE "userId" IN (SELECT "id" FROM "User" WHERE "dni" = '45718997')
), s AS (
  SELECT "dni" FROM "Student" WHERE "dni" = '49923174'
)
INSERT INTO "StudentTeacherAssignment" ("id", "studentDni", "teacherId", "startAt", "active")
SELECT gen_random_uuid(), s."dni", t."id", NOW(), true FROM s, t
ON CONFLICT DO NOTHING;

WITH t AS (
  SELECT "id" FROM "Teacher" WHERE "userId" IN (SELECT "id" FROM "User" WHERE "dni" = '45718997')
), s AS (
  SELECT "dni" FROM "Student" WHERE "dni" = '51318581'
)
INSERT INTO "StudentTeacherAssignment" ("id", "studentDni", "teacherId", "startAt", "active")
SELECT gen_random_uuid(), s."dni", t."id", NOW(), true FROM s, t
ON CONFLICT DO NOTHING;

WITH t AS (
  SELECT "id" FROM "Teacher" WHERE "userId" IN (SELECT "id" FROM "User" WHERE "dni" = '45718997')
), s AS (
  SELECT "dni" FROM "Student" WHERE "dni" = '53484003'
)
INSERT INTO "StudentTeacherAssignment" ("id", "studentDni", "teacherId", "startAt", "active")
SELECT gen_random_uuid(), s."dni", t."id", NOW(), true FROM s, t
ON CONFLICT DO NOTHING;

WITH t AS (
  SELECT "id" FROM "Teacher" WHERE "userId" IN (SELECT "id" FROM "User" WHERE "dni" = '45718997')
), s AS (
  SELECT "dni" FROM "Student" WHERE "dni" = '34370493'
)
INSERT INTO "StudentTeacherAssignment" ("id", "studentDni", "teacherId", "startAt", "active")
SELECT gen_random_uuid(), s."dni", t."id", NOW(), true FROM s, t
ON CONFLICT DO NOTHING;

WITH t AS (
  SELECT "id" FROM "Teacher" WHERE "userId" IN (SELECT "id" FROM "User" WHERE "dni" = '45718997')
), s AS (
  SELECT "dni" FROM "Student" WHERE "dni" = '49787262'
)
INSERT INTO "StudentTeacherAssignment" ("id", "studentDni", "teacherId", "startAt", "active")
SELECT gen_random_uuid(), s."dni", t."id", NOW(), true FROM s, t
ON CONFLICT DO NOTHING;

WITH t AS (
  SELECT "id" FROM "Teacher" WHERE "userId" IN (SELECT "id" FROM "User" WHERE "dni" = '45718997')
), s AS (
  SELECT "dni" FROM "Student" WHERE "dni" = '51090502'
)
INSERT INTO "StudentTeacherAssignment" ("id", "studentDni", "teacherId", "startAt", "active")
SELECT gen_random_uuid(), s."dni", t."id", NOW(), true FROM s, t
ON CONFLICT DO NOTHING;

WITH t AS (
  SELECT "id" FROM "Teacher" WHERE "userId" IN (SELECT "id" FROM "User" WHERE "dni" = '45718997')
), s AS (
  SELECT "dni" FROM "Student" WHERE "dni" = '52292246'
)
INSERT INTO "StudentTeacherAssignment" ("id", "studentDni", "teacherId", "startAt", "active")
SELECT gen_random_uuid(), s."dni", t."id", NOW(), true FROM s, t
ON CONFLICT DO NOTHING;

WITH t AS (
  SELECT "id" FROM "Teacher" WHERE "userId" IN (SELECT "id" FROM "User" WHERE "dni" = '45724004')
), s AS (
  SELECT "dni" FROM "Student" WHERE "dni" = '54922503'
)
INSERT INTO "StudentTeacherAssignment" ("id", "studentDni", "teacherId", "startAt", "active")
SELECT gen_random_uuid(), s."dni", t."id", NOW(), true FROM s, t
ON CONFLICT DO NOTHING;

WITH t AS (
  SELECT "id" FROM "Teacher" WHERE "userId" IN (SELECT "id" FROM "User" WHERE "dni" = '45724004')
), s AS (
  SELECT "dni" FROM "Student" WHERE "dni" = '52684003'
)
INSERT INTO "StudentTeacherAssignment" ("id", "studentDni", "teacherId", "startAt", "active")
SELECT gen_random_uuid(), s."dni", t."id", NOW(), true FROM s, t
ON CONFLICT DO NOTHING;

WITH t AS (
  SELECT "id" FROM "Teacher" WHERE "userId" IN (SELECT "id" FROM "User" WHERE "dni" = '45724004')
), s AS (
  SELECT "dni" FROM "Student" WHERE "dni" = '52812193'
)
INSERT INTO "StudentTeacherAssignment" ("id", "studentDni", "teacherId", "startAt", "active")
SELECT gen_random_uuid(), s."dni", t."id", NOW(), true FROM s, t
ON CONFLICT DO NOTHING;

WITH t AS (
  SELECT "id" FROM "Teacher" WHERE "userId" IN (SELECT "id" FROM "User" WHERE "dni" = '45724004')
), s AS (
  SELECT "dni" FROM "Student" WHERE "dni" = '55384692'
)
INSERT INTO "StudentTeacherAssignment" ("id", "studentDni", "teacherId", "startAt", "active")
SELECT gen_random_uuid(), s."dni", t."id", NOW(), true FROM s, t
ON CONFLICT DO NOTHING;

WITH t AS (
  SELECT "id" FROM "Teacher" WHERE "userId" IN (SELECT "id" FROM "User" WHERE "dni" = '45724004')
), s AS (
  SELECT "dni" FROM "Student" WHERE "dni" = '55924578'
)
INSERT INTO "StudentTeacherAssignment" ("id", "studentDni", "teacherId", "startAt", "active")
SELECT gen_random_uuid(), s."dni", t."id", NOW(), true FROM s, t
ON CONFLICT DO NOTHING;

WITH t AS (
  SELECT "id" FROM "Teacher" WHERE "userId" IN (SELECT "id" FROM "User" WHERE "dni" = '45724004')
), s AS (
  SELECT "dni" FROM "Student" WHERE "dni" = '51183171'
)
INSERT INTO "StudentTeacherAssignment" ("id", "studentDni", "teacherId", "startAt", "active")
SELECT gen_random_uuid(), s."dni", t."id", NOW(), true FROM s, t
ON CONFLICT DO NOTHING;

WITH t AS (
  SELECT "id" FROM "Teacher" WHERE "userId" IN (SELECT "id" FROM "User" WHERE "dni" = '45724004')
), s AS (
  SELECT "dni" FROM "Student" WHERE "dni" = '52292577'
)
INSERT INTO "StudentTeacherAssignment" ("id", "studentDni", "teacherId", "startAt", "active")
SELECT gen_random_uuid(), s."dni", t."id", NOW(), true FROM s, t
ON CONFLICT DO NOTHING;

WITH t AS (
  SELECT "id" FROM "Teacher" WHERE "userId" IN (SELECT "id" FROM "User" WHERE "dni" = '45724004')
), s AS (
  SELECT "dni" FROM "Student" WHERE "dni" = '43543568'
)
INSERT INTO "StudentTeacherAssignment" ("id", "studentDni", "teacherId", "startAt", "active")
SELECT gen_random_uuid(), s."dni", t."id", NOW(), true FROM s, t
ON CONFLICT DO NOTHING;

WITH t AS (
  SELECT "id" FROM "Teacher" WHERE "userId" IN (SELECT "id" FROM "User" WHERE "dni" = '45724004')
), s AS (
  SELECT "dni" FROM "Student" WHERE "dni" = '57583742'
)
INSERT INTO "StudentTeacherAssignment" ("id", "studentDni", "teacherId", "startAt", "active")
SELECT gen_random_uuid(), s."dni", t."id", NOW(), true FROM s, t
ON CONFLICT DO NOTHING;

WITH t AS (
  SELECT "id" FROM "Teacher" WHERE "userId" IN (SELECT "id" FROM "User" WHERE "dni" = '45724004')
), s AS (
  SELECT "dni" FROM "Student" WHERE "dni" = '57119337'
)
INSERT INTO "StudentTeacherAssignment" ("id", "studentDni", "teacherId", "startAt", "active")
SELECT gen_random_uuid(), s."dni", t."id", NOW(), true FROM s, t
ON CONFLICT DO NOTHING;

WITH t AS (
  SELECT "id" FROM "Teacher" WHERE "userId" IN (SELECT "id" FROM "User" WHERE "dni" = '45724004')
), s AS (
  SELECT "dni" FROM "Student" WHERE "dni" = '44122856'
)
INSERT INTO "StudentTeacherAssignment" ("id", "studentDni", "teacherId", "startAt", "active")
SELECT gen_random_uuid(), s."dni", t."id", NOW(), true FROM s, t
ON CONFLICT DO NOTHING;

WITH t AS (
  SELECT "id" FROM "Teacher" WHERE "userId" IN (SELECT "id" FROM "User" WHERE "dni" = '45724004')
), s AS (
  SELECT "dni" FROM "Student" WHERE "dni" = '42749536'
)
INSERT INTO "StudentTeacherAssignment" ("id", "studentDni", "teacherId", "startAt", "active")
SELECT gen_random_uuid(), s."dni", t."id", NOW(), true FROM s, t
ON CONFLICT DO NOTHING;

WITH t AS (
  SELECT "id" FROM "Teacher" WHERE "userId" IN (SELECT "id" FROM "User" WHERE "dni" = '45724004')
), s AS (
  SELECT "dni" FROM "Student" WHERE "dni" = '54690607'
)
INSERT INTO "StudentTeacherAssignment" ("id", "studentDni", "teacherId", "startAt", "active")
SELECT gen_random_uuid(), s."dni", t."id", NOW(), true FROM s, t
ON CONFLICT DO NOTHING;

WITH t AS (
  SELECT "id" FROM "Teacher" WHERE "userId" IN (SELECT "id" FROM "User" WHERE "dni" = '45724004')
), s AS (
  SELECT "dni" FROM "Student" WHERE "dni" = '56700205'
)
INSERT INTO "StudentTeacherAssignment" ("id", "studentDni", "teacherId", "startAt", "active")
SELECT gen_random_uuid(), s."dni", t."id", NOW(), true FROM s, t
ON CONFLICT DO NOTHING;

WITH t AS (
  SELECT "id" FROM "Teacher" WHERE "userId" IN (SELECT "id" FROM "User" WHERE "dni" = '45724004')
), s AS (
  SELECT "dni" FROM "Student" WHERE "dni" = '57792489'
)
INSERT INTO "StudentTeacherAssignment" ("id", "studentDni", "teacherId", "startAt", "active")
SELECT gen_random_uuid(), s."dni", t."id", NOW(), true FROM s, t
ON CONFLICT DO NOTHING;

WITH t AS (
  SELECT "id" FROM "Teacher" WHERE "userId" IN (SELECT "id" FROM "User" WHERE "dni" = '45724004')
), s AS (
  SELECT "dni" FROM "Student" WHERE "dni" = '57792490'
)
INSERT INTO "StudentTeacherAssignment" ("id", "studentDni", "teacherId", "startAt", "active")
SELECT gen_random_uuid(), s."dni", t."id", NOW(), true FROM s, t
ON CONFLICT DO NOTHING;

WITH t AS (
  SELECT "id" FROM "Teacher" WHERE "userId" IN (SELECT "id" FROM "User" WHERE "dni" = '45724004')
), s AS (
  SELECT "dni" FROM "Student" WHERE "dni" = '55923248'
)
INSERT INTO "StudentTeacherAssignment" ("id", "studentDni", "teacherId", "startAt", "active")
SELECT gen_random_uuid(), s."dni", t."id", NOW(), true FROM s, t
ON CONFLICT DO NOTHING;

WITH t AS (
  SELECT "id" FROM "Teacher" WHERE "userId" IN (SELECT "id" FROM "User" WHERE "dni" = '45724004')
), s AS (
  SELECT "dni" FROM "Student" WHERE "dni" = '57792329'
)
INSERT INTO "StudentTeacherAssignment" ("id", "studentDni", "teacherId", "startAt", "active")
SELECT gen_random_uuid(), s."dni", t."id", NOW(), true FROM s, t
ON CONFLICT DO NOTHING;

WITH t AS (
  SELECT "id" FROM "Teacher" WHERE "userId" IN (SELECT "id" FROM "User" WHERE "dni" = '45724004')
), s AS (
  SELECT "dni" FROM "Student" WHERE "dni" = '55383522'
)
INSERT INTO "StudentTeacherAssignment" ("id", "studentDni", "teacherId", "startAt", "active")
SELECT gen_random_uuid(), s."dni", t."id", NOW(), true FROM s, t
ON CONFLICT DO NOTHING;

WITH t AS (
  SELECT "id" FROM "Teacher" WHERE "userId" IN (SELECT "id" FROM "User" WHERE "dni" = '45724004')
), s AS (
  SELECT "dni" FROM "Student" WHERE "dni" = '53485824'
)
INSERT INTO "StudentTeacherAssignment" ("id", "studentDni", "teacherId", "startAt", "active")
SELECT gen_random_uuid(), s."dni", t."id", NOW(), true FROM s, t
ON CONFLICT DO NOTHING;

WITH t AS (
  SELECT "id" FROM "Teacher" WHERE "userId" IN (SELECT "id" FROM "User" WHERE "dni" = '48076512')
), s AS (
  SELECT "dni" FROM "Student" WHERE "dni" = '53138994'
)
INSERT INTO "StudentTeacherAssignment" ("id", "studentDni", "teacherId", "startAt", "active")
SELECT gen_random_uuid(), s."dni", t."id", NOW(), true FROM s, t
ON CONFLICT DO NOTHING;

WITH t AS (
  SELECT "id" FROM "Teacher" WHERE "userId" IN (SELECT "id" FROM "User" WHERE "dni" = '48076512')
), s AS (
  SELECT "dni" FROM "Student" WHERE "dni" = '57364496'
)
INSERT INTO "StudentTeacherAssignment" ("id", "studentDni", "teacherId", "startAt", "active")
SELECT gen_random_uuid(), s."dni", t."id", NOW(), true FROM s, t
ON CONFLICT DO NOTHING;

WITH t AS (
  SELECT "id" FROM "Teacher" WHERE "userId" IN (SELECT "id" FROM "User" WHERE "dni" = '48076512')
), s AS (
  SELECT "dni" FROM "Student" WHERE "dni" = '58275103'
)
INSERT INTO "StudentTeacherAssignment" ("id", "studentDni", "teacherId", "startAt", "active")
SELECT gen_random_uuid(), s."dni", t."id", NOW(), true FROM s, t
ON CONFLICT DO NOTHING;

WITH t AS (
  SELECT "id" FROM "Teacher" WHERE "userId" IN (SELECT "id" FROM "User" WHERE "dni" = '48076512')
), s AS (
  SELECT "dni" FROM "Student" WHERE "dni" = '53659388'
)
INSERT INTO "StudentTeacherAssignment" ("id", "studentDni", "teacherId", "startAt", "active")
SELECT gen_random_uuid(), s."dni", t."id", NOW(), true FROM s, t
ON CONFLICT DO NOTHING;

WITH t AS (
  SELECT "id" FROM "Teacher" WHERE "userId" IN (SELECT "id" FROM "User" WHERE "dni" = '48076512')
), s AS (
  SELECT "dni" FROM "Student" WHERE "dni" = '55383646'
)
INSERT INTO "StudentTeacherAssignment" ("id", "studentDni", "teacherId", "startAt", "active")
SELECT gen_random_uuid(), s."dni", t."id", NOW(), true FROM s, t
ON CONFLICT DO NOTHING;

WITH t AS (
  SELECT "id" FROM "Teacher" WHERE "userId" IN (SELECT "id" FROM "User" WHERE "dni" = '44139436')
), s AS (
  SELECT "dni" FROM "Student" WHERE "dni" = '55135904'
)
INSERT INTO "StudentTeacherAssignment" ("id", "studentDni", "teacherId", "startAt", "active")
SELECT gen_random_uuid(), s."dni", t."id", NOW(), true FROM s, t
ON CONFLICT DO NOTHING;

WITH t AS (
  SELECT "id" FROM "Teacher" WHERE "userId" IN (SELECT "id" FROM "User" WHERE "dni" = '44139436')
), s AS (
  SELECT "dni" FROM "Student" WHERE "dni" = '50490945'
)
INSERT INTO "StudentTeacherAssignment" ("id", "studentDni", "teacherId", "startAt", "active")
SELECT gen_random_uuid(), s."dni", t."id", NOW(), true FROM s, t
ON CONFLICT DO NOTHING;

WITH t AS (
  SELECT "id" FROM "Teacher" WHERE "userId" IN (SELECT "id" FROM "User" WHERE "dni" = '44139436')
), s AS (
  SELECT "dni" FROM "Student" WHERE "dni" = '56225225'
)
INSERT INTO "StudentTeacherAssignment" ("id", "studentDni", "teacherId", "startAt", "active")
SELECT gen_random_uuid(), s."dni", t."id", NOW(), true FROM s, t
ON CONFLICT DO NOTHING;

WITH t AS (
  SELECT "id" FROM "Teacher" WHERE "userId" IN (SELECT "id" FROM "User" WHERE "dni" = '44139436')
), s AS (
  SELECT "dni" FROM "Student" WHERE "dni" = '56286188'
)
INSERT INTO "StudentTeacherAssignment" ("id", "studentDni", "teacherId", "startAt", "active")
SELECT gen_random_uuid(), s."dni", t."id", NOW(), true FROM s, t
ON CONFLICT DO NOTHING;

WITH t AS (
  SELECT "id" FROM "Teacher" WHERE "userId" IN (SELECT "id" FROM "User" WHERE "dni" = '44139436')
), s AS (
  SELECT "dni" FROM "Student" WHERE "dni" = '58475676'
)
INSERT INTO "StudentTeacherAssignment" ("id", "studentDni", "teacherId", "startAt", "active")
SELECT gen_random_uuid(), s."dni", t."id", NOW(), true FROM s, t
ON CONFLICT DO NOTHING;

WITH t AS (
  SELECT "id" FROM "Teacher" WHERE "userId" IN (SELECT "id" FROM "User" WHERE "dni" = '44139436')
), s AS (
  SELECT "dni" FROM "Student" WHERE "dni" = '57121773'
)
INSERT INTO "StudentTeacherAssignment" ("id", "studentDni", "teacherId", "startAt", "active")
SELECT gen_random_uuid(), s."dni", t."id", NOW(), true FROM s, t
ON CONFLICT DO NOTHING;

WITH t AS (
  SELECT "id" FROM "Teacher" WHERE "userId" IN (SELECT "id" FROM "User" WHERE "dni" = '44139436')
), s AS (
  SELECT "dni" FROM "Student" WHERE "dni" = '38007722'
)
INSERT INTO "StudentTeacherAssignment" ("id", "studentDni", "teacherId", "startAt", "active")
SELECT gen_random_uuid(), s."dni", t."id", NOW(), true FROM s, t
ON CONFLICT DO NOTHING;

WITH t AS (
  SELECT "id" FROM "Teacher" WHERE "userId" IN (SELECT "id" FROM "User" WHERE "dni" = '44139436')
), s AS (
  SELECT "dni" FROM "Student" WHERE "dni" = '57530137'
)
INSERT INTO "StudentTeacherAssignment" ("id", "studentDni", "teacherId", "startAt", "active")
SELECT gen_random_uuid(), s."dni", t."id", NOW(), true FROM s, t
ON CONFLICT DO NOTHING;

WITH t AS (
  SELECT "id" FROM "Teacher" WHERE "userId" IN (SELECT "id" FROM "User" WHERE "dni" = '44139436')
), s AS (
  SELECT "dni" FROM "Student" WHERE "dni" = '55255782'
)
INSERT INTO "StudentTeacherAssignment" ("id", "studentDni", "teacherId", "startAt", "active")
SELECT gen_random_uuid(), s."dni", t."id", NOW(), true FROM s, t
ON CONFLICT DO NOTHING;

WITH t AS (
  SELECT "id" FROM "Teacher" WHERE "userId" IN (SELECT "id" FROM "User" WHERE "dni" = '44139436')
), s AS (
  SELECT "dni" FROM "Student" WHERE "dni" = '57935558'
)
INSERT INTO "StudentTeacherAssignment" ("id", "studentDni", "teacherId", "startAt", "active")
SELECT gen_random_uuid(), s."dni", t."id", NOW(), true FROM s, t
ON CONFLICT DO NOTHING;

WITH t AS (
  SELECT "id" FROM "Teacher" WHERE "userId" IN (SELECT "id" FROM "User" WHERE "dni" = '44139436')
), s AS (
  SELECT "dni" FROM "Student" WHERE "dni" = '52514178'
)
INSERT INTO "StudentTeacherAssignment" ("id", "studentDni", "teacherId", "startAt", "active")
SELECT gen_random_uuid(), s."dni", t."id", NOW(), true FROM s, t
ON CONFLICT DO NOTHING;

WITH t AS (
  SELECT "id" FROM "Teacher" WHERE "userId" IN (SELECT "id" FROM "User" WHERE "dni" = '44139436')
), s AS (
  SELECT "dni" FROM "Student" WHERE "dni" = '49266423'
)
INSERT INTO "StudentTeacherAssignment" ("id", "studentDni", "teacherId", "startAt", "active")
SELECT gen_random_uuid(), s."dni", t."id", NOW(), true FROM s, t
ON CONFLICT DO NOTHING;

WITH t AS (
  SELECT "id" FROM "Teacher" WHERE "userId" IN (SELECT "id" FROM "User" WHERE "dni" = '44139436')
), s AS (
  SELECT "dni" FROM "Student" WHERE "dni" = '52148830'
)
INSERT INTO "StudentTeacherAssignment" ("id", "studentDni", "teacherId", "startAt", "active")
SELECT gen_random_uuid(), s."dni", t."id", NOW(), true FROM s, t
ON CONFLICT DO NOTHING;

WITH t AS (
  SELECT "id" FROM "Teacher" WHERE "userId" IN (SELECT "id" FROM "User" WHERE "dni" = '44139436')
), s AS (
  SELECT "dni" FROM "Student" WHERE "dni" = '55136405'
)
INSERT INTO "StudentTeacherAssignment" ("id", "studentDni", "teacherId", "startAt", "active")
SELECT gen_random_uuid(), s."dni", t."id", NOW(), true FROM s, t
ON CONFLICT DO NOTHING;

WITH t AS (
  SELECT "id" FROM "Teacher" WHERE "userId" IN (SELECT "id" FROM "User" WHERE "dni" = '44139436')
), s AS (
  SELECT "dni" FROM "Student" WHERE "dni" = '52940235'
)
INSERT INTO "StudentTeacherAssignment" ("id", "studentDni", "teacherId", "startAt", "active")
SELECT gen_random_uuid(), s."dni", t."id", NOW(), true FROM s, t
ON CONFLICT DO NOTHING;

WITH t AS (
  SELECT "id" FROM "Teacher" WHERE "userId" IN (SELECT "id" FROM "User" WHERE "dni" = '44139436')
), s AS (
  SELECT "dni" FROM "Student" WHERE "dni" = '54692546'
)
INSERT INTO "StudentTeacherAssignment" ("id", "studentDni", "teacherId", "startAt", "active")
SELECT gen_random_uuid(), s."dni", t."id", NOW(), true FROM s, t
ON CONFLICT DO NOTHING;

WITH t AS (
  SELECT "id" FROM "Teacher" WHERE "userId" IN (SELECT "id" FROM "User" WHERE "dni" = '44139436')
), s AS (
  SELECT "dni" FROM "Student" WHERE "dni" = '51295224'
)
INSERT INTO "StudentTeacherAssignment" ("id", "studentDni", "teacherId", "startAt", "active")
SELECT gen_random_uuid(), s."dni", t."id", NOW(), true FROM s, t
ON CONFLICT DO NOTHING;

WITH t AS (
  SELECT "id" FROM "Teacher" WHERE "userId" IN (SELECT "id" FROM "User" WHERE "dni" = '44139436')
), s AS (
  SELECT "dni" FROM "Student" WHERE "dni" = '51707157'
)
INSERT INTO "StudentTeacherAssignment" ("id", "studentDni", "teacherId", "startAt", "active")
SELECT gen_random_uuid(), s."dni", t."id", NOW(), true FROM s, t
ON CONFLICT DO NOTHING;

WITH t AS (
  SELECT "id" FROM "Teacher" WHERE "userId" IN (SELECT "id" FROM "User" WHERE "dni" = '43831454')
), s AS (
  SELECT "dni" FROM "Student" WHERE "dni" = '50812957'
)
INSERT INTO "StudentTeacherAssignment" ("id", "studentDni", "teacherId", "startAt", "active")
SELECT gen_random_uuid(), s."dni", t."id", NOW(), true FROM s, t
ON CONFLICT DO NOTHING;

WITH t AS (
  SELECT "id" FROM "Teacher" WHERE "userId" IN (SELECT "id" FROM "User" WHERE "dni" = '43831454')
), s AS (
  SELECT "dni" FROM "Student" WHERE "dni" = '549210009'
)
INSERT INTO "StudentTeacherAssignment" ("id", "studentDni", "teacherId", "startAt", "active")
SELECT gen_random_uuid(), s."dni", t."id", NOW(), true FROM s, t
ON CONFLICT DO NOTHING;

WITH t AS (
  SELECT "id" FROM "Teacher" WHERE "userId" IN (SELECT "id" FROM "User" WHERE "dni" = '43831454')
), s AS (
  SELECT "dni" FROM "Student" WHERE "dni" = '53155146'
)
INSERT INTO "StudentTeacherAssignment" ("id", "studentDni", "teacherId", "startAt", "active")
SELECT gen_random_uuid(), s."dni", t."id", NOW(), true FROM s, t
ON CONFLICT DO NOTHING;

WITH t AS (
  SELECT "id" FROM "Teacher" WHERE "userId" IN (SELECT "id" FROM "User" WHERE "dni" = '43831454')
), s AS (
  SELECT "dni" FROM "Student" WHERE "dni" = '55544509'
)
INSERT INTO "StudentTeacherAssignment" ("id", "studentDni", "teacherId", "startAt", "active")
SELECT gen_random_uuid(), s."dni", t."id", NOW(), true FROM s, t
ON CONFLICT DO NOTHING;

WITH t AS (
  SELECT "id" FROM "Teacher" WHERE "userId" IN (SELECT "id" FROM "User" WHERE "dni" = '43831454')
), s AS (
  SELECT "dni" FROM "Student" WHERE "dni" = '57583825'
)
INSERT INTO "StudentTeacherAssignment" ("id", "studentDni", "teacherId", "startAt", "active")
SELECT gen_random_uuid(), s."dni", t."id", NOW(), true FROM s, t
ON CONFLICT DO NOTHING;

WITH t AS (
  SELECT "id" FROM "Teacher" WHERE "userId" IN (SELECT "id" FROM "User" WHERE "dni" = '43831454')
), s AS (
  SELECT "dni" FROM "Student" WHERE "dni" = '54924808'
)
INSERT INTO "StudentTeacherAssignment" ("id", "studentDni", "teacherId", "startAt", "active")
SELECT gen_random_uuid(), s."dni", t."id", NOW(), true FROM s, t
ON CONFLICT DO NOTHING;

WITH t AS (
  SELECT "id" FROM "Teacher" WHERE "userId" IN (SELECT "id" FROM "User" WHERE "dni" = '43831454')
), s AS (
  SELECT "dni" FROM "Student" WHERE "dni" = '56086862'
)
INSERT INTO "StudentTeacherAssignment" ("id", "studentDni", "teacherId", "startAt", "active")
SELECT gen_random_uuid(), s."dni", t."id", NOW(), true FROM s, t
ON CONFLICT DO NOTHING;

WITH t AS (
  SELECT "id" FROM "Teacher" WHERE "userId" IN (SELECT "id" FROM "User" WHERE "dni" = '43831454')
), s AS (
  SELECT "dni" FROM "Student" WHERE "dni" = '54689482'
)
INSERT INTO "StudentTeacherAssignment" ("id", "studentDni", "teacherId", "startAt", "active")
SELECT gen_random_uuid(), s."dni", t."id", NOW(), true FROM s, t
ON CONFLICT DO NOTHING;

WITH t AS (
  SELECT "id" FROM "Teacher" WHERE "userId" IN (SELECT "id" FROM "User" WHERE "dni" = '43831454')
), s AS (
  SELECT "dni" FROM "Student" WHERE "dni" = '53939390'
)
INSERT INTO "StudentTeacherAssignment" ("id", "studentDni", "teacherId", "startAt", "active")
SELECT gen_random_uuid(), s."dni", t."id", NOW(), true FROM s, t
ON CONFLICT DO NOTHING;

WITH t AS (
  SELECT "id" FROM "Teacher" WHERE "userId" IN (SELECT "id" FROM "User" WHERE "dni" = '43831454')
), s AS (
  SELECT "dni" FROM "Student" WHERE "dni" = '57367320'
)
INSERT INTO "StudentTeacherAssignment" ("id", "studentDni", "teacherId", "startAt", "active")
SELECT gen_random_uuid(), s."dni", t."id", NOW(), true FROM s, t
ON CONFLICT DO NOTHING;

WITH t AS (
  SELECT "id" FROM "Teacher" WHERE "userId" IN (SELECT "id" FROM "User" WHERE "dni" = '43831454')
), s AS (
  SELECT "dni" FROM "Student" WHERE "dni" = '54921217'
)
INSERT INTO "StudentTeacherAssignment" ("id", "studentDni", "teacherId", "startAt", "active")
SELECT gen_random_uuid(), s."dni", t."id", NOW(), true FROM s, t
ON CONFLICT DO NOTHING;

WITH t AS (
  SELECT "id" FROM "Teacher" WHERE "userId" IN (SELECT "id" FROM "User" WHERE "dni" = '43831454')
), s AS (
  SELECT "dni" FROM "Student" WHERE "dni" = '49821666'
)
INSERT INTO "StudentTeacherAssignment" ("id", "studentDni", "teacherId", "startAt", "active")
SELECT gen_random_uuid(), s."dni", t."id", NOW(), true FROM s, t
ON CONFLICT DO NOTHING;

WITH t AS (
  SELECT "id" FROM "Teacher" WHERE "userId" IN (SELECT "id" FROM "User" WHERE "dni" = '43831454')
), s AS (
  SELECT "dni" FROM "Student" WHERE "dni" = '54922034'
)
INSERT INTO "StudentTeacherAssignment" ("id", "studentDni", "teacherId", "startAt", "active")
SELECT gen_random_uuid(), s."dni", t."id", NOW(), true FROM s, t
ON CONFLICT DO NOTHING;

WITH t AS (
  SELECT "id" FROM "Teacher" WHERE "userId" IN (SELECT "id" FROM "User" WHERE "dni" = '43831454')
), s AS (
  SELECT "dni" FROM "Student" WHERE "dni" = '57582780'
)
INSERT INTO "StudentTeacherAssignment" ("id", "studentDni", "teacherId", "startAt", "active")
SELECT gen_random_uuid(), s."dni", t."id", NOW(), true FROM s, t
ON CONFLICT DO NOTHING;

WITH t AS (
  SELECT "id" FROM "Teacher" WHERE "userId" IN (SELECT "id" FROM "User" WHERE "dni" = '43831454')
), s AS (
  SELECT "dni" FROM "Student" WHERE "dni" = '47613328'
)
INSERT INTO "StudentTeacherAssignment" ("id", "studentDni", "teacherId", "startAt", "active")
SELECT gen_random_uuid(), s."dni", t."id", NOW(), true FROM s, t
ON CONFLICT DO NOTHING;

WITH t AS (
  SELECT "id" FROM "Teacher" WHERE "userId" IN (SELECT "id" FROM "User" WHERE "dni" = '43831454')
), s AS (
  SELECT "dni" FROM "Student" WHERE "dni" = '52520393'
)
INSERT INTO "StudentTeacherAssignment" ("id", "studentDni", "teacherId", "startAt", "active")
SELECT gen_random_uuid(), s."dni", t."id", NOW(), true FROM s, t
ON CONFLICT DO NOTHING;

WITH t AS (
  SELECT "id" FROM "Teacher" WHERE "userId" IN (SELECT "id" FROM "User" WHERE "dni" = '43831454')
), s AS (
  SELECT "dni" FROM "Student" WHERE "dni" = '51532369'
)
INSERT INTO "StudentTeacherAssignment" ("id", "studentDni", "teacherId", "startAt", "active")
SELECT gen_random_uuid(), s."dni", t."id", NOW(), true FROM s, t
ON CONFLICT DO NOTHING;

WITH t AS (
  SELECT "id" FROM "Teacher" WHERE "userId" IN (SELECT "id" FROM "User" WHERE "dni" = '43831454')
), s AS (
  SELECT "dni" FROM "Student" WHERE "dni" = '48607535'
)
INSERT INTO "StudentTeacherAssignment" ("id", "studentDni", "teacherId", "startAt", "active")
SELECT gen_random_uuid(), s."dni", t."id", NOW(), true FROM s, t
ON CONFLICT DO NOTHING;

WITH t AS (
  SELECT "id" FROM "Teacher" WHERE "userId" IN (SELECT "id" FROM "User" WHERE "dni" = '43831454')
), s AS (
  SELECT "dni" FROM "Student" WHERE "dni" = '51189489'
)
INSERT INTO "StudentTeacherAssignment" ("id", "studentDni", "teacherId", "startAt", "active")
SELECT gen_random_uuid(), s."dni", t."id", NOW(), true FROM s, t
ON CONFLICT DO NOTHING;

WITH t AS (
  SELECT "id" FROM "Teacher" WHERE "userId" IN (SELECT "id" FROM "User" WHERE "dni" = '43831454')
), s AS (
  SELECT "dni" FROM "Student" WHERE "dni" = '53946708'
)
INSERT INTO "StudentTeacherAssignment" ("id", "studentDni", "teacherId", "startAt", "active")
SELECT gen_random_uuid(), s."dni", t."id", NOW(), true FROM s, t
ON CONFLICT DO NOTHING;

WITH t AS (
  SELECT "id" FROM "Teacher" WHERE "userId" IN (SELECT "id" FROM "User" WHERE "dni" = '43831454')
), s AS (
  SELECT "dni" FROM "Student" WHERE "dni" = '49335489'
)
INSERT INTO "StudentTeacherAssignment" ("id", "studentDni", "teacherId", "startAt", "active")
SELECT gen_random_uuid(), s."dni", t."id", NOW(), true FROM s, t
ON CONFLICT DO NOTHING;

WITH t AS (
  SELECT "id" FROM "Teacher" WHERE "userId" IN (SELECT "id" FROM "User" WHERE "dni" = '42421850')
), s AS (
  SELECT "dni" FROM "Student" WHERE "dni" = '53313626'
)
INSERT INTO "StudentTeacherAssignment" ("id", "studentDni", "teacherId", "startAt", "active")
SELECT gen_random_uuid(), s."dni", t."id", NOW(), true FROM s, t
ON CONFLICT DO NOTHING;

WITH t AS (
  SELECT "id" FROM "Teacher" WHERE "userId" IN (SELECT "id" FROM "User" WHERE "dni" = '42421850')
), s AS (
  SELECT "dni" FROM "Student" WHERE "dni" = '50812930'
)
INSERT INTO "StudentTeacherAssignment" ("id", "studentDni", "teacherId", "startAt", "active")
SELECT gen_random_uuid(), s."dni", t."id", NOW(), true FROM s, t
ON CONFLICT DO NOTHING;

WITH t AS (
  SELECT "id" FROM "Teacher" WHERE "userId" IN (SELECT "id" FROM "User" WHERE "dni" = '42421850')
), s AS (
  SELECT "dni" FROM "Student" WHERE "dni" = '13513965'
)
INSERT INTO "StudentTeacherAssignment" ("id", "studentDni", "teacherId", "startAt", "active")
SELECT gen_random_uuid(), s."dni", t."id", NOW(), true FROM s, t
ON CONFLICT DO NOTHING;

WITH t AS (
  SELECT "id" FROM "Teacher" WHERE "userId" IN (SELECT "id" FROM "User" WHERE "dni" = '42421850')
), s AS (
  SELECT "dni" FROM "Student" WHERE "dni" = '45024344'
)
INSERT INTO "StudentTeacherAssignment" ("id", "studentDni", "teacherId", "startAt", "active")
SELECT gen_random_uuid(), s."dni", t."id", NOW(), true FROM s, t
ON CONFLICT DO NOTHING;

WITH t AS (
  SELECT "id" FROM "Teacher" WHERE "userId" IN (SELECT "id" FROM "User" WHERE "dni" = '42421850')
), s AS (
  SELECT "dni" FROM "Student" WHERE "dni" = '46549409'
)
INSERT INTO "StudentTeacherAssignment" ("id", "studentDni", "teacherId", "startAt", "active")
SELECT gen_random_uuid(), s."dni", t."id", NOW(), true FROM s, t
ON CONFLICT DO NOTHING;

WITH t AS (
  SELECT "id" FROM "Teacher" WHERE "userId" IN (SELECT "id" FROM "User" WHERE "dni" = '42421850')
), s AS (
  SELECT "dni" FROM "Student" WHERE "dni" = '23712041'
)
INSERT INTO "StudentTeacherAssignment" ("id", "studentDni", "teacherId", "startAt", "active")
SELECT gen_random_uuid(), s."dni", t."id", NOW(), true FROM s, t
ON CONFLICT DO NOTHING;

WITH t AS (
  SELECT "id" FROM "Teacher" WHERE "userId" IN (SELECT "id" FROM "User" WHERE "dni" = '42421850')
), s AS (
  SELECT "dni" FROM "Student" WHERE "dni" = '53662411'
)
INSERT INTO "StudentTeacherAssignment" ("id", "studentDni", "teacherId", "startAt", "active")
SELECT gen_random_uuid(), s."dni", t."id", NOW(), true FROM s, t
ON CONFLICT DO NOTHING;

WITH t AS (
  SELECT "id" FROM "Teacher" WHERE "userId" IN (SELECT "id" FROM "User" WHERE "dni" = '23832541')
), s AS (
  SELECT "dni" FROM "Student" WHERE "dni" = '48077697'
)
INSERT INTO "StudentTeacherAssignment" ("id", "studentDni", "teacherId", "startAt", "active")
SELECT gen_random_uuid(), s."dni", t."id", NOW(), true FROM s, t
ON CONFLICT DO NOTHING;

COMMIT;