-- =========================
-- EVENT OUTBOX TRIGGERS
-- =========================
-- These triggers automatically populate the event_outbox table
-- whenever core entities are created or updated, ensuring
-- transactional event emission for downstream analytics.

-- Generic function to emit events for any entity
create or replace function emit_event()
returns trigger as $$
declare
  event_name text;
  agg_type text;
begin
  -- Determine aggregate type from table name
  agg_type := TG_TABLE_NAME;
  
  -- Build event type (e.g., 'INSERT_LEAD', 'UPDATE_ACCOUNT')
  event_name := TG_OP || '_' || upper(agg_type);
  
  -- For DELETE operations, use OLD row; otherwise use NEW
  if TG_OP = 'DELETE' then
    insert into event_outbox (event_type, aggregate_type, aggregate_id, payload)
    values (
      event_name,
      agg_type,
      OLD.id,
      row_to_json(OLD)
    );
    return OLD;
  else
    insert into event_outbox (event_type, aggregate_type, aggregate_id, payload)
    values (
      event_name,
      agg_type,
      NEW.id,
      row_to_json(NEW)
    );
    return NEW;
  end if;
end;
$$ language plpgsql;

-- =========================
-- TRIGGER ATTACHMENTS
-- =========================

-- Leads: Track all lifecycle events
create trigger lead_event_trigger
after insert or update or delete on leads
for each row execute function emit_event();

-- Accounts: Track creation and status changes
create trigger account_event_trigger
after insert or update or delete on accounts
for each row execute function emit_event();

-- Projects: Track project lifecycle
create trigger project_event_trigger
after insert or update or delete on projects
for each row execute function emit_event();

-- Activities: Track all interactions
create trigger activity_event_trigger
after insert or update or delete on activities
for each row execute function emit_event();
