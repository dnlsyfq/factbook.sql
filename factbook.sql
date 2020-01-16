
CREATE TABLE "facts" (
  "id" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
  "code" varchar(255) NOT NULL,
  "name" varchar(255) NOT NULL,
  "area"       integer,
  "area_land"  integer,
  "area_water" integer,
  "population"        integer,
  "population_growth" float,
  "birth_rate"        float,
  "death_rate"        float,
  "migration_rate"    float,
  "created_at" datetime,
  "updated_at" datetime
);

.open factbook.db
.tables
.mode column 




