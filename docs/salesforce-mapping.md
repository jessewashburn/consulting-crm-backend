# Salesforce Mapping

## Object Mapping

| Salesforce Object | CRM Table | Notes |
|-------------------|-----------|-------|
| Lead | leads | Direct 1:1 mapping |
| Account | accounts | Direct 1:1 mapping |
| Opportunity | projects | Consulting projects are opportunities |
| Task / Event | activities | Combined into single activity table |

## Field Mapping

### Leads
| Salesforce Field | CRM Field | Transform |
|------------------|-----------|-----------|
| Company | company_name | None |
| FirstName + LastName | contact_name | Concatenate |
| Email | email | None |
| Industry | industry | None |
| Status | lead_status | Map to enum values |
| LeadSource | lead_source | None |
| CreatedDate | created_at | None |

### Accounts
| Salesforce Field | CRM Field | Transform |
|------------------|-----------|-----------|
| Name | company_name | None |
| Industry | industry | None |
| Type | account_status | Customer/Prospect→active; Dormant set internally based on activity |
| CreatedDate | created_at | None |

### Opportunities (→ Projects)
| Salesforce Field | CRM Field | Transform |
|------------------|-----------|-----------|
| AccountId | account_id | UUID reference |
| Name | project_name | None |
| CloseDate | end_date | None |
| Amount | contract_value | None |
| StageName | project_status | Map multiple Salesforce stages into simplified enum values |

### Tasks/Events (→ Activities)
| Salesforce Field | CRM Field | Transform |
|------------------|-----------|-----------|
| WhoId/WhatId | related_id | Determine related_type from object type |
| Type | activity_type | Map to enum |
| ActivityDate | activity_date | None |
| Description | notes | None |

## Migration Notes

- Salesforce uses 18-character IDs; map to UUIDs
- Multiple Salesforce status values may map to single enum
- Consider incremental sync strategy for large datasets
