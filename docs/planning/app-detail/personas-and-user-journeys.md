# Field Work, Stock, And Logistics App Personas And User Journeys

Reviewed: 2026-06-06

This document describes how different personas should experience the app and how the app should support real operational journeys. Use it when designing screens, workflow tasks, API commands, notifications, reporting, and permissions.

Source overview: [field-work-stock-logistics.md](../field-work-stock-logistics.md)

## Personas Covered

- Dispatcher: schedules technicians and balances work queues.
- Field technician: executes install, repair, survey, migration, pickup, maintenance, and decommission tasks.
- Warehouse user: manages serialized equipment, CPE, devices, spares, and van stock.
- Logistics coordinator: tracks shipping, delivery, returns, and exceptions.
- Customer/care user: sees appointment and shipment status.

## Journey Design Principles

- Start journeys from real work triggers: customer contact, partner request, order fallout, alarm, planning threshold, approval queue, compliance event, API error, or scheduled operational review.
- Keep every journey API-backed so the same capability can be exposed through internal UI, self-care, partner portal, automation, or headless integration.
- Show users the source of truth, related projections, and confidence level where data is derived from another app.
- Design every journey with exception handling, audit evidence, notification, and downstream event behavior.
- Avoid making digital or reporting views accidental masters of BSS, OSS, revenue, inventory, or security records.

## Core Workflow Journey

| Step | User intent | App responsibilities | Output |
| ---: | --- | --- | --- |
| 1 | Schedule appointment and reserve time slot. | App validates context, permissions, dependencies, and lifecycle state. | App-owned record, event, task, projection, or handoff is updated. |
| 2 | Create work order with skills, tasks, materials, access notes, safety constraints, and customer/site context. | App validates context, permissions, dependencies, and lifecycle state. | App-owned record, event, task, projection, or handoff is updated. |
| 3 | Dispatch technician or vendor based on location, skills, SLA, materials, and availability. | App validates context, permissions, dependencies, and lifecycle state. | App-owned record, event, task, projection, or handoff is updated. |
| 4 | Reserve, ship, transfer, consume, return, or reconcile stock. | App validates context, permissions, dependencies, and lifecycle state. | App-owned record, event, task, projection, or handoff is updated. |
| 5 | Capture field evidence, serials, photos, signatures, tests, and acceptance. | App validates context, permissions, dependencies, and lifecycle state. | App-owned record, event, task, projection, or handoff is updated. |
| 6 | Handover actual installed state to inventory and fulfillment. | App validates context, permissions, dependencies, and lifecycle state. | App-owned record, event, task, projection, or handoff is updated. |

## Persona Journeys

## Persona Journey 1: Dispatcher

Need: schedules technicians and balances work queues.

Typical journey:

1. Opens the app from a work queue, customer/account context, operational dashboard, external notification, or direct search.
2. Reviews relevant records, relationships, history, policy flags, and open exceptions across modules such as Appointment Management, Work Order, Dispatch And Field Execution, Stock And Warehouse.
3. Performs the required domain action through the owning app workflow, API-backed form, task, approval, or automation.
4. Handles validation errors, missing dependencies, policy exceptions, or fallout by assigning work, requesting correction, escalating, or creating a linked case/task.
5. Confirms the outcome, captures evidence, triggers notifications/events, and leaves downstream apps with a reliable status to consume.

Success measures:

- The persona can complete work without switching to hidden spreadsheets or direct database access.
- The app records who changed what, why, from which channel, and what downstream dependency was affected.
- The journey creates an API/event trail that supports operations, customer visibility, analytics, and audit.

## Persona Journey 2: Field technician

Need: executes install, repair, survey, migration, pickup, maintenance, and decommission tasks.

Typical journey:

1. Opens the app from a work queue, customer/account context, operational dashboard, external notification, or direct search.
2. Reviews relevant records, relationships, history, policy flags, and open exceptions across modules such as Appointment Management, Work Order, Dispatch And Field Execution, Stock And Warehouse.
3. Performs the required domain action through the owning app workflow, API-backed form, task, approval, or automation.
4. Handles validation errors, missing dependencies, policy exceptions, or fallout by assigning work, requesting correction, escalating, or creating a linked case/task.
5. Confirms the outcome, captures evidence, triggers notifications/events, and leaves downstream apps with a reliable status to consume.

Success measures:

- The persona can complete work without switching to hidden spreadsheets or direct database access.
- The app records who changed what, why, from which channel, and what downstream dependency was affected.
- The journey creates an API/event trail that supports operations, customer visibility, analytics, and audit.

## Persona Journey 3: Warehouse user

Need: manages serialized equipment, CPE, devices, spares, and van stock.

Typical journey:

1. Opens the app from a work queue, customer/account context, operational dashboard, external notification, or direct search.
2. Reviews relevant records, relationships, history, policy flags, and open exceptions across modules such as Appointment Management, Work Order, Dispatch And Field Execution, Stock And Warehouse.
3. Performs the required domain action through the owning app workflow, API-backed form, task, approval, or automation.
4. Handles validation errors, missing dependencies, policy exceptions, or fallout by assigning work, requesting correction, escalating, or creating a linked case/task.
5. Confirms the outcome, captures evidence, triggers notifications/events, and leaves downstream apps with a reliable status to consume.

Success measures:

- The persona can complete work without switching to hidden spreadsheets or direct database access.
- The app records who changed what, why, from which channel, and what downstream dependency was affected.
- The journey creates an API/event trail that supports operations, customer visibility, analytics, and audit.

## Persona Journey 4: Logistics coordinator

Need: tracks shipping, delivery, returns, and exceptions.

Typical journey:

1. Opens the app from a work queue, customer/account context, operational dashboard, external notification, or direct search.
2. Reviews relevant records, relationships, history, policy flags, and open exceptions across modules such as Appointment Management, Work Order, Dispatch And Field Execution, Stock And Warehouse.
3. Performs the required domain action through the owning app workflow, API-backed form, task, approval, or automation.
4. Handles validation errors, missing dependencies, policy exceptions, or fallout by assigning work, requesting correction, escalating, or creating a linked case/task.
5. Confirms the outcome, captures evidence, triggers notifications/events, and leaves downstream apps with a reliable status to consume.

Success measures:

- The persona can complete work without switching to hidden spreadsheets or direct database access.
- The app records who changed what, why, from which channel, and what downstream dependency was affected.
- The journey creates an API/event trail that supports operations, customer visibility, analytics, and audit.

## Persona Journey 5: Customer/care user

Need: sees appointment and shipment status.

Typical journey:

1. Opens the app from a work queue, customer/account context, operational dashboard, external notification, or direct search.
2. Reviews relevant records, relationships, history, policy flags, and open exceptions across modules such as Appointment Management, Work Order, Dispatch And Field Execution, Stock And Warehouse.
3. Performs the required domain action through the owning app workflow, API-backed form, task, approval, or automation.
4. Handles validation errors, missing dependencies, policy exceptions, or fallout by assigning work, requesting correction, escalating, or creating a linked case/task.
5. Confirms the outcome, captures evidence, triggers notifications/events, and leaves downstream apps with a reliable status to consume.

Success measures:

- The persona can complete work without switching to hidden spreadsheets or direct database access.
- The app records who changed what, why, from which channel, and what downstream dependency was affected.
- The journey creates an API/event trail that supports operations, customer visibility, analytics, and audit.


## Cross-Module Journeys

The app should support journeys that cross these modules: Appointment Management, Work Order, Dispatch And Field Execution, Stock And Warehouse, Shipping And Shipment Tracking, Field-To-Inventory Handover.

| Journey type | Description | Required app behavior |
| --- | --- | --- |
| Happy path completion | The user has valid context, required permissions, complete source data, and no blocking dependency. | Guide the user through the shortest path, validate silently where possible, publish events, and show clear completion state. |
| Exception and fallout | Data is missing, validation fails, downstream app is unavailable, or policy requires review. | Preserve the attempted action, create an actionable exception, assign ownership, support retry/resume, and notify affected journeys. |
| Assisted correction | A consumer detects wrong or stale master data. | Route correction to the owning module, capture evidence, prevent local shadow fixes, and publish corrected state. |
| Supervisor review | A lead needs aging, volume, SLA, fallout, risk, or productivity visibility. | Provide dashboards, saved filters, bulk assignment, escalation, and exportable evidence without exposing direct database access. |
| Compliance and audit | A compliance or audit user needs proof of policy adherence. | Show decision history, access history, before/after values, approvals, retention/legal hold status, and evidence links. |
| API consumer journey | Another app, partner, channel, or automation uses this app headlessly. | Provide documented APIs, events, idempotency, correlation IDs, clear error models, version compatibility, and conformance tests. |

## Screen And Task Implications

- Provide landing views by persona: personal work queue, operational dashboard, search, recent records, exceptions, and approvals.
- Provide record detail views with lifecycle state, relationships, timeline, evidence, comments, tasks, and related external references.
- Provide guided actions for create, update, approve, reject, cancel, suspend, resume, retry, handoff, export, and close where relevant.
- Provide role-aware views so sensitive customer, revenue, security, partner, and network data is masked or restricted by policy.
- Provide journey telemetry so product owners can see drop-off, rework, exception causes, automation success, and user effort.

## Journey Completion Definition

A journey is complete only when:

1. The owning app record reaches a valid lifecycle state.
2. Required events, notifications, and downstream handoffs are sent or queued.
3. Audit evidence is stored with actor, source, reason, and correlation ID.
4. Linked apps can consume the outcome through APIs, events, or governed projections.
5. Operational dashboards and reports can explain the status without direct database inspection.
