# Design Decisions

## Architecture Overview

This CRM backend uses PostgreSQL as the system of record with a clear separation between:
- **Schema** (schema.sql): Core data model
- **Views** (views.sql): Analytics layer for Power BI

## Key Decisions

### 1. UUID Primary Keys
All tables use UUID primary keys for:
- Distributed system readiness
- Avoidance of enumeration attacks
- Easier data migration and merging

### 2. Enum Types
PostgreSQL enums provide:
- Type safety at the database level
- Clear documentation of valid states
- Performance benefits over string checks

### 3. Activity Polymorphism
The `activities` table uses a polymorphic pattern with `related_type` and `related_id` to track activities across leads, accounts, and projects without junction tables.

### 4. View-Based Analytics
Power BI connects exclusively to views, providing:
- Stable API contract for BI tools
- Flexibility to change underlying schema
- Pre-aggregated data for performance

## Trade-offs

- **No foreign key for activities.related_id**: Enables polymorphism but sacrifices referential integrity
- **Denormalized views**: Simplify analytics queries and improve BI performance at the cost of more complex view definitions
