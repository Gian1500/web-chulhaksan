-- Taekwondo forms (links) + manual unlock per student.

-- CreateTable
CREATE TABLE "FormLink" (
    "id" TEXT NOT NULL,
    "title" TEXT NOT NULL,
    "url" TEXT NOT NULL,
    "order" INTEGER NOT NULL DEFAULT 0,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "FormLink_pkey" PRIMARY KEY ("id")
);

-- CreateIndex
CREATE INDEX "FormLink_order_idx" ON "FormLink"("order");

-- CreateTable
CREATE TABLE "StudentFormAccess" (
    "id" TEXT NOT NULL,
    "studentDni" TEXT NOT NULL,
    "formId" TEXT NOT NULL,
    "unlockedAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "unlockedByTeacherId" TEXT,

    CONSTRAINT "StudentFormAccess_pkey" PRIMARY KEY ("id")
);

-- CreateIndex
CREATE UNIQUE INDEX "StudentFormAccess_studentDni_formId_key" ON "StudentFormAccess"("studentDni", "formId");
CREATE INDEX "StudentFormAccess_studentDni_idx" ON "StudentFormAccess"("studentDni");
CREATE INDEX "StudentFormAccess_formId_idx" ON "StudentFormAccess"("formId");
CREATE INDEX "StudentFormAccess_unlockedByTeacherId_idx" ON "StudentFormAccess"("unlockedByTeacherId");

-- AddForeignKey
ALTER TABLE "StudentFormAccess"
ADD CONSTRAINT "StudentFormAccess_studentDni_fkey"
FOREIGN KEY ("studentDni") REFERENCES "Student"("dni")
ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "StudentFormAccess"
ADD CONSTRAINT "StudentFormAccess_formId_fkey"
FOREIGN KEY ("formId") REFERENCES "FormLink"("id")
ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "StudentFormAccess"
ADD CONSTRAINT "StudentFormAccess_unlockedByTeacherId_fkey"
FOREIGN KEY ("unlockedByTeacherId") REFERENCES "Teacher"("id")
ON DELETE SET NULL ON UPDATE CASCADE;

