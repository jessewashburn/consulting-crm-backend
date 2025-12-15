-- =========================
-- SAMPLE DATA
-- =========================
-- Run this after schema.sql to populate with realistic test data

-- =========================
-- LEADS
-- =========================

insert into leads (id, company_name, contact_name, email, industry, estimated_value, lead_status, lead_source, created_at, last_contact_at) values
-- Won (2)
('550e8400-e29b-41d4-a716-446655440001', 'FinServe Bank', 'Emily Rodriguez', 'erodriguez@finserve.com', 'Financial Services', 500000, 'won', 'Cold Call', '2024-11-10 13:20:00-08', '2025-01-15 10:00:00-08'),
('550e8400-e29b-41d4-a716-446655440002', 'Quantum Dynamics', 'Alex Rivera', 'arivera@quantumdynamics.com', 'Technology', 425000, 'won', 'Conference', '2024-12-01 09:00:00-08', '2025-02-05 16:00:00-08'),

-- Qualified (3)
('550e8400-e29b-41d4-a716-446655440003', 'Acme Manufacturing', 'John Smith', 'john.smith@acme-mfg.com', 'Manufacturing', 150000, 'qualified', 'Website', '2025-01-15 10:00:00-08', '2025-02-10 14:30:00-08'),
('550e8400-e29b-41d4-a716-446655440004', 'Pacific Insurance Group', 'Maria Garcia', 'mgarcia@pacificins.com', 'Insurance', 275000, 'qualified', 'Partner', '2025-01-20 11:30:00-08', '2025-03-01 10:00:00-08'),
('550e8400-e29b-41d4-a716-446655440005', 'Urban Development Corp', 'James Wilson', 'jwilson@urbandevelopment.com', 'Real Estate', 380000, 'qualified', 'Referral', '2025-02-01 08:15:00-08', '2025-03-05 13:45:00-08'),

-- Contacted (3)
('550e8400-e29b-41d4-a716-446655440006', 'TechStart Solutions', 'Sarah Johnson', 'sarah.j@techstart.io', 'Technology', 75000, 'contacted', 'Referral', '2025-02-20 09:15:00-08', '2025-02-25 11:00:00-08'),
('550e8400-e29b-41d4-a716-446655440007', 'Midwest Agriculture Co', 'Tom Harrison', 'tharrison@midwestagriculture.com', 'Agriculture', 95000, 'contacted', 'Cold Call', '2025-02-28 14:20:00-08', '2025-03-08 09:30:00-08'),
('550e8400-e29b-41d4-a716-446655440008', 'Digital Media Partners', 'Rachel Green', 'rgreen@digitalmedia.io', 'Media', 120000, 'contacted', 'LinkedIn', '2025-03-02 10:45:00-08', '2025-03-10 15:00:00-08'),

-- New (6)
('550e8400-e29b-41d4-a716-446655440009', 'Global Retail Co', 'Michael Chen', 'm.chen@globalretail.com', 'Retail', 200000, 'new', 'Conference', '2025-03-01 08:45:00-08', null),
('550e8400-e29b-41d4-a716-446655440010', 'Sunrise Hospitality', 'Nina Patel', 'npatel@sunrisehospitality.com', 'Hospitality', 85000, 'new', 'Website', '2025-03-12 07:30:00-08', null),
('550e8400-e29b-41d4-a716-446655440011', 'Advanced Robotics Inc', 'Kevin O''Brien', 'kobrien@advancedrobotics.com', 'Manufacturing', 450000, 'new', 'Trade Show', '2025-03-13 16:00:00-08', null),
('550e8400-e29b-41d4-a716-446655440012', 'GreenTech Solutions', 'Amanda Lee', 'alee@greentech.com', 'Environmental Services', 110000, 'new', 'Partner', '2025-03-14 11:15:00-08', null),
('550e8400-e29b-41d4-a716-446655440013', 'Metro Transportation', 'Carlos Sanchez', 'csanchez@metrotrans.com', 'Transportation', 325000, 'new', 'Website', '2025-03-15 09:50:00-08', null),
('550e8400-e29b-41d4-a716-446655440014', 'Premier Education Systems', 'Laura Thompson', 'lthompson@premieredu.org', 'Education', 65000, 'new', 'Referral', '2025-03-15 13:20:00-08', null),

-- Lost (1)
('550e8400-e29b-41d4-a716-446655440015', 'HealthCare Plus', 'David Williams', 'dwilliams@hcplus.org', 'Healthcare', 300000, 'lost', 'LinkedIn', '2024-12-05 15:30:00-08', '2025-01-20 09:00:00-08');

-- =========================
-- ACCOUNTS
-- =========================

insert into accounts (id, company_name, industry, primary_contact, email, account_status, created_at) values
('660e8400-e29b-41d4-a716-446655440001', 'BlueSky Logistics', 'Transportation', 'Jennifer Martinez', 'jmartinez@bluesky-log.com', 'active', '2023-06-15 10:00:00-08'),
('660e8400-e29b-41d4-a716-446655440002', 'Innovation Labs', 'Technology', 'Robert Taylor', 'rtaylor@innovlabs.com', 'active', '2024-03-20 14:30:00-08'),
('660e8400-e29b-41d4-a716-446655440003', 'EcoEnergy Corp', 'Energy', 'Lisa Anderson', 'landerson@ecoenergy.com', 'active', '2024-08-10 09:15:00-08'),
('660e8400-e29b-41d4-a716-446655440004', 'MegaStore Retail', 'Retail', 'Thomas Brown', 'tbrown@megastore.com', 'dormant', '2022-01-05 11:00:00-08');

-- =========================
-- PROJECTS
-- =========================

insert into projects (id, account_id, project_name, start_date, end_date, contract_value, project_status) values
('770e8400-e29b-41d4-a716-446655440001', '660e8400-e29b-41d4-a716-446655440001', 'Supply Chain Optimization', '2024-01-15', '2024-06-30', 250000, 'completed'),
('770e8400-e29b-41d4-a716-446655440002', '660e8400-e29b-41d4-a716-446655440001', 'Warehouse Management System', '2024-09-01', '2025-03-31', 180000, 'active'),
('770e8400-e29b-41d4-a716-446655440003', '660e8400-e29b-41d4-a716-446655440002', 'AI Platform Development', '2024-06-01', '2025-12-31', 500000, 'active'),
('770e8400-e29b-41d4-a716-446655440004', '660e8400-e29b-41d4-a716-446655440003', 'Renewable Energy Strategy', '2024-10-01', '2025-04-30', 320000, 'active'),
('770e8400-e29b-41d4-a716-446655440005', '660e8400-e29b-41d4-a716-446655440003', 'Carbon Footprint Analysis', '2024-03-01', '2024-08-31', 150000, 'completed'),
('770e8400-e29b-41d4-a716-446655440006', '660e8400-e29b-41d4-a716-446655440004', 'E-commerce Migration', '2023-05-01', '2024-02-28', 400000, 'on_hold');

-- =========================
-- ACTIVITIES
-- =========================

insert into activities (id, related_type, related_id, activity_type, activity_date, notes) values
-- Lead activities
('880e8400-e29b-41d4-a716-446655440001', 'lead', '550e8400-e29b-41d4-a716-446655440001', 'call', '2025-01-15 10:30:00-08', 'Initial discovery call. Discussed supply chain challenges and potential engagement.'),
('880e8400-e29b-41d4-a716-446655440002', 'lead', '550e8400-e29b-41d4-a716-446655440001', 'email', '2025-02-01 14:00:00-08', 'Sent proposal for Q1 2025 engagement. Awaiting response.'),
('880e8400-e29b-41d4-a716-446655440003', 'lead', '550e8400-e29b-41d4-a716-446655440002', 'meeting', '2025-02-25 11:00:00-08', 'In-person meeting with leadership team. Strong interest in digital transformation.'),
('880e8400-e29b-41d4-a716-446655440004', 'lead', '550e8400-e29b-41d4-a716-446655440004', 'call', '2025-01-15 15:30:00-08', 'Contract signed! Converted to account.'),

-- Account activities
('880e8400-e29b-41d4-a716-446655440005', 'account', '660e8400-e29b-41d4-a716-446655440001', 'meeting', '2024-12-10 10:00:00-08', 'Quarterly business review. Discussed expanding engagement to additional business units.'),
('880e8400-e29b-41d4-a716-446655440006', 'account', '660e8400-e29b-41d4-a716-446655440002', 'email', '2025-01-05 09:15:00-08', 'Sent project status update and next phase proposal.'),
('880e8400-e29b-41d4-a716-446655440007', 'account', '660e8400-e29b-41d4-a716-446655440003', 'call', '2025-02-20 13:30:00-08', 'Check-in call. Client very satisfied with current project progress.'),

-- Project activities
('880e8400-e29b-41d4-a716-446655440008', 'project', '770e8400-e29b-41d4-a716-446655440002', 'work', '2025-03-01 09:00:00-08', 'Sprint planning session for warehouse integration module.'),
('880e8400-e29b-41d4-a716-446655440009', 'project', '770e8400-e29b-41d4-a716-446655440002', 'work', '2025-03-05 14:30:00-08', 'Completed API integration with legacy inventory system.'),
('880e8400-e29b-41d4-a716-446655440010', 'project', '770e8400-e29b-41d4-a716-446655440003', 'meeting', '2025-02-15 10:00:00-08', 'Technical architecture review with client engineering team.'),
('880e8400-e29b-41d4-a716-446655440011', 'project', '770e8400-e29b-41d4-a716-446655440004', 'work', '2025-03-10 11:00:00-08', 'Completed market analysis phase. Moving to implementation.'),
('880e8400-e29b-41d4-a716-446655440012', 'project', '770e8400-e29b-41d4-a716-446655440006', 'call', '2024-10-15 16:00:00-08', 'Project on hold due to client budget reallocation. Resume date TBD.');
