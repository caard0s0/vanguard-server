CREATE TABLE "accounts" (
  "id" BIGSERIAL PRIMARY KEY,
  "owner" VARCHAR UNIQUE NOT NULL,
  "balance" BIGINT NOT NULL,
  "currency" VARCHAR NOT NULL,
  "created_at" TIMESTAMP WITH TIME ZONE NOT NULL DEFAULT (now())
);

CREATE TABLE "entries" (
  "id" BIGSERIAL PRIMARY KEY,
  "account_id" BIGINT NOT NULL,
  "amount" BIGINT NOT NULL,
  "created_at" TIMESTAMP WITH TIME ZONE NOT NULL DEFAULT (now())
);

CREATE TABLE "transfers" (
  "id" BIGSERIAL PRIMARY KEY,
  "from_account_id" BIGINT NOT NULL,
  "from_account_owner" VARCHAR NOT NULL,
  "to_account_id" BIGINT NOT NULL,
  "to_account_owner" VARCHAR NOT NULL,
  "amount" BIGINT NOT NULL,
  "created_at" TIMESTAMP WITH TIME ZONE NOT NULL DEFAULT (now())
);

CREATE INDEX ON "accounts" ("owner");

CREATE INDEX ON "entries" ("account_id");

CREATE INDEX ON "transfers" ("from_account_id");

CREATE INDEX ON "transfers" ("to_account_id");

CREATE INDEX ON "transfers" ("from_account_id", "to_account_id");

COMMENT ON COLUMN "entries"."amount" IS 'can be negative or positive';

COMMENT ON COLUMN "transfers"."amount" IS 'must be positive';

ALTER TABLE "entries" ADD FOREIGN KEY ("account_id") REFERENCES "accounts" ("id");

ALTER TABLE "transfers" ADD FOREIGN KEY ("from_account_id") REFERENCES "accounts" ("id");

ALTER TABLE "transfers" ADD FOREIGN KEY ("to_account_id") REFERENCES "accounts" ("id");

ALTER TABLE "transfers" ADD FOREIGN KEY ("from_account_owner") REFERENCES "accounts" ("owner");

ALTER TABLE "transfers" ADD FOREIGN KEY ("to_account_owner") REFERENCES "accounts" ("owner");