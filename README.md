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

PostgreSQL is used as the core system to provide strong relational guarantees and BI compatibility while remaining low-cost.

---

## Core Data Model

The schema mirrors common CRM concepts to allow seamless future integration with platforms such as Salesforce.

### Tables

* `leads` – inbound opportunities and early-stage sales
* `accounts` – confirmed clients
* `projects` – billable work tied to accounts
* `activities` – shared activity log across leads, accounts, and projects

Primary keys are UUIDs. Status fields are enforced using enums. Referential integrity is handled at the database level where appropriate.

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

The schema intentionally aligns with Salesforce concepts:

| PostgreSQL Table | Salesforce Object |
| ---------------- | ----------------- |
| `leads`          | Lead              |
| `accounts`       | Account           |
| `projects`       | Opportunity       |
| `activities`     | Activity          |

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

Key decisions documented in this project include:

* Using PostgreSQL instead of a full CRM platform to reduce cost while preserving relational rigor
* Enforcing business rules via database constraints where possible
* Separating operational tables from analytics views
* Avoiding premature frontend or UI development

These decisions are discussed in more detail in `/docs/design-decisions.md`.

---

## Non-Goals

This project intentionally does not include:

* Invoicing or accounting
* Time tracking
* Authentication UI
* Bidirectional CRM synchronization

---

## Dashboard Overview

This backend is paired with a Power BI report that demonstrates how the schema and analytics views support real-world consulting insights. The dashboard is designed for executive-level visibility while remaining grounded in clean relational data.

### Primary Dashboard: Pipeline, Revenue, & Delivery

The main report page includes:
<img width="1439" height="908" alt="consultingCRM" src="https://github.com/user-attachments/assets/c2cbd681-c909-4589-9b66-cb45fe2054e8" />

* **Leads by Status** – Bar chart showing pipeline distribution across sales stages
* **Revenue by Client** – Horizontal bar chart summarizing total contracted value per account
* **KPI Cards**:

  * Total Estimated Pipeline Value
  * Total Contracted Revenue
  * Active Projects Count
* **Project Detail Table** – Account, project name, status, and contract value
* **Client Slicer** – Enables focused analysis by individual client

This layout mirrors common executive CRM dashboards while remaining simple and interpretable.

Screenshots of the dashboard are included in `/docs` for portfolio and review purposes.

---

## Power BI Report Pages

The report is structured as a multi-page BI asset. 

Planned / visible report tabs include:

* **Executive Overview** – High-level KPIs and pipeline health
* **Pipeline Analysis** – Lead volume and value by status and source
* **Revenue Overview** – Contracted revenue by client and project
* **Active Projects** – Delivery status and workload distribution
* **Client Detail** – Drill-down view per account
* **Delivery & Activity** – Engagement touchpoints and activity trends

This mirrors how dashboards are commonly organized in enterprise BI environments.

---

## Getting Started

### Prerequisites

* Supabase account
* PostgreSQL client (psql)
* Power BI Desktop

### Setup

1. Create a new Supabase project
2. Execute `schema.sql` to create tables and enums
3. Execute `views.sql` to create analytics views
4. (Optional) Load sample data for testing and demo purposes
5. Connect Power BI to Supabase using PostgreSQL or ODBC
6. Build visuals against the provided views

---

## Status

This project is actively evolving as a reference architecture and working backend. It is used for experimentation, analytics, and future integration planning rather than as a production SaaS application.

---

## License

MIT
