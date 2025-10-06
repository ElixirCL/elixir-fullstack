CREATE TABLE IF NOT EXISTS "schema_migrations" ("version" INTEGER PRIMARY KEY, "inserted_at" TEXT);
CREATE TABLE IF NOT EXISTS "quotes" ("id" INTEGER PRIMARY KEY AUTOINCREMENT, "quote" TEXT, "author" TEXT, "source" TEXT, "inserted_at" TEXT NOT NULL, "updated_at" TEXT NOT NULL);
CREATE TABLE sqlite_sequence(name,seq);
CREATE UNIQUE INDEX "index_for_duplicate_quotes" ON "quotes" ("quote");
INSERT INTO schema_migrations VALUES(20250926120933,'2025-10-05T11:43:28');
