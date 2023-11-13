
-- Define schema version
CREATE SCHEMA IF NOT EXISTS "active_record" VERSION "7.1";

-- Create table api_v1_quests
CREATE TABLE "api_v1_quests" (
  "user_id" bigint,
  "quest_id" bigint,
  "progress" integer,
  "ranking" integer,
  "created_at" timestamp NOT NULL,
  "updated_at" timestamp NOT NULL
);

-- Create table api_v1_user_quests
CREATE TABLE "api_v1_user_quests" (
  "user_id" bigint,
  "quest_id" bigint,
  "progress" integer,
  "ranking" integer,
  "created_at" timestamp NOT NULL,
  "updated_at" timestamp NOT NULL
);

-- Create table companies
CREATE TABLE "companies" (
  "name" varchar,
  "website" varchar,
  "created_at" timestamp NOT NULL,
  "updated_at" timestamp NOT NULL
);

-- Create table educations
CREATE TABLE "educations" (
  "user_id" bigint NOT NULL,
  "institution" varchar,
  "degree" varchar,
  "graduation_year" integer,
  "created_at" timestamp NOT NULL,
  "updated_at" timestamp NOT NULL
);

-- Add index on educations
CREATE INDEX "index_educations_on_user_id" ON "educations" ("user_id");

-- Create table job_applications
CREATE TABLE "job_applications" (
  "user_id" bigint NOT NULL,
  "role_id" bigint NOT NULL,
  "cover_letter" text,
  "resume" text,
  "status" boolean DEFAULT false,
  "created_at" timestamp NOT NULL,
  "updated_at" timestamp NOT NULL
);

-- Add unique index on job_applications
CREATE UNIQUE INDEX "index_job_applications_on_user_id_and_role_id" ON "job_applications" ("user_id", "role_id");

-- Create table profiles
CREATE TABLE "profiles" (
  "user_id" bigint NOT NULL,
  "image" varchar,
  "introduction" text,
  "resume" text,
  "about" text,
  "experience" text,
  "portfolio_link" varchar,
  "cover_letter" varchar,
  "created_at" timestamp NOT NULL,
  "updated_at" timestamp NOT NULL
);

-- Add index on profiles
CREATE INDEX "index_profiles_on_user_id" ON "profiles" ("user_id");

-- Create table quests
CREATE TABLE "quests" (
  "name" varchar,
  "description" text,
  "duration" integer,
  "created_at" timestamp NOT NULL,
  "updated_at" timestamp NOT NULL
);

-- Create table roles
CREATE TABLE "roles" (
  "company_id" bigint NOT NULL,
  "name" varchar,
  "description" text,
  "employee_type" varchar,
  "location" varchar,
  "salary" numeric(10,2),
  "created_at" timestamp NOT NULL,
  "updated_at" timestamp NOT NULL,
  "quest_id" bigint,
  "ranking" integer DEFAULT 0
);

-- Add unique index on roles
CREATE UNIQUE INDEX "index_roles_on_company_id_and_name" ON "roles" ("company_id", "name");

-- Add index on roles
CREATE INDEX "index_roles_on_quest_id" ON "roles" ("quest_id");

-- Create table skills
CREATE TABLE "skills" (
  "name" varchar,
  "user_id" bigint NOT NULL,
  "created_at" timestamp NOT NULL,
  "updated_at" timestamp NOT NULL
);

-- Add index on skills
CREATE INDEX "index_skills_on_user_id" ON "skills" ("user_id");

-- Create table user_quests
CREATE TABLE "user_quests" (
  "user_id" bigint NOT NULL,
  "quest_id" bigint NOT NULL,
  "created_at" timestamp NOT NULL,
  "updated_at" timestamp NOT NULL,
  "progress" integer DEFAULT 0,
  "ranking" integer DEFAULT 0
);

-- Add index on user_quests
CREATE INDEX "index_user_quests_on_quest_id" ON "user_quests" ("quest_id");

-- Add index on user_quests
CREATE INDEX "index_user_quests_on_user_id" ON "user_quests" ("user_id");

-- Create table users
CREATE TABLE "users" (
  "name" varchar,
  "created_at" timestamp NOT NULL,
  "updated_at" timestamp NOT NULL,
  "role_type" varchar
);

-- Add foreign key on educations
ALTER TABLE "educations" ADD CONSTRAINT "fk_rails_2edf2e0c6b"
FOREIGN KEY ("user_id") REFERENCES "users" ("id");

-- Add foreign key on job_applications
ALTER TABLE "job_applications" ADD CONSTRAINT "fk_rails_7c9e900439"
FOREIGN KEY ("role_id") REFERENCES "roles" ("id");

-- Add foreign key on job_applications
ALTER TABLE "job_applications" ADD CONSTRAINT "fk_rails_b30e06ba2f"
FOREIGN KEY ("user_id") REFERENCES "users" ("id");

-- Add foreign key on profiles
ALTER TABLE "profiles" ADD CONSTRAINT "fk_rails_e55f1546a7"
FOREIGN KEY ("user_id") REFERENCES "users" ("id");

-- Add foreign key on roles
ALTER TABLE "roles" ADD CONSTRAINT "fk_rails_66f450f2d0"
FOREIGN KEY ("company_id") REFERENCES "companies" ("id");

-- Add foreign key on roles
ALTER TABLE "roles" ADD CONSTRAINT "fk_rails_6d8c37042e"
FOREIGN KEY ("quest_id") REFERENCES "quests" ("id");

-- Add foreign key on skills
ALTER TABLE "skills" ADD CONSTRAINT "fk_rails_eecc8b837b"
FOREIGN KEY ("user_id") REFERENCES "users" ("id");

-- Add foreign key on user_quests
ALTER TABLE "user_quests" ADD CONSTRAINT "fk_rails_39e6f0a516"
FOREIGN KEY ("quest_id") REFERENCES "quests" ("id");

-- Add foreign key on user_quests
ALTER TABLE "user_quests" ADD CONSTRAINT "fk_rails_22a365f0ee"
FOREIGN KEY ("user_id") REFERENCES "users" ("id");
