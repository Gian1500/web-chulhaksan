/*
  Warnings:

  - A unique constraint covering the columns `[mpPreferenceId]` on the table `Payment` will be added. If there are existing duplicate values, this will fail.

*/
-- AlterTable
ALTER TABLE "Payment" ADD COLUMN     "mpPreferenceId" TEXT;

-- CreateIndex
CREATE UNIQUE INDEX "Payment_mpPreferenceId_key" ON "Payment"("mpPreferenceId");
