# Field Work, Stock, And Logistics App Modules And Features

Reviewed: 2026-06-06

This document expands each app module into feature-level planning guidance. It should be used to create epics, stories, API contracts, event contracts, screens, permissions, and test cases.

Source overview: [field-work-stock-logistics.md](../field-work-stock-logistics.md)

## App-Level Feature Principles

- Every feature must have an owning module and an owning app API.
- UI actions must call app APIs rather than writing directly to shared data stores.
- Cross-app reads should use APIs, subscribed events, governed projections, or data products.
- Each module should expose enough lifecycle state for operations, audit, automation, and customer/partner visibility.
- Feature design must include happy path, exception path, audit path, and reporting path.

## App Data Ownership Context

Owns appointment state, dispatch plans, work order execution state, field evidence, stock operational records, shipment tracking, and handover packages. Inventory owns final resource state after acceptance.

## First Release Context

Deliver appointment, work order, dispatch board, stock reservation, shipment tracking, and field evidence handover. Add route optimization, offline mobile depth, contractor portals, and advanced stock forecasting later.

## Module 1: Appointment Management

Anchor: `appointment-management`

### Capability Intent

Schedule installation, repair, survey, migration, pickup, maintenance, and decommission appointments. Manage slots, customer availability, technician availability, location constraints, status, and rescheduling.

### Primary Personas Supported

- Dispatcher: schedules technicians and balances work queues.
- Field technician: executes install, repair, survey, migration, pickup, maintenance, and decommission tasks.
- Warehouse user: manages serialized equipment, CPE, devices, spares, and van stock.
- Logistics coordinator: tracks shipping, delivery, returns, and exceptions.
- Customer/care user: sees appointment and shipment status.

### Feature Backlog Candidates

- Schedule installation.
- And decommission appointments.
- Manage slots.
- Customer availability.
- Technician availability.
- Location constraints.
- And rescheduling.

### Feature Groups

| Feature group | Feature detail |
| --- | --- |
| Record and lifecycle management | Create, search, view, update, retire, reinstate, and track lifecycle state for appointment management records. Maintain ownership, status reason, timestamps, and relationships to upstream and downstream entities. |
| Validation, policy, and eligibility | Validate appointment management changes against catalog rules, customer/account context, serviceability, inventory state, compliance policy, role permissions, and data-quality constraints relevant to this app. |
| Work queues and approvals | Provide queues for draft, pending approval, blocked, exception, fallout, rejected, completed, and archived work. Support assignment, SLA/OLA tracking, escalation, comments, and handoff. |
| Search, timeline, and operational views | Offer filtered search, saved views, dependency views, lifecycle timeline, related orders/tickets/events, and persona-specific dashboards for appointment management work. |
| API and event behavior | Expose command, query, and event contracts for appointment management so UIs, workflows, partner channels, analytics, and downstream apps do not bypass the owning app. |
| Audit, evidence, and reporting | Capture actor, reason, before/after state, source channel, approval evidence, policy decisions, and reporting measures needed for operations, compliance, and continuous improvement. |

### User Journey Coverage

| Journey | Trigger | App behavior | Successful outcome |
| --- | --- | --- | --- |
| Maintain Appointment Management | User creates or updates domain information | Validate context, capture change, publish event, update projections | Accurate appointment management state available through APIs |
| Handle Appointment Management exception | Conflict, validation failure, policy exception, fallout, or missing dependency | Route to owner, capture evidence, resolve or escalate, notify dependent work | Exception closed with auditable reason and downstream handoff |
| Review Appointment Management performance | Supervisor, planner, compliance, or operations user needs visibility | Filter records, inspect trend, export/report, create follow-up task | Actionable operational insight and accountable next step |

### API And Integration Alignment

Related APIs and API areas: [TMF646](../../../../references/tmforum-open-apis/openapi-specs/TMF646_AppointmentManagement)

Implementation guidance:

- Provide create, read, update, lifecycle transition, search, event notification, and audit retrieval behavior where the domain lifecycle requires it.
- Publish domain events for state changes that other apps need for projections, workflow triggers, analytics, or customer/partner communication.
- Keep integration retries, idempotency keys, correlation IDs, and external reference IDs visible to operators.

### Data, Control, And Reporting Needs

- Store app-owned operational records in the app's logical database defined in the database setup document.
- Store external IDs, source channel, owner, status reason, timestamps, and relationship references needed for traceability.
- Provide operational metrics for volume, aging, fallout, SLA/OLA status, exception rate, policy overrides, and automation success.
- Support role-based access, tenant/region boundaries, sensitive-data masking, and export controls where applicable.

### First Release Interpretation

For the first release, implement the minimum lifecycle, search, validation, API, event, audit, and operational queue behavior needed for this module to participate in the app's core workflow. Advanced automation, AI assistance, bulk optimization, simulation, and deep analytics can follow after the app proves the core operating loop.

## Module 2: Work Order

Anchor: `work-order`

### Capability Intent

Create and manage field and engineering work orders, technician/vendor assignment, task steps, required skills, materials, access notes, safety constraints, photos, signatures, and completion evidence.

### Primary Personas Supported

- Dispatcher: schedules technicians and balances work queues.
- Field technician: executes install, repair, survey, migration, pickup, maintenance, and decommission tasks.
- Warehouse user: manages serialized equipment, CPE, devices, spares, and van stock.
- Logistics coordinator: tracks shipping, delivery, returns, and exceptions.
- Customer/care user: sees appointment and shipment status.

### Feature Backlog Candidates

- Create and manage field and engineering work orders.
- Technician/vendor assignment.
- Required skills.
- Access notes.
- Safety constraints.
- And completion evidence.

### Feature Groups

| Feature group | Feature detail |
| --- | --- |
| Record and lifecycle management | Create, search, view, update, retire, reinstate, and track lifecycle state for work order records. Maintain ownership, status reason, timestamps, and relationships to upstream and downstream entities. |
| Validation, policy, and eligibility | Validate work order changes against catalog rules, customer/account context, serviceability, inventory state, compliance policy, role permissions, and data-quality constraints relevant to this app. |
| Work queues and approvals | Provide queues for draft, pending approval, blocked, exception, fallout, rejected, completed, and archived work. Support assignment, SLA/OLA tracking, escalation, comments, and handoff. |
| Search, timeline, and operational views | Offer filtered search, saved views, dependency views, lifecycle timeline, related orders/tickets/events, and persona-specific dashboards for work order work. |
| API and event behavior | Expose command, query, and event contracts for work order so UIs, workflows, partner channels, analytics, and downstream apps do not bypass the owning app. |
| Audit, evidence, and reporting | Capture actor, reason, before/after state, source channel, approval evidence, policy decisions, and reporting measures needed for operations, compliance, and continuous improvement. |

### User Journey Coverage

| Journey | Trigger | App behavior | Successful outcome |
| --- | --- | --- | --- |
| Maintain Work Order | User creates or updates domain information | Validate context, capture change, publish event, update projections | Accurate work order state available through APIs |
| Handle Work Order exception | Conflict, validation failure, policy exception, fallout, or missing dependency | Route to owner, capture evidence, resolve or escalate, notify dependent work | Exception closed with auditable reason and downstream handoff |
| Review Work Order performance | Supervisor, planner, compliance, or operations user needs visibility | Filter records, inspect trend, export/report, create follow-up task | Actionable operational insight and accountable next step |

### API And Integration Alignment

Related APIs and API areas: [TMF697](../../../../references/tmforum-open-apis/openapi-specs/TMF697_Work_Order)

Implementation guidance:

- Provide create, read, update, lifecycle transition, search, event notification, and audit retrieval behavior where the domain lifecycle requires it.
- Publish domain events for state changes that other apps need for projections, workflow triggers, analytics, or customer/partner communication.
- Keep integration retries, idempotency keys, correlation IDs, and external reference IDs visible to operators.

### Data, Control, And Reporting Needs

- Store app-owned operational records in the app's logical database defined in the database setup document.
- Store external IDs, source channel, owner, status reason, timestamps, and relationship references needed for traceability.
- Provide operational metrics for volume, aging, fallout, SLA/OLA status, exception rate, policy overrides, and automation success.
- Support role-based access, tenant/region boundaries, sensitive-data masking, and export controls where applicable.

### First Release Interpretation

For the first release, implement the minimum lifecycle, search, validation, API, event, audit, and operational queue behavior needed for this module to participate in the app's core workflow. Advanced automation, AI assistance, bulk optimization, simulation, and deep analytics can follow after the app proves the core operating loop.

## Module 3: Dispatch And Field Execution

Anchor: `dispatch-and-field-execution`

### Capability Intent

Optimize technician assignment by skill, location, availability, SLA, materials, and appointment windows. Support mobile workflows, offline capture, evidence upload, no-access, incomplete work, rework, and escalation.

### Primary Personas Supported

- Dispatcher: schedules technicians and balances work queues.
- Field technician: executes install, repair, survey, migration, pickup, maintenance, and decommission tasks.
- Warehouse user: manages serialized equipment, CPE, devices, spares, and van stock.
- Logistics coordinator: tracks shipping, delivery, returns, and exceptions.
- Customer/care user: sees appointment and shipment status.

### Feature Backlog Candidates

- Optimize technician assignment by skill.
- Availability.
- And appointment windows.
- Support mobile workflows.
- Offline capture.
- Evidence upload.
- Incomplete work.
- And escalation.

### Feature Groups

| Feature group | Feature detail |
| --- | --- |
| Record and lifecycle management | Create, search, view, update, retire, reinstate, and track lifecycle state for dispatch and field execution records. Maintain ownership, status reason, timestamps, and relationships to upstream and downstream entities. |
| Validation, policy, and eligibility | Validate dispatch and field execution changes against catalog rules, customer/account context, serviceability, inventory state, compliance policy, role permissions, and data-quality constraints relevant to this app. |
| Work queues and approvals | Provide queues for draft, pending approval, blocked, exception, fallout, rejected, completed, and archived work. Support assignment, SLA/OLA tracking, escalation, comments, and handoff. |
| Search, timeline, and operational views | Offer filtered search, saved views, dependency views, lifecycle timeline, related orders/tickets/events, and persona-specific dashboards for dispatch and field execution work. |
| API and event behavior | Expose command, query, and event contracts for dispatch and field execution so UIs, workflows, partner channels, analytics, and downstream apps do not bypass the owning app. |
| Audit, evidence, and reporting | Capture actor, reason, before/after state, source channel, approval evidence, policy decisions, and reporting measures needed for operations, compliance, and continuous improvement. |

### User Journey Coverage

| Journey | Trigger | App behavior | Successful outcome |
| --- | --- | --- | --- |
| Maintain Dispatch And Field Execution | User creates or updates domain information | Validate context, capture change, publish event, update projections | Accurate dispatch and field execution state available through APIs |
| Handle Dispatch And Field Execution exception | Conflict, validation failure, policy exception, fallout, or missing dependency | Route to owner, capture evidence, resolve or escalate, notify dependent work | Exception closed with auditable reason and downstream handoff |
| Review Dispatch And Field Execution performance | Supervisor, planner, compliance, or operations user needs visibility | Filter records, inspect trend, export/report, create follow-up task | Actionable operational insight and accountable next step |

### API And Integration Alignment

Related APIs and API areas: [TMF697](../../../../references/tmforum-open-apis/openapi-specs/TMF697_Work_Order), [TMF646](../../../../references/tmforum-open-apis/openapi-specs/TMF646_AppointmentManagement)

Implementation guidance:

- Provide create, read, update, lifecycle transition, search, event notification, and audit retrieval behavior where the domain lifecycle requires it.
- Publish domain events for state changes that other apps need for projections, workflow triggers, analytics, or customer/partner communication.
- Keep integration retries, idempotency keys, correlation IDs, and external reference IDs visible to operators.

### Data, Control, And Reporting Needs

- Store app-owned operational records in the app's logical database defined in the database setup document.
- Store external IDs, source channel, owner, status reason, timestamps, and relationship references needed for traceability.
- Provide operational metrics for volume, aging, fallout, SLA/OLA status, exception rate, policy overrides, and automation success.
- Support role-based access, tenant/region boundaries, sensitive-data masking, and export controls where applicable.

### First Release Interpretation

For the first release, implement the minimum lifecycle, search, validation, API, event, audit, and operational queue behavior needed for this module to participate in the app's core workflow. Advanced automation, AI assistance, bulk optimization, simulation, and deep analytics can follow after the app proves the core operating loop.

## Module 4: Stock And Warehouse

Anchor: `stock-and-warehouse`

### Capability Intent

Manage stock items, serialized equipment, CPE, SIM/eSIM, spare parts, devices, warehouse stock, van stock, reservations, transfers, returns, damaged items, consumed materials, and reconciliation.

### Primary Personas Supported

- Dispatcher: schedules technicians and balances work queues.
- Field technician: executes install, repair, survey, migration, pickup, maintenance, and decommission tasks.
- Warehouse user: manages serialized equipment, CPE, devices, spares, and van stock.
- Logistics coordinator: tracks shipping, delivery, returns, and exceptions.
- Customer/care user: sees appointment and shipment status.

### Feature Backlog Candidates

- Manage stock items.
- Serialized equipment.
- Warehouse stock.
- Reservations.
- Damaged items.
- Consumed materials.
- And reconciliation.

### Feature Groups

| Feature group | Feature detail |
| --- | --- |
| Record and lifecycle management | Create, search, view, update, retire, reinstate, and track lifecycle state for stock and warehouse records. Maintain ownership, status reason, timestamps, and relationships to upstream and downstream entities. |
| Validation, policy, and eligibility | Validate stock and warehouse changes against catalog rules, customer/account context, serviceability, inventory state, compliance policy, role permissions, and data-quality constraints relevant to this app. |
| Work queues and approvals | Provide queues for draft, pending approval, blocked, exception, fallout, rejected, completed, and archived work. Support assignment, SLA/OLA tracking, escalation, comments, and handoff. |
| Search, timeline, and operational views | Offer filtered search, saved views, dependency views, lifecycle timeline, related orders/tickets/events, and persona-specific dashboards for stock and warehouse work. |
| API and event behavior | Expose command, query, and event contracts for stock and warehouse so UIs, workflows, partner channels, analytics, and downstream apps do not bypass the owning app. |
| Audit, evidence, and reporting | Capture actor, reason, before/after state, source channel, approval evidence, policy decisions, and reporting measures needed for operations, compliance, and continuous improvement. |

### User Journey Coverage

| Journey | Trigger | App behavior | Successful outcome |
| --- | --- | --- | --- |
| Maintain Stock And Warehouse | User creates or updates domain information | Validate context, capture change, publish event, update projections | Accurate stock and warehouse state available through APIs |
| Handle Stock And Warehouse exception | Conflict, validation failure, policy exception, fallout, or missing dependency | Route to owner, capture evidence, resolve or escalate, notify dependent work | Exception closed with auditable reason and downstream handoff |
| Review Stock And Warehouse performance | Supervisor, planner, compliance, or operations user needs visibility | Filter records, inspect trend, export/report, create follow-up task | Actionable operational insight and accountable next step |

### API And Integration Alignment

Related APIs and API areas: [TMF687](../../../../references/tmforum-open-apis/openapi-specs/TMF687_StockManagement)

Implementation guidance:

- Provide create, read, update, lifecycle transition, search, event notification, and audit retrieval behavior where the domain lifecycle requires it.
- Publish domain events for state changes that other apps need for projections, workflow triggers, analytics, or customer/partner communication.
- Keep integration retries, idempotency keys, correlation IDs, and external reference IDs visible to operators.

### Data, Control, And Reporting Needs

- Store app-owned operational records in the app's logical database defined in the database setup document.
- Store external IDs, source channel, owner, status reason, timestamps, and relationship references needed for traceability.
- Provide operational metrics for volume, aging, fallout, SLA/OLA status, exception rate, policy overrides, and automation success.
- Support role-based access, tenant/region boundaries, sensitive-data masking, and export controls where applicable.

### First Release Interpretation

For the first release, implement the minimum lifecycle, search, validation, API, event, audit, and operational queue behavior needed for this module to participate in the app's core workflow. Advanced automation, AI assistance, bulk optimization, simulation, and deep analytics can follow after the app proves the core operating loop.

## Module 5: Shipping And Shipment Tracking

Anchor: `shipping-and-shipment-tracking`

### Capability Intent

Create shipping orders for CPE, devices, cards, equipment, and install material. Track carrier references, delivery evidence, exceptions, returns, and links to orders/work/stock/customer notifications.

### Primary Personas Supported

- Dispatcher: schedules technicians and balances work queues.
- Field technician: executes install, repair, survey, migration, pickup, maintenance, and decommission tasks.
- Warehouse user: manages serialized equipment, CPE, devices, spares, and van stock.
- Logistics coordinator: tracks shipping, delivery, returns, and exceptions.
- Customer/care user: sees appointment and shipment status.

### Feature Backlog Candidates

- Create shipping orders for CPE.
- And install material.
- Track carrier references.
- Delivery evidence.
- And links to orders/work/stock/customer notifications.

### Feature Groups

| Feature group | Feature detail |
| --- | --- |
| Record and lifecycle management | Create, search, view, update, retire, reinstate, and track lifecycle state for shipping and shipment tracking records. Maintain ownership, status reason, timestamps, and relationships to upstream and downstream entities. |
| Validation, policy, and eligibility | Validate shipping and shipment tracking changes against catalog rules, customer/account context, serviceability, inventory state, compliance policy, role permissions, and data-quality constraints relevant to this app. |
| Work queues and approvals | Provide queues for draft, pending approval, blocked, exception, fallout, rejected, completed, and archived work. Support assignment, SLA/OLA tracking, escalation, comments, and handoff. |
| Search, timeline, and operational views | Offer filtered search, saved views, dependency views, lifecycle timeline, related orders/tickets/events, and persona-specific dashboards for shipping and shipment tracking work. |
| API and event behavior | Expose command, query, and event contracts for shipping and shipment tracking so UIs, workflows, partner channels, analytics, and downstream apps do not bypass the owning app. |
| Audit, evidence, and reporting | Capture actor, reason, before/after state, source channel, approval evidence, policy decisions, and reporting measures needed for operations, compliance, and continuous improvement. |

### User Journey Coverage

| Journey | Trigger | App behavior | Successful outcome |
| --- | --- | --- | --- |
| Maintain Shipping And Shipment Tracking | User creates or updates domain information | Validate context, capture change, publish event, update projections | Accurate shipping and shipment tracking state available through APIs |
| Handle Shipping And Shipment Tracking exception | Conflict, validation failure, policy exception, fallout, or missing dependency | Route to owner, capture evidence, resolve or escalate, notify dependent work | Exception closed with auditable reason and downstream handoff |
| Review Shipping And Shipment Tracking performance | Supervisor, planner, compliance, or operations user needs visibility | Filter records, inspect trend, export/report, create follow-up task | Actionable operational insight and accountable next step |

### API And Integration Alignment

Related APIs and API areas: [TMF700](../../../../references/tmforum-open-apis/openapi-specs/TMF700_ShippingOrder), [TMF684](../../../../references/tmforum-open-apis/openapi-specs/TMF684_ShipmentTracking)

Implementation guidance:

- Provide create, read, update, lifecycle transition, search, event notification, and audit retrieval behavior where the domain lifecycle requires it.
- Publish domain events for state changes that other apps need for projections, workflow triggers, analytics, or customer/partner communication.
- Keep integration retries, idempotency keys, correlation IDs, and external reference IDs visible to operators.

### Data, Control, And Reporting Needs

- Store app-owned operational records in the app's logical database defined in the database setup document.
- Store external IDs, source channel, owner, status reason, timestamps, and relationship references needed for traceability.
- Provide operational metrics for volume, aging, fallout, SLA/OLA status, exception rate, policy overrides, and automation success.
- Support role-based access, tenant/region boundaries, sensitive-data masking, and export controls where applicable.

### First Release Interpretation

For the first release, implement the minimum lifecycle, search, validation, API, event, audit, and operational queue behavior needed for this module to participate in the app's core workflow. Advanced automation, AI assistance, bulk optimization, simulation, and deep analytics can follow after the app proves the core operating loop.

## Module 6: Field-To-Inventory Handover

Anchor: `field-to-inventory-handover`

### Capability Intent

Convert field evidence into inventory updates, installed equipment, serial numbers, port assignments, locations, photos, test results, customer acceptance, and mismatch tasks.

### Primary Personas Supported

- Dispatcher: schedules technicians and balances work queues.
- Field technician: executes install, repair, survey, migration, pickup, maintenance, and decommission tasks.
- Warehouse user: manages serialized equipment, CPE, devices, spares, and van stock.
- Logistics coordinator: tracks shipping, delivery, returns, and exceptions.
- Customer/care user: sees appointment and shipment status.

### Feature Backlog Candidates

- Convert field evidence into inventory updates.
- Installed equipment.
- Serial numbers.
- Port assignments.
- Test results.
- Customer acceptance.
- And mismatch tasks.

### Feature Groups

| Feature group | Feature detail |
| --- | --- |
| Record and lifecycle management | Create, search, view, update, retire, reinstate, and track lifecycle state for field-to-inventory handover records. Maintain ownership, status reason, timestamps, and relationships to upstream and downstream entities. |
| Validation, policy, and eligibility | Validate field-to-inventory handover changes against catalog rules, customer/account context, serviceability, inventory state, compliance policy, role permissions, and data-quality constraints relevant to this app. |
| Work queues and approvals | Provide queues for draft, pending approval, blocked, exception, fallout, rejected, completed, and archived work. Support assignment, SLA/OLA tracking, escalation, comments, and handoff. |
| Search, timeline, and operational views | Offer filtered search, saved views, dependency views, lifecycle timeline, related orders/tickets/events, and persona-specific dashboards for field-to-inventory handover work. |
| API and event behavior | Expose command, query, and event contracts for field-to-inventory handover so UIs, workflows, partner channels, analytics, and downstream apps do not bypass the owning app. |
| Audit, evidence, and reporting | Capture actor, reason, before/after state, source channel, approval evidence, policy decisions, and reporting measures needed for operations, compliance, and continuous improvement. |

### User Journey Coverage

| Journey | Trigger | App behavior | Successful outcome |
| --- | --- | --- | --- |
| Maintain Field-To-Inventory Handover | User creates or updates domain information | Validate context, capture change, publish event, update projections | Accurate field-to-inventory handover state available through APIs |
| Handle Field-To-Inventory Handover exception | Conflict, validation failure, policy exception, fallout, or missing dependency | Route to owner, capture evidence, resolve or escalate, notify dependent work | Exception closed with auditable reason and downstream handoff |
| Review Field-To-Inventory Handover performance | Supervisor, planner, compliance, or operations user needs visibility | Filter records, inspect trend, export/report, create follow-up task | Actionable operational insight and accountable next step |

### API And Integration Alignment

Related APIs and API areas: [TMF639](../../../../references/tmforum-open-apis/openapi-specs/TMF639_ResourceInventory), [TMF697](../../../../references/tmforum-open-apis/openapi-specs/TMF697_Work_Order), [TMF687](../../../../references/tmforum-open-apis/openapi-specs/TMF687_StockManagement)

Implementation guidance:

- Provide create, read, update, lifecycle transition, search, event notification, and audit retrieval behavior where the domain lifecycle requires it.
- Publish domain events for state changes that other apps need for projections, workflow triggers, analytics, or customer/partner communication.
- Keep integration retries, idempotency keys, correlation IDs, and external reference IDs visible to operators.

### Data, Control, And Reporting Needs

- Store app-owned operational records in the app's logical database defined in the database setup document.
- Store external IDs, source channel, owner, status reason, timestamps, and relationship references needed for traceability.
- Provide operational metrics for volume, aging, fallout, SLA/OLA status, exception rate, policy overrides, and automation success.
- Support role-based access, tenant/region boundaries, sensitive-data masking, and export controls where applicable.

### First Release Interpretation

For the first release, implement the minimum lifecycle, search, validation, API, event, audit, and operational queue behavior needed for this module to participate in the app's core workflow. Advanced automation, AI assistance, bulk optimization, simulation, and deep analytics can follow after the app proves the core operating loop.

## Critical Feature Review Enhancements (2026-06-14)

### Critical Assessment

The baseline field and logistics modules are sound, but the implementation needs stronger real-world execution controls. This app must handle appointment reliability, dispatch readiness, mobile field execution, serialized stock and van stock, shipment/RMA exceptions, safety/access evidence, and field-to-inventory handover without becoming the inventory master.

### Enhancements To Add

| Enhancement | Modules | Implementation need |
| --- | --- | --- |
| Appointment reliability workbench | Appointment Management | Manage slot search, booking, reschedule, cancellation, no-access, missed appointment, customer communication, technician availability, and SLA/customer promise impact. |
| Work order readiness checklist | Work Order | Validate skills, materials, stock reservation, site access, safety/HSE, customer/site notes, dependency clearance, and fulfillment/order context before dispatch. |
| Dispatch board | Dispatch And Field Execution | Assign technician/vendor by skill, geography, workload, SLA, route, stock, appointment window, and escalation priority. |
| Field execution evidence capture | Dispatch And Field Execution; Field-To-Inventory Handover | Capture task steps, tests, serials, photos, signatures, GPS/time evidence, safety notes, access outcome, and completion/failure reason. |
| Stock chain-of-custody control | Stock And Warehouse | Track serialized stock, stock balance, reserve, pick, pack, ship, transfer, consume, return, quarantine, refurbish, scrap, and van stock reconciliation. |
| Shipping and RMA exception board | Shipping And Shipment Tracking; Stock And Warehouse | Track shipping order, carrier status, lost/damaged/delayed shipment, customer delivery, RMA, refurbishment, restock, and refund/billing handoff. |
| Field-to-inventory acceptance package | Field-To-Inventory Handover | Package installed/removed resource, serials, location, tests, photos, stock consumption, exceptions, and acceptance/rejection route for Inventory And Topology. |

### Required Screens

| Screen | Required behavior |
| --- | --- |
| Dispatch operations board | Work queue, appointment windows, technician/vendor capacity, route, SLA risk, stock readiness, and blockers. |
| Technician task view | Step checklist, site/customer context, safety/access notes, materials, tests, evidence capture, offline indicator if applicable, and closure action. |
| Stock and van inventory workspace | Serialized items, reservations, transfers, consumption, returns, quarantine, reconciliation, and chain-of-custody history. |
| Shipment/RMA tracker | Shipping status, carrier events, exceptions, returned equipment, refurbishment/scrap/restock state, and impacted work/order. |
| Handover review | Field evidence, installed/removed inventory, serials, location, stock consumption, discrepancies, and inventory acceptance state. |

### Open-Source Decision Points

| Need | Candidate options | Decision prompt |
| --- | --- | --- |
| Dispatch map and route support | PrimeNG table/calendar; Leaflet/OpenLayers; OSRM integration later | Ask before adding map/routing technology; start with dense dispatch board if routing is not release-critical. |
| Offline field capability | Responsive web with queued submissions; PWA local storage; mobile framework later | Ask before adding offline sync because it changes conflict handling, security, and test scope. |
| Barcode/QR scanning | Browser APIs; open-source scanner library | Add scanner support only if serialized stock workflow requires it in release 1. |
| Evidence storage | PostgreSQL metadata plus object adapter; MinIO | Ask before storing photos, signatures, test files, or handover packs outside PostgreSQL. |

### API/Event/Data Additions

| Area | Additions |
| --- | --- |
| APIs | Slot search/book/reschedule/cancel, work order readiness validate, dispatch assign, field task update, stock reserve/consume/return/reconcile, shipment update, RMA update, inventory handover submit. |
| Events | `AppointmentBooked`, `AppointmentMissed`, `WorkOrderReady`, `DispatchAssigned`, `FieldTaskCompleted`, `StockReserved`, `StockConsumed`, `ShipmentExceptionRaised`, `RMAReceived`, `FieldInventoryHandoverReady`. |
| Data | Field work, appointments, stock operations, and logistics evidence are mastered here; accepted resource/service inventory remains mastered by Inventory And Topology. |

### First Release Scope

Include appointment management, work order readiness, dispatch board, technician task/evidence capture, stock reservation/consumption/return, shipment tracking, and field-to-inventory handover. Defer full offline mode, route optimization, and advanced mobile-native functionality until field operating constraints are confirmed.
