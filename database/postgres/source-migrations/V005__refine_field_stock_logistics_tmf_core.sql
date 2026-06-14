-- TelcoSuite V005 TMF core refinement for Field Work, Stock, And Logistics
-- Target database: ts_oss_engineering_fulfillment
-- App schema: field_stock_logistics
-- Generated from: planning/suite-details/tmf-api-ddl-reviews/field-stock-logistics.md
-- Reviewed: 2026-06-14

CREATE EXTENSION IF NOT EXISTS pgcrypto;

BEGIN;

COMMENT ON SCHEMA field_stock_logistics IS 'App-owned schema for Field Work, Stock, And Logistics; V002 TMF baseline review complete on 2026-06-14.';

-- Promote common TMF resource fields on field_stock_logistics.appointment.
ALTER TABLE field_stock_logistics.appointment
    ADD COLUMN IF NOT EXISTS tmf_id text,
    ADD COLUMN IF NOT EXISTS tmf_href text,
    ADD COLUMN IF NOT EXISTS tmf_type text,
    ADD COLUMN IF NOT EXISTS tmf_base_type text,
    ADD COLUMN IF NOT EXISTS tmf_schema_location text,
    ADD COLUMN IF NOT EXISTS tmf_referred_type text,
    ADD COLUMN IF NOT EXISTS tmf_name text,
    ADD COLUMN IF NOT EXISTS tmf_description text,
    ADD COLUMN IF NOT EXISTS tmf_category text,
    ADD COLUMN IF NOT EXISTS tmf_lifecycle_status text,
    ADD COLUMN IF NOT EXISTS tmf_state text,
    ADD COLUMN IF NOT EXISTS tmf_status_reason text,
    ADD COLUMN IF NOT EXISTS tmf_priority text,
    ADD COLUMN IF NOT EXISTS tmf_last_update timestamptz,
    ADD COLUMN IF NOT EXISTS tmf_start_date timestamptz,
    ADD COLUMN IF NOT EXISTS tmf_end_date timestamptz,
    ADD COLUMN IF NOT EXISTS tmf_requested_start_date timestamptz,
    ADD COLUMN IF NOT EXISTS tmf_requested_completion_date timestamptz,
    ADD COLUMN IF NOT EXISTS tmf_expected_completion_date timestamptz,
    ADD COLUMN IF NOT EXISTS tmf_completion_date timestamptz,
    ADD COLUMN IF NOT EXISTS tmf_external_id text;
CREATE INDEX IF NOT EXISTS ix_appointment_tmf_id ON field_stock_logistics.appointment (tmf_id) WHERE tmf_id IS NOT NULL;
CREATE INDEX IF NOT EXISTS ix_appointment_tmf_href ON field_stock_logistics.appointment (tmf_href) WHERE tmf_href IS NOT NULL;
CREATE INDEX IF NOT EXISTS ix_appointment_tmf_state ON field_stock_logistics.appointment (tenant_id, tmf_state) WHERE tmf_state IS NOT NULL;
COMMENT ON COLUMN field_stock_logistics.appointment.tmf_payload IS 'Full validated TMF resource payload retained for fields not promoted to typed columns.';
COMMENT ON COLUMN field_stock_logistics.appointment.tmf_id IS 'TMF resource id from the selected local TMF API baseline when different from canonical_id.';

-- Promote common TMF resource fields on field_stock_logistics.work_order.
ALTER TABLE field_stock_logistics.work_order
    ADD COLUMN IF NOT EXISTS tmf_id text,
    ADD COLUMN IF NOT EXISTS tmf_href text,
    ADD COLUMN IF NOT EXISTS tmf_type text,
    ADD COLUMN IF NOT EXISTS tmf_base_type text,
    ADD COLUMN IF NOT EXISTS tmf_schema_location text,
    ADD COLUMN IF NOT EXISTS tmf_referred_type text,
    ADD COLUMN IF NOT EXISTS tmf_name text,
    ADD COLUMN IF NOT EXISTS tmf_description text,
    ADD COLUMN IF NOT EXISTS tmf_category text,
    ADD COLUMN IF NOT EXISTS tmf_lifecycle_status text,
    ADD COLUMN IF NOT EXISTS tmf_state text,
    ADD COLUMN IF NOT EXISTS tmf_status_reason text,
    ADD COLUMN IF NOT EXISTS tmf_priority text,
    ADD COLUMN IF NOT EXISTS tmf_last_update timestamptz,
    ADD COLUMN IF NOT EXISTS tmf_start_date timestamptz,
    ADD COLUMN IF NOT EXISTS tmf_end_date timestamptz,
    ADD COLUMN IF NOT EXISTS tmf_requested_start_date timestamptz,
    ADD COLUMN IF NOT EXISTS tmf_requested_completion_date timestamptz,
    ADD COLUMN IF NOT EXISTS tmf_expected_completion_date timestamptz,
    ADD COLUMN IF NOT EXISTS tmf_completion_date timestamptz,
    ADD COLUMN IF NOT EXISTS tmf_external_id text;
CREATE INDEX IF NOT EXISTS ix_work_order_tmf_id ON field_stock_logistics.work_order (tmf_id) WHERE tmf_id IS NOT NULL;
CREATE INDEX IF NOT EXISTS ix_work_order_tmf_href ON field_stock_logistics.work_order (tmf_href) WHERE tmf_href IS NOT NULL;
CREATE INDEX IF NOT EXISTS ix_work_order_tmf_state ON field_stock_logistics.work_order (tenant_id, tmf_state) WHERE tmf_state IS NOT NULL;
COMMENT ON COLUMN field_stock_logistics.work_order.tmf_payload IS 'Full validated TMF resource payload retained for fields not promoted to typed columns.';
COMMENT ON COLUMN field_stock_logistics.work_order.tmf_id IS 'TMF resource id from the selected local TMF API baseline when different from canonical_id.';

-- Promote common TMF resource fields on field_stock_logistics.dispatch_plan.
ALTER TABLE field_stock_logistics.dispatch_plan
    ADD COLUMN IF NOT EXISTS tmf_id text,
    ADD COLUMN IF NOT EXISTS tmf_href text,
    ADD COLUMN IF NOT EXISTS tmf_type text,
    ADD COLUMN IF NOT EXISTS tmf_base_type text,
    ADD COLUMN IF NOT EXISTS tmf_schema_location text,
    ADD COLUMN IF NOT EXISTS tmf_referred_type text,
    ADD COLUMN IF NOT EXISTS tmf_name text,
    ADD COLUMN IF NOT EXISTS tmf_description text,
    ADD COLUMN IF NOT EXISTS tmf_category text,
    ADD COLUMN IF NOT EXISTS tmf_lifecycle_status text,
    ADD COLUMN IF NOT EXISTS tmf_state text,
    ADD COLUMN IF NOT EXISTS tmf_status_reason text,
    ADD COLUMN IF NOT EXISTS tmf_priority text,
    ADD COLUMN IF NOT EXISTS tmf_last_update timestamptz,
    ADD COLUMN IF NOT EXISTS tmf_start_date timestamptz,
    ADD COLUMN IF NOT EXISTS tmf_end_date timestamptz,
    ADD COLUMN IF NOT EXISTS tmf_requested_start_date timestamptz,
    ADD COLUMN IF NOT EXISTS tmf_requested_completion_date timestamptz,
    ADD COLUMN IF NOT EXISTS tmf_expected_completion_date timestamptz,
    ADD COLUMN IF NOT EXISTS tmf_completion_date timestamptz,
    ADD COLUMN IF NOT EXISTS tmf_external_id text;
CREATE INDEX IF NOT EXISTS ix_dispatch_plan_tmf_id ON field_stock_logistics.dispatch_plan (tmf_id) WHERE tmf_id IS NOT NULL;
CREATE INDEX IF NOT EXISTS ix_dispatch_plan_tmf_href ON field_stock_logistics.dispatch_plan (tmf_href) WHERE tmf_href IS NOT NULL;
CREATE INDEX IF NOT EXISTS ix_dispatch_plan_tmf_state ON field_stock_logistics.dispatch_plan (tenant_id, tmf_state) WHERE tmf_state IS NOT NULL;
COMMENT ON COLUMN field_stock_logistics.dispatch_plan.tmf_payload IS 'Full validated TMF resource payload retained for fields not promoted to typed columns.';
COMMENT ON COLUMN field_stock_logistics.dispatch_plan.tmf_id IS 'TMF resource id from the selected local TMF API baseline when different from canonical_id.';

-- Promote common TMF resource fields on field_stock_logistics.field_evidence.
ALTER TABLE field_stock_logistics.field_evidence
    ADD COLUMN IF NOT EXISTS tmf_id text,
    ADD COLUMN IF NOT EXISTS tmf_href text,
    ADD COLUMN IF NOT EXISTS tmf_type text,
    ADD COLUMN IF NOT EXISTS tmf_base_type text,
    ADD COLUMN IF NOT EXISTS tmf_schema_location text,
    ADD COLUMN IF NOT EXISTS tmf_referred_type text,
    ADD COLUMN IF NOT EXISTS tmf_name text,
    ADD COLUMN IF NOT EXISTS tmf_description text,
    ADD COLUMN IF NOT EXISTS tmf_category text,
    ADD COLUMN IF NOT EXISTS tmf_lifecycle_status text,
    ADD COLUMN IF NOT EXISTS tmf_state text,
    ADD COLUMN IF NOT EXISTS tmf_status_reason text,
    ADD COLUMN IF NOT EXISTS tmf_priority text,
    ADD COLUMN IF NOT EXISTS tmf_last_update timestamptz,
    ADD COLUMN IF NOT EXISTS tmf_start_date timestamptz,
    ADD COLUMN IF NOT EXISTS tmf_end_date timestamptz,
    ADD COLUMN IF NOT EXISTS tmf_requested_start_date timestamptz,
    ADD COLUMN IF NOT EXISTS tmf_requested_completion_date timestamptz,
    ADD COLUMN IF NOT EXISTS tmf_expected_completion_date timestamptz,
    ADD COLUMN IF NOT EXISTS tmf_completion_date timestamptz,
    ADD COLUMN IF NOT EXISTS tmf_external_id text;
CREATE INDEX IF NOT EXISTS ix_field_evidence_tmf_id ON field_stock_logistics.field_evidence (tmf_id) WHERE tmf_id IS NOT NULL;
CREATE INDEX IF NOT EXISTS ix_field_evidence_tmf_href ON field_stock_logistics.field_evidence (tmf_href) WHERE tmf_href IS NOT NULL;
CREATE INDEX IF NOT EXISTS ix_field_evidence_tmf_state ON field_stock_logistics.field_evidence (tenant_id, tmf_state) WHERE tmf_state IS NOT NULL;
COMMENT ON COLUMN field_stock_logistics.field_evidence.tmf_payload IS 'Full validated TMF resource payload retained for fields not promoted to typed columns.';
COMMENT ON COLUMN field_stock_logistics.field_evidence.tmf_id IS 'TMF resource id from the selected local TMF API baseline when different from canonical_id.';

-- Promote common TMF resource fields on field_stock_logistics.stock_item.
ALTER TABLE field_stock_logistics.stock_item
    ADD COLUMN IF NOT EXISTS tmf_id text,
    ADD COLUMN IF NOT EXISTS tmf_href text,
    ADD COLUMN IF NOT EXISTS tmf_type text,
    ADD COLUMN IF NOT EXISTS tmf_base_type text,
    ADD COLUMN IF NOT EXISTS tmf_schema_location text,
    ADD COLUMN IF NOT EXISTS tmf_referred_type text,
    ADD COLUMN IF NOT EXISTS tmf_name text,
    ADD COLUMN IF NOT EXISTS tmf_description text,
    ADD COLUMN IF NOT EXISTS tmf_category text,
    ADD COLUMN IF NOT EXISTS tmf_lifecycle_status text,
    ADD COLUMN IF NOT EXISTS tmf_state text,
    ADD COLUMN IF NOT EXISTS tmf_status_reason text,
    ADD COLUMN IF NOT EXISTS tmf_priority text,
    ADD COLUMN IF NOT EXISTS tmf_last_update timestamptz,
    ADD COLUMN IF NOT EXISTS tmf_start_date timestamptz,
    ADD COLUMN IF NOT EXISTS tmf_end_date timestamptz,
    ADD COLUMN IF NOT EXISTS tmf_requested_start_date timestamptz,
    ADD COLUMN IF NOT EXISTS tmf_requested_completion_date timestamptz,
    ADD COLUMN IF NOT EXISTS tmf_expected_completion_date timestamptz,
    ADD COLUMN IF NOT EXISTS tmf_completion_date timestamptz,
    ADD COLUMN IF NOT EXISTS tmf_external_id text;
CREATE INDEX IF NOT EXISTS ix_stock_item_tmf_id ON field_stock_logistics.stock_item (tmf_id) WHERE tmf_id IS NOT NULL;
CREATE INDEX IF NOT EXISTS ix_stock_item_tmf_href ON field_stock_logistics.stock_item (tmf_href) WHERE tmf_href IS NOT NULL;
CREATE INDEX IF NOT EXISTS ix_stock_item_tmf_state ON field_stock_logistics.stock_item (tenant_id, tmf_state) WHERE tmf_state IS NOT NULL;
COMMENT ON COLUMN field_stock_logistics.stock_item.tmf_payload IS 'Full validated TMF resource payload retained for fields not promoted to typed columns.';
COMMENT ON COLUMN field_stock_logistics.stock_item.tmf_id IS 'TMF resource id from the selected local TMF API baseline when different from canonical_id.';

-- Promote common TMF resource fields on field_stock_logistics.stock_balance.
ALTER TABLE field_stock_logistics.stock_balance
    ADD COLUMN IF NOT EXISTS tmf_id text,
    ADD COLUMN IF NOT EXISTS tmf_href text,
    ADD COLUMN IF NOT EXISTS tmf_type text,
    ADD COLUMN IF NOT EXISTS tmf_base_type text,
    ADD COLUMN IF NOT EXISTS tmf_schema_location text,
    ADD COLUMN IF NOT EXISTS tmf_referred_type text,
    ADD COLUMN IF NOT EXISTS tmf_name text,
    ADD COLUMN IF NOT EXISTS tmf_description text,
    ADD COLUMN IF NOT EXISTS tmf_category text,
    ADD COLUMN IF NOT EXISTS tmf_lifecycle_status text,
    ADD COLUMN IF NOT EXISTS tmf_state text,
    ADD COLUMN IF NOT EXISTS tmf_status_reason text,
    ADD COLUMN IF NOT EXISTS tmf_priority text,
    ADD COLUMN IF NOT EXISTS tmf_last_update timestamptz,
    ADD COLUMN IF NOT EXISTS tmf_start_date timestamptz,
    ADD COLUMN IF NOT EXISTS tmf_end_date timestamptz,
    ADD COLUMN IF NOT EXISTS tmf_requested_start_date timestamptz,
    ADD COLUMN IF NOT EXISTS tmf_requested_completion_date timestamptz,
    ADD COLUMN IF NOT EXISTS tmf_expected_completion_date timestamptz,
    ADD COLUMN IF NOT EXISTS tmf_completion_date timestamptz,
    ADD COLUMN IF NOT EXISTS tmf_external_id text;
CREATE INDEX IF NOT EXISTS ix_stock_balance_tmf_id ON field_stock_logistics.stock_balance (tmf_id) WHERE tmf_id IS NOT NULL;
CREATE INDEX IF NOT EXISTS ix_stock_balance_tmf_href ON field_stock_logistics.stock_balance (tmf_href) WHERE tmf_href IS NOT NULL;
CREATE INDEX IF NOT EXISTS ix_stock_balance_tmf_state ON field_stock_logistics.stock_balance (tenant_id, tmf_state) WHERE tmf_state IS NOT NULL;
COMMENT ON COLUMN field_stock_logistics.stock_balance.tmf_payload IS 'Full validated TMF resource payload retained for fields not promoted to typed columns.';
COMMENT ON COLUMN field_stock_logistics.stock_balance.tmf_id IS 'TMF resource id from the selected local TMF API baseline when different from canonical_id.';

-- Promote common TMF resource fields on field_stock_logistics.shipping_order.
ALTER TABLE field_stock_logistics.shipping_order
    ADD COLUMN IF NOT EXISTS tmf_id text,
    ADD COLUMN IF NOT EXISTS tmf_href text,
    ADD COLUMN IF NOT EXISTS tmf_type text,
    ADD COLUMN IF NOT EXISTS tmf_base_type text,
    ADD COLUMN IF NOT EXISTS tmf_schema_location text,
    ADD COLUMN IF NOT EXISTS tmf_referred_type text,
    ADD COLUMN IF NOT EXISTS tmf_name text,
    ADD COLUMN IF NOT EXISTS tmf_description text,
    ADD COLUMN IF NOT EXISTS tmf_category text,
    ADD COLUMN IF NOT EXISTS tmf_lifecycle_status text,
    ADD COLUMN IF NOT EXISTS tmf_state text,
    ADD COLUMN IF NOT EXISTS tmf_status_reason text,
    ADD COLUMN IF NOT EXISTS tmf_priority text,
    ADD COLUMN IF NOT EXISTS tmf_last_update timestamptz,
    ADD COLUMN IF NOT EXISTS tmf_start_date timestamptz,
    ADD COLUMN IF NOT EXISTS tmf_end_date timestamptz,
    ADD COLUMN IF NOT EXISTS tmf_requested_start_date timestamptz,
    ADD COLUMN IF NOT EXISTS tmf_requested_completion_date timestamptz,
    ADD COLUMN IF NOT EXISTS tmf_expected_completion_date timestamptz,
    ADD COLUMN IF NOT EXISTS tmf_completion_date timestamptz,
    ADD COLUMN IF NOT EXISTS tmf_external_id text;
CREATE INDEX IF NOT EXISTS ix_shipping_order_tmf_id ON field_stock_logistics.shipping_order (tmf_id) WHERE tmf_id IS NOT NULL;
CREATE INDEX IF NOT EXISTS ix_shipping_order_tmf_href ON field_stock_logistics.shipping_order (tmf_href) WHERE tmf_href IS NOT NULL;
CREATE INDEX IF NOT EXISTS ix_shipping_order_tmf_state ON field_stock_logistics.shipping_order (tenant_id, tmf_state) WHERE tmf_state IS NOT NULL;
COMMENT ON COLUMN field_stock_logistics.shipping_order.tmf_payload IS 'Full validated TMF resource payload retained for fields not promoted to typed columns.';
COMMENT ON COLUMN field_stock_logistics.shipping_order.tmf_id IS 'TMF resource id from the selected local TMF API baseline when different from canonical_id.';

-- Promote common TMF resource fields on field_stock_logistics.tracking_event.
ALTER TABLE field_stock_logistics.tracking_event
    ADD COLUMN IF NOT EXISTS tmf_id text,
    ADD COLUMN IF NOT EXISTS tmf_href text,
    ADD COLUMN IF NOT EXISTS tmf_type text,
    ADD COLUMN IF NOT EXISTS tmf_base_type text,
    ADD COLUMN IF NOT EXISTS tmf_schema_location text,
    ADD COLUMN IF NOT EXISTS tmf_referred_type text,
    ADD COLUMN IF NOT EXISTS tmf_name text,
    ADD COLUMN IF NOT EXISTS tmf_description text,
    ADD COLUMN IF NOT EXISTS tmf_category text,
    ADD COLUMN IF NOT EXISTS tmf_lifecycle_status text,
    ADD COLUMN IF NOT EXISTS tmf_state text,
    ADD COLUMN IF NOT EXISTS tmf_status_reason text,
    ADD COLUMN IF NOT EXISTS tmf_priority text,
    ADD COLUMN IF NOT EXISTS tmf_last_update timestamptz,
    ADD COLUMN IF NOT EXISTS tmf_start_date timestamptz,
    ADD COLUMN IF NOT EXISTS tmf_end_date timestamptz,
    ADD COLUMN IF NOT EXISTS tmf_requested_start_date timestamptz,
    ADD COLUMN IF NOT EXISTS tmf_requested_completion_date timestamptz,
    ADD COLUMN IF NOT EXISTS tmf_expected_completion_date timestamptz,
    ADD COLUMN IF NOT EXISTS tmf_completion_date timestamptz,
    ADD COLUMN IF NOT EXISTS tmf_external_id text;
CREATE INDEX IF NOT EXISTS ix_tracking_event_tmf_id ON field_stock_logistics.tracking_event (tmf_id) WHERE tmf_id IS NOT NULL;
CREATE INDEX IF NOT EXISTS ix_tracking_event_tmf_href ON field_stock_logistics.tracking_event (tmf_href) WHERE tmf_href IS NOT NULL;
CREATE INDEX IF NOT EXISTS ix_tracking_event_tmf_state ON field_stock_logistics.tracking_event (tenant_id, tmf_state) WHERE tmf_state IS NOT NULL;
COMMENT ON COLUMN field_stock_logistics.tracking_event.tmf_payload IS 'Full validated TMF resource payload retained for fields not promoted to typed columns.';
COMMENT ON COLUMN field_stock_logistics.tracking_event.tmf_id IS 'TMF resource id from the selected local TMF API baseline when different from canonical_id.';

-- Promote common TMF resource fields on field_stock_logistics.field_inventory_handover.
ALTER TABLE field_stock_logistics.field_inventory_handover
    ADD COLUMN IF NOT EXISTS tmf_id text,
    ADD COLUMN IF NOT EXISTS tmf_href text,
    ADD COLUMN IF NOT EXISTS tmf_type text,
    ADD COLUMN IF NOT EXISTS tmf_base_type text,
    ADD COLUMN IF NOT EXISTS tmf_schema_location text,
    ADD COLUMN IF NOT EXISTS tmf_referred_type text,
    ADD COLUMN IF NOT EXISTS tmf_name text,
    ADD COLUMN IF NOT EXISTS tmf_description text,
    ADD COLUMN IF NOT EXISTS tmf_category text,
    ADD COLUMN IF NOT EXISTS tmf_lifecycle_status text,
    ADD COLUMN IF NOT EXISTS tmf_state text,
    ADD COLUMN IF NOT EXISTS tmf_status_reason text,
    ADD COLUMN IF NOT EXISTS tmf_priority text,
    ADD COLUMN IF NOT EXISTS tmf_last_update timestamptz,
    ADD COLUMN IF NOT EXISTS tmf_start_date timestamptz,
    ADD COLUMN IF NOT EXISTS tmf_end_date timestamptz,
    ADD COLUMN IF NOT EXISTS tmf_requested_start_date timestamptz,
    ADD COLUMN IF NOT EXISTS tmf_requested_completion_date timestamptz,
    ADD COLUMN IF NOT EXISTS tmf_expected_completion_date timestamptz,
    ADD COLUMN IF NOT EXISTS tmf_completion_date timestamptz,
    ADD COLUMN IF NOT EXISTS tmf_external_id text;
CREATE INDEX IF NOT EXISTS ix_field_inventory_handover_tmf_id ON field_stock_logistics.field_inventory_handover (tmf_id) WHERE tmf_id IS NOT NULL;
CREATE INDEX IF NOT EXISTS ix_field_inventory_handover_tmf_href ON field_stock_logistics.field_inventory_handover (tmf_href) WHERE tmf_href IS NOT NULL;
CREATE INDEX IF NOT EXISTS ix_field_inventory_handover_tmf_state ON field_stock_logistics.field_inventory_handover (tenant_id, tmf_state) WHERE tmf_state IS NOT NULL;
COMMENT ON COLUMN field_stock_logistics.field_inventory_handover.tmf_payload IS 'Full validated TMF resource payload retained for fields not promoted to typed columns.';
COMMENT ON COLUMN field_stock_logistics.field_inventory_handover.tmf_id IS 'TMF resource id from the selected local TMF API baseline when different from canonical_id.';

-- Promote common TMF resource fields on field_stock_logistics.event_outbox.
ALTER TABLE field_stock_logistics.event_outbox
    ADD COLUMN IF NOT EXISTS tmf_id text,
    ADD COLUMN IF NOT EXISTS tmf_href text,
    ADD COLUMN IF NOT EXISTS tmf_type text,
    ADD COLUMN IF NOT EXISTS tmf_base_type text,
    ADD COLUMN IF NOT EXISTS tmf_schema_location text,
    ADD COLUMN IF NOT EXISTS tmf_referred_type text,
    ADD COLUMN IF NOT EXISTS tmf_name text,
    ADD COLUMN IF NOT EXISTS tmf_description text,
    ADD COLUMN IF NOT EXISTS tmf_category text,
    ADD COLUMN IF NOT EXISTS tmf_lifecycle_status text,
    ADD COLUMN IF NOT EXISTS tmf_state text,
    ADD COLUMN IF NOT EXISTS tmf_status_reason text,
    ADD COLUMN IF NOT EXISTS tmf_priority text,
    ADD COLUMN IF NOT EXISTS tmf_last_update timestamptz,
    ADD COLUMN IF NOT EXISTS tmf_start_date timestamptz,
    ADD COLUMN IF NOT EXISTS tmf_end_date timestamptz,
    ADD COLUMN IF NOT EXISTS tmf_requested_start_date timestamptz,
    ADD COLUMN IF NOT EXISTS tmf_requested_completion_date timestamptz,
    ADD COLUMN IF NOT EXISTS tmf_expected_completion_date timestamptz,
    ADD COLUMN IF NOT EXISTS tmf_completion_date timestamptz,
    ADD COLUMN IF NOT EXISTS tmf_external_id text;
CREATE INDEX IF NOT EXISTS ix_event_outbox_tmf_id ON field_stock_logistics.event_outbox (tmf_id) WHERE tmf_id IS NOT NULL;
CREATE INDEX IF NOT EXISTS ix_event_outbox_tmf_href ON field_stock_logistics.event_outbox (tmf_href) WHERE tmf_href IS NOT NULL;
CREATE INDEX IF NOT EXISTS ix_event_outbox_tmf_state ON field_stock_logistics.event_outbox (tenant_id, tmf_state) WHERE tmf_state IS NOT NULL;
COMMENT ON COLUMN field_stock_logistics.event_outbox.tmf_payload IS 'Full validated TMF resource payload retained for fields not promoted to typed columns.';
COMMENT ON COLUMN field_stock_logistics.event_outbox.tmf_id IS 'TMF resource id from the selected local TMF API baseline when different from canonical_id.';

CREATE TABLE IF NOT EXISTS field_stock_logistics.tmf_api_resource_map (
    id uuid PRIMARY KEY DEFAULT gen_random_uuid(),
    tmf_api text NOT NULL,
    tmf_resource text NOT NULL,
    resource_path text,
    anchor_table text NOT NULL,
    ownership_role text NOT NULL DEFAULT 'master_or_projection',
    field_strategy text NOT NULL,
    local_spec_path text,
    promoted_fields jsonb NOT NULL DEFAULT '[]'::jsonb,
    payload_required boolean NOT NULL DEFAULT true,
    contract_test_required boolean NOT NULL DEFAULT true,
    created_at timestamptz NOT NULL DEFAULT now(),
    updated_at timestamptz NOT NULL DEFAULT now(),
    CONSTRAINT uk_tmf_api_resource_map UNIQUE (tmf_api, tmf_resource, anchor_table)
);

CREATE TABLE IF NOT EXISTS field_stock_logistics.tmf_resource_reference (
    id uuid PRIMARY KEY DEFAULT gen_random_uuid(),
    tenant_id text NOT NULL DEFAULT 'default',
    source_table text NOT NULL,
    source_record_id uuid,
    source_canonical_id text,
    reference_role text NOT NULL,
    referenced_api text,
    referenced_resource text,
    referenced_id text,
    referenced_href text,
    referenced_name text,
    referred_type text,
    reference_payload jsonb NOT NULL DEFAULT '{}'::jsonb,
    valid_from timestamptz,
    valid_to timestamptz,
    created_at timestamptz NOT NULL DEFAULT now(),
    created_by text,
    CONSTRAINT ck_tmf_resource_reference_validity CHECK (valid_to IS NULL OR valid_from IS NULL OR valid_to >= valid_from)
);

CREATE TABLE IF NOT EXISTS field_stock_logistics.tmf_characteristic (
    id uuid PRIMARY KEY DEFAULT gen_random_uuid(),
    tenant_id text NOT NULL DEFAULT 'default',
    source_table text NOT NULL,
    source_record_id uuid,
    source_canonical_id text,
    characteristic_name text NOT NULL,
    value_type text,
    characteristic_value jsonb NOT NULL DEFAULT '{}'::jsonb,
    value_from timestamptz,
    value_to timestamptz,
    created_at timestamptz NOT NULL DEFAULT now(),
    created_by text,
    CONSTRAINT ck_tmf_characteristic_validity CHECK (value_to IS NULL OR value_from IS NULL OR value_to >= value_from)
);

CREATE TABLE IF NOT EXISTS field_stock_logistics.tmf_external_identifier (
    id uuid PRIMARY KEY DEFAULT gen_random_uuid(),
    tenant_id text NOT NULL DEFAULT 'default',
    source_table text NOT NULL,
    source_record_id uuid,
    source_canonical_id text,
    owner text,
    external_identifier_type text,
    external_identifier_id text NOT NULL,
    external_href text,
    created_at timestamptz NOT NULL DEFAULT now(),
    CONSTRAINT uk_tmf_external_identifier UNIQUE (tenant_id, source_table, external_identifier_id)
);

CREATE TABLE IF NOT EXISTS field_stock_logistics.tmf_related_party (
    id uuid PRIMARY KEY DEFAULT gen_random_uuid(),
    tenant_id text NOT NULL DEFAULT 'default',
    source_table text NOT NULL,
    source_record_id uuid,
    source_canonical_id text,
    party_id text,
    party_href text,
    party_name text,
    party_role text,
    party_referred_type text,
    related_party_payload jsonb NOT NULL DEFAULT '{}'::jsonb,
    created_at timestamptz NOT NULL DEFAULT now()
);

CREATE TABLE IF NOT EXISTS field_stock_logistics.tmf_note (
    id uuid PRIMARY KEY DEFAULT gen_random_uuid(),
    tenant_id text NOT NULL DEFAULT 'default',
    source_table text NOT NULL,
    source_record_id uuid,
    source_canonical_id text,
    note_author text,
    note_date timestamptz,
    note_text text NOT NULL,
    note_payload jsonb NOT NULL DEFAULT '{}'::jsonb,
    created_at timestamptz NOT NULL DEFAULT now()
);

CREATE TABLE IF NOT EXISTS field_stock_logistics.tmf_attachment (
    id uuid PRIMARY KEY DEFAULT gen_random_uuid(),
    tenant_id text NOT NULL DEFAULT 'default',
    source_table text NOT NULL,
    source_record_id uuid,
    source_canonical_id text,
    attachment_id text,
    attachment_href text,
    attachment_name text,
    attachment_type text,
    mime_type text,
    content_url text,
    size_amount numeric,
    size_units text,
    attachment_payload jsonb NOT NULL DEFAULT '{}'::jsonb,
    created_at timestamptz NOT NULL DEFAULT now()
);

CREATE TABLE IF NOT EXISTS field_stock_logistics.tmf_relationship (
    id uuid PRIMARY KEY DEFAULT gen_random_uuid(),
    tenant_id text NOT NULL DEFAULT 'default',
    source_table text NOT NULL,
    source_record_id uuid,
    source_canonical_id text,
    relationship_type text NOT NULL,
    target_table text,
    target_record_id uuid,
    target_canonical_id text,
    target_api text,
    target_resource text,
    target_href text,
    relationship_payload jsonb NOT NULL DEFAULT '{}'::jsonb,
    valid_from timestamptz,
    valid_to timestamptz,
    created_at timestamptz NOT NULL DEFAULT now(),
    CONSTRAINT ck_tmf_relationship_validity CHECK (valid_to IS NULL OR valid_from IS NULL OR valid_to >= valid_from)
);

CREATE TABLE IF NOT EXISTS field_stock_logistics.event_contract (
    id uuid PRIMARY KEY DEFAULT gen_random_uuid(),
    event_name text NOT NULL,
    event_version text NOT NULL DEFAULT 'v1',
    tmf_api text,
    tmf_resource text,
    source_table text NOT NULL,
    event_type text NOT NULL,
    event_key_strategy text NOT NULL,
    payload_basis text NOT NULL,
    outbox_table text NOT NULL DEFAULT 'field_stock_logistics.event_outbox',
    retention_class text NOT NULL DEFAULT 'event_replay_90d',
    masking_policy text NOT NULL DEFAULT 'Apply source table masking policy before external publication',
    consumer_notes text,
    is_active boolean NOT NULL DEFAULT true,
    created_at timestamptz NOT NULL DEFAULT now(),
    updated_at timestamptz NOT NULL DEFAULT now(),
    CONSTRAINT uk_event_contract UNIQUE (event_name, event_version)
);

CREATE TABLE IF NOT EXISTS field_stock_logistics.privacy_retention_policy (
    id uuid PRIMARY KEY DEFAULT gen_random_uuid(),
    table_name text NOT NULL,
    data_domain text NOT NULL,
    data_classification text NOT NULL,
    retention_class text NOT NULL,
    retention_basis text NOT NULL,
    default_retention_days integer,
    legal_hold_supported boolean NOT NULL DEFAULT true,
    residency_rule text,
    masking_policy text NOT NULL,
    audit_level text NOT NULL DEFAULT 'standard',
    created_at timestamptz NOT NULL DEFAULT now(),
    updated_at timestamptz NOT NULL DEFAULT now(),
    CONSTRAINT uk_privacy_retention_policy UNIQUE (table_name)
);

CREATE INDEX IF NOT EXISTS ix_tmf_api_resource_map_lookup ON field_stock_logistics.tmf_api_resource_map (tmf_api, tmf_resource);
CREATE INDEX IF NOT EXISTS ix_tmf_resource_reference_lookup ON field_stock_logistics.tmf_resource_reference (tenant_id, source_table, source_canonical_id);
CREATE INDEX IF NOT EXISTS ix_tmf_characteristic_lookup ON field_stock_logistics.tmf_characteristic (tenant_id, source_table, characteristic_name);
CREATE INDEX IF NOT EXISTS ix_tmf_external_identifier_lookup ON field_stock_logistics.tmf_external_identifier (tenant_id, external_identifier_id);
CREATE INDEX IF NOT EXISTS ix_tmf_related_party_lookup ON field_stock_logistics.tmf_related_party (tenant_id, party_id);
CREATE INDEX IF NOT EXISTS ix_tmf_note_lookup ON field_stock_logistics.tmf_note (tenant_id, source_table, source_canonical_id);
CREATE INDEX IF NOT EXISTS ix_tmf_attachment_lookup ON field_stock_logistics.tmf_attachment (tenant_id, source_table, source_canonical_id);
CREATE INDEX IF NOT EXISTS ix_tmf_relationship_lookup ON field_stock_logistics.tmf_relationship (tenant_id, source_table, relationship_type);
CREATE INDEX IF NOT EXISTS ix_event_contract_lookup ON field_stock_logistics.event_contract (event_name, event_version);
CREATE INDEX IF NOT EXISTS ix_privacy_retention_policy_lookup ON field_stock_logistics.privacy_retention_policy (table_name);

COMMENT ON TABLE field_stock_logistics.tmf_api_resource_map IS 'V002 TMF support/control table for Field Work, Stock, And Logistics.';
COMMENT ON TABLE field_stock_logistics.tmf_resource_reference IS 'V002 TMF support/control table for Field Work, Stock, And Logistics.';
COMMENT ON TABLE field_stock_logistics.tmf_characteristic IS 'V002 TMF support/control table for Field Work, Stock, And Logistics.';
COMMENT ON TABLE field_stock_logistics.tmf_external_identifier IS 'V002 TMF support/control table for Field Work, Stock, And Logistics.';
COMMENT ON TABLE field_stock_logistics.tmf_related_party IS 'V002 TMF support/control table for Field Work, Stock, And Logistics.';
COMMENT ON TABLE field_stock_logistics.tmf_note IS 'V002 TMF support/control table for Field Work, Stock, And Logistics.';
COMMENT ON TABLE field_stock_logistics.tmf_attachment IS 'V002 TMF support/control table for Field Work, Stock, And Logistics.';
COMMENT ON TABLE field_stock_logistics.tmf_relationship IS 'V002 TMF support/control table for Field Work, Stock, And Logistics.';
COMMENT ON TABLE field_stock_logistics.event_contract IS 'V002 TMF support/control table for Field Work, Stock, And Logistics.';
COMMENT ON TABLE field_stock_logistics.privacy_retention_policy IS 'V002 TMF support/control table for Field Work, Stock, And Logistics.';


INSERT INTO field_stock_logistics.tmf_api_resource_map (tmf_api, tmf_resource, resource_path, anchor_table, field_strategy, local_spec_path, promoted_fields) VALUES ('TMF646', 'appointment', '/appointment', 'appointment', 'Promote common TMF lifecycle/reference fields; store remaining validated resource fields in tmf_payload and characteristics tables.', 'references/tmforum-open-apis/openapi-specs/TMF646_AppointmentManagement/TMF646_Appointment_Management_API_v4.0.0_swagger.json', '["id", "href", "category", "creationDate", "description", "externalId", "lastUpdate", "attachment", "calendarEvent", "contactMedium", "note", "relatedEntity", "relatedParty", "relatedPlace", "status", "validFor"]'::jsonb) ON CONFLICT (tmf_api, tmf_resource, anchor_table) DO UPDATE SET field_strategy = EXCLUDED.field_strategy, local_spec_path = EXCLUDED.local_spec_path, promoted_fields = EXCLUDED.promoted_fields, updated_at = now();
INSERT INTO field_stock_logistics.event_contract (event_name, event_version, tmf_api, tmf_resource, source_table, event_type, event_key_strategy, payload_basis, consumer_notes) VALUES ('field_stock_logistics.appointment.created', 'v1', 'TMF646', 'appointment', 'field_stock_logistics.appointment', 'created', 'tenant_id + canonical_id + version', 'typed columns + tmf_payload snapshot', 'Register concrete consumers during integration design') ON CONFLICT (event_name, event_version) DO UPDATE SET source_table = EXCLUDED.source_table, payload_basis = EXCLUDED.payload_basis, updated_at = now();
INSERT INTO field_stock_logistics.event_contract (event_name, event_version, tmf_api, tmf_resource, source_table, event_type, event_key_strategy, payload_basis, consumer_notes) VALUES ('field_stock_logistics.appointment.updated', 'v1', 'TMF646', 'appointment', 'field_stock_logistics.appointment', 'updated', 'tenant_id + canonical_id + version', 'typed columns + tmf_payload snapshot', 'Register concrete consumers during integration design') ON CONFLICT (event_name, event_version) DO UPDATE SET source_table = EXCLUDED.source_table, payload_basis = EXCLUDED.payload_basis, updated_at = now();
INSERT INTO field_stock_logistics.event_contract (event_name, event_version, tmf_api, tmf_resource, source_table, event_type, event_key_strategy, payload_basis, consumer_notes) VALUES ('field_stock_logistics.appointment.stateChanged', 'v1', 'TMF646', 'appointment', 'field_stock_logistics.appointment', 'stateChanged', 'tenant_id + canonical_id + version', 'typed columns + tmf_payload snapshot', 'Register concrete consumers during integration design') ON CONFLICT (event_name, event_version) DO UPDATE SET source_table = EXCLUDED.source_table, payload_basis = EXCLUDED.payload_basis, updated_at = now();
INSERT INTO field_stock_logistics.event_contract (event_name, event_version, tmf_api, tmf_resource, source_table, event_type, event_key_strategy, payload_basis, consumer_notes) VALUES ('field_stock_logistics.appointment.deleted', 'v1', 'TMF646', 'appointment', 'field_stock_logistics.appointment', 'deleted', 'tenant_id + canonical_id + version', 'typed columns + tmf_payload snapshot', 'Register concrete consumers during integration design') ON CONFLICT (event_name, event_version) DO UPDATE SET source_table = EXCLUDED.source_table, payload_basis = EXCLUDED.payload_basis, updated_at = now();
INSERT INTO field_stock_logistics.tmf_api_resource_map (tmf_api, tmf_resource, resource_path, anchor_table, field_strategy, local_spec_path, promoted_fields) VALUES ('TMF646', 'searchTimeSlot', '/searchTimeSlot', 'appointment', 'Promote common TMF lifecycle/reference fields; store remaining validated resource fields in tmf_payload and characteristics tables.', 'references/tmforum-open-apis/openapi-specs/TMF646_AppointmentManagement/TMF646_Appointment_Management_API_v4.0.0_swagger.json', '["id", "href", "searchDate", "searchResult", "availableTimeSlot", "relatedEntity", "relatedParty", "relatedPlace", "requestedTimeSlot", "status", "@baseType", "@schemaLocation", "@type"]'::jsonb) ON CONFLICT (tmf_api, tmf_resource, anchor_table) DO UPDATE SET field_strategy = EXCLUDED.field_strategy, local_spec_path = EXCLUDED.local_spec_path, promoted_fields = EXCLUDED.promoted_fields, updated_at = now();
INSERT INTO field_stock_logistics.event_contract (event_name, event_version, tmf_api, tmf_resource, source_table, event_type, event_key_strategy, payload_basis, consumer_notes) VALUES ('field_stock_logistics.search_time_slot.created', 'v1', 'TMF646', 'searchTimeSlot', 'field_stock_logistics.appointment', 'created', 'tenant_id + canonical_id + version', 'typed columns + tmf_payload snapshot', 'Register concrete consumers during integration design') ON CONFLICT (event_name, event_version) DO UPDATE SET source_table = EXCLUDED.source_table, payload_basis = EXCLUDED.payload_basis, updated_at = now();
INSERT INTO field_stock_logistics.event_contract (event_name, event_version, tmf_api, tmf_resource, source_table, event_type, event_key_strategy, payload_basis, consumer_notes) VALUES ('field_stock_logistics.search_time_slot.updated', 'v1', 'TMF646', 'searchTimeSlot', 'field_stock_logistics.appointment', 'updated', 'tenant_id + canonical_id + version', 'typed columns + tmf_payload snapshot', 'Register concrete consumers during integration design') ON CONFLICT (event_name, event_version) DO UPDATE SET source_table = EXCLUDED.source_table, payload_basis = EXCLUDED.payload_basis, updated_at = now();
INSERT INTO field_stock_logistics.event_contract (event_name, event_version, tmf_api, tmf_resource, source_table, event_type, event_key_strategy, payload_basis, consumer_notes) VALUES ('field_stock_logistics.search_time_slot.stateChanged', 'v1', 'TMF646', 'searchTimeSlot', 'field_stock_logistics.appointment', 'stateChanged', 'tenant_id + canonical_id + version', 'typed columns + tmf_payload snapshot', 'Register concrete consumers during integration design') ON CONFLICT (event_name, event_version) DO UPDATE SET source_table = EXCLUDED.source_table, payload_basis = EXCLUDED.payload_basis, updated_at = now();
INSERT INTO field_stock_logistics.event_contract (event_name, event_version, tmf_api, tmf_resource, source_table, event_type, event_key_strategy, payload_basis, consumer_notes) VALUES ('field_stock_logistics.search_time_slot.deleted', 'v1', 'TMF646', 'searchTimeSlot', 'field_stock_logistics.appointment', 'deleted', 'tenant_id + canonical_id + version', 'typed columns + tmf_payload snapshot', 'Register concrete consumers during integration design') ON CONFLICT (event_name, event_version) DO UPDATE SET source_table = EXCLUDED.source_table, payload_basis = EXCLUDED.payload_basis, updated_at = now();
INSERT INTO field_stock_logistics.tmf_api_resource_map (tmf_api, tmf_resource, resource_path, anchor_table, field_strategy, local_spec_path, promoted_fields) VALUES ('TMF697', 'cancelWorkOrder', '/cancelWorkOrder', 'work_order', 'Promote common TMF lifecycle/reference fields; store remaining validated resource fields in tmf_payload and characteristics tables.', 'references/tmforum-open-apis/openapi-specs/TMF697_Work_Order/TMF697-WorkOrder-v4.0.0.swagger.json', '["id", "href", "cancellationDate", "cancellationReason", "category", "completionDate", "description", "expectedCompletionDate", "externalId", "notificationContact", "orderDate", "priority", "requestedCompletionDate", "requestedStartDate", "startDate", "stateChangeDate"]'::jsonb) ON CONFLICT (tmf_api, tmf_resource, anchor_table) DO UPDATE SET field_strategy = EXCLUDED.field_strategy, local_spec_path = EXCLUDED.local_spec_path, promoted_fields = EXCLUDED.promoted_fields, updated_at = now();
INSERT INTO field_stock_logistics.event_contract (event_name, event_version, tmf_api, tmf_resource, source_table, event_type, event_key_strategy, payload_basis, consumer_notes) VALUES ('field_stock_logistics.cancel_work_order.created', 'v1', 'TMF697', 'cancelWorkOrder', 'field_stock_logistics.work_order', 'created', 'tenant_id + canonical_id + version', 'typed columns + tmf_payload snapshot', 'Register concrete consumers during integration design') ON CONFLICT (event_name, event_version) DO UPDATE SET source_table = EXCLUDED.source_table, payload_basis = EXCLUDED.payload_basis, updated_at = now();
INSERT INTO field_stock_logistics.event_contract (event_name, event_version, tmf_api, tmf_resource, source_table, event_type, event_key_strategy, payload_basis, consumer_notes) VALUES ('field_stock_logistics.cancel_work_order.updated', 'v1', 'TMF697', 'cancelWorkOrder', 'field_stock_logistics.work_order', 'updated', 'tenant_id + canonical_id + version', 'typed columns + tmf_payload snapshot', 'Register concrete consumers during integration design') ON CONFLICT (event_name, event_version) DO UPDATE SET source_table = EXCLUDED.source_table, payload_basis = EXCLUDED.payload_basis, updated_at = now();
INSERT INTO field_stock_logistics.event_contract (event_name, event_version, tmf_api, tmf_resource, source_table, event_type, event_key_strategy, payload_basis, consumer_notes) VALUES ('field_stock_logistics.cancel_work_order.stateChanged', 'v1', 'TMF697', 'cancelWorkOrder', 'field_stock_logistics.work_order', 'stateChanged', 'tenant_id + canonical_id + version', 'typed columns + tmf_payload snapshot', 'Register concrete consumers during integration design') ON CONFLICT (event_name, event_version) DO UPDATE SET source_table = EXCLUDED.source_table, payload_basis = EXCLUDED.payload_basis, updated_at = now();
INSERT INTO field_stock_logistics.event_contract (event_name, event_version, tmf_api, tmf_resource, source_table, event_type, event_key_strategy, payload_basis, consumer_notes) VALUES ('field_stock_logistics.cancel_work_order.deleted', 'v1', 'TMF697', 'cancelWorkOrder', 'field_stock_logistics.work_order', 'deleted', 'tenant_id + canonical_id + version', 'typed columns + tmf_payload snapshot', 'Register concrete consumers during integration design') ON CONFLICT (event_name, event_version) DO UPDATE SET source_table = EXCLUDED.source_table, payload_basis = EXCLUDED.payload_basis, updated_at = now();
INSERT INTO field_stock_logistics.tmf_api_resource_map (tmf_api, tmf_resource, resource_path, anchor_table, field_strategy, local_spec_path, promoted_fields) VALUES ('TMF697', 'workOrder', '/workOrder', 'work_order', 'Promote common TMF lifecycle/reference fields; store remaining validated resource fields in tmf_payload and characteristics tables.', 'references/tmforum-open-apis/openapi-specs/TMF697_Work_Order/TMF697-WorkOrder-v4.0.0.swagger.json', '["id", "href", "cancellationDate", "cancellationReason", "category", "completionDate", "description", "expectedCompletionDate", "externalId", "notificationContact", "orderDate", "priority", "requestedCompletionDate", "requestedStartDate", "startDate", "stateChangeDate"]'::jsonb) ON CONFLICT (tmf_api, tmf_resource, anchor_table) DO UPDATE SET field_strategy = EXCLUDED.field_strategy, local_spec_path = EXCLUDED.local_spec_path, promoted_fields = EXCLUDED.promoted_fields, updated_at = now();
INSERT INTO field_stock_logistics.event_contract (event_name, event_version, tmf_api, tmf_resource, source_table, event_type, event_key_strategy, payload_basis, consumer_notes) VALUES ('field_stock_logistics.work_order.created', 'v1', 'TMF697', 'workOrder', 'field_stock_logistics.work_order', 'created', 'tenant_id + canonical_id + version', 'typed columns + tmf_payload snapshot', 'Register concrete consumers during integration design') ON CONFLICT (event_name, event_version) DO UPDATE SET source_table = EXCLUDED.source_table, payload_basis = EXCLUDED.payload_basis, updated_at = now();
INSERT INTO field_stock_logistics.event_contract (event_name, event_version, tmf_api, tmf_resource, source_table, event_type, event_key_strategy, payload_basis, consumer_notes) VALUES ('field_stock_logistics.work_order.updated', 'v1', 'TMF697', 'workOrder', 'field_stock_logistics.work_order', 'updated', 'tenant_id + canonical_id + version', 'typed columns + tmf_payload snapshot', 'Register concrete consumers during integration design') ON CONFLICT (event_name, event_version) DO UPDATE SET source_table = EXCLUDED.source_table, payload_basis = EXCLUDED.payload_basis, updated_at = now();
INSERT INTO field_stock_logistics.event_contract (event_name, event_version, tmf_api, tmf_resource, source_table, event_type, event_key_strategy, payload_basis, consumer_notes) VALUES ('field_stock_logistics.work_order.stateChanged', 'v1', 'TMF697', 'workOrder', 'field_stock_logistics.work_order', 'stateChanged', 'tenant_id + canonical_id + version', 'typed columns + tmf_payload snapshot', 'Register concrete consumers during integration design') ON CONFLICT (event_name, event_version) DO UPDATE SET source_table = EXCLUDED.source_table, payload_basis = EXCLUDED.payload_basis, updated_at = now();
INSERT INTO field_stock_logistics.event_contract (event_name, event_version, tmf_api, tmf_resource, source_table, event_type, event_key_strategy, payload_basis, consumer_notes) VALUES ('field_stock_logistics.work_order.deleted', 'v1', 'TMF697', 'workOrder', 'field_stock_logistics.work_order', 'deleted', 'tenant_id + canonical_id + version', 'typed columns + tmf_payload snapshot', 'Register concrete consumers during integration design') ON CONFLICT (event_name, event_version) DO UPDATE SET source_table = EXCLUDED.source_table, payload_basis = EXCLUDED.payload_basis, updated_at = now();
INSERT INTO field_stock_logistics.tmf_api_resource_map (tmf_api, tmf_resource, resource_path, anchor_table, field_strategy, local_spec_path, promoted_fields) VALUES ('TMF687', 'adjustProductStock', '/adjustProductStock', 'stock_item', 'Promote common TMF lifecycle/reference fields; store remaining validated resource fields in tmf_payload and characteristics tables.', 'references/tmforum-open-apis/openapi-specs/TMF687_StockManagement/TMF687_Stock_Management_API_v4.0.0_swagger.json', '["id", "href", "creationDate", "description", "lastInventoryDate", "lastUpdate", "name", "replenishmentDate", "stockLevelCategory", "channel", "marketSegment", "maxStockLevel", "minStockLevel", "place", "productStockLevel", "productStockRelationship"]'::jsonb) ON CONFLICT (tmf_api, tmf_resource, anchor_table) DO UPDATE SET field_strategy = EXCLUDED.field_strategy, local_spec_path = EXCLUDED.local_spec_path, promoted_fields = EXCLUDED.promoted_fields, updated_at = now();
INSERT INTO field_stock_logistics.event_contract (event_name, event_version, tmf_api, tmf_resource, source_table, event_type, event_key_strategy, payload_basis, consumer_notes) VALUES ('field_stock_logistics.adjust_product_stock.created', 'v1', 'TMF687', 'adjustProductStock', 'field_stock_logistics.stock_item', 'created', 'tenant_id + canonical_id + version', 'typed columns + tmf_payload snapshot', 'Register concrete consumers during integration design') ON CONFLICT (event_name, event_version) DO UPDATE SET source_table = EXCLUDED.source_table, payload_basis = EXCLUDED.payload_basis, updated_at = now();
INSERT INTO field_stock_logistics.event_contract (event_name, event_version, tmf_api, tmf_resource, source_table, event_type, event_key_strategy, payload_basis, consumer_notes) VALUES ('field_stock_logistics.adjust_product_stock.updated', 'v1', 'TMF687', 'adjustProductStock', 'field_stock_logistics.stock_item', 'updated', 'tenant_id + canonical_id + version', 'typed columns + tmf_payload snapshot', 'Register concrete consumers during integration design') ON CONFLICT (event_name, event_version) DO UPDATE SET source_table = EXCLUDED.source_table, payload_basis = EXCLUDED.payload_basis, updated_at = now();
INSERT INTO field_stock_logistics.event_contract (event_name, event_version, tmf_api, tmf_resource, source_table, event_type, event_key_strategy, payload_basis, consumer_notes) VALUES ('field_stock_logistics.adjust_product_stock.stateChanged', 'v1', 'TMF687', 'adjustProductStock', 'field_stock_logistics.stock_item', 'stateChanged', 'tenant_id + canonical_id + version', 'typed columns + tmf_payload snapshot', 'Register concrete consumers during integration design') ON CONFLICT (event_name, event_version) DO UPDATE SET source_table = EXCLUDED.source_table, payload_basis = EXCLUDED.payload_basis, updated_at = now();
INSERT INTO field_stock_logistics.event_contract (event_name, event_version, tmf_api, tmf_resource, source_table, event_type, event_key_strategy, payload_basis, consumer_notes) VALUES ('field_stock_logistics.adjust_product_stock.deleted', 'v1', 'TMF687', 'adjustProductStock', 'field_stock_logistics.stock_item', 'deleted', 'tenant_id + canonical_id + version', 'typed columns + tmf_payload snapshot', 'Register concrete consumers during integration design') ON CONFLICT (event_name, event_version) DO UPDATE SET source_table = EXCLUDED.source_table, payload_basis = EXCLUDED.payload_basis, updated_at = now();
INSERT INTO field_stock_logistics.tmf_api_resource_map (tmf_api, tmf_resource, resource_path, anchor_table, field_strategy, local_spec_path, promoted_fields) VALUES ('TMF687', 'checkProductStock', '/checkProductStock', 'stock_item', 'Promote common TMF lifecycle/reference fields; store remaining validated resource fields in tmf_payload and characteristics tables.', 'references/tmforum-open-apis/openapi-specs/TMF687_StockManagement/TMF687_Stock_Management_API_v4.0.0_swagger.json', '["id", "href", "creationDate", "description", "lastInventoryDate", "lastUpdate", "name", "replenishmentDate", "stockLevelCategory", "channel", "marketSegment", "maxStockLevel", "minStockLevel", "place", "productStockLevel", "productStockRelationship"]'::jsonb) ON CONFLICT (tmf_api, tmf_resource, anchor_table) DO UPDATE SET field_strategy = EXCLUDED.field_strategy, local_spec_path = EXCLUDED.local_spec_path, promoted_fields = EXCLUDED.promoted_fields, updated_at = now();
INSERT INTO field_stock_logistics.event_contract (event_name, event_version, tmf_api, tmf_resource, source_table, event_type, event_key_strategy, payload_basis, consumer_notes) VALUES ('field_stock_logistics.check_product_stock.created', 'v1', 'TMF687', 'checkProductStock', 'field_stock_logistics.stock_item', 'created', 'tenant_id + canonical_id + version', 'typed columns + tmf_payload snapshot', 'Register concrete consumers during integration design') ON CONFLICT (event_name, event_version) DO UPDATE SET source_table = EXCLUDED.source_table, payload_basis = EXCLUDED.payload_basis, updated_at = now();
INSERT INTO field_stock_logistics.event_contract (event_name, event_version, tmf_api, tmf_resource, source_table, event_type, event_key_strategy, payload_basis, consumer_notes) VALUES ('field_stock_logistics.check_product_stock.updated', 'v1', 'TMF687', 'checkProductStock', 'field_stock_logistics.stock_item', 'updated', 'tenant_id + canonical_id + version', 'typed columns + tmf_payload snapshot', 'Register concrete consumers during integration design') ON CONFLICT (event_name, event_version) DO UPDATE SET source_table = EXCLUDED.source_table, payload_basis = EXCLUDED.payload_basis, updated_at = now();
INSERT INTO field_stock_logistics.event_contract (event_name, event_version, tmf_api, tmf_resource, source_table, event_type, event_key_strategy, payload_basis, consumer_notes) VALUES ('field_stock_logistics.check_product_stock.stateChanged', 'v1', 'TMF687', 'checkProductStock', 'field_stock_logistics.stock_item', 'stateChanged', 'tenant_id + canonical_id + version', 'typed columns + tmf_payload snapshot', 'Register concrete consumers during integration design') ON CONFLICT (event_name, event_version) DO UPDATE SET source_table = EXCLUDED.source_table, payload_basis = EXCLUDED.payload_basis, updated_at = now();
INSERT INTO field_stock_logistics.event_contract (event_name, event_version, tmf_api, tmf_resource, source_table, event_type, event_key_strategy, payload_basis, consumer_notes) VALUES ('field_stock_logistics.check_product_stock.deleted', 'v1', 'TMF687', 'checkProductStock', 'field_stock_logistics.stock_item', 'deleted', 'tenant_id + canonical_id + version', 'typed columns + tmf_payload snapshot', 'Register concrete consumers during integration design') ON CONFLICT (event_name, event_version) DO UPDATE SET source_table = EXCLUDED.source_table, payload_basis = EXCLUDED.payload_basis, updated_at = now();
INSERT INTO field_stock_logistics.tmf_api_resource_map (tmf_api, tmf_resource, resource_path, anchor_table, field_strategy, local_spec_path, promoted_fields) VALUES ('TMF687', 'productStock', '/productStock', 'stock_item', 'Promote common TMF lifecycle/reference fields; store remaining validated resource fields in tmf_payload and characteristics tables.', 'references/tmforum-open-apis/openapi-specs/TMF687_StockManagement/TMF687_Stock_Management_API_v4.0.0_swagger.json', '["id", "href", "creationDate", "description", "lastInventoryDate", "lastUpdate", "name", "replenishmentDate", "stockLevelCategory", "channel", "marketSegment", "maxStockLevel", "minStockLevel", "place", "productStockLevel", "productStockRelationship"]'::jsonb) ON CONFLICT (tmf_api, tmf_resource, anchor_table) DO UPDATE SET field_strategy = EXCLUDED.field_strategy, local_spec_path = EXCLUDED.local_spec_path, promoted_fields = EXCLUDED.promoted_fields, updated_at = now();
INSERT INTO field_stock_logistics.event_contract (event_name, event_version, tmf_api, tmf_resource, source_table, event_type, event_key_strategy, payload_basis, consumer_notes) VALUES ('field_stock_logistics.product_stock.created', 'v1', 'TMF687', 'productStock', 'field_stock_logistics.stock_item', 'created', 'tenant_id + canonical_id + version', 'typed columns + tmf_payload snapshot', 'Register concrete consumers during integration design') ON CONFLICT (event_name, event_version) DO UPDATE SET source_table = EXCLUDED.source_table, payload_basis = EXCLUDED.payload_basis, updated_at = now();
INSERT INTO field_stock_logistics.event_contract (event_name, event_version, tmf_api, tmf_resource, source_table, event_type, event_key_strategy, payload_basis, consumer_notes) VALUES ('field_stock_logistics.product_stock.updated', 'v1', 'TMF687', 'productStock', 'field_stock_logistics.stock_item', 'updated', 'tenant_id + canonical_id + version', 'typed columns + tmf_payload snapshot', 'Register concrete consumers during integration design') ON CONFLICT (event_name, event_version) DO UPDATE SET source_table = EXCLUDED.source_table, payload_basis = EXCLUDED.payload_basis, updated_at = now();
INSERT INTO field_stock_logistics.event_contract (event_name, event_version, tmf_api, tmf_resource, source_table, event_type, event_key_strategy, payload_basis, consumer_notes) VALUES ('field_stock_logistics.product_stock.stateChanged', 'v1', 'TMF687', 'productStock', 'field_stock_logistics.stock_item', 'stateChanged', 'tenant_id + canonical_id + version', 'typed columns + tmf_payload snapshot', 'Register concrete consumers during integration design') ON CONFLICT (event_name, event_version) DO UPDATE SET source_table = EXCLUDED.source_table, payload_basis = EXCLUDED.payload_basis, updated_at = now();
INSERT INTO field_stock_logistics.event_contract (event_name, event_version, tmf_api, tmf_resource, source_table, event_type, event_key_strategy, payload_basis, consumer_notes) VALUES ('field_stock_logistics.product_stock.deleted', 'v1', 'TMF687', 'productStock', 'field_stock_logistics.stock_item', 'deleted', 'tenant_id + canonical_id + version', 'typed columns + tmf_payload snapshot', 'Register concrete consumers during integration design') ON CONFLICT (event_name, event_version) DO UPDATE SET source_table = EXCLUDED.source_table, payload_basis = EXCLUDED.payload_basis, updated_at = now();
INSERT INTO field_stock_logistics.tmf_api_resource_map (tmf_api, tmf_resource, resource_path, anchor_table, field_strategy, local_spec_path, promoted_fields) VALUES ('TMF687', 'queryProductStock', '/queryProductStock', 'stock_item', 'Promote common TMF lifecycle/reference fields; store remaining validated resource fields in tmf_payload and characteristics tables.', 'references/tmforum-open-apis/openapi-specs/TMF687_StockManagement/TMF687_Stock_Management_API_v4.0.0_swagger.json', '["id", "href", "creationDate", "description", "lastInventoryDate", "lastUpdate", "name", "replenishmentDate", "stockLevelCategory", "channel", "marketSegment", "maxStockLevel", "minStockLevel", "place", "productStockLevel", "productStockRelationship"]'::jsonb) ON CONFLICT (tmf_api, tmf_resource, anchor_table) DO UPDATE SET field_strategy = EXCLUDED.field_strategy, local_spec_path = EXCLUDED.local_spec_path, promoted_fields = EXCLUDED.promoted_fields, updated_at = now();
INSERT INTO field_stock_logistics.event_contract (event_name, event_version, tmf_api, tmf_resource, source_table, event_type, event_key_strategy, payload_basis, consumer_notes) VALUES ('field_stock_logistics.query_product_stock.created', 'v1', 'TMF687', 'queryProductStock', 'field_stock_logistics.stock_item', 'created', 'tenant_id + canonical_id + version', 'typed columns + tmf_payload snapshot', 'Register concrete consumers during integration design') ON CONFLICT (event_name, event_version) DO UPDATE SET source_table = EXCLUDED.source_table, payload_basis = EXCLUDED.payload_basis, updated_at = now();
INSERT INTO field_stock_logistics.event_contract (event_name, event_version, tmf_api, tmf_resource, source_table, event_type, event_key_strategy, payload_basis, consumer_notes) VALUES ('field_stock_logistics.query_product_stock.updated', 'v1', 'TMF687', 'queryProductStock', 'field_stock_logistics.stock_item', 'updated', 'tenant_id + canonical_id + version', 'typed columns + tmf_payload snapshot', 'Register concrete consumers during integration design') ON CONFLICT (event_name, event_version) DO UPDATE SET source_table = EXCLUDED.source_table, payload_basis = EXCLUDED.payload_basis, updated_at = now();
INSERT INTO field_stock_logistics.event_contract (event_name, event_version, tmf_api, tmf_resource, source_table, event_type, event_key_strategy, payload_basis, consumer_notes) VALUES ('field_stock_logistics.query_product_stock.stateChanged', 'v1', 'TMF687', 'queryProductStock', 'field_stock_logistics.stock_item', 'stateChanged', 'tenant_id + canonical_id + version', 'typed columns + tmf_payload snapshot', 'Register concrete consumers during integration design') ON CONFLICT (event_name, event_version) DO UPDATE SET source_table = EXCLUDED.source_table, payload_basis = EXCLUDED.payload_basis, updated_at = now();
INSERT INTO field_stock_logistics.event_contract (event_name, event_version, tmf_api, tmf_resource, source_table, event_type, event_key_strategy, payload_basis, consumer_notes) VALUES ('field_stock_logistics.query_product_stock.deleted', 'v1', 'TMF687', 'queryProductStock', 'field_stock_logistics.stock_item', 'deleted', 'tenant_id + canonical_id + version', 'typed columns + tmf_payload snapshot', 'Register concrete consumers during integration design') ON CONFLICT (event_name, event_version) DO UPDATE SET source_table = EXCLUDED.source_table, payload_basis = EXCLUDED.payload_basis, updated_at = now();
INSERT INTO field_stock_logistics.tmf_api_resource_map (tmf_api, tmf_resource, resource_path, anchor_table, field_strategy, local_spec_path, promoted_fields) VALUES ('TMF687', 'reserveProductStock', '/reserveProductStock', 'stock_item', 'Promote common TMF lifecycle/reference fields; store remaining validated resource fields in tmf_payload and characteristics tables.', 'references/tmforum-open-apis/openapi-specs/TMF687_StockManagement/TMF687_Stock_Management_API_v4.0.0_swagger.json', '["id", "href", "creationDate", "description", "lastInventoryDate", "lastUpdate", "name", "replenishmentDate", "stockLevelCategory", "channel", "marketSegment", "maxStockLevel", "minStockLevel", "place", "productStockLevel", "productStockRelationship"]'::jsonb) ON CONFLICT (tmf_api, tmf_resource, anchor_table) DO UPDATE SET field_strategy = EXCLUDED.field_strategy, local_spec_path = EXCLUDED.local_spec_path, promoted_fields = EXCLUDED.promoted_fields, updated_at = now();
INSERT INTO field_stock_logistics.event_contract (event_name, event_version, tmf_api, tmf_resource, source_table, event_type, event_key_strategy, payload_basis, consumer_notes) VALUES ('field_stock_logistics.reserve_product_stock.created', 'v1', 'TMF687', 'reserveProductStock', 'field_stock_logistics.stock_item', 'created', 'tenant_id + canonical_id + version', 'typed columns + tmf_payload snapshot', 'Register concrete consumers during integration design') ON CONFLICT (event_name, event_version) DO UPDATE SET source_table = EXCLUDED.source_table, payload_basis = EXCLUDED.payload_basis, updated_at = now();
INSERT INTO field_stock_logistics.event_contract (event_name, event_version, tmf_api, tmf_resource, source_table, event_type, event_key_strategy, payload_basis, consumer_notes) VALUES ('field_stock_logistics.reserve_product_stock.updated', 'v1', 'TMF687', 'reserveProductStock', 'field_stock_logistics.stock_item', 'updated', 'tenant_id + canonical_id + version', 'typed columns + tmf_payload snapshot', 'Register concrete consumers during integration design') ON CONFLICT (event_name, event_version) DO UPDATE SET source_table = EXCLUDED.source_table, payload_basis = EXCLUDED.payload_basis, updated_at = now();
INSERT INTO field_stock_logistics.event_contract (event_name, event_version, tmf_api, tmf_resource, source_table, event_type, event_key_strategy, payload_basis, consumer_notes) VALUES ('field_stock_logistics.reserve_product_stock.stateChanged', 'v1', 'TMF687', 'reserveProductStock', 'field_stock_logistics.stock_item', 'stateChanged', 'tenant_id + canonical_id + version', 'typed columns + tmf_payload snapshot', 'Register concrete consumers during integration design') ON CONFLICT (event_name, event_version) DO UPDATE SET source_table = EXCLUDED.source_table, payload_basis = EXCLUDED.payload_basis, updated_at = now();
INSERT INTO field_stock_logistics.event_contract (event_name, event_version, tmf_api, tmf_resource, source_table, event_type, event_key_strategy, payload_basis, consumer_notes) VALUES ('field_stock_logistics.reserve_product_stock.deleted', 'v1', 'TMF687', 'reserveProductStock', 'field_stock_logistics.stock_item', 'deleted', 'tenant_id + canonical_id + version', 'typed columns + tmf_payload snapshot', 'Register concrete consumers during integration design') ON CONFLICT (event_name, event_version) DO UPDATE SET source_table = EXCLUDED.source_table, payload_basis = EXCLUDED.payload_basis, updated_at = now();
INSERT INTO field_stock_logistics.tmf_api_resource_map (tmf_api, tmf_resource, resource_path, anchor_table, field_strategy, local_spec_path, promoted_fields) VALUES ('TMF700', 'shippingOrder', '/shippingOrder', 'shipping_order', 'Promote common TMF lifecycle/reference fields; store remaining validated resource fields in tmf_payload and characteristics tables.', 'references/tmforum-open-apis/openapi-specs/TMF700_ShippingOrder/TMF700-ShippingOrder-v4.0.0.swagger.json', '["id", "href", "creationDate", "lastUpdateDate", "status", "note", "placeFrom", "placeTo", "productOrder", "relatedParty", "relatedShippingOrder", "shippingInstruction", "shippingOrderCharacteristic", "shippingOrderItem", "shippingOrderOffering", "shippingOrderPrice"]'::jsonb) ON CONFLICT (tmf_api, tmf_resource, anchor_table) DO UPDATE SET field_strategy = EXCLUDED.field_strategy, local_spec_path = EXCLUDED.local_spec_path, promoted_fields = EXCLUDED.promoted_fields, updated_at = now();
INSERT INTO field_stock_logistics.event_contract (event_name, event_version, tmf_api, tmf_resource, source_table, event_type, event_key_strategy, payload_basis, consumer_notes) VALUES ('field_stock_logistics.shipping_order.created', 'v1', 'TMF700', 'shippingOrder', 'field_stock_logistics.shipping_order', 'created', 'tenant_id + canonical_id + version', 'typed columns + tmf_payload snapshot', 'Register concrete consumers during integration design') ON CONFLICT (event_name, event_version) DO UPDATE SET source_table = EXCLUDED.source_table, payload_basis = EXCLUDED.payload_basis, updated_at = now();
INSERT INTO field_stock_logistics.event_contract (event_name, event_version, tmf_api, tmf_resource, source_table, event_type, event_key_strategy, payload_basis, consumer_notes) VALUES ('field_stock_logistics.shipping_order.updated', 'v1', 'TMF700', 'shippingOrder', 'field_stock_logistics.shipping_order', 'updated', 'tenant_id + canonical_id + version', 'typed columns + tmf_payload snapshot', 'Register concrete consumers during integration design') ON CONFLICT (event_name, event_version) DO UPDATE SET source_table = EXCLUDED.source_table, payload_basis = EXCLUDED.payload_basis, updated_at = now();
INSERT INTO field_stock_logistics.event_contract (event_name, event_version, tmf_api, tmf_resource, source_table, event_type, event_key_strategy, payload_basis, consumer_notes) VALUES ('field_stock_logistics.shipping_order.stateChanged', 'v1', 'TMF700', 'shippingOrder', 'field_stock_logistics.shipping_order', 'stateChanged', 'tenant_id + canonical_id + version', 'typed columns + tmf_payload snapshot', 'Register concrete consumers during integration design') ON CONFLICT (event_name, event_version) DO UPDATE SET source_table = EXCLUDED.source_table, payload_basis = EXCLUDED.payload_basis, updated_at = now();
INSERT INTO field_stock_logistics.event_contract (event_name, event_version, tmf_api, tmf_resource, source_table, event_type, event_key_strategy, payload_basis, consumer_notes) VALUES ('field_stock_logistics.shipping_order.deleted', 'v1', 'TMF700', 'shippingOrder', 'field_stock_logistics.shipping_order', 'deleted', 'tenant_id + canonical_id + version', 'typed columns + tmf_payload snapshot', 'Register concrete consumers during integration design') ON CONFLICT (event_name, event_version) DO UPDATE SET source_table = EXCLUDED.source_table, payload_basis = EXCLUDED.payload_basis, updated_at = now();
INSERT INTO field_stock_logistics.tmf_api_resource_map (tmf_api, tmf_resource, resource_path, anchor_table, field_strategy, local_spec_path, promoted_fields) VALUES ('TMF684', 'TMF684', '', 'shipping_order', 'Promote common TMF metadata; store resource-specific fields in tmf_payload until query patterns justify additional typed columns.', 'references/tmforum-open-apis/openapi-specs/TMF684_ShipmentTracking/shipmentTracking_v10_Jan18_SwaggerValidatorPassed.json', '[]'::jsonb) ON CONFLICT (tmf_api, tmf_resource, anchor_table) DO UPDATE SET field_strategy = EXCLUDED.field_strategy, local_spec_path = EXCLUDED.local_spec_path, promoted_fields = EXCLUDED.promoted_fields, updated_at = now();
INSERT INTO field_stock_logistics.event_contract (event_name, event_version, tmf_api, tmf_resource, source_table, event_type, event_key_strategy, payload_basis, consumer_notes) VALUES ('field_stock_logistics.tmf684.created', 'v1', 'TMF684', 'TMF684', 'field_stock_logistics.shipping_order', 'created', 'tenant_id + canonical_id + version', 'typed columns + tmf_payload snapshot', 'Register concrete consumers during integration design') ON CONFLICT (event_name, event_version) DO UPDATE SET source_table = EXCLUDED.source_table, payload_basis = EXCLUDED.payload_basis, updated_at = now();
INSERT INTO field_stock_logistics.event_contract (event_name, event_version, tmf_api, tmf_resource, source_table, event_type, event_key_strategy, payload_basis, consumer_notes) VALUES ('field_stock_logistics.tmf684.updated', 'v1', 'TMF684', 'TMF684', 'field_stock_logistics.shipping_order', 'updated', 'tenant_id + canonical_id + version', 'typed columns + tmf_payload snapshot', 'Register concrete consumers during integration design') ON CONFLICT (event_name, event_version) DO UPDATE SET source_table = EXCLUDED.source_table, payload_basis = EXCLUDED.payload_basis, updated_at = now();
INSERT INTO field_stock_logistics.event_contract (event_name, event_version, tmf_api, tmf_resource, source_table, event_type, event_key_strategy, payload_basis, consumer_notes) VALUES ('field_stock_logistics.tmf684.stateChanged', 'v1', 'TMF684', 'TMF684', 'field_stock_logistics.shipping_order', 'stateChanged', 'tenant_id + canonical_id + version', 'typed columns + tmf_payload snapshot', 'Register concrete consumers during integration design') ON CONFLICT (event_name, event_version) DO UPDATE SET source_table = EXCLUDED.source_table, payload_basis = EXCLUDED.payload_basis, updated_at = now();
INSERT INTO field_stock_logistics.event_contract (event_name, event_version, tmf_api, tmf_resource, source_table, event_type, event_key_strategy, payload_basis, consumer_notes) VALUES ('field_stock_logistics.tmf684.deleted', 'v1', 'TMF684', 'TMF684', 'field_stock_logistics.shipping_order', 'deleted', 'tenant_id + canonical_id + version', 'typed columns + tmf_payload snapshot', 'Register concrete consumers during integration design') ON CONFLICT (event_name, event_version) DO UPDATE SET source_table = EXCLUDED.source_table, payload_basis = EXCLUDED.payload_basis, updated_at = now();
INSERT INTO field_stock_logistics.tmf_api_resource_map (tmf_api, tmf_resource, resource_path, anchor_table, field_strategy, local_spec_path, promoted_fields) VALUES ('TMF639', 'resource', '/resource', 'appointment', 'Promote common TMF metadata; store resource-specific fields in tmf_payload until query patterns justify additional typed columns.', 'references/tmforum-open-apis/openapi-specs/TMF639_ResourceInventory/TMF639-Resource_Inventory_Management-v5.0.0.oas.yaml', '[]'::jsonb) ON CONFLICT (tmf_api, tmf_resource, anchor_table) DO UPDATE SET field_strategy = EXCLUDED.field_strategy, local_spec_path = EXCLUDED.local_spec_path, promoted_fields = EXCLUDED.promoted_fields, updated_at = now();
INSERT INTO field_stock_logistics.event_contract (event_name, event_version, tmf_api, tmf_resource, source_table, event_type, event_key_strategy, payload_basis, consumer_notes) VALUES ('field_stock_logistics.resource.created', 'v1', 'TMF639', 'resource', 'field_stock_logistics.appointment', 'created', 'tenant_id + canonical_id + version', 'typed columns + tmf_payload snapshot', 'Register concrete consumers during integration design') ON CONFLICT (event_name, event_version) DO UPDATE SET source_table = EXCLUDED.source_table, payload_basis = EXCLUDED.payload_basis, updated_at = now();
INSERT INTO field_stock_logistics.event_contract (event_name, event_version, tmf_api, tmf_resource, source_table, event_type, event_key_strategy, payload_basis, consumer_notes) VALUES ('field_stock_logistics.resource.updated', 'v1', 'TMF639', 'resource', 'field_stock_logistics.appointment', 'updated', 'tenant_id + canonical_id + version', 'typed columns + tmf_payload snapshot', 'Register concrete consumers during integration design') ON CONFLICT (event_name, event_version) DO UPDATE SET source_table = EXCLUDED.source_table, payload_basis = EXCLUDED.payload_basis, updated_at = now();
INSERT INTO field_stock_logistics.event_contract (event_name, event_version, tmf_api, tmf_resource, source_table, event_type, event_key_strategy, payload_basis, consumer_notes) VALUES ('field_stock_logistics.resource.stateChanged', 'v1', 'TMF639', 'resource', 'field_stock_logistics.appointment', 'stateChanged', 'tenant_id + canonical_id + version', 'typed columns + tmf_payload snapshot', 'Register concrete consumers during integration design') ON CONFLICT (event_name, event_version) DO UPDATE SET source_table = EXCLUDED.source_table, payload_basis = EXCLUDED.payload_basis, updated_at = now();
INSERT INTO field_stock_logistics.event_contract (event_name, event_version, tmf_api, tmf_resource, source_table, event_type, event_key_strategy, payload_basis, consumer_notes) VALUES ('field_stock_logistics.resource.deleted', 'v1', 'TMF639', 'resource', 'field_stock_logistics.appointment', 'deleted', 'tenant_id + canonical_id + version', 'typed columns + tmf_payload snapshot', 'Register concrete consumers during integration design') ON CONFLICT (event_name, event_version) DO UPDATE SET source_table = EXCLUDED.source_table, payload_basis = EXCLUDED.payload_basis, updated_at = now();

INSERT INTO field_stock_logistics.privacy_retention_policy (table_name, data_domain, data_classification, retention_class, retention_basis, default_retention_days, legal_hold_supported, residency_rule, masking_policy, audit_level) VALUES ('field_stock_logistics.appointment', 'field_stock_logistics', 'internal', 'operational_telemetry', 'Suite data model and TMF API baseline review', 730, true, 'Keep operational data in the suite deployment region unless a release-specific residency rule overrides it.', 'Aggregate or pseudonymize identifiers before analytics distribution.', 'standard') ON CONFLICT (table_name) DO UPDATE SET data_classification = EXCLUDED.data_classification, retention_class = EXCLUDED.retention_class, masking_policy = EXCLUDED.masking_policy, audit_level = EXCLUDED.audit_level, updated_at = now();
INSERT INTO field_stock_logistics.privacy_retention_policy (table_name, data_domain, data_classification, retention_class, retention_basis, default_retention_days, legal_hold_supported, residency_rule, masking_policy, audit_level) VALUES ('field_stock_logistics.work_order', 'field_stock_logistics', 'confidential', 'business_lifecycle', 'Suite data model and TMF API baseline review', 2190, true, 'Keep operational data in the suite deployment region unless a release-specific residency rule overrides it.', 'Mask customer, partner, account, order, and operationally sensitive details in non-production and exports.', 'standard-high') ON CONFLICT (table_name) DO UPDATE SET data_classification = EXCLUDED.data_classification, retention_class = EXCLUDED.retention_class, masking_policy = EXCLUDED.masking_policy, audit_level = EXCLUDED.audit_level, updated_at = now();
INSERT INTO field_stock_logistics.privacy_retention_policy (table_name, data_domain, data_classification, retention_class, retention_basis, default_retention_days, legal_hold_supported, residency_rule, masking_policy, audit_level) VALUES ('field_stock_logistics.dispatch_plan', 'field_stock_logistics', 'internal', 'operational_telemetry', 'Suite data model and TMF API baseline review', 730, true, 'Keep operational data in the suite deployment region unless a release-specific residency rule overrides it.', 'Aggregate or pseudonymize identifiers before analytics distribution.', 'standard') ON CONFLICT (table_name) DO UPDATE SET data_classification = EXCLUDED.data_classification, retention_class = EXCLUDED.retention_class, masking_policy = EXCLUDED.masking_policy, audit_level = EXCLUDED.audit_level, updated_at = now();
INSERT INTO field_stock_logistics.privacy_retention_policy (table_name, data_domain, data_classification, retention_class, retention_basis, default_retention_days, legal_hold_supported, residency_rule, masking_policy, audit_level) VALUES ('field_stock_logistics.field_evidence', 'field_stock_logistics', 'internal', 'operational_telemetry', 'Suite data model and TMF API baseline review', 730, true, 'Keep operational data in the suite deployment region unless a release-specific residency rule overrides it.', 'Aggregate or pseudonymize identifiers before analytics distribution.', 'standard') ON CONFLICT (table_name) DO UPDATE SET data_classification = EXCLUDED.data_classification, retention_class = EXCLUDED.retention_class, masking_policy = EXCLUDED.masking_policy, audit_level = EXCLUDED.audit_level, updated_at = now();
INSERT INTO field_stock_logistics.privacy_retention_policy (table_name, data_domain, data_classification, retention_class, retention_basis, default_retention_days, legal_hold_supported, residency_rule, masking_policy, audit_level) VALUES ('field_stock_logistics.stock_item', 'field_stock_logistics', 'internal', 'operational_telemetry', 'Suite data model and TMF API baseline review', 730, true, 'Keep operational data in the suite deployment region unless a release-specific residency rule overrides it.', 'Aggregate or pseudonymize identifiers before analytics distribution.', 'standard') ON CONFLICT (table_name) DO UPDATE SET data_classification = EXCLUDED.data_classification, retention_class = EXCLUDED.retention_class, masking_policy = EXCLUDED.masking_policy, audit_level = EXCLUDED.audit_level, updated_at = now();
INSERT INTO field_stock_logistics.privacy_retention_policy (table_name, data_domain, data_classification, retention_class, retention_basis, default_retention_days, legal_hold_supported, residency_rule, masking_policy, audit_level) VALUES ('field_stock_logistics.stock_balance', 'field_stock_logistics', 'internal', 'operational_telemetry', 'Suite data model and TMF API baseline review', 730, true, 'Keep operational data in the suite deployment region unless a release-specific residency rule overrides it.', 'Aggregate or pseudonymize identifiers before analytics distribution.', 'standard') ON CONFLICT (table_name) DO UPDATE SET data_classification = EXCLUDED.data_classification, retention_class = EXCLUDED.retention_class, masking_policy = EXCLUDED.masking_policy, audit_level = EXCLUDED.audit_level, updated_at = now();
INSERT INTO field_stock_logistics.privacy_retention_policy (table_name, data_domain, data_classification, retention_class, retention_basis, default_retention_days, legal_hold_supported, residency_rule, masking_policy, audit_level) VALUES ('field_stock_logistics.shipping_order', 'field_stock_logistics', 'confidential', 'business_lifecycle', 'Suite data model and TMF API baseline review', 2190, true, 'Keep operational data in the suite deployment region unless a release-specific residency rule overrides it.', 'Mask customer, partner, account, order, and operationally sensitive details in non-production and exports.', 'standard-high') ON CONFLICT (table_name) DO UPDATE SET data_classification = EXCLUDED.data_classification, retention_class = EXCLUDED.retention_class, masking_policy = EXCLUDED.masking_policy, audit_level = EXCLUDED.audit_level, updated_at = now();
INSERT INTO field_stock_logistics.privacy_retention_policy (table_name, data_domain, data_classification, retention_class, retention_basis, default_retention_days, legal_hold_supported, residency_rule, masking_policy, audit_level) VALUES ('field_stock_logistics.tracking_event', 'field_stock_logistics', 'internal', 'operational_telemetry', 'Suite data model and TMF API baseline review', 730, true, 'Keep operational data in the suite deployment region unless a release-specific residency rule overrides it.', 'Aggregate or pseudonymize identifiers before analytics distribution.', 'standard') ON CONFLICT (table_name) DO UPDATE SET data_classification = EXCLUDED.data_classification, retention_class = EXCLUDED.retention_class, masking_policy = EXCLUDED.masking_policy, audit_level = EXCLUDED.audit_level, updated_at = now();
INSERT INTO field_stock_logistics.privacy_retention_policy (table_name, data_domain, data_classification, retention_class, retention_basis, default_retention_days, legal_hold_supported, residency_rule, masking_policy, audit_level) VALUES ('field_stock_logistics.field_inventory_handover', 'field_stock_logistics', 'internal', 'operational_telemetry', 'Suite data model and TMF API baseline review', 730, true, 'Keep operational data in the suite deployment region unless a release-specific residency rule overrides it.', 'Aggregate or pseudonymize identifiers before analytics distribution.', 'standard') ON CONFLICT (table_name) DO UPDATE SET data_classification = EXCLUDED.data_classification, retention_class = EXCLUDED.retention_class, masking_policy = EXCLUDED.masking_policy, audit_level = EXCLUDED.audit_level, updated_at = now();
INSERT INTO field_stock_logistics.privacy_retention_policy (table_name, data_domain, data_classification, retention_class, retention_basis, default_retention_days, legal_hold_supported, residency_rule, masking_policy, audit_level) VALUES ('field_stock_logistics.event_outbox', 'field_stock_logistics', 'internal', 'operational_telemetry', 'Suite data model and TMF API baseline review', 730, true, 'Keep operational data in the suite deployment region unless a release-specific residency rule overrides it.', 'Aggregate or pseudonymize identifiers before analytics distribution.', 'standard') ON CONFLICT (table_name) DO UPDATE SET data_classification = EXCLUDED.data_classification, retention_class = EXCLUDED.retention_class, masking_policy = EXCLUDED.masking_policy, audit_level = EXCLUDED.audit_level, updated_at = now();

COMMIT;
