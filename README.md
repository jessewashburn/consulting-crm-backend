# Consulting CRM Backend

## Overview

This repository documents the design and implementation of a lightweight CRM backend intended for a solo consulting practice. The system is built around **PostgreSQL (via Supabase)** as the system of record and is designed to support client intake, project tracking, and revenue analytics while remaining compatible with future enterprise CRM integrations.

The goal of this project is not to build a full custom CRM application, but to demonstrate **sound data modeling, analytics readiness, and architectural judgment** using tools that balance cost, maintainability, and extensibility.

---

## Problem Statement

Solo consultants and small firms often manage client relationships using ad hoc tools such as spreadsheets, notes, and email threads. These approaches make it difficult to:

* Understand sales pipeline health
* Track project and revenue concentration
* Produce consistent analytics
* Transition to enterprise CRM platforms later

This project provides a structured backend that solves those problems without overengineering.

---

## Architecture Summary

* **Database:** PostgreSQL (Supabase)
* **System of Record:** PostgreSQL schema and constraints
* **Analytics:** Power BI (via database views)
* **API Access:** Supabase auto-generated REST API
* **Frontend:** Out of scope for MVP

PostgreSQL is intentionally used as the core system to provide strong relational guarantees and BI compatibility while remaining low-cost.

---

## Core Data Model

The schema mirrors common CRM concepts to allow seamless future integration with platforms such as Salesforce.

### Tables

* `leads` – inbound opportunities and early-stage sales
* `accounts` – confirmed clients
* `projects` – billable work tied to accounts
* `activities` – shared activity log across leads, accounts, and projects

Primary keys are UUIDs. Status fields are enforced using enums. Referential integrity is handled at the database level.

An ER diagram is included in `/architecture`.

---

## Analytics Design

Analytics are built on **database views**, not raw tables. This provides:

* Stable contracts for BI tools
* Simplified reporting logic
* Isolation between operational schema and analytics

Power BI connects directly to these views to generate pipeline, revenue, and client health dashboards.

---

## Salesforce Readiness

Although Salesforce is not part of the MVP implementation, the schema intentionally aligns with Salesforce concepts:

| PostgreSQL Table | Salesforce Object |
| ---------------- | ----------------- |
| leads            | Lead              |
| accounts         | Account           |
| projects         | Opportunity       |
| activities       | Activity          |

This allows future synchronization via API, ETL tooling, or Power Automate without requiring a schema redesign.

---

## Repository Structure

```
consulting-crm-backend/
  README.md
  schema.sql
  views.sql
  architecture/
    er-diagram.png
  docs/
    design-decisions.md
    salesforce-mapping.md
```

---

## Design Decisions

Key decisions documented in this project:

* Use of PostgreSQL instead of a full CRM platform to reduce cost while preserving relational rigor
* Use of database constraints over application logic where possible
* Separation of operational tables and analytics views
* Avoidance of premature frontend development

These decisions are discussed in more detail in `/docs/design-decisions.md`.

---

## Non-Goals

This project intentionally does not include:

* Invoicing or accounting
* Time tracking
* Authentication UI
* Bidirectional CRM synchronization

Those concerns are out of scope for a solo-consultant MVP.

---

## Status

This project is actively evolving as a reference architecture and working backend. It is used for experimentation, analytics, and future integration planning rather than as a production SaaS application.

---

## License

MIT
