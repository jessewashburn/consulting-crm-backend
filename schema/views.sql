-- =========================
-- LEAD PIPELINE SUMMARY
-- =========================

create view lead_pipeline_view as
select
  lead_status,
  count(*) as lead_count,
  sum(estimated_value) as total_estimated_value
from leads
group by lead_status;

-- =========================
-- ACTIVE PROJECTS
-- =========================

create view active_projects_view as
select
  a.id as account_id,
  a.company_name,
  p.id as project_id,
  p.project_name,
  p.contract_value,
  p.project_status
from projects p
join accounts a
  on a.id = p.account_id;

-- =========================
-- REVENUE BY ACCOUNT
-- =========================

create view revenue_by_account_view as
select
  a.id as account_id,
  a.company_name,
  sum(p.contract_value) as total_contract_value
from accounts a
join projects p
  on p.account_id = a.id
group by a.id, a.company_name;
