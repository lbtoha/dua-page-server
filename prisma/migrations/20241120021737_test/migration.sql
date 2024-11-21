/*
  Warnings:

  - The primary key for the `category` table will be changed. If it partially fails, the table could be left without primary key constraint.
  - The primary key for the `dua` table will be changed. If it partially fails, the table could be left without primary key constraint.
  - The primary key for the `sub_category` table will be changed. If it partially fails, the table could be left without primary key constraint.
  - Made the column `id` on table `category` required. This step will fail if there are existing NULL values in that column.
  - Made the column `id` on table `dua` required. This step will fail if there are existing NULL values in that column.
  - Made the column `id` on table `sub_category` required. This step will fail if there are existing NULL values in that column.

*/
-- RedefineTables
PRAGMA defer_foreign_keys=ON;
PRAGMA foreign_keys=OFF;
CREATE TABLE "new_category" (
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "cat_id" INTEGER NOT NULL,
    "cat_name_bn" TEXT,
    "cat_name_en" TEXT,
    "no_of_subcat" INTEGER,
    "no_of_dua" INTEGER,
    "cat_icon" TEXT
);
INSERT INTO "new_category" ("cat_icon", "cat_id", "cat_name_bn", "cat_name_en", "id", "no_of_dua", "no_of_subcat") SELECT "cat_icon", "cat_id", "cat_name_bn", "cat_name_en", "id", "no_of_dua", "no_of_subcat" FROM "category";
DROP TABLE "category";
ALTER TABLE "new_category" RENAME TO "category";
CREATE UNIQUE INDEX "category_cat_id_key" ON "category"("cat_id");
CREATE TABLE "new_dua" (
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "cat_id" INTEGER NOT NULL,
    "subcat_id" INTEGER NOT NULL,
    "dua_id" INTEGER NOT NULL,
    "dua_name_bn" TEXT,
    "dua_name_en" TEXT,
    "top_bn" TEXT,
    "top_en" TEXT,
    "dua_arabic" TEXT,
    "dua_indopak" TEXT,
    "clean_arabic" TEXT,
    "transliteration_bn" TEXT,
    "transliteration_en" TEXT,
    "translation_bn" TEXT,
    "translation_en" TEXT,
    "bottom_bn" TEXT,
    "bottom_en" TEXT,
    "refference_bn" TEXT,
    "refference_en" TEXT,
    "audio" TEXT,
    CONSTRAINT "dua_subcat_id_fkey" FOREIGN KEY ("subcat_id") REFERENCES "sub_category" ("subcat_id") ON DELETE RESTRICT ON UPDATE CASCADE
);
INSERT INTO "new_dua" ("audio", "bottom_bn", "bottom_en", "cat_id", "clean_arabic", "dua_arabic", "dua_id", "dua_indopak", "dua_name_bn", "dua_name_en", "id", "refference_bn", "refference_en", "subcat_id", "top_bn", "top_en", "translation_bn", "translation_en", "transliteration_bn", "transliteration_en") SELECT "audio", "bottom_bn", "bottom_en", "cat_id", "clean_arabic", "dua_arabic", "dua_id", "dua_indopak", "dua_name_bn", "dua_name_en", "id", "refference_bn", "refference_en", "subcat_id", "top_bn", "top_en", "translation_bn", "translation_en", "transliteration_bn", "transliteration_en" FROM "dua";
DROP TABLE "dua";
ALTER TABLE "new_dua" RENAME TO "dua";
CREATE UNIQUE INDEX "dua_dua_id_key" ON "dua"("dua_id");
CREATE TABLE "new_sub_category" (
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "cat_id" INTEGER NOT NULL,
    "subcat_id" INTEGER NOT NULL,
    "subcat_name_bn" TEXT,
    "subcat_name_en" TEXT,
    "no_of_dua" INTEGER,
    CONSTRAINT "sub_category_cat_id_fkey" FOREIGN KEY ("cat_id") REFERENCES "category" ("cat_id") ON DELETE RESTRICT ON UPDATE CASCADE
);
INSERT INTO "new_sub_category" ("cat_id", "id", "no_of_dua", "subcat_id", "subcat_name_bn", "subcat_name_en") SELECT "cat_id", "id", "no_of_dua", "subcat_id", "subcat_name_bn", "subcat_name_en" FROM "sub_category";
DROP TABLE "sub_category";
ALTER TABLE "new_sub_category" RENAME TO "sub_category";
CREATE UNIQUE INDEX "sub_category_subcat_id_key" ON "sub_category"("subcat_id");
PRAGMA foreign_keys=ON;
PRAGMA defer_foreign_keys=OFF;
