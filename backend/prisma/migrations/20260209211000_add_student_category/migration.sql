-- Add adult/child tag for students.

DO $$
BEGIN
  IF NOT EXISTS (SELECT 1 FROM pg_type WHERE typname = 'StudentCategory') THEN
    CREATE TYPE "StudentCategory" AS ENUM ('ADULT', 'CHILD');
  END IF;
END$$;

ALTER TABLE "Student"
ADD COLUMN IF NOT EXISTS "category" "StudentCategory" NOT NULL DEFAULT 'ADULT';

CREATE INDEX IF NOT EXISTS "Student_category_idx" ON "Student"("category");

