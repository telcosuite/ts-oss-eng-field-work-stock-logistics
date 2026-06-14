# Field Work, Stock, And Logistics App Feature Specifications

Reviewed: 2026-06-07

This folder contains detailed feature specifications for the Field Work, Stock, And Logistics app. The app owns appointment state, dispatch plans, work order execution state, mobile field evidence, stock operational records, shipment tracking, reverse logistics/RMA records, contractor/HSE controls, replenishment controls, and field-to-inventory handover packages. The app does not own commercial product orders, final product/service/resource inventory, fulfillment activation execution, assurance incidents, customer records, billing/payment decisions, partner lifecycle, ERP procurement/payment records, carrier master data, or platform security records.

Parent app: [Field Work, Stock, And Logistics](../README.md)

## Feature Specification Index

| Feature specification | Field, stock, and logistics intent | Primary TMF anchors | Gap priority |
| --- | --- | --- | --- |
| [Appointment Management](appointment-management.md) | Schedule and govern installation, repair, survey, migration, pickup, maintenance, and decommission appointment windows for customer sites, network sites, enterprise locations, and partner/off-net visits. | TMF646 | Core |
| [Work Order](work-order.md) | Create and govern field and engineering work orders with task steps, skills, materials, access notes, safety constraints, technician or vendor assignment, photos, signatures, serial capture, tests, and completion evidence. | TMF697 | Core |
| [Dispatch And Field Execution](dispatch-and-field-execution.md) | Optimize technician, crew, and contractor assignment by skill, certification, location, route, SLA, customer appointment window, stock readiness, shipment status, site access, and active order or trouble priority. | TMF697, TMF646 | Core |
| [Stock And Warehouse](stock-and-warehouse.md) | Manage serialized and non-serialized stock for CPE, ONT, routers, SIM/eSIM cards, devices, spares, line cards, SFPs, install material, warehouse stock, van stock, reservations, transfers, consumption, returns, damaged items, quarantine, and reconciliation. | TMF687 | Core |
| [Shipping And Shipment Tracking](shipping-and-shipment-tracking.md) | Create shipping orders and track carrier movement for CPE, devices, SIM/eSIM cards, ONT, line cards, spares, install material, return kits, replacement shipments, partner/off-net material, and customer self-install packages. | TMF700, TMF684 | Core |
| [Field-To-Inventory Handover](field-to-inventory-handover.md) | Convert field execution evidence into governed handover packages for installed, removed, swapped, migrated, repaired, quarantined, or decommissioned resources. | TMF639, TMF697, TMF687, TMF638 | Core |
| [Workforce Capacity Skills And Route Optimization](workforce-capacity-skills-and-route-optimization.md) | Plan technician, crew, and contractor capacity by skill, certification, territory, travel time, shift, SLA priority, appointment window, material readiness, HSE constraint, route feasibility, and workload forecast. | TMF646, TMF697, TMF696 | Critical |
| [Mobile Field Evidence And Failed Appointment](mobile-field-evidence-and-failed-appointment.md) | Support technician mobile execution with offline task steps, barcode/QR/serial scans, photos, GPS/time evidence, signatures, service tests, site access/HSE checks, customer acceptance, no-access reason codes, failed-appointment remediation, reschedule requests, and evidence upload. | TMF646, TMF697, TMF667, TMF681 | Critical |
| [Reverse Logistics RMA And Refurbishment](reverse-logistics-rma-and-refurbishment.md) | Manage customer returns, pickup, RMA, warranty check, replacement shipment, returned-device quarantine, privacy wipe, test/refurbishment, restock, scrap, vendor return, and inventory recovery for CPE, ONT, routers, phones, SIM/eSIM cards, line cards, spares, and partner-owned equipment. | TMF687, TMF700, TMF684, TMF637, TMF676 | Critical |
| [Contractor HSE And Replenishment Control](contractor-hse-and-replenishment-control.md) | Track contractor assignment, site access, HSE/JSA checks, permit evidence, time/material evidence, invoice support, van-stock replenishment, procurement shortage escalation, and partner labor handoff for field delivery. | TMF697, TMF687, TMF700, TMF667, TMF696 | Critical |

## App-Level Control Scope

- Field Work, Stock, And Logistics masters appointment records, work order execution records, dispatch plans, field execution sessions, mobile evidence bundles, stock transaction records, shipping and shipment tracking records, reverse logistics/RMA records, contractor HSE/replenishment control records, and field-to-inventory handover packages.
- Field Work, Stock, And Logistics references product/service/resource orders, product/service/resource inventory, activation state, assurance tickets, customer/site/contact data, partner/off-net milestones, ERP/procurement/payment references, carrier milestones, GIS/location context, platform identity, and data products through APIs, events, adapters, governed projections, workflow tasks, or evidence packages.
- Field Work, Stock, And Logistics must never become the product order, final inventory, activation, assurance, customer, billing/payment, partner, ERP, carrier, GIS, or platform security master.

## Cross-App Handoffs To Prove

| Handoff | Required evidence |
| --- | --- |
| Fulfillment to field | Service/resource order reference, work order dependency, appointment requirement, stock or shipment readiness, customer-impact flag, due date, and idempotency key. |
| Field to inventory | Work completion evidence, installed/removed serials, port/location data, photos, signatures, tests, stock consumption/return state, handover package, acceptance/rejection state, and replay metadata. |
| Field to assurance/NOC/care | Repair evidence, no-access reason, service test result, ETA/completion state, customer communication status, and unresolved dependency owner. |
| Warehouse/logistics to fulfillment | Stock reservation, pick/pack/ship status, carrier milestone, delivery proof, shortage exception, RMA/replacement state, and appointment/order jeopardy signal. |
| Contractor/HSE to compliance | Contractor authorization, JSA/HSE evidence, site access proof, stop-work decision, time/material support, evidence retention class, legal hold flag, and export/audit package. |
| App to data platform | Event IDs, source authority, lifecycle state, evidence completeness, queue aging, SLA/OLA status, consumer acceptance/rejection, and lineage for certified operational reporting. |

## How To Use These Feature Specs

- Use each feature specification as the starting point for epics, user stories, API contracts, event contracts, mobile flows, carrier adapters, contractor portals, operational dashboards, runbooks, and QA evidence.
- Confirm the master entity, referenced entities, TMF API fit, non-TMF extension APIs, events, private database boundary, idempotency, mobile/offline behavior, contractor/HSE controls, stock/shipment controls, RMA disposition, handover behavior, and consumer revalidation before implementation starts.
- Keep app-owned writes inside the Field Work, Stock, And Logistics boundary; cross-app work must use APIs, events, governed projections, workflow tasks, carrier adapters, partner callbacks, evidence packages, or certified data products.
- Validate every feature against order-to-activate, plan-to-build handoff, assure-to-optimize inventory feedback, trouble-to-resolve field diagnostics, lead-to-order feasibility/reservation support, partner/off-net delivery evidence, and govern-to-comply asset, site, HSE, and inventory evidence journeys.

## Feature Detail Review Alignment (2026-06-14)

Source: [Suite Feature Detail Review](../../feature-detail-review.md) and [Critical Feature Review Enhancements](../modules-and-features.md#critical-feature-review-enhancements-2026-06-14).

The 2026-06-14 review upgrades this app feature set with required scope: appointment control, dispatch, mobile field evidence, stock chain of custody, shipping, RMA, and field-to-inventory handover.

Apply this scope when refining the feature specifications in this folder:

- Add or update epics, stories, UI workbenches, APIs, events, app-owned data fields, DDL gaps, test cases, observability, runbooks, and definition-of-done evidence for the review scope.
- Preserve the app data ownership boundary. Cross-app access must use APIs, events, workflow tasks, governed projections, or certified data products rather than direct database sharing.
- If this scope needs technology beyond Angular, Spring Boot, PostgreSQL, and PrimeNG, offer open-source options with pros, cons, and a recommendation before implementation.
