-- Seed de alumnos desde alumnos.csv
-- Password inicial: Bienvenido2026!
BEGIN;

INSERT INTO "User" ("id", "dni", "passwordHash", "role", "status", "createdAt", "updatedAt") VALUES ('8d4989a9-df0b-448c-8220-5dd1f54893af', '55926268', '$2a$10$qJRRLhy.x62iLrYdqGckV.GkzA9Y0/RNp8I1iA5jTdDnRXnrvWaZW', 'STUDENT', 'ACTIVE', NOW(), NOW());
INSERT INTO "Student" ("dni", "userId", "firstName", "lastName", "createdAt", "updatedAt") VALUES ('55926268', '8d4989a9-df0b-448c-8220-5dd1f54893af', 'Emma', 'Carnicel', NOW(), NOW());

INSERT INTO "User" ("id", "dni", "passwordHash", "role", "status", "createdAt", "updatedAt") VALUES ('f449473d-a7f5-48c1-88a8-9adcbcc57c20', '57370540', '$2a$10$qJRRLhy.x62iLrYdqGckV.GkzA9Y0/RNp8I1iA5jTdDnRXnrvWaZW', 'STUDENT', 'ACTIVE', NOW(), NOW());
INSERT INTO "Student" ("dni", "userId", "firstName", "lastName", "createdAt", "updatedAt") VALUES ('57370540', 'f449473d-a7f5-48c1-88a8-9adcbcc57c20', 'Tadeo', 'Sinastra', NOW(), NOW());

INSERT INTO "User" ("id", "dni", "passwordHash", "role", "status", "createdAt", "updatedAt") VALUES ('f3b61645-74da-4a56-9b5f-cfef79496464', '49400559', '$2a$10$qJRRLhy.x62iLrYdqGckV.GkzA9Y0/RNp8I1iA5jTdDnRXnrvWaZW', 'STUDENT', 'ACTIVE', NOW(), NOW());
INSERT INTO "Student" ("dni", "userId", "firstName", "lastName", "createdAt", "updatedAt") VALUES ('49400559', 'f3b61645-74da-4a56-9b5f-cfef79496464', 'Mario', 'Baños', NOW(), NOW());

INSERT INTO "User" ("id", "dni", "passwordHash", "role", "status", "createdAt", "updatedAt") VALUES ('6c86a217-cd9a-486f-90c6-0663f9c7246c', '51189443', '$2a$10$qJRRLhy.x62iLrYdqGckV.GkzA9Y0/RNp8I1iA5jTdDnRXnrvWaZW', 'STUDENT', 'ACTIVE', NOW(), NOW());
INSERT INTO "Student" ("dni", "userId", "firstName", "lastName", "createdAt", "updatedAt") VALUES ('51189443', '6c86a217-cd9a-486f-90c6-0663f9c7246c', 'Leonardo', 'Baños', NOW(), NOW());

INSERT INTO "User" ("id", "dni", "passwordHash", "role", "status", "createdAt", "updatedAt") VALUES ('9b2a5b41-969e-4dc6-a0f8-3b934983ed1f', '55545110', '$2a$10$qJRRLhy.x62iLrYdqGckV.GkzA9Y0/RNp8I1iA5jTdDnRXnrvWaZW', 'STUDENT', 'ACTIVE', NOW(), NOW());
INSERT INTO "Student" ("dni", "userId", "firstName", "lastName", "createdAt", "updatedAt") VALUES ('55545110', '9b2a5b41-969e-4dc6-a0f8-3b934983ed1f', 'Federico', 'Funes', NOW(), NOW());

INSERT INTO "User" ("id", "dni", "passwordHash", "role", "status", "createdAt", "updatedAt") VALUES ('3efbcdaf-bfd2-4fc2-8773-aeaafef7b81f', '55380219', '$2a$10$qJRRLhy.x62iLrYdqGckV.GkzA9Y0/RNp8I1iA5jTdDnRXnrvWaZW', 'STUDENT', 'ACTIVE', NOW(), NOW());
INSERT INTO "Student" ("dni", "userId", "firstName", "lastName", "createdAt", "updatedAt") VALUES ('55380219', '3efbcdaf-bfd2-4fc2-8773-aeaafef7b81f', 'Lorenzo', 'Funes', NOW(), NOW());

INSERT INTO "User" ("id", "dni", "passwordHash", "role", "status", "createdAt", "updatedAt") VALUES ('4a5354b3-9d22-4482-a49e-2780225738e8', '55380220', '$2a$10$qJRRLhy.x62iLrYdqGckV.GkzA9Y0/RNp8I1iA5jTdDnRXnrvWaZW', 'STUDENT', 'ACTIVE', NOW(), NOW());
INSERT INTO "Student" ("dni", "userId", "firstName", "lastName", "createdAt", "updatedAt") VALUES ('55380220', '4a5354b3-9d22-4482-a49e-2780225738e8', 'Lisandro', 'Funes', NOW(), NOW());

INSERT INTO "User" ("id", "dni", "passwordHash", "role", "status", "createdAt", "updatedAt") VALUES ('05a3567e-59a4-4385-9962-7610ea1d36ca', '53942626', '$2a$10$qJRRLhy.x62iLrYdqGckV.GkzA9Y0/RNp8I1iA5jTdDnRXnrvWaZW', 'STUDENT', 'ACTIVE', NOW(), NOW());
INSERT INTO "Student" ("dni", "userId", "firstName", "lastName", "createdAt", "updatedAt") VALUES ('53942626', '05a3567e-59a4-4385-9962-7610ea1d36ca', 'Facundo', 'Perez', NOW(), NOW());

INSERT INTO "User" ("id", "dni", "passwordHash", "role", "status", "createdAt", "updatedAt") VALUES ('faa92ef0-2e08-46f7-a909-a171f403f667', '54923846', '$2a$10$qJRRLhy.x62iLrYdqGckV.GkzA9Y0/RNp8I1iA5jTdDnRXnrvWaZW', 'STUDENT', 'PENDING', NOW(), NOW());
INSERT INTO "Student" ("dni", "userId", "firstName", "lastName", "createdAt", "updatedAt") VALUES ('54923846', 'faa92ef0-2e08-46f7-a909-a171f403f667', 'Lautaro', 'Prado', NOW(), NOW());

INSERT INTO "User" ("id", "dni", "passwordHash", "role", "status", "createdAt", "updatedAt") VALUES ('b02eb2f4-7330-4fbc-bda7-c0967477c99e', '56086377', '$2a$10$qJRRLhy.x62iLrYdqGckV.GkzA9Y0/RNp8I1iA5jTdDnRXnrvWaZW', 'STUDENT', 'PENDING', NOW(), NOW());
INSERT INTO "Student" ("dni", "userId", "firstName", "lastName", "createdAt", "updatedAt") VALUES ('56086377', 'b02eb2f4-7330-4fbc-bda7-c0967477c99e', 'Valentin', 'Chavez', NOW(), NOW());

INSERT INTO "User" ("id", "dni", "passwordHash", "role", "status", "createdAt", "updatedAt") VALUES ('208e9b13-6a5e-4f2c-bab5-de503f292982', '45529902', '$2a$10$qJRRLhy.x62iLrYdqGckV.GkzA9Y0/RNp8I1iA5jTdDnRXnrvWaZW', 'STUDENT', 'PENDING', NOW(), NOW());
INSERT INTO "Student" ("dni", "userId", "firstName", "lastName", "createdAt", "updatedAt") VALUES ('45529902', '208e9b13-6a5e-4f2c-bab5-de503f292982', 'Fernando', 'Palacios', NOW(), NOW());

INSERT INTO "User" ("id", "dni", "passwordHash", "role", "status", "createdAt", "updatedAt") VALUES ('8271b553-7e03-4260-b179-e632b86c6f77', '46172388', '$2a$10$qJRRLhy.x62iLrYdqGckV.GkzA9Y0/RNp8I1iA5jTdDnRXnrvWaZW', 'STUDENT', 'PENDING', NOW(), NOW());
INSERT INTO "Student" ("dni", "userId", "firstName", "lastName", "createdAt", "updatedAt") VALUES ('46172388', '8271b553-7e03-4260-b179-e632b86c6f77', 'Samuel', 'Serrano', NOW(), NOW());

INSERT INTO "User" ("id", "dni", "passwordHash", "role", "status", "createdAt", "updatedAt") VALUES ('e2a52c51-e5ac-422a-a0ae-fc145d7a4a93', '44986637', '$2a$10$qJRRLhy.x62iLrYdqGckV.GkzA9Y0/RNp8I1iA5jTdDnRXnrvWaZW', 'STUDENT', 'PENDING', NOW(), NOW());
INSERT INTO "Student" ("dni", "userId", "firstName", "lastName", "createdAt", "updatedAt") VALUES ('44986637', 'e2a52c51-e5ac-422a-a0ae-fc145d7a4a93', 'Mercedes', 'Murri', NOW(), NOW());

INSERT INTO "User" ("id", "dni", "passwordHash", "role", "status", "createdAt", "updatedAt") VALUES ('b9deb4bf-c7df-442b-9aef-d18dd76d2c90', '52940656', '$2a$10$qJRRLhy.x62iLrYdqGckV.GkzA9Y0/RNp8I1iA5jTdDnRXnrvWaZW', 'STUDENT', 'PENDING', NOW(), NOW());
INSERT INTO "Student" ("dni", "userId", "firstName", "lastName", "createdAt", "updatedAt") VALUES ('52940656', 'b9deb4bf-c7df-442b-9aef-d18dd76d2c90', 'Angelina', 'Bazan', NOW(), NOW());

INSERT INTO "User" ("id", "dni", "passwordHash", "role", "status", "createdAt", "updatedAt") VALUES ('3244ed59-8e25-4e86-bcbf-5463b44487c5', '51187268', '$2a$10$qJRRLhy.x62iLrYdqGckV.GkzA9Y0/RNp8I1iA5jTdDnRXnrvWaZW', 'STUDENT', 'PENDING', NOW(), NOW());
INSERT INTO "Student" ("dni", "userId", "firstName", "lastName", "createdAt", "updatedAt") VALUES ('51187268', '3244ed59-8e25-4e86-bcbf-5463b44487c5', 'Rocio', 'Barrionuevo', NOW(), NOW());

INSERT INTO "User" ("id", "dni", "passwordHash", "role", "status", "createdAt", "updatedAt") VALUES ('1cc53a64-db72-40c9-b638-033e14b79a91', '39603413', '$2a$10$qJRRLhy.x62iLrYdqGckV.GkzA9Y0/RNp8I1iA5jTdDnRXnrvWaZW', 'STUDENT', 'PENDING', NOW(), NOW());
INSERT INTO "Student" ("dni", "userId", "firstName", "lastName", "createdAt", "updatedAt") VALUES ('39603413', '1cc53a64-db72-40c9-b638-033e14b79a91', 'Gabriel', 'Medina', NOW(), NOW());

COMMIT;
