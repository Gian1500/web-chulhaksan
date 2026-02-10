-- Add gymId to Attendance so attendance can be queried/audited by gym.
-- We backfill from the student's current gymId for existing rows.

-- Add column (nullable for backfill)
ALTER TABLE "Attendance" ADD COLUMN "gymId" TEXT;

-- Backfill from Student
UPDATE "Attendance" a
SET "gymId" = s."gymId"
FROM "Student" s
WHERE s."dni" = a."studentDni"
  AND a."gymId" IS NULL;

-- Make required + FK
ALTER TABLE "Attendance" ALTER COLUMN "gymId" SET NOT NULL;

ALTER TABLE "Attendance"
ADD CONSTRAINT "Attendance_gymId_fkey"
FOREIGN KEY ("gymId") REFERENCES "Gym"("id")
ON DELETE RESTRICT
ON UPDATE CASCADE;

CREATE INDEX "Attendance_gymId_idx" ON "Attendance"("gymId");
CREATE INDEX "Attendance_gymId_date_idx" ON "Attendance"("gymId", "date");

