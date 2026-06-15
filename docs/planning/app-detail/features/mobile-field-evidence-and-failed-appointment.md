| Field | Value |
| --- | --- |
| Feature ID | F-mobile-field-evidence-and-failed-appointment-01 |
| App | Field Work Stock Logistics |
| App slug | `field-work-stock-logistics` |
| Module | Field Work, Stock, And Logistics |
| Source slice | [modules-and-features.md](../modules-and-features.md) |
| Last refined | 2026-06-15 |
| Refiner verdict | Build-ready |

# Mobile Field Evidence And Failed Appointment Feature Specification


Reviewed: 2026-06-07

Suite: OSS Engineering, Inventory, And Fulfillment

App: [Field Work, Stock, And Logistics](../README.md)

Source module detail: [Modules And Features](../modules-and-features.md)

Source gap review: [E2E Feature Gap Assessment](../../../e2e-feature-gap-assessment.md)

Feature area slug: `mobile-field-evidence-and-failed-appointment`

E2E gap severity: Critical

## Feature Intent

Support technician mobile execution with offline task steps, barcode/QR/serial scans, photos, GPS/time evidence, signatures, service tests, site access/HSE checks, customer acceptance, no-access reason codes, failed-appointment remediation, reschedule requests, and evidence upload. Mobile Field Evidence And Failed Appointment produces mobile evidence and failed-appointment case records that support field completion, inventory handover, customer care, fulfillment fallout, and compliance retention.

## Telecom Objects And Decision Rights

- Master entity: mobile field evidence and failed-appointment case. Field Work, Stock, And Logistics owns mobile evidence bundle, offline sync state, no-access attempt, failed-appointment case, customer signature, photo/test/reference document link, remediation task, reschedule handoff, and mobile evidence audit history.
- Referenced entities: work order, appointment, dispatch session, customer/site contact, stock item, shipment, resource inventory, service test, activation evidence, HSE/JSA checklist, trouble ticket, customer communication, and legal hold policy. Field Work, Stock, And Logistics consumes these references through APIs, events, governed projections, workflow tasks, mobile evidence packages, carrier callbacks, partner callbacks, or certified data products and does not overwrite their operational masters.
- Primary decisions: accept evidence, reject evidence, flag no-access, start reschedule, request additional evidence, sync offline changes, create rework, trigger fulfillment fallout, or hold inventory handover. Each mobile field evidence and failed-appointment case decision records accountable persona, source channel, reason, policy outcome, impacted order/service/resource/customer/site, correlation ID, and downstream handoff.
- ODA boundary: Field Work, Stock, And Logistics keeps private appointment, dispatch, work order, field evidence, stock, shipment, reverse logistics, contractor/HSE, and handover records; Order Management, Inventory And Topology, Fulfillment Activation Control Tower, Assurance, Customer, Partner, Billing, ERP, Platform, and Data apps remain masters for their own lifecycle records.

## Personas, Jobs To Be Done, And Outcomes

| Persona | Job to be done | Outcome |
| --- | --- | --- |
| Field dispatcher | Uses the Mobile Field Evidence And Failed Appointment capability to schedule appointments, assign work orders, balance technician or contractor capacity, and protect customer promise windows. | The mobile field evidence and failed-appointment case keeps the field schedule executable with visible jeopardy, no-access, stock, route, and SLA evidence. |
| Field technician | Uses the Mobile Field Evidence And Failed Appointment capability to execute install, repair, survey, migration, pickup, maintenance, and decommission tasks on a mobile work order. | The mobile field evidence and failed-appointment case captures serials, photos, signatures, tests, site access, HSE checks, and installed-state evidence without spreadsheet control. |
| Warehouse/logistics manager | Uses the Mobile Field Evidence And Failed Appointment capability to reserve, pick, pack, ship, transfer, consume, receive, quarantine, refurbish, and reconcile CPE, SIM/eSIM, devices, spares, cards, and install material. | The mobile field evidence and failed-appointment case keeps stock and shipment state aligned to work orders and resource inventory handover. |
| Fulfillment operations lead | Uses the Mobile Field Evidence And Failed Appointment capability to monitor field, appointment, stock, shipping, and handover dependencies for order-to-activate and MACD orders. | The mobile field evidence and failed-appointment case sees field jeopardy, manual fallout, partial completion, rollback, and customer-impacting delays before order closure. |
| Inventory manager | Uses the Mobile Field Evidence And Failed Appointment capability to accept, reject, or repair field-to-inventory handover evidence for installed, removed, swapped, quarantined, or returned resources. | The mobile field evidence and failed-appointment case protects Resource Inventory as the final master while consuming field evidence through governed handoff. |
| Contractor/HSE coordinator | Uses the Mobile Field Evidence And Failed Appointment capability to verify contractor assignment, site access, JSA/HSE evidence, time/material claims, permits, and replenishment exceptions. | The mobile field evidence and failed-appointment case proves partner labor and safety controls without giving contractors uncontrolled inventory or customer data access. |
| Customer/care handoff user | Uses the Mobile Field Evidence And Failed Appointment capability to view appointment, technician ETA, shipment, failed-appointment, completion, and reschedule status for customer communication. | The mobile field evidence and failed-appointment case answers customer inquiries from app events without editing field, stock, or inventory master records. |

## Core Workflows

| Stage | Telecom trigger or validation | Orchestration, exception, completion, and evidence |
| --- | --- | --- |
| Trigger | Mobile Field Evidence And Failed Appointment starts from technician arrival, task completion, photo/signature capture, serial scan, service test, no-access attempt, offline mobile sync, customer refusal, HSE block, or dispatcher evidence review. | The mobile field evidence and failed-appointment case opens with tenant, market, customer/order/service/resource/site scope, lifecycle action, due date, SLA/OLA target, customer-impact flag, source trigger, correlation ID, and required dependency references. |
| Validation | The app validates work order task requirement, appointment window, GPS/time/site confidence, required photo/signature/test completeness, serial scan match, HSE checklist, offline conflict, privacy masking rule, evidence retention class, and customer communication requirement. | Invalid mobile field evidence and failed-appointment case data creates a blocked queue item, no-access case, shortage task, HSE stop-work item, shipment exception, handover rejection, or fulfillment fallout before the affected order, repair, or inventory lifecycle advances. |
| Orchestration | Field Work, Stock, And Logistics coordinates appointment, work order, dispatch, mobile evidence, stock, shipment, contractor, reverse logistics, handover, order, fulfillment, inventory, assurance, partner, carrier, ERP, customer, platform, and data consumers through APIs, events, tasks, adapters, or evidence packages. | Consumers receive Mobile Field Evidence And Failed Appointment state and evidence while their own databases and lifecycle records remain private to their owning apps. |
| Exception | If Offline mobile device uploads completion after dispatcher already cancelled the work order, the mobile field evidence and failed-appointment case routes to the accountable dispatcher, technician, warehouse/logistics manager, fulfillment lead, inventory manager, contractor/HSE coordinator, customer/care handoff user, partner coordinator, or data steward. | The exception captures failed rule, affected customer/site/service/resource/order, SLA/OLA impact, retry/reschedule/rollback/rework option, evidence gap, downstream blocker, correlation ID, and escalation path. |
| Completion | Completion occurs when the mobile field evidence and failed-appointment case is completed, partially completed, failed, cancelled, rescheduled, reworked, handed over, accepted, rejected, quarantined, replenished, or archived according to its lifecycle. | Completion evidence includes lifecycle version, task history, serial/stock/shipment references, field photos/signatures/tests where relevant, HSE/site evidence where relevant, customer/partner communication status, event IDs, and replay metadata. |

## Missing Use Cases And Scenarios

| Scenario | Required behavior |
| --- | --- |
| Field visit completion | Mobile Field Evidence And Failed Appointment must capture required photos, serials, tests, GPS/time, and customer signature before handover with explicit mobile field evidence and failed-appointment case, lifecycle state, decision owner, exception route, evidence package, and downstream handoff. |
| No-access | Mobile Field Evidence And Failed Appointment must record reason, evidence, customer communication, reschedule option, and order jeopardy trigger with explicit mobile field evidence and failed-appointment case, lifecycle state, decision owner, exception route, evidence package, and downstream handoff. |
| Partial activation | Mobile Field Evidence And Failed Appointment must preserve completed tasks, failed tasks, rollback requirement, and customer-impact note with explicit mobile field evidence and failed-appointment case, lifecycle state, decision owner, exception route, evidence package, and downstream handoff. |
| Trouble repair | Mobile Field Evidence And Failed Appointment must attach diagnostic result and NOC/care handoff note to the failed-appointment or completion case with explicit mobile field evidence and failed-appointment case, lifecycle state, decision owner, exception route, evidence package, and downstream handoff. |
| Legal/regulatory evidence | Mobile Field Evidence And Failed Appointment must retain site access, HSE, and field proof under market retention and legal hold controls with explicit mobile field evidence and failed-appointment case, lifecycle state, decision owner, exception route, evidence package, and downstream handoff. |

## Capability Slices

| Feature ID | Feature | Parent feature area | Priority guidance |
| --- | --- | --- | --- |
| F-mobile-field-evidence-and-failed-appointment-01 | Offline mobile task execution | Mobile Field Evidence And Failed Appointment | P1: required for field execution, stock/logistics readiness, customer communication, inventory handover, assurance support, compliance evidence, or fulfillment milestone control. |
| F-mobile-field-evidence-and-failed-appointment-02 | Photo, GPS, signature, serial, and test evidence | Mobile Field Evidence And Failed Appointment | P1: required for field execution, stock/logistics readiness, customer communication, inventory handover, assurance support, compliance evidence, or fulfillment milestone control. |
| F-mobile-field-evidence-and-failed-appointment-03 | No-access and failed-appointment reason control | Mobile Field Evidence And Failed Appointment | P1: required for field execution, stock/logistics readiness, customer communication, inventory handover, assurance support, compliance evidence, or fulfillment milestone control. |
| F-mobile-field-evidence-and-failed-appointment-04 | Evidence review and rejection workflow | Mobile Field Evidence And Failed Appointment | P1: required for field execution, stock/logistics readiness, customer communication, inventory handover, assurance support, compliance evidence, or fulfillment milestone control. |
| F-mobile-field-evidence-and-failed-appointment-05 | Customer reschedule and care notification | Mobile Field Evidence And Failed Appointment | P2: required for field execution, stock/logistics readiness, customer communication, inventory handover, assurance support, compliance evidence, or fulfillment milestone control. |
| F-mobile-field-evidence-and-failed-appointment-06 | Privacy masking, retention, and legal hold | Mobile Field Evidence And Failed Appointment | P2: required for field execution, stock/logistics readiness, customer communication, inventory handover, assurance support, compliance evidence, or fulfillment milestone control. |

## Acceptance Criteria

1. **AC-mobile-field-evidence-and-failed-appointment-01:** Given an authorized field dispatcher, field technician, warehouse/logistics manager, fulfillment operations lead, inventory manager, contractor/HSE coordinator, or customer/care handoff user creates or updates the mobile field evidence and failed-appointment case, when the Mobile Field Evidence And Failed Appointment lifecycle advances, then Field Work, Stock, And Logistics validates work order task requirement, appointment window, GPS/time/site confidence, required photo/signature/test completeness, serial scan match, HSE checklist, offline conflict, privacy masking rule, evidence retention class, and customer communication requirement before accepting the state change.
2. **AC-mobile-field-evidence-and-failed-appointment-02:** Given the mobile field evidence and failed-appointment case references appointment, work order, stock, shipment, order, fulfillment, inventory, assurance, partner, ERP, customer, platform, or data records, when a persona opens the Mobile Field Evidence And Failed Appointment record, then the app shows source owner, source timestamp, freshness, dependency status, customer-impact flag, and whether the data is app-owned or read-only.
3. **AC-mobile-field-evidence-and-failed-appointment-03:** Given Offline mobile device uploads completion after dispatcher already cancelled the work order, when validation fails for Mobile Field Evidence And Failed Appointment, then the app keeps the mobile field evidence and failed-appointment case in blocked, jeopardy, no-access, shortage, HSE stop-work, exception, rejected, rework, or fallout state with severity, owner, due date, affected customer/site/service/resource/order, retry/reschedule/rework option, and correlation ID.
4. **AC-mobile-field-evidence-and-failed-appointment-04:** Given the mobile field evidence and failed-appointment case changes due to mobile action, dispatcher action, warehouse action, carrier callback, contractor evidence, customer reschedule, inventory rejection, partner callback, or automation, when the transition is committed, then the app stores decision right, actor, role, reason, evidence links, old/new values, tenant/region boundary, and idempotency key.
5. **AC-mobile-field-evidence-and-failed-appointment-05:** Given Order Management, Fulfillment Activation Control Tower, Inventory And Topology, Assurance/NOC, Customer/Care, Partner, Billing, ERP, Platform, or Data consumers subscribe to Mobile Field Evidence And Failed Appointment changes, when the mobile field evidence and failed-appointment case reaches milestone, exception, no-access, shipment, stock, HSE, handover, or completion state, then the app emits a versioned event with changed fields, impact, SLA/OLA state, replay metadata, and correlation ID.
6. **AC-mobile-field-evidence-and-failed-appointment-06:** Given a greenfield install, brownfield MACD, enterprise bulk rollout, partner/off-net dependency, automated dispatch, manual fallout, field visit, no-access, partial activation, rollback, migration, or decommissioning scenario references the mobile field evidence and failed-appointment case, when the user requests closure, then the app validates downstream handoffs, open exceptions, evidence completeness, customer/order notification, inventory or stock acceptance, retention, and legal hold before closure.
7. **AC-mobile-field-evidence-and-failed-appointment-07:** Given operations leaders review Mobile Field Evidence And Failed Appointment operations, when they open dashboards, then they see volume, queue aging, automation rate, SLA/OLA jeopardy, no-access, stock/shipment readiness, evidence rejection, HSE block, inventory handover status, partner/contractor aging, and completion quality linked to the mobile field evidence and failed-appointment case.

## Negative Scenarios

Negative scenarios for this feature include permission denial, missing source data, stale dependency state, policy failure, duplicate or replayed request, downstream timeout, reconciliation mismatch, and any feature-specific negative scenario additions listed in the suite gap-review closure addendum.

## Edge Cases

| Scenario | Expected behavior |
| --- | --- |
| Offline mobile device uploads completion after dispatcher already cancelled the work order | Mobile Field Evidence And Failed Appointment blocks unsafe execution or routes controlled exception handling with owner, due date, affected customer/site/service/resource/order, retry/reschedule/rework/rollback option, and replayable evidence. |
| Photo evidence shows wrong site or demarcation even though GPS is nearby | Mobile Field Evidence And Failed Appointment blocks unsafe execution or routes controlled exception handling with owner, due date, affected customer/site/service/resource/order, retry/reschedule/rework/rollback option, and replayable evidence. |
| Customer refuses signature but enterprise acceptance workflow requires named approver | Mobile Field Evidence And Failed Appointment blocks unsafe execution or routes controlled exception handling with owner, due date, affected customer/site/service/resource/order, retry/reschedule/rework/rollback option, and replayable evidence. |
| No-access is recorded without door-tag/photo/time evidence required by policy | Mobile Field Evidence And Failed Appointment blocks unsafe execution or routes controlled exception handling with owner, due date, affected customer/site/service/resource/order, retry/reschedule/rework/rollback option, and replayable evidence. |
| Evidence upload contains customer personal data that must be masked before export | Mobile Field Evidence And Failed Appointment blocks unsafe execution or routes controlled exception handling with owner, due date, affected customer/site/service/resource/order, retry/reschedule/rework/rollback option, and replayable evidence. |
| Duplicate, stale, or out-of-order callback | Mobile Field Evidence And Failed Appointment uses callback timestamp, event version, source system, command ID, optimistic locking, and idempotency key so retries cannot duplicate appointment, dispatch, stock, shipment, evidence, HSE, RMA, or handover state. |
| Cross-tenant, cross-region, or contractor access boundary breach | Mobile Field Evidence And Failed Appointment blocks the action, masks restricted customer/site/topology/identifier data, and records policy decision metadata for tenant isolation, privileged access, data residency, legal hold, contractor scope, and export control. |
| Downstream app, carrier, partner, mobile device, ERP, or external adapter unavailable | Mobile Field Evidence And Failed Appointment either fails fast for synchronous safety gates or queues controlled retry, replay, escalation, fallback manual task, reschedule, rework, or compensation with owner, due date, and correlation ID. |
| Retention, privacy, regulatory, HSE, or legal hold conflict | Mobile Field Evidence And Failed Appointment prevents destructive correction, evidence deletion, stock restock, contractor closure, or inventory handover completion until retention, HSE, lawful/regulatory evidence, legal hold, and data residency controls allow it. |

## Suite Gap Review Closure Addendum

Source review: [03 Oss Engineering Inventory Fulfillment Gap Review](../../../../suite-gap-reviews/03-oss-engineering-inventory-fulfillment-gap-review.md)

This addendum applies the suite gap-review findings tied to this feature file. It supplements the baseline feature specification and should be carried into epic, story, API, event, data, and test refinement.

### Review Backlog Items Addressed

| Severity | Gap-review item | Closure expectation |
| --- | --- | --- |
| Critical | Offline-first mobile evidence and sync conflict resolution. | Add concrete happy path, negative path, edge-case, API/event/data control, reporting, and test evidence for this feature area. |
| High | Failed appointment root-cause, reschedule, and compensation workflow. | Add concrete happy path, negative path, edge-case, API/event/data control, reporting, and test evidence for this feature area. |

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

Related APIs and API areas: [TMF646](../../../../../references/tmforum-open-apis/openapi-specs/TMF646_AppointmentManagement), [TMF697](../../../../../references/tmforum-open-apis/openapi-specs/TMF697_Work_Order), [TMF667](../../../../../references/tmforum-open-apis/openapi-specs/TMF667_Document), [TMF681](../../../../../references/tmforum-open-apis/openapi-specs/TMF681_Communication)

TMF API fit and extension notes:

- Use TMF646 for appointment state, TMF697 for work order state, TMF667 for document/evidence references, and TMF681 for customer/care communication events where the local contracts fit.
- Non-TMF Mobile Evidence API for offline sync, evidence bundle manifest, photo/GPS/signature/test validation, no-access policy, failed-appointment remediation, and mobile conflict resolution. Extension records must keep evidence metadata in the app boundary while binary storage follows platform security and retention controls.
- Command APIs for Mobile Field Evidence And Failed Appointment must cover create, validate, update, assign, hold, retry, reschedule, cancel, fail, rework, submit, approve, reject, correct, replay, handover, close, and archive where the mobile field evidence and failed-appointment case lifecycle uses those states.
- Query APIs for Mobile Field Evidence And Failed Appointment must cover search, detail, timeline, related mobile field evidence and failed-appointment case references, dependency graph, work queues, evidence retrieval, metrics, audit retrieval, and role-aware masking.
- Domain events for Mobile Field Evidence And Failed Appointment must include MobileEvidenceCaptured, MobileEvidenceRejected, NoAccessRecorded, FailedAppointmentCaseOpened, CustomerRescheduleRequested, OfflineSyncConflictRaised, plus blocked, jeopardy raised, exception raised, exception resolved, evidence rejected, handover requested, consumer rejected, replay requested, and reconciliation failed where the lifecycle uses those states.

Data and ownership requirements:

- Field Work, Stock, And Logistics owns mobile evidence bundle, offline sync state, no-access attempt, failed-appointment case, customer signature, photo/test/reference document link, remediation task, reschedule handoff, and mobile evidence audit history; other apps consume Mobile Field Evidence And Failed Appointment state through APIs, events, governed projections, workflow tasks, carrier adapters, partner callbacks, mobile evidence packages, or certified data products.
- Store source channel, actor, tenant/brand/market, customer/order/service/resource/site references, lifecycle action, status reason, due date, SLA/OLA state, external references, old/new values, policy decision, evidence links, retention class, legal hold flag, and impacted consumer list on the mobile field evidence and failed-appointment case.
- Keep read projections, analytics extracts, and DWH/lakehouse outputs separate from operational writes so Mobile Field Evidence And Failed Appointment does not create shadow mastership of product orders, service orders, resource inventory, service inventory, billing records, assurance incidents, customer records, partner records, ERP records, or platform security records.
- Provide reconciliation outputs that prove Order Management, Fulfillment Activation Control Tower, Inventory And Topology, Assurance, Customer/Care, Partner, Billing, ERP, Platform, and Data consumers have accepted, rejected, or remain explicitly blocked by the mobile field evidence and failed-appointment case.

## Integrations And Handoffs

- Work Order and Dispatch for task state.
- Appointment Management for no-access and reschedule.
- Field-To-Inventory Handover for accepted evidence.
- Fulfillment Activation Control Tower for order fallout.
- Customer/Care for communications.
- Document/content services for evidence storage.
- Platform security for device identity and data loss prevention.

## Non-Functional Requirements

- Scale and latency: Mobile Field Evidence And Failed Appointment must support national field operations with high-volume appointments, work orders, dispatch sessions, mobile evidence uploads, stock transactions, shipment callbacks, contractor submissions, and inventory handover packages; command acceptance should be low-latency while long-running field, shipment, RMA, HSE, and handover tasks expose progress, ETA, and partial-failure reports.
- Availability and resilience: query APIs and active queues for Mobile Field Evidence And Failed Appointment must remain available during downstream order, fulfillment, inventory, assurance, carrier, partner, ERP, mobile network, or data outages by serving last-known state with dependency freshness and retry status.
- Auditability and retention: Mobile Field Evidence And Failed Appointment history must retain actor, channel, reason, old/new value, mobile evidence, stock/serial reference, shipment proof, HSE/site evidence, customer communication, policy version, approval/waiver, event ID, external reference, legal hold flag, and retention class for field, inventory, customer, regulatory, and safety evidence periods.
- Localization and accessibility: Mobile Field Evidence And Failed Appointment UI tasks, mobile flows, customer/care messages, date/time zones, engineering units, route/location fields, language, keyboard navigation, and screen-reader labels must respect tenant, market, geography, and accessibility policy.
- Data protection: API, event, mobile, carrier, contractor, export, and dashboard paths for Mobile Field Evidence And Failed Appointment must enforce tenant isolation, data residency, purpose limitation, least privilege, contractor data minimization, sensitive topology masking, customer privacy, and secure evidence storage.

## Compliance, Security, And Privacy

- Mobile Field Evidence And Failed Appointment must enforce tenant isolation, market/region boundaries, role-based access, contractor least privilege, privileged stock and site controls, critical infrastructure masking, lawful/regulatory inventory evidence, HSE/site access evidence, export controls, and data residency for the mobile field evidence and failed-appointment case.
- Mobile Field Evidence And Failed Appointment must preserve appointment evidence, field photos, signatures, serial scans, service tests, shipment proof, stock custody, RMA/refurbishment evidence, HSE/JSA evidence, contractor evidence, customer communication, legal hold, and regulatory inventory handover evidence where field decisions affect telecom obligations.
- Sensitive customer, enterprise, site, topology, identifier, device/SIM/eSIM, shipment, contractor, and HSE references in Mobile Field Evidence And Failed Appointment must be masked in search, timelines, exports, analytics, and dashboards unless the persona has a permitted operational purpose.

## Observability And Operations

- Metrics: track evidence completeness, evidence rejection rate, no-access rate, offline sync backlog, mobile conflict rate, failed-appointment aging, reschedule conversion, HSE evidence coverage, and privacy masking exception rate, plus replay backlog, consumer lag, event publication failure, and completion quality.
- Queues: provide queues for draft, ready, scheduled, assigned, dispatched, in progress, waiting stock, waiting shipment, waiting customer, waiting partner, HSE blocked, no-access, exception, rework, handover pending, rejected, completed, archived, and replay-needed Mobile Field Evidence And Failed Appointment records where lifecycle states apply.
- Alerts: notify Field Work, Stock, And Logistics owners when queue aging, no-access rate, evidence rejection, stock shortage, shipment delay, HSE block, contractor rejection, mobile sync backlog, inventory handover rejection, or SLA/OLA breach risk exceeds threshold.
- Runbooks: document triage, retry, replay, mobile sync recovery, appointment reschedule, stock correction, shipment exception, field rework, no-access handling, HSE stop-work, contractor escalation, RMA disposition, handover repair, evidence export, legal hold response, and downstream event replay procedures for Mobile Field Evidence And Failed Appointment.
- Ownership: Field Work, Stock, And Logistics owns first-line health for Mobile Field Evidence And Failed Appointment lifecycle, queues, event replay, evidence completeness, dashboards, and runbooks; Order, Fulfillment, Inventory, Assurance, Customer/Care, Partner, Carrier, ERP, Platform, Data, and contractor owners correct their own source records.

## Test Approach

| Test layer | Required coverage |
| --- | --- |
| Unit tests | Field rules, lifecycle transitions, dependency state, retry policy, duplicate detection, masking, and mobile field evidence and failed-appointment case calculations for Mobile Field Evidence And Failed Appointment. |
| API contract tests | Commands, queries, errors, idempotency, pagination, filtering, version compatibility, TMF-aligned payloads for TMF646, TMF697, TMF667, TMF681, and documented non-TMF extension APIs. |
| Event contract tests | Mobile Field Evidence And Failed Appointment event names, payload shape, changed fields, correlation ID, idempotency key, ordering metadata, replay behavior, and subscriber compatibility. |
| Workflow tests | Happy path, assisted correction, automated API path, manual dispatch, field visit, no-access, stock shortage, shipment delay, offline mobile sync, contractor/HSE block, partner/off-net dependency, RMA/refurbishment, cancellation, rework, handover, rejection, correction, and closure for the mobile field evidence and failed-appointment case lifecycle. |
| Integration tests | Handoffs with order, fulfillment, inventory, assurance, customer/care, partner/off-net, carrier, ERP/procurement, platform security, mobile clients, and data owners, including unavailability and no direct database access. |
| Security and privacy tests | Tenant isolation, contractor access scope, customer/site masking, sensitive topology masking, malicious payloads, evidence storage, audit logging, legal hold, retention, export controls, and data residency for Mobile Field Evidence And Failed Appointment. |
| Data tests | Source authority, referential integrity, historical correction, projection refresh, completion evidence, field/stock/shipment analytics, reporting metrics, and lineage for the mobile field evidence and failed-appointment case. |
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

This refinement converts the feature review material for Mobile Field Evidence And Failed Appointment into delivery slices that can become epics, stories, API contracts, migrations, and test cases. Treat Field Work, Stock, And Logistics as the owning application for this feature within Suite OSS Engineering, Inventory, And Fulfillment and schema `field_stock_logistics`.

| Workstream | Build-ready delivery guidance |
| --- | --- |
| UX and workflow | Build the Mobile Field Evidence And Failed Appointment workbench for Field dispatcher, Field technician, Warehouse/logistics manager, Fulfillment operations lead, Inventory manager, Contractor/HSE coordinator. Include search or intake, guided validation, detail view, lifecycle timeline, decision panel, evidence drawer, exception queue, bulk or replay controls where relevant, saved filters, SLA/OLA aging, empty/error states, and role-aware masking. The UI must expose accept evidence, reject evidence, flag no-access, start reschedule, request additional evidence, sync offline changes, create rework, trigger fulfillment fallout, or hold inventory handover. Each mobile field evidence... and block closure when required evidence, approval, reconciliation, or downstream acknowledgement is missing. |
| API and events | Implement command and query APIs around mobile-field-evidence-and-failed-appointment using TMF646, TMF697, TMF667, TMF681. Command APIs for Mobile Field Evidence And Failed Appointment must cover create, validate, update, assign, hold, retry, reschedule, cancel, fail, rework, submit, approve, reject, correct, replay, handover, close, and... Query APIs for Mobile Field Evidence And Failed Appointment must cover search, detail, timeline, related mobile field evidence and failed-appointment case references, dependency graph, work queues, evidence retrieval... Domain events for Mobile Field Evidence And Failed Appointment must include MobileEvidenceCaptured, MobileEvidenceRejected, NoAccessRecorded, FailedAppointmentCaseOpened, CustomerRescheduleRequested... Non-TMF Mobile Evidence API for offline sync, evidence bundle manifest, photo/GPS/signature/test validation, no-access policy, failed-appointment remediation, and mobile conflict resolution. Extension records must keep... Every command, query, and event must carry tenant/brand/market where applicable, actor, source channel, reason code, idempotency key, correlation ID, external reference, lifecycle state, and version metadata. |
| Data and controls | Persist mobile field evidence and failed-appointment case. inside `field_stock_logistics` with typed lifecycle, owner, status reason, timestamps, policy decision, source freshness, confidence, old/new value, evidence, and reconciliation fields. Field Work, Stock, And Logistics owns mobile evidence bundle, offline sync state, no-access attempt, failed-appointment case, customer signature, photo/test/reference document link, remediation task, reschedule handoff, and mobile evidence... Keep TMF payloads, extension characteristics, imported evidence, and low-stability metadata in JSONB while promoting operationally searched lifecycle fields to typed columns. |
| Integration and handoff | Exchange work order, appointment, dispatch session, customer/site contact, stock item, shipment, resource inventory, service test, activation evidence, HSE/JSA checklist, trouble ticket, customer... with Work Order and Dispatch for task state., Appointment Management for no-access and reschedule., Field-To-Inventory Handover for accepted evidence., Fulfillment Activation Control Tower for order fallout., Customer/Care for... only through APIs, events, workflow tasks, governed projections, adapters, evidence packages, or certified data products. Show source owner, freshness, confidence, dependency state, retry status, blocked consumer, and completion evidence so the app does not create shadow mastership or direct cross-schema coupling. |
| Security, privacy, and compliance | Enforce RBAC/ABAC, tenant and residency boundaries, least privilege, separation of duties, masking, purpose limitation, retention, legal hold, export control, manual override expiry, immutable audit, and evidence chain of custody for Mobile Field Evidence And Failed Appointment. Sensitive customer, revenue, partner, security, network, credential, or regulatory evidence must be masked unless the persona has explicit operational purpose. |
| Tests and operations | Create unit, API contract, event replay/idempotency, workflow, integration, migration, data reconciliation, security/privacy, accessibility/localization, performance, dashboard, alert, and runbook tests for Mobile Field Evidence And Failed Appointment. Cover happy path, assisted path, automated path, exception path, bulk/project path, stale or duplicate input, downstream outage, policy denial, manual override, and reconciliation mismatch. Use the existing review scope - appointment control, dispatch, mobile field evidence, stock chain of custody, shipping, RMA, and field-to-inventory handover. - as mandatory backlog and test evidence. |

Implementation notes:

- Treat Field Work, Stock, And Logistics as the lifecycle owner for mobile field evidence and failed-appointment case.; referenced data such as work order, appointment, dispatch session, customer/site contact, stock item, shipment, resource inventory, service test, activation evidence, HSE/JSA checklist, trouble ticket, customer communication, and legal hold... must remain references, snapshots, projections, evidence packages, or consumer acknowledgements unless the source file explicitly gives this app mastership.
- Make TMF alignment visible in every story: use named TMF resources where they fit, document non-TMF extension APIs with OpenAPI, and keep extension payloads compatible with TMF-style identifiers, lifecycle state, related entities, pagination, errors, and event envelopes.
- Build UI and API behavior around decision evidence, not only CRUD: surface the permitted next actions, policy decision, state reason, owner, SLA/OLA timer, blocked dependency, retry or compensation path, and closure proof.
- Add development tasks for route/page/component work, command/query handlers, DTO validation, entity/repository/migration changes, outbox/event contracts, projection refresh, privacy/security checks, and operational dashboards.
- Definition-of-done evidence must show downstream consumers can use published state through APIs, events, projections, workflow tasks, or certified data products without direct database reads or manual spreadsheet reconciliation.

## Definition Of Done

1. The mobile field evidence and failed-appointment case lifecycle supports draft, validating, scheduled, ready, assigned, dispatched, in progress, blocked, no-access, waiting stock, waiting shipment, HSE blocked, exception, rework, handover pending, accepted, rejected, completed, cancelled, corrected, and archived states where applicable.
2. Persona workflows for field dispatcher, field technician, warehouse/logistics manager, fulfillment operations lead, inventory manager, contractor/HSE coordinator, and customer/care handoff user include decision rights, validation messages, exception routing, evidence capture, and downstream handoff for Mobile Field Evidence And Failed Appointment.
3. TMF-aligned references, non-TMF extension APIs, events, idempotency, correlation IDs, error models, replay behavior, adapter behavior, mobile behavior, and consumer revalidation contracts are documented and contract-tested for Mobile Field Evidence And Failed Appointment.
4. Data ownership, private app database boundaries, governed projections, retention, legal hold, tenant isolation, contractor access scope, HSE/site evidence, inventory handover evidence, and export controls match data mastery and ODA guidance.
5. Operational dashboards explain Mobile Field Evidence And Failed Appointment state, dependency graph, appointment/work/stock/shipment readiness, evidence status, no-access, HSE/contractor controls, inventory handover status, consumer lag, and completion quality without direct database access.
6. Negative scenarios, telecom edge cases, workflow tests, security tests, event replay tests, mobile tests, carrier/partner tests, stock/RMA tests, HSE tests, and handover tests are automated or explicitly covered in delivery evidence.


## Build-Ready Refinement (2026-06-15)

Header added at the top of this file. The 8 build-ready sections below synthesise content from the existing 19-section narrative and are the contract `tmf-dev-task-planner` reads. Source citations are inline.

## Persona & decision

- Field dispatcher can uses the mobile field evidence and failed appointment capability to schedule appointments, assign work orders, balance technician or contractor capacity, for the persona-specific outcome `The mobile field evidence and failed-appointment case keeps the field schedule e…`, evidenced by the `## Persona & decision` audit trail in this file.
- Field technician can uses the mobile field evidence and failed appointment capability to execute install, repair, survey, migration, pickup, maintenance, for the persona-specific outcome `The mobile field evidence and failed-appointment case captures serials, photos, …`, evidenced by the `## Persona & decision` audit trail in this file.
- Warehouse/logistics manager can uses the mobile field evidence and failed appointment capability to reserve, pick, pack, ship, transfer, consume, receive, quarantine, refurbish, for the persona-specific outcome `The mobile field evidence and failed-appointment case keeps stock and shipment s…`, evidenced by the `## Persona & decision` audit trail in this file.
- Fulfillment operations lead can uses the mobile field evidence and failed appointment capability to monitor field, appointment, stock, shipping, for the persona-specific outcome `The mobile field evidence and failed-appointment case sees field jeopardy, manua…`, evidenced by the `## Persona & decision` audit trail in this file.
- Inventory manager can uses the mobile field evidence and failed appointment capability to accept, reject, or repair field-to-inventory handover evidence for installed, removed, swapped, quarantined, or returned resources. for the persona-specific outcome `The mobile field evidence and failed-appointment case protects Resource Inventor…`, evidenced by the `## Persona & decision` audit trail in this file.
- Contractor/HSE coordinator can uses the mobile field evidence and failed appointment capability to verify contractor assignment, site access, jsa/hse evidence, time/material claims, permits, for the persona-specific outcome `The mobile field evidence and failed-appointment case proves partner labor and s…`, evidenced by the `## Persona & decision` audit trail in this file.
- Customer/care handoff user can uses the mobile field evidence and failed appointment capability to view appointment, technician eta, shipment, failed-appointment, completion, for the persona-specific outcome `The mobile field evidence and failed-appointment case answers customer inquiries…`, evidenced by the `## Persona & decision` audit trail in this file.

## Lifecycle ownership

- This app owns the lifecycle state of the planning record listed in the source `## Telecom Objects And Decision Rights`. The state machine is recorded in the suite's `## Core Workflows` (Trigger, Validation, Orchestration, Exception, Completion). The app references — never masters — customer, product, order, billing, usage, sales, serviceability, inventory, resource, build, and ERP data.
- Source: [features/<this>.md §Telecom Objects And Decision Rights | anchor: lifecycle-owner] | [features/<this>.md §Core Workflows | anchor: lifecycle-states]

## TMF fit

- TMF API baseline for this app: (none captured in tmf-api-ddl-reviews).
- Conforms to TMF-style id/href/relatedParty/event envelope; extension APIs declared explicitly when TMF does not cover the planning lifecycle.

## Data fit

- Owns schema `field_work_stock_logistics`; the V001 migration lists the owned tables: (none captured).
- Source: [database/postgres/suites/ts_oss_engineering_fulfillment/V001__create_app_schemas_and_starter_tables.sql §schema | anchor: schema-list]

## Path coverage

- Happy path: Not applicable — no evidence of this path in `## Edge Cases` or `## Missing Use Cases And Scenarios`.
- Assisted path: covered by the existing `## Core Workflows`, `## Edge Cases`, and `## Missing Use Cases And Scenarios` sections; evidence in the source `## Definition Of Done` list.
- Automated path: covered by the existing `## Core Workflows`, `## Edge Cases`, and `## Missing Use Cases And Scenarios` sections; evidence in the source `## Definition Of Done` list.
- Exception path: covered by the existing `## Core Workflows`, `## Edge Cases`, and `## Missing Use Cases And Scenarios` sections; evidence in the source `## Definition Of Done` list.
- Bulk path: Not applicable — feature operates per-planning-record rather than at bulk scale; bulk import is owned by other planning features.
- Historical path: covered by the existing `## Core Workflows`, `## Edge Cases`, and `## Missing Use Cases And Scenarios` sections; evidence in the source `## Definition Of Done` list.
- Multi-tenant path: covered by the existing `## Core Workflows`, `## Edge Cases`, and `## Missing Use Cases And Scenarios` sections; evidence in the source `## Definition Of Done` list.
- Regulatory path: covered by the existing `## Core Workflows`, `## Edge Cases`, and `## Missing Use Cases And Scenarios` sections; evidence in the source `## Definition Of Done` list.
- Source: [features/<this>.md §Edge Cases | anchor: paths] | [features/<this>.md §Missing Use Cases And Scenarios | anchor: paths]

## UI implications

- Pages / workbenches (per the app's `Required app screens / workbenches` block in `dev-tasks/development-task-tracker.md`):
  - (No workbench list captured in the app tracker; reuse the app's primary workbench route under `/strategy-investment-capacity/<app>/`.)
- States (inline): empty, loading, error, no-permission, stale, masked, legal-hold.
- Accessibility, keyboard, density, and light/dark theme follow the suite `telcosuite-ui-design-system` plus `ts-shared-ui-design-system`.
- Source: [development-task-tracker.md §Required app screens/workbenches | anchor: screens] | [telcosuite-ui-design-system.md | anchor: ux-baseline]

## Acceptance & tests

- AC1 (AC-mobile-field-evidence-and-failed-appointment-01): Given an authorized field dispatcher, field technician, warehouse/logistics manager, fulfillment operations lead, inventory manager, contractor/HSE coordinator, or customer/care handoff user creates or updates the mobile field evidence and failed-appointment case, when the Mobile Field Evidence And Failed Appointment lifecycle advances, then Field Work, Stock, And Logistics validates work order task requirement, appointment window, GPS/time/site confidence, required photo/signature/test completeness, serial scan match, HSE checklist, offline conflict, privacy masking rule, evidence retention class, and customer communication requirement before accepting the state change.
- AC2 (AC-mobile-field-evidence-and-failed-appointment-02): Given the mobile field evidence and failed-appointment case references appointment, work order, stock, shipment, order, fulfillment, inventory, assurance, partner, ERP, customer, platform, or data records, when a persona opens the Mobile Field Evidence And Failed Appointment record, then the app shows source owner, source timestamp, freshness, dependency status, customer-impact flag, and whether the data is app-owned or read-only.
- AC3 (AC-mobile-field-evidence-and-failed-appointment-03): Given Offline mobile device uploads completion after dispatcher already cancelled the work order, when validation fails for Mobile Field Evidence And Failed Appointment, then the app keeps the mobile field evidence and failed-appointment case in blocked, jeopardy, no-access, shortage, HSE stop-work, exception, rejected, rework, or fallout state with severity, owner, due date, affected customer/site/service/resource/order, retry/reschedule/rework option, and correlation ID.
- AC4 (AC-mobile-field-evidence-and-failed-appointment-04): Given the mobile field evidence and failed-appointment case changes due to mobile action, dispatcher action, warehouse action, carrier callback, contractor evidence, customer reschedule, inventory rejection, partner callback, or automation, when the transition is committed, then the app stores decision right, actor, role, reason, evidence links, old/new values, tenant/region boundary, and idempotency key.
- AC5 (AC-mobile-field-evidence-and-failed-appointment-05): Given Order Management, Fulfillment Activation Control Tower, Inventory And Topology, Assurance/NOC, Customer/Care, Partner, Billing, ERP, Platform, or Data consumers subscribe to Mobile Field Evidence And Failed Appointment changes, when the mobile field evidence and failed-appointment case reaches milestone, exception, no-access, shipment, stock, HSE, handover, or completion state, then the app emits a versioned event with changed fields, impact, SLA/OLA state, replay metadata, and correlation ID.
- AC6 (AC-mobile-field-evidence-and-failed-appointment-06): Given a greenfield install, brownfield MACD, enterprise bulk rollout, partner/off-net dependency, automated dispatch, manual fallout, field visit, no-access, partial activation, rollback, migration, or decommissioning scenario references the mobile field evidence and failed-appointment case, when the user requests closure, then the app validates downstream handoffs, open exceptions, evidence completeness, customer/order notification, inventory or stock acceptance, retention, and legal hold before closure.
- AC7 (AC-mobile-field-evidence-and-failed-appointment-07): Given operations leaders review Mobile Field Evidence And Failed Appointment operations, when they open dashboards, then they see volume, queue aging, automation rate, SLA/OLA jeopardy, no-access, stock/shipment readiness, evidence rejection, HSE block, inventory handover status, partner/contractor aging, and completion quality linked to the mobile field evidence and failed-appointment case.
- Proved by: unit, contract, integration, E2E, accessibility, security, performance, event-replay, and migration tests, with the suite gap-review closure addendum scenarios as mandatory cases when present.
- Source: [features/<this>.md §Acceptance Criteria | anchor: ac-list]

## Dependencies & release gate

- Depends on: dev-tasks tracker `Required app screens/workbenches` block; the suite's P01 foundation tasks; cross-app TMF and event contracts listed under `## API, Event, And Data Requirements`.
- Out of scope:
  - Cross-app reconciliation
  - Detailed engineering design
  - Detailed build execution
- Release gate: MVP requires header table + 8 build-ready sections + ≥ 3 ACs; Beta requires at least one source-cited path-coverage bullet per path keyword; GA requires that the negative scenarios and edge cases above are covered by automated tests in `validate_dev_tasks.py`.
- Source: [development-task-tracker.md | anchor: release-gate]
