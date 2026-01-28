-- AlterTable
ALTER TABLE "Teacher" ADD COLUMN     "address" TEXT,
ADD COLUMN     "birthDate" TIMESTAMP(3),
ADD COLUMN     "gyms" TEXT[] DEFAULT ARRAY[]::TEXT[];
