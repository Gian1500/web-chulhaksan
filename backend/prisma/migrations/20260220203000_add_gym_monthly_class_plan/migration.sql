-- CreateTable
CREATE TABLE "GymMonthlyClassPlan" (
    "id" TEXT NOT NULL,
    "gymId" TEXT NOT NULL,
    "year" INTEGER NOT NULL,
    "month" INTEGER NOT NULL,
    "classesPlanned" INTEGER NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "GymMonthlyClassPlan_pkey" PRIMARY KEY ("id")
);

-- CreateIndex
CREATE UNIQUE INDEX "GymMonthlyClassPlan_gymId_year_month_key" ON "GymMonthlyClassPlan"("gymId", "year", "month");

-- CreateIndex
CREATE INDEX "GymMonthlyClassPlan_gymId_idx" ON "GymMonthlyClassPlan"("gymId");

-- AddForeignKey
ALTER TABLE "GymMonthlyClassPlan" ADD CONSTRAINT "GymMonthlyClassPlan_gymId_fkey" FOREIGN KEY ("gymId") REFERENCES "Gym"("id") ON DELETE CASCADE ON UPDATE CASCADE;
