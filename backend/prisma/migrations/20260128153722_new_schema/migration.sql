-- AlterTable
ALTER TABLE "Student" ADD COLUMN     "guardianPhone" TEXT,
ADD COLUMN     "gym" TEXT;

-- AlterTable
ALTER TABLE "Teacher" ADD COLUMN     "mpAccessToken" TEXT,
ADD COLUMN     "mpConnectedAt" TIMESTAMP(3),
ADD COLUMN     "mpRefreshToken" TEXT,
ADD COLUMN     "mpTokenExpiresAt" TIMESTAMP(3),
ADD COLUMN     "mpUserId" TEXT;
