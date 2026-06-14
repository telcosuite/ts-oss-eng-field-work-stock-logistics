# Contractor HSE And Replenishment Control Feature Specification

Reviewed: 2026-06-07

Suite: OSS Engineering, Inventory, And Fulfillment

App: [Field Work, Stock, And Logistics](../README.md)

Source module detail: [Modules And Features](../modules-and-features.md)

Source gap review: [E2E Feature Gap Assessment](../../../e2e-feature-gap-assessment.md)

Feature area slug: `contractor-hse-and-replenishment-control`

E2E gap severity: Critical

## Feature Intent

Track contractor assignment, site access, HSE/JSA checks, permit evidence, time/material evidence, invoice support, van-stock replenishment, procurement shortage escalation, and partner labor handoff for field delivery. Contractor HSE And Replenishment Control produces contractor HSE and replenishment control records that prove external labor, safety compliance, stock custody, and shortage escalation without giving contractors direct control of inventory, customer, billing, or platform master data.

## Telecom Objects And Decision Rights

- Master entity: contractor HSE and replenishment control record. Field Work, Stock, And Logistics owns contractor assignment gate, HSE/JSA evidence, access permit check, contractor completion evidence, time/material claim support, van-stock replenishment request, shortage escalation, policy rejection, and contractor control audit history.
- Referenced entities: work order, appointment, contractor party role, site access record, HSE risk, document evidence, stock reservation, shipping order, procurement/ERP reference, invoice support reference, customer/site contact, and field-to-inventory handover package. Field Work, Stock, And Logistics consumes these references through APIs, events, governed projections, workflow tasks, mobile evidence packages, carrier callbacks, partner callbacks, or certified data products and does not overwrite their operational masters.
- Primary decisions: approve contractor assignment, block unsafe access, require HSE evidence, accept/reject contractor evidence, request replenishment, escalate shortage, approve time/material evidence for invoice support, or revoke contractor access. Each contractor HSE and replenishment control record decision records accountable persona, source channel, reason, policy outcome, impacted order/service/resource/customer/site, correlation ID, and downstream handoff.
- ODA boundary: Field Work, Stock, And Logistics keeps private appointment, dispatch, work order, field evidence, stock, shipment, reverse logistics, contractor/HSE, and handover records; Order Management, Inventory And Topology, Fulfillment Activation Control Tower, Assurance, Customer, Partner, Billing, ERP, Platform, and Data apps remain masters for their own lifecycle records.

## Personas, Jobs To Be Done, And Outcomes

| Persona | Job to be done | Outcome |
| --- | --- | --- |
| Field dispatcher | Uses the Contractor HSE And Replenishment Control capability to schedule appointments, assign work orders, balance technician or contractor capacity, and protect customer promise windows. | The contractor HSE and replenishment control record keeps the field schedule executable with visible jeopardy, no-access, stock, route, and SLA evidence. |
| Field technician | Uses the Contractor HSE And Replenishment Control capability to execute install, repair, survey, migration, pickup, maintenance, and decommission tasks on a mobile work order. | The contractor HSE and replenishment control record captures serials, photos, signatures, tests, site access, HSE checks, and installed-state evidence without spreadsheet control. |
| Warehouse/logistics manager | Uses the Contractor HSE And Replenishment Control capability to reserve, pick, pack, ship, transfer, consume, receive, quarantine, refurbish, and reconcile CPE, SIM/eSIM, devices, spares, cards, and install material. | The contractor HSE and replenishment control record keeps stock and shipment state aligned to work orders and resource inventory handover. |
| Fulfillment operations lead | Uses the Contractor HSE And Replenishment Control capability to monitor field, appointment, stock, shipping, and handover dependencies for order-to-activate and MACD orders. | The contractor HSE and replenishment control record sees field jeopardy, manual fallout, partial completion, rollback, and customer-impacting delays before order closure. |
| Inventory manager | Uses the Contractor HSE And Replenishment Control capability to accept, reject, or repair field-to-inventory handover evidence for installed, removed, swapped, quarantined, or returned resources. | The contractor HSE and replenishment control record protects Resource Inventory as the final master while consuming field evidence through governed handoff. |
| Contractor/HSE coordinator | Uses the Contractor HSE And Replenishment Control capability to verify contractor assignment, site access, JSA/HSE evidence, time/material claims, permits, and replenishment exceptions. | The contractor HSE and replenishment control record proves partner labor and safety controls without giving contractors uncontrolled inventory or customer data access. |
| Customer/care handoff user | Uses the Contractor HSE And Replenishment Control capability to view appointment, technician ETA, shipment, failed-appointment, completion, and reschedule status for customer communication. | The contractor HSE and replenishment control record answers customer inquiries from app events without editing field, stock, or inventory master records. |

## Core Workflows

| Stage | Telecom trigger or validation | Orchestration, exception, completion, and evidence |
| --- | --- | --- |
| Trigger | Contractor HSE And Replenishment Control starts from contractor work assignment, site access request, HSE checklist submission, time/material claim, van stock shortage, replenishment threshold breach, procurement backorder, partner/off-net field dependency, or compliance audit request. | The contractor HSE and replenishment control record opens with tenant, market, customer/order/service/resource/site scope, lifecycle action, due date, SLA/OLA target, customer-impact flag, source trigger, correlation ID, and required dependency references. |
| Validation | The app validates contractor authorization, skill/certification, insurance/permit status, site HSE/JSA requirement, stock custody, replenishment threshold, procurement lead time, data access scope, customer privacy, and critical infrastructure masking rule. | Invalid contractor HSE and replenishment control record data creates a blocked queue item, no-access case, shortage task, HSE stop-work item, shipment exception, handover rejection, or fulfillment fallout before the affected order, repair, or inventory lifecycle advances. |
| Orchestration | Field Work, Stock, And Logistics coordinates appointment, work order, dispatch, mobile evidence, stock, shipment, contractor, reverse logistics, handover, order, fulfillment, inventory, assurance, partner, carrier, ERP, customer, platform, and data consumers through APIs, events, tasks, adapters, or evidence packages. | Consumers receive Contractor HSE And Replenishment Control state and evidence while their own databases and lifecycle records remain private to their owning apps. |
| Exception | If Contractor starts work without valid HSE/JSA evidence, the contractor HSE and replenishment control record routes to the accountable dispatcher, technician, warehouse/logistics manager, fulfillment lead, inventory manager, contractor/HSE coordinator, customer/care handoff user, partner coordinator, or data steward. | The exception captures failed rule, affected customer/site/service/resource/order, SLA/OLA impact, retry/reschedule/rollback/rework option, evidence gap, downstream blocker, correlation ID, and escalation path. |
| Completion | Completion occurs when the contractor HSE and replenishment control record is completed, partially completed, failed, cancelled, rescheduled, reworked, handed over, accepted, rejected, quarantined, replenished, or archived according to its lifecycle. | Completion evidence includes lifecycle version, task history, serial/stock/shipment references, field photos/signatures/tests where relevant, HSE/site evidence where relevant, customer/partner communication status, event IDs, and replay metadata. |

## Missing Use Cases And Scenarios

| Scenario | Required behavior |
| --- | --- |
| Contractor install | Contractor HSE And Replenishment Control must gate work assignment by certification, insurance, site access, HSE, and material custody controls with explicit contractor HSE and replenishment control record, lifecycle state, decision owner, exception route, evidence package, and downstream handoff. |
| HSE incident or block | Contractor HSE And Replenishment Control must preserve JSA, risk, photos, permit, and stop-work evidence for compliance review with explicit contractor HSE and replenishment control record, lifecycle state, decision owner, exception route, evidence package, and downstream handoff. |
| Van-stock replenishment | Contractor HSE And Replenishment Control must request replenishment from shortage, reserve material, ship to depot/van, and reconcile custody with explicit contractor HSE and replenishment control record, lifecycle state, decision owner, exception route, evidence package, and downstream handoff. |
| Enterprise rollout | Contractor HSE And Replenishment Control must coordinate partner crews, access windows, material availability, and customer project milestones with explicit contractor HSE and replenishment control record, lifecycle state, decision owner, exception route, evidence package, and downstream handoff. |
| Invoice support | Contractor HSE And Replenishment Control must capture time/material evidence without becoming ERP, billing, or contractor payment master with explicit contractor HSE and replenishment control record, lifecycle state, decision owner, exception route, evidence package, and downstream handoff. |

## Capability Slices

| Feature ID | Feature | Parent feature area | Priority guidance |
| --- | --- | --- | --- |
| F-contractor-hse-and-replenishment-control-01 | Contractor assignment and access gating | Contractor HSE And Replenishment Control | P1: required for field execution, stock/logistics readiness, customer communication, inventory handover, assurance support, compliance evidence, or fulfillment milestone control. |
| F-contractor-hse-and-replenishment-control-02 | HSE/JSA evidence and stop-work control | Contractor HSE And Replenishment Control | P1: required for field execution, stock/logistics readiness, customer communication, inventory handover, assurance support, compliance evidence, or fulfillment milestone control. |
| F-contractor-hse-and-replenishment-control-03 | Time/material and invoice-support evidence | Contractor HSE And Replenishment Control | P1: required for field execution, stock/logistics readiness, customer communication, inventory handover, assurance support, compliance evidence, or fulfillment milestone control. |
| F-contractor-hse-and-replenishment-control-04 | Van-stock replenishment and shortage escalation | Contractor HSE And Replenishment Control | P1: required for field execution, stock/logistics readiness, customer communication, inventory handover, assurance support, compliance evidence, or fulfillment milestone control. |
| F-contractor-hse-and-replenishment-control-05 | Contractor data minimization and masking | Contractor HSE And Replenishment Control | P2: required for field execution, stock/logistics readiness, customer communication, inventory handover, assurance support, compliance evidence, or fulfillment milestone control. |
| F-contractor-hse-and-replenishment-control-06 | Compliance dashboard and audit export | Contractor HSE And Replenishment Control | P2: required for field execution, stock/logistics readiness, customer communication, inventory handover, assurance support, compliance evidence, or fulfillment milestone control. |

## Acceptance Criteria

1. **AC-contractor-hse-and-replenishment-control-01:** Given an authorized field dispatcher, field technician, warehouse/logistics manager, fulfillment operations lead, inventory manager, contractor/HSE coordinator, or customer/care handoff user creates or updates the contractor HSE and replenishment control record, when the Contractor HSE And Replenishment Control lifecycle advances, then Field Work, Stock, And Logistics validates contractor authorization, skill/certification, insurance/permit status, site HSE/JSA requirement, stock custody, replenishment threshold, procurement lead time, data access scope, customer privacy, and critical infrastructure masking rule before accepting the state change.
2. **AC-contractor-hse-and-replenishment-control-02:** Given the contractor HSE and replenishment control record references appointment, work order, stock, shipment, order, fulfillment, inventory, assurance, partner, ERP, customer, platform, or data records, when a persona opens the Contractor HSE And Replenishment Control record, then the app shows source owner, source timestamp, freshness, dependency status, customer-impact flag, and whether the data is app-owned or read-only.
3. **AC-contractor-hse-and-replenishment-control-03:** Given Contractor starts work without valid HSE/JSA evidence, when validation fails for Contractor HSE And Replenishment Control, then the app keeps the contractor HSE and replenishment control record in blocked, jeopardy, no-access, shortage, HSE stop-work, exception, rejected, rework, or fallout state with severity, owner, due date, affected customer/site/service/resource/order, retry/reschedule/rework option, and correlation ID.
4. **AC-contractor-hse-and-replenishment-control-04:** Given the contractor HSE and replenishment control record changes due to mobile action, dispatcher action, warehouse action, carrier callback, contractor evidence, customer reschedule, inventory rejection, partner callback, or automation, when the transition is committed, then the app stores decision right, actor, role, reason, evidence links, old/new values, tenant/region boundary, and idempotency key.
5. **AC-contractor-hse-and-replenishment-control-05:** Given Order Management, Fulfillment Activation Control Tower, Inventory And Topology, Assurance/NOC, Customer/Care, Partner, Billing, ERP, Platform, or Data consumers subscribe to Contractor HSE And Replenishment Control changes, when the contractor HSE and replenishment control record reaches milestone, exception, no-access, shipment, stock, HSE, handover, or completion state, then the app emits a versioned event with changed fields, impact, SLA/OLA state, replay metadata, and correlation ID.
6. **AC-contractor-hse-and-replenishment-control-06:** Given a greenfield install, brownfield MACD, enterprise bulk rollout, partner/off-net dependency, automated dispatch, manual fallout, field visit, no-access, partial activation, rollback, migration, or decommissioning scenario references the contractor HSE and replenishment control record, when the user requests closure, then the app validates downstream handoffs, open exceptions, evidence completeness, customer/order notification, inventory or stock acceptance, retention, and legal hold before closure.
7. **AC-contractor-hse-and-replenishment-control-07:** Given operations leaders review Contractor HSE And Replenishment Control operations, when they open dashboards, then they see volume, queue aging, automation rate, SLA/OLA jeopardy, no-access, stock/shipment readiness, evidence rejection, HSE block, inventory handover status, partner/contractor aging, and completion quality linked to the contractor HSE and replenishment control record.

## Negative Scenarios

Negative scenarios for this feature include permission denial, missing source data, stale dependency state, policy failure, duplicate or replayed request, downstream timeout, reconciliation mismatch, and any feature-specific negative scenario additions listed in the suite gap-review closure addendum.

## Edge Cases

| Scenario | Expected behavior |
| --- | --- |
| Contractor starts work without valid HSE/JSA evidence | Contractor HSE And Replenishment Control blocks unsafe execution or routes controlled exception handling with owner, due date, affected customer/site/service/resource/order, retry/reschedule/rework/rollback option, and replayable evidence. |
| Contractor requests customer or topology data outside assignment scope | Contractor HSE And Replenishment Control blocks unsafe execution or routes controlled exception handling with owner, due date, affected customer/site/service/resource/order, retry/reschedule/rework/rollback option, and replayable evidence. |
| Van-stock replenishment is approved but procurement shortage blocks work orders | Contractor HSE And Replenishment Control blocks unsafe execution or routes controlled exception handling with owner, due date, affected customer/site/service/resource/order, retry/reschedule/rework/rollback option, and replayable evidence. |
| Time/material claim lacks serial, photo, GPS, or work order correlation | Contractor HSE And Replenishment Control blocks unsafe execution or routes controlled exception handling with owner, due date, affected customer/site/service/resource/order, retry/reschedule/rework/rollback option, and replayable evidence. |
| Site access permit expires before contractor completion evidence is submitted | Contractor HSE And Replenishment Control blocks unsafe execution or routes controlled exception handling with owner, due date, affected customer/site/service/resource/order, retry/reschedule/rework/rollback option, and replayable evidence. |
| Duplicate, stale, or out-of-order callback | Contractor HSE And Replenishment Control uses callback timestamp, event version, source system, command ID, optimistic locking, and idempotency key so retries cannot duplicate appointment, dispatch, stock, shipment, evidence, HSE, RMA, or handover state. |
| Cross-tenant, cross-region, or contractor access boundary breach | Contractor HSE And Replenishment Control blocks the action, masks restricted customer/site/topology/identifier data, and records policy decision metadata for tenant isolation, privileged access, data residency, legal hold, contractor scope, and export control. |
| Downstream app, carrier, partner, mobile device, ERP, or external adapter unavailable | Contractor HSE And Replenishment Control either fails fast for synchronous safety gates or queues controlled retry, replay, escalation, fallback manual task, reschedule, rework, or compensation with owner, due date, and correlation ID. |
| Retention, privacy, regulatory, HSE, or legal hold conflict | Contractor HSE And Replenishment Control prevents destructive correction, evidence deletion, stock restock, contractor closure, or inventory handover completion until retention, HSE, lawful/regulatory evidence, legal hold, and data residency controls allow it. |

## Suite Gap Review Closure Addendum

Source review: [03 Oss Engineering Inventory Fulfillment Gap Review](../../../../suite-gap-reviews/03-oss-engineering-inventory-fulfillment-gap-review.md)

This addendum applies the suite gap-review findings tied to this feature file. It supplements the baseline feature specification and should be carried into epic, story, API, event, data, and test refinement.

### Review Backlog Items Addressed

| Severity | Gap-review item | Closure expectation |
| --- | --- | --- |
| Medium | Contractor HSE/certification and invoice evidence dispute controls. | Add concrete happy path, negative path, edge-case, API/event/data control, reporting, and test evidence for this feature area. |

### Acceptance Criteria Additions

1. Given a technician completes work offline, when sync resumes, then evidence is validated for version, GPS/time, serials, photos, signature, task state, and duplicate upload before closure or inventory handover.
2. Given an appointment fails, when the reason is no access, customer cancellation, no stock, technician no-show, safety issue, or network blocker, then reschedule, communication, compensation, and owner actions are created.
3. Given dispatch is proposed, when required serialized stock, skill, certification, access note, HSE permit, or shipment readiness is missing, then the work cannot be dispatched without approved exception.

### Negative Scenario Additions

1. Technician installs a different ONT than reserved; hold closure and create stock/inventory discrepancy.
2. Mobile app uploads duplicate completion after offline retry; use idempotency and evidence hash to prevent duplicate inventory update.
3. Contractor arrives with expired certification; block work start and route to contractor/HSE owner.

### API, Event, Data, And Reporting Updates

- Add or refine command/query APIs so the owning app remains the system of record and consumers do not bypass app APIs.
- Add lifecycle events for the reviewed gap, including created, validated, blocked, approved, completed, failed, corrected, replayed, and reconciliation-failed variants where applicable.
- Capture idempotency keys, correlation IDs, source freshness, lineage, confidence, policy version, owner, SLA/OLA timers, and audit evidence.
- Add dashboards or operational reports for aging, failure reason, confidence/quality, consumer impact, exception backlog, and closure proof.
- Extend the test approach with happy-path, negative, edge-case, contract, event replay, data reconciliation, security, accessibility, and operational-readiness tests for the listed review items.

## API, Event, And Data Requirements

Related APIs and API areas: [TMF697](../../../../../references/tmforum-open-apis/openapi-specs/TMF697_Work_Order), [TMF687](../../../../../references/tmforum-open-apis/openapi-specs/TMF687_StockManagement), [TMF700](../../../../../references/tmforum-open-apis/openapi-specs/TMF700_ShippingOrder), [TMF667](../../../../../references/tmforum-open-apis/openapi-specs/TMF667_Document), [TMF696](../../../../../references/tmforum-open-apis/openapi-specs/TMF696_RiskManagement)

TMF API fit and extension notes:

- Use TMF697 for contractor work order context, TMF687 for stock and replenishment references, TMF700 for replenishment shipping, TMF667 for document evidence, and TMF696 for HSE/risk records where applicable.
- Non-TMF Contractor HSE Control API for assignment gating, JSA/HSE checklist, stop-work decision, permit evidence, time/material claim support, contractor access scope, and replenishment shortage escalation. ERP procurement and contractor payment remain external owners referenced by this app.
- Command APIs for Contractor HSE And Replenishment Control must cover create, validate, update, assign, hold, retry, reschedule, cancel, fail, rework, submit, approve, reject, correct, replay, handover, close, and archive where the contractor HSE and replenishment control record lifecycle uses those states.
- Query APIs for Contractor HSE And Replenishment Control must cover search, detail, timeline, related contractor HSE and replenishment control record references, dependency graph, work queues, evidence retrieval, metrics, audit retrieval, and role-aware masking.
- Domain events for Contractor HSE And Replenishment Control must include ContractorAssignmentApproved, HSEEvidenceSubmitted, StopWorkRaised, ContractorEvidenceRejected, VanStockReplenishmentRequested, ProcurementShortageEscalated, plus blocked, jeopardy raised, exception raised, exception resolved, evidence rejected, handover requested, consumer rejected, replay requested, and reconciliation failed where the lifecycle uses those states.

Data and ownership requirements:

- Field Work, Stock, And Logistics owns contractor assignment gate, HSE/JSA evidence, access permit check, contractor completion evidence, time/material claim support, van-stock replenishment request, shortage escalation, policy rejection, and contractor control audit history; other apps consume Contractor HSE And Replenishment Control state through APIs, events, governed projections, workflow tasks, carrier adapters, partner callbacks, mobile evidence packages, or certified data products.
- Store source channel, actor, tenant/brand/market, customer/order/service/resource/site references, lifecycle action, status reason, due date, SLA/OLA state, external references, old/new values, policy decision, evidence links, retention class, legal hold flag, and impacted consumer list on the contractor HSE and replenishment control record.
- Keep read projections, analytics extracts, and DWH/lakehouse outputs separate from operational writes so Contractor HSE And Replenishment Control does not create shadow mastership of product orders, service orders, resource inventory, service inventory, billing records, assurance incidents, customer records, partner records, ERP records, or platform security records.
- Provide reconciliation outputs that prove Order Management, Fulfillment Activation Control Tower, Inventory And Topology, Assurance, Customer/Care, Partner, Billing, ERP, Platform, and Data consumers have accepted, rejected, or remain explicitly blocked by the contractor HSE and replenishment control record.

## Integrations And Handoffs

- Work Order and Dispatch for contractor task context.
- Stock/warehouse and Shipping for replenishment and material custody.
- ERP/procurement for shortage and invoice references.
- Partner/contractor portals for controlled evidence submission.
- Platform IAM for contractor access and revocation.
- Compliance/security for HSE, privacy, and critical infrastructure controls.

## Non-Functional Requirements

- Scale and latency: Contractor HSE And Replenishment Control must support national field operations with high-volume appointments, work orders, dispatch sessions, mobile evidence uploads, stock transactions, shipment callbacks, contractor submissions, and inventory handover packages; command acceptance should be low-latency while long-running field, shipment, RMA, HSE, and handover tasks expose progress, ETA, and partial-failure reports.
- Availability and resilience: query APIs and active queues for Contractor HSE And Replenishment Control must remain available during downstream order, fulfillment, inventory, assurance, carrier, partner, ERP, mobile network, or data outages by serving last-known state with dependency freshness and retry status.
- Auditability and retention: Contractor HSE And Replenishment Control history must retain actor, channel, reason, old/new value, mobile evidence, stock/serial reference, shipment proof, HSE/site evidence, customer communication, policy version, approval/waiver, event ID, external reference, legal hold flag, and retention class for field, inventory, customer, regulatory, and safety evidence periods.
- Localization and accessibility: Contractor HSE And Replenishment Control UI tasks, mobile flows, customer/care messages, date/time zones, engineering units, route/location fields, language, keyboard navigation, and screen-reader labels must respect tenant, market, geography, and accessibility policy.
- Data protection: API, event, mobile, carrier, contractor, export, and dashboard paths for Contractor HSE And Replenishment Control must enforce tenant isolation, data residency, purpose limitation, least privilege, contractor data minimization, sensitive topology masking, customer privacy, and secure evidence storage.

## Compliance, Security, And Privacy

- Contractor HSE And Replenishment Control must enforce tenant isolation, market/region boundaries, role-based access, contractor least privilege, privileged stock and site controls, critical infrastructure masking, lawful/regulatory inventory evidence, HSE/site access evidence, export controls, and data residency for the contractor HSE and replenishment control record.
- Contractor HSE And Replenishment Control must preserve appointment evidence, field photos, signatures, serial scans, service tests, shipment proof, stock custody, RMA/refurbishment evidence, HSE/JSA evidence, contractor evidence, customer communication, legal hold, and regulatory inventory handover evidence where field decisions affect telecom obligations.
- Sensitive customer, enterprise, site, topology, identifier, device/SIM/eSIM, shipment, contractor, and HSE references in Contractor HSE And Replenishment Control must be masked in search, timelines, exports, analytics, and dashboards unless the persona has a permitted operational purpose.

## Observability And Operations

- Metrics: track contractor assignment cycle time, HSE evidence completion, stop-work count, time/material rejection rate, replenishment lead time, shortage aging, contractor access violations, and compliance audit export completion, plus replay backlog, consumer lag, event publication failure, and completion quality.
- Queues: provide queues for draft, ready, scheduled, assigned, dispatched, in progress, waiting stock, waiting shipment, waiting customer, waiting partner, HSE blocked, no-access, exception, rework, handover pending, rejected, completed, archived, and replay-needed Contractor HSE And Replenishment Control records where lifecycle states apply.
- Alerts: notify Field Work, Stock, And Logistics owners when queue aging, no-access rate, evidence rejection, stock shortage, shipment delay, HSE block, contractor rejection, mobile sync backlog, inventory handover rejection, or SLA/OLA breach risk exceeds threshold.
- Runbooks: document triage, retry, replay, mobile sync recovery, appointment reschedule, stock correction, shipment exception, field rework, no-access handling, HSE stop-work, contractor escalation, RMA disposition, handover repair, evidence export, legal hold response, and downstream event replay procedures for Contractor HSE And Replenishment Control.
- Ownership: Field Work, Stock, And Logistics owns first-line health for Contractor HSE And Replenishment Control lifecycle, queues, event replay, evidence completeness, dashboards, and runbooks; Order, Fulfillment, Inventory, Assurance, Customer/Care, Partner, Carrier, ERP, Platform, Data, and contractor owners correct their own source records.

## Test Approach

| Test layer | Required coverage |
| --- | --- |
| Unit tests | Field rules, lifecycle transitions, dependency state, retry policy, duplicate detection, masking, and contractor HSE and replenishment control record calculations for Contractor HSE And Replenishment Control. |
| API contract tests | Commands, queries, errors, idempotency, pagination, filtering, version compatibility, TMF-aligned payloads for TMF697, TMF687, TMF700, TMF667, TMF696, and documented non-TMF extension APIs. |
| Event contract tests | Contractor HSE And Replenishment Control event names, payload shape, changed fields, correlation ID, idempotency key, ordering metadata, replay behavior, and subscriber compatibility. |
| Workflow tests | Happy path, assisted correction, automated API path, manual dispatch, field visit, no-access, stock shortage, shipment delay, offline mobile sync, contractor/HSE block, partner/off-net dependency, RMA/refurbishment, cancellation, rework, handover, rejection, correction, and closure for the contractor HSE and replenishment control record lifecycle. |
| Integration tests | Handoffs with order, fulfillment, inventory, assurance, customer/care, partner/off-net, carrier, ERP/procurement, platform security, mobile clients, and data owners, including unavailability and no direct database access. |
| Security and privacy tests | Tenant isolation, contractor access scope, customer/site masking, sensitive topology masking, malicious payloads, evidence storage, audit logging, legal hold, retention, export controls, and data residency for Contractor HSE And Replenishment Control. |
| Data tests | Source authority, referential integrity, historical correction, projection refresh, completion evidence, field/stock/shipment analytics, reporting metrics, and lineage for the contractor HSE and replenishment control record. |
| Performance tests | Search, queue processing, mobile evidence upload, carrier callback ingest, event publication, replay, dashboard query, and API throughput under realistic telecom field, stock, and logistics volumes. |

## Feature Detail Review Implementation Alignment (2026-06-14)

Source: [App Feature Detail Review Alignment](README.md#feature-detail-review-alignment-2026-06-14) and [Suite Feature Detail Review](../../feature-detail-review.md).

Apply this app review scope to this feature: appointment control, dispatch, mobile field evidence, stock chain of custody, shipping, RMA, and field-to-inventory handover.

Implementation updates required for this feature:

- Re-check the core workflows and add or adjust happy paths, approval paths, exception queues, rollback or compensation behavior, and handoffs so the review scope is directly represented in build stories.
- Add or refine UI workbench expectations, including operator queues, evidence panels, policy decision traces, preview/simulation views, and status dashboards where this feature owns the behavior.
- Add or refine command APIs, query APIs, events, app-owned data fields, DDL gap notes, and integration handoffs needed to support the review scope without crossing app data ownership boundaries.
- Add acceptance criteria for source authority, tenant and residency controls, lifecycle state, approval evidence, idempotency, correlation IDs, SLA/OLA timers, and downstream acknowledgement where applicable.
- Add negative scenarios for stale data, duplicate events, policy denial, missing evidence, downstream outage, unauthorized access, bulk/replay risk, and manual override misuse.
- Extend tests to include happy path, negative path, edge case, API contract, event replay, data reconciliation, security, accessibility, observability, runbook, and release-gate evidence for the review scope.

## Build-Ready Refinement (2026-06-14)

This refinement converts the feature review material for Contractor HSE And Replenishment Control into delivery slices that can become epics, stories, API contracts, migrations, and test cases. Treat Field Work, Stock, And Logistics as the owning application for this feature within Suite OSS Engineering, Inventory, And Fulfillment and schema `field_stock_logistics`.

| Workstream | Build-ready delivery guidance |
| --- | --- |
| UX and workflow | Build the Contractor HSE And Replenishment Control workbench for Field dispatcher, Field technician, Warehouse/logistics manager, Fulfillment operations lead, Inventory manager, Contractor/HSE coordinator. Include search or intake, guided validation, detail view, lifecycle timeline, decision panel, evidence drawer, exception queue, bulk or replay controls where relevant, saved filters, SLA/OLA aging, empty/error states, and role-aware masking. The UI must expose approve contractor assignment, block unsafe access, require HSE evidence, accept/reject contractor evidence, request replenishment, escalate shortage, approve time/material evidence for invoice support, or revoke... and block closure when required evidence, approval, reconciliation, or downstream acknowledgement is missing. |
| API and events | Implement command and query APIs around contractor-hse-and-replenishment-control using TMF697, TMF687, TMF700, TMF667, TMF696. Command APIs for Contractor HSE And Replenishment Control must cover create, validate, update, assign, hold, retry, reschedule, cancel, fail, rework, submit, approve, reject, correct, replay, handover, close, and... Query APIs for Contractor HSE And Replenishment Control must cover search, detail, timeline, related contractor HSE and replenishment control record references, dependency graph, work queues, evidence retrieval... Domain events for Contractor HSE And Replenishment Control must include ContractorAssignmentApproved, HSEEvidenceSubmitted, StopWorkRaised, ContractorEvidenceRejected, VanStockReplenishmentRequested... Non-TMF Contractor HSE Control API for assignment gating, JSA/HSE checklist, stop-work decision, permit evidence, time/material claim support, contractor access scope, and replenishment shortage escalation. ERP... Every command, query, and event must carry tenant/brand/market where applicable, actor, source channel, reason code, idempotency key, correlation ID, external reference, lifecycle state, and version metadata. |
| Data and controls | Persist contractor HSE and replenishment control record. inside `field_stock_logistics` with typed lifecycle, owner, status reason, timestamps, policy decision, source freshness, confidence, old/new value, evidence, and reconciliation fields. Field Work, Stock, And Logistics owns contractor assignment gate, HSE/JSA evidence, access permit check, contractor completion evidence, time/material claim support, van-stock replenishment request, shortage escalation, policy rejection... Keep TMF payloads, extension characteristics, imported evidence, and low-stability metadata in JSONB while promoting operationally searched lifecycle fields to typed columns. |
| Integration and handoff | Exchange work order, appointment, contractor party role, site access record, HSE risk, document evidence, stock reservation, shipping order, procurement/ERP reference, invoice support reference... with Work Order and Dispatch for contractor task context., Stock/warehouse and Shipping for replenishment and material custody., ERP/procurement for shortage and invoice references., Partner/contractor portals for controlled evidence... only through APIs, events, workflow tasks, governed projections, adapters, evidence packages, or certified data products. Show source owner, freshness, confidence, dependency state, retry status, blocked consumer, and completion evidence so the app does not create shadow mastership or direct cross-schema coupling. |
| Security, privacy, and compliance | Enforce RBAC/ABAC, tenant and residency boundaries, least privilege, separation of duties, masking, purpose limitation, retention, legal hold, export control, manual override expiry, immutable audit, and evidence chain of custody for Contractor HSE And Replenishment Control. Sensitive customer, revenue, partner, security, network, credential, or regulatory evidence must be masked unless the persona has explicit operational purpose. |
| Tests and operations | Create unit, API contract, event replay/idempotency, workflow, integration, migration, data reconciliation, security/privacy, accessibility/localization, performance, dashboard, alert, and runbook tests for Contractor HSE And Replenishment Control. Cover happy path, assisted path, automated path, exception path, bulk/project path, stale or duplicate input, downstream outage, policy denial, manual override, and reconciliation mismatch. Use the existing review scope - appointment control, dispatch, mobile field evidence, stock chain of custody, shipping, RMA, and field-to-inventory handover. - as mandatory backlog and test evidence. |

Implementation notes:

- Treat Field Work, Stock, And Logistics as the lifecycle owner for contractor HSE and replenishment control record.; referenced data such as work order, appointment, contractor party role, site access record, HSE risk, document evidence, stock reservation, shipping order, procurement/ERP reference, invoice support reference, customer/site contact, and... must remain references, snapshots, projections, evidence packages, or consumer acknowledgements unless the source file explicitly gives this app mastership.
- Make TMF alignment visible in every story: use named TMF resources where they fit, document non-TMF extension APIs with OpenAPI, and keep extension payloads compatible with TMF-style identifiers, lifecycle state, related entities, pagination, errors, and event envelopes.
- Build UI and API behavior around decision evidence, not only CRUD: surface the permitted next actions, policy decision, state reason, owner, SLA/OLA timer, blocked dependency, retry or compensation path, and closure proof.
- Add development tasks for route/page/component work, command/query handlers, DTO validation, entity/repository/migration changes, outbox/event contracts, projection refresh, privacy/security checks, and operational dashboards.
- Definition-of-done evidence must show downstream consumers can use published state through APIs, events, projections, workflow tasks, or certified data products without direct database reads or manual spreadsheet reconciliation.

## Definition Of Done

1. The contractor HSE and replenishment control record lifecycle supports draft, validating, scheduled, ready, assigned, dispatched, in progress, blocked, no-access, waiting stock, waiting shipment, HSE blocked, exception, rework, handover pending, accepted, rejected, completed, cancelled, corrected, and archived states where applicable.
2. Persona workflows for field dispatcher, field technician, warehouse/logistics manager, fulfillment operations lead, inventory manager, contractor/HSE coordinator, and customer/care handoff user include decision rights, validation messages, exception routing, evidence capture, and downstream handoff for Contractor HSE And Replenishment Control.
3. TMF-aligned references, non-TMF extension APIs, events, idempotency, correlation IDs, error models, replay behavior, adapter behavior, mobile behavior, and consumer revalidation contracts are documented and contract-tested for Contractor HSE And Replenishment Control.
4. Data ownership, private app database boundaries, governed projections, retention, legal hold, tenant isolation, contractor access scope, HSE/site evidence, inventory handover evidence, and export controls match data mastery and ODA guidance.
5. Operational dashboards explain Contractor HSE And Replenishment Control state, dependency graph, appointment/work/stock/shipment readiness, evidence status, no-access, HSE/contractor controls, inventory handover status, consumer lag, and completion quality without direct database access.
6. Negative scenarios, telecom edge cases, workflow tests, security tests, event replay tests, mobile tests, carrier/partner tests, stock/RMA tests, HSE tests, and handover tests are automated or explicitly covered in delivery evidence.
