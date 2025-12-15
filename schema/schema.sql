-- =========================
-- ENUM TYPES
-- =========================

create type lead_status as enum (
  'new',
  'contacted',
  'qualified',
  'won',
  'lost'
);

create type account_status as enum (
  'active',
  'dormant'
);

create type project_status as enum (
  'active',
  'completed',
  'on_hold'
);

create type activity_type as enum (
  'call',
  'email',
  'meeting',
  'work'
);

create type related_type as enum (
  'lead',
  'account',
  'project'
);

-- =========================
-- TABLES
-- =========================

create table leads (
  id uuid primary key default gen_random_uuid(),
  company_name text not null,
  contact_name text,
  email text unique,
  industry text,
  estimated_value numeric check (estimated_value >= 0),
  lead_status lead_status not null default 'new',
  lead_source text,
  created_at timestamptz default now(),
  last_contact_at timestamptz
);

create table accounts (
  id uuid primary key default gen_random_uuid(),
  company_name text not null,
  industry text,
  primary_contact text,
  email text,
  account_status account_status not null default 'active',
  created_at timestamptz default now()
);

create table projects (
  id uuid primary key default gen_random_uuid(),
  account_id uuid not null
    references accounts(id)
    on delete cascade,
  project_name text not null,
  start_date date,
  end_date date,
  contract_value numeric check (contract_value >= 0),
  project_status project_status not null default 'active'
);

create table activities (
  id uuid primary key default gen_random_uuid(),
  related_type related_type not null,
  related_id uuid not null,
  activity_type activity_type not null,
  activity_date timestamptz default now(),
  notes text
);

-- =========================
-- INDEXES
-- =========================
-- Indexes can be added later based on query patterns
-- Common candidates:
--   create index on projects(account_id);
--   create index on activities(related_type, related_id);
