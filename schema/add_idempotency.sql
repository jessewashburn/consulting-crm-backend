-- Migration: Add idempotency and failure handling
-- Run this in Supabase SQL Editor

-- Add columns to event_outbox
ALTER TABLE event_outbox ADD COLUMN IF NOT EXISTS event_id text UNIQUE NOT NULL DEFAULT gen_random_uuid()::text;
ALTER TABLE event_outbox ADD COLUMN IF NOT EXISTS retry_count int NOT NULL DEFAULT 0;
ALTER TABLE event_outbox ADD COLUMN IF NOT EXISTS last_error text;

-- Create index for fast idempotency checks
CREATE INDEX IF NOT EXISTS idx_event_outbox_event_id ON event_outbox(event_id);

-- Verify the changes
SELECT 
    column_name, 
    data_type, 
    is_nullable, 
    column_default
FROM information_schema.columns
WHERE table_name = 'event_outbox'
ORDER BY ordinal_position;
