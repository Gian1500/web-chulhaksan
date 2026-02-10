-- DropForeignKey
ALTER TABLE "StudentFormAccess" DROP CONSTRAINT "StudentFormAccess_formId_fkey";

-- AddForeignKey
ALTER TABLE "StudentFormAccess" ADD CONSTRAINT "StudentFormAccess_formId_fkey" FOREIGN KEY ("formId") REFERENCES "FormLink"("id") ON DELETE RESTRICT ON UPDATE CASCADE;
