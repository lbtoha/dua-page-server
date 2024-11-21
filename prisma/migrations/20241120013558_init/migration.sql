-- CreateTable
CREATE TABLE "category" (
    "id" INTEGER,
    "cat_id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "cat_name_bn" TEXT,
    "cat_name_en" TEXT,
    "no_of_subcat" INTEGER,
    "no_of_dua" INTEGER,
    "cat_icon" TEXT
);

-- CreateTable
CREATE TABLE "sub_category" (
    "id" INTEGER,
    "cat_id" INTEGER NOT NULL,
    "subcat_id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "subcat_name_bn" TEXT,
    "subcat_name_en" TEXT,
    "no_of_dua" INTEGER
);

-- CreateTable
CREATE TABLE "dua" (
    "id" INTEGER,
    "cat_id" INTEGER NOT NULL,
    "subcat_id" INTEGER NOT NULL,
    "dua_id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
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
    "audio" TEXT
);