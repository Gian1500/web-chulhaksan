-- DropForeignKey
ALTER TABLE "Student" DROP CONSTRAINT "Student_gymId_fkey";

-- AlterTable
ALTER TABLE "Gym" ADD COLUMN     "isArchived" BOOLEAN NOT NULL DEFAULT false;

-- AlterTable
ALTER TABLE "Student" ALTER COLUMN "gymId" DROP NOT NULL;

-- AddForeignKey
ALTER TABLE "Student" ADD CONSTRAINT "Student_gymId_fkey" FOREIGN KEY ("gymId") REFERENCES "Gym"("id") ON DELETE SET NULL ON UPDATE CASCADE;
