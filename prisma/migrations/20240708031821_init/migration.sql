-- CreateTable
CREATE TABLE "Client" (
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "name" TEXT NOT NULL,
    "address" TEXT NOT NULL,
    "phone_number" TEXT NOT NULL,
    "shop_name" TEXT NOT NULL,
    "debt_balance" REAL NOT NULL DEFAULT 0.0,
    "created_at" TEXT NOT NULL,
    "updated_at" TEXT,
    "deleted_at" TEXT
);

-- CreateTable
CREATE TABLE "ClientPayment" (
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "payment_date" TEXT NOT NULL,
    "paid_amount" REAL NOT NULL,
    "notes" TEXT NOT NULL,
    "client_id" INTEGER NOT NULL,
    CONSTRAINT "ClientPayment_client_id_fkey" FOREIGN KEY ("client_id") REFERENCES "Client" ("id") ON DELETE RESTRICT ON UPDATE CASCADE
);

-- CreateTable
CREATE TABLE "Manager" (
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "username" TEXT NOT NULL,
    "password" TEXT NOT NULL
);

-- CreateTable
CREATE TABLE "Note" (
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "title" TEXT NOT NULL,
    "content" TEXT NOT NULL,
    "created_at" TEXT NOT NULL
);

-- CreateTable
CREATE TABLE "StorageOut" (
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "flour_class_one_amount" REAL NOT NULL,
    "flour_class_two_amount" REAL NOT NULL,
    "flour_class_three_amount" REAL NOT NULL,
    "flour_class_four_amount" REAL NOT NULL,
    "flour_class_one_unit_price" REAL NOT NULL,
    "flour_class_two_unit_price" REAL NOT NULL,
    "flour_class_three_unit_price" REAL NOT NULL,
    "flour_class_four_unit_price" REAL NOT NULL,
    "sale_id" INTEGER NOT NULL,
    CONSTRAINT "StorageOut_sale_id_fkey" FOREIGN KEY ("sale_id") REFERENCES "Sale" ("id") ON DELETE RESTRICT ON UPDATE CASCADE
);

-- CreateTable
CREATE TABLE "Sale" (
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "client_id" INTEGER NOT NULL,
    "created_at" TEXT NOT NULL,
    "total_price" REAL NOT NULL,
    "client_old_debt" REAL NOT NULL,
    "client_new_debt" REAL NOT NULL,
    CONSTRAINT "Sale_client_id_fkey" FOREIGN KEY ("client_id") REFERENCES "Client" ("id") ON DELETE RESTRICT ON UPDATE CASCADE
);

-- CreateTable
CREATE TABLE "StorageState" (
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT
);

-- CreateIndex
CREATE UNIQUE INDEX "StorageOut_sale_id_key" ON "StorageOut"("sale_id");
