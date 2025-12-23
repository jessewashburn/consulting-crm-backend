-- Test script for event outbox functionality
-- Run this after applying schema.sql and triggers.sql

-- Insert a test lead
insert into leads (company_name, contact_name, email, lead_status, industry, estimated_value)
values ('Acme Corp', 'John Smith', 'john@acme.com', 'new', 'Technology', 50000);

-- Insert a test account
insert into accounts (company_name, industry, primary_contact, email)
values ('Beta Industries', 'Manufacturing', 'Jane Doe', 'jane@beta.com');

-- Check the event_outbox - should show 2 events
select 
  event_type,
  aggregate_type,
  aggregate_id,
  payload->>'company_name' as company_name,
  payload->>'email' as email,
  created_at,
  processed_at
from event_outbox
order by created_at desc;

-- Update the lead status
update leads 
set lead_status = 'contacted', last_contact_at = now()
where email = 'john@acme.com';

-- Check outbox again - should now show 3 events (2 inserts + 1 update)
select 
  event_type,
  aggregate_type,
  payload->>'company_name' as company_name,
  payload->>'lead_status' as status,
  created_at
from event_outbox
order by created_at desc;
