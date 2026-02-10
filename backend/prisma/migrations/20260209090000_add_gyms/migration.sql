-- CreateTable
CREATE TABLE "Gym" (
    "id" TEXT NOT NULL,
    "name" TEXT NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "Gym_pkey" PRIMARY KEY ("id")
);

-- CreateIndex
CREATE UNIQUE INDEX "Gym_name_key" ON "Gym"("name");

-- AddColumn
ALTER TABLE "Student" ADD COLUMN "gymId" TEXT;

-- Data migration
CREATE EXTENSION IF NOT EXISTS pgcrypto;

INSERT INTO "Gym" ("id", "name", "createdAt", "updatedAt")
VALUES (gen_random_uuid()::text, 'Sin gimnasio', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP)
ON CONFLICT ("name") DO NOTHING;

WITH distinct_names AS (
    SELECT DISTINCT TRIM("gym") AS name
    FROM "Student"
    WHERE "gym" IS NOT NULL
      AND TRIM("gym") <> ''
      AND LOWER(TRIM("gym")) <> 'nan'
),
to_insert AS (
    SELECT gen_random_uuid()::text AS id, name FROM distinct_names
)
INSERT INTO "Gym" ("id", "name", "createdAt", "updatedAt")
SELECT id, name, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP
FROM to_insert
ON CONFLICT ("name") DO NOTHING;

UPDATE "Student" s
SET "gymId" = g."id"
FROM "Gym" g
WHERE g."name" = (
    CASE
        WHEN s."gym" IS NULL OR TRIM(s."gym") = '' OR LOWER(TRIM(s."gym")) = 'nan'
            THEN 'Sin gimnasio'
        ELSE TRIM(s."gym")
    END
);

-- Make required + FK
ALTER TABLE "Student" ALTER COLUMN "gymId" SET NOT NULL;

ALTER TABLE "Student"
ADD CONSTRAINT "Student_gymId_fkey"
FOREIGN KEY ("gymId") REFERENCES "Gym"("id")
ON DELETE RESTRICT
ON UPDATE CASCADE;

CREATE INDEX "Student_gymId_idx" ON "Student"("gymId");

-- Drop old free-text field
ALTER TABLE "Student" DROP COLUMN "gym";

