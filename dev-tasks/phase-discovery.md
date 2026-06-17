# Field Work, Stock, And Logistics Phase Discovery

## App Identity

| Field | Value |
| --- | --- |
| Suite | OSS Engineering, Inventory, And Fulfillment |
| App | Field Work, Stock, And Logistics |
| App slug | `field-work-stock-logistics` |
| Implementation repo | `ts-oss-eng-field-work-stock-logistics` |
| Database | `ts_oss_engineering_fulfillment` |
| Schema | `field_stock_logistics` |
| APIs | TMF646, TMF697, TMF687, TMF700, TMF684, TMF639 |
| Generated date | 2026-06-17 |
| Phase/task signature | 4 phases / P01=14, P02=9, P03=9, P04=5 |

Phase count decision: 4 phases are evidence-derived from the current app-repo state, P01 runtime bootstrap requirements, and 10 build-ready feature files grouped by lifecycle, UI/API/data/event ownership, integration risk, and release gates.

Repeated skeleton audit: Evidence-derived and accepted for this app. Even when another app shares a phase/task-count signature, this discovery file cites this app's feature files, phase files, current repo state, and split/merge decisions; regenerate and split or merge phases if those inputs change.

## Input Evidence Inventory

| Evidence | Link | Status |
| --- | --- | --- |
| App implementation usage | [../implementation-file-usage.md](../implementation-file-usage.md) | Present |
| App README | [../README.md](../README.md) | Present |
| Modules and features | [../modules-and-features.md](../modules-and-features.md) | Present |
| Personas and journeys | [../personas-and-user-journeys.md](../personas-and-user-journeys.md) | Present |
| Suite data model | [../../data-model.md](../../data-model.md) | Present |
| Suite tech/UI guidance | [../../tech-and-ui-guidance.md](../../tech-and-ui-guidance.md) | Present |
| Suite implementation guide | [../../implementation-file-usage-guide.md](../../implementation-file-usage-guide.md) | Present |
| Repository strategy | [../../../../repository-strategy.md](../../../../repository-strategy.md) | Present |
| Feature: Appointment Management | [../features/appointment-management.md](../features/appointment-management.md) | Present |
| Feature: Contractor HSE And Replenishment Control | [../features/contractor-hse-and-replenishment-control.md](../features/contractor-hse-and-replenishment-control.md) | Present |
| Feature: Dispatch And Field Execution | [../features/dispatch-and-field-execution.md](../features/dispatch-and-field-execution.md) | Present |
| Feature: Field-To-Inventory Handover | [../features/field-to-inventory-handover.md](../features/field-to-inventory-handover.md) | Present |
| Feature: Mobile Field Evidence And Failed Appointment | [../features/mobile-field-evidence-and-failed-appointment.md](../features/mobile-field-evidence-and-failed-appointment.md) | Present |
| Feature: Reverse Logistics RMA And Refurbishment | [../features/reverse-logistics-rma-and-refurbishment.md](../features/reverse-logistics-rma-and-refurbishment.md) | Present |
| Feature: Shipping And Shipment Tracking | [../features/shipping-and-shipment-tracking.md](../features/shipping-and-shipment-tracking.md) | Present |
| Feature: Stock And Warehouse | [../features/stock-and-warehouse.md](../features/stock-and-warehouse.md) | Present |
| Feature: Work Order | [../features/work-order.md](../features/work-order.md) | Present |
| Feature: Workforce Capacity Skills And Route Optimization | [../features/workforce-capacity-skills-and-route-optimization.md](../features/workforce-capacity-skills-and-route-optimization.md) | Present |

## App Repository Current State Inventory

| Marker | Value |
| --- | --- |
| Repo exists | Yes |
| Runnable frontend: | No |
| Runnable backend: | No |
| App-specific migrations: | Yes |
| OpenAPI contract | Yes |
| Event contracts | Yes |
| Deployment skeleton | Yes |
| CI workflow | No |
| Current implementation conclusion: | Keep the zero-to-one foundation explicit until runnable frontend, backend, migrations, contracts, CI, deployment, and proof-slice evidence are all present in `ts-oss-eng-field-work-stock-logistics`. |

## Feature/Module Cluster Analysis

| Feature | Feature ID | Source detail carried into tasks | Implementing task IDs | Phase |
| --- | --- | --- | --- | --- |
| [Appointment Management](../features/appointment-management.md) | F-appointment-management-01 |  | DT-03-field-work-stock-logistics-P02-T001, DT-03-field-work-stock-logistics-P02-T002, DT-03-field-work-stock-logistics-P02-T009 | P02 - Appointment Management And Contractor HSE And Replenishment Control And Dispatch And Field Execution Delivery |
| [Contractor HSE And Replenishment Control](../features/contractor-hse-and-replenishment-control.md) | F-contractor-hse-and-replenishment-control-01 |  | DT-03-field-work-stock-logistics-P02-T003, DT-03-field-work-stock-logistics-P02-T004, DT-03-field-work-stock-logistics-P02-T009 | P02 - Appointment Management And Contractor HSE And Replenishment Control And Dispatch And Field Execution Delivery |
| [Dispatch And Field Execution](../features/dispatch-and-field-execution.md) | F-dispatch-and-field-execution-01 |  | DT-03-field-work-stock-logistics-P02-T005, DT-03-field-work-stock-logistics-P02-T006, DT-03-field-work-stock-logistics-P02-T009 | P02 - Appointment Management And Contractor HSE And Replenishment Control And Dispatch And Field Execution Delivery |
| [Field-To-Inventory Handover](../features/field-to-inventory-handover.md) | F-field-to-inventory-handover-01 |  | DT-03-field-work-stock-logistics-P02-T007, DT-03-field-work-stock-logistics-P02-T008, DT-03-field-work-stock-logistics-P02-T009 | P02 - Appointment Management And Contractor HSE And Replenishment Control And Dispatch And Field Execution Delivery |
| [Mobile Field Evidence And Failed Appointment](../features/mobile-field-evidence-and-failed-appointment.md) | F-mobile-field-evidence-and-failed-appointment-01 |  | DT-03-field-work-stock-logistics-P03-T001, DT-03-field-work-stock-logistics-P03-T002, DT-03-field-work-stock-logistics-P03-T009 | P03 - Mobile Field Evidence And Failed Appointment And Reverse Logistics RMA And Refurbishment And Shipping And Shipment Tracking Delivery |
| [Reverse Logistics RMA And Refurbishment](../features/reverse-logistics-rma-and-refurbishment.md) | F-reverse-logistics-rma-and-refurbishment-01 |  | DT-03-field-work-stock-logistics-P03-T003, DT-03-field-work-stock-logistics-P03-T004, DT-03-field-work-stock-logistics-P03-T009 | P03 - Mobile Field Evidence And Failed Appointment And Reverse Logistics RMA And Refurbishment And Shipping And Shipment Tracking Delivery |
| [Shipping And Shipment Tracking](../features/shipping-and-shipment-tracking.md) | F-shipping-and-shipment-tracking-01 |  | DT-03-field-work-stock-logistics-P03-T005, DT-03-field-work-stock-logistics-P03-T006, DT-03-field-work-stock-logistics-P03-T009 | P03 - Mobile Field Evidence And Failed Appointment And Reverse Logistics RMA And Refurbishment And Shipping And Shipment Tracking Delivery |
| [Stock And Warehouse](../features/stock-and-warehouse.md) | F-stock-and-warehouse-01 |  | DT-03-field-work-stock-logistics-P03-T007, DT-03-field-work-stock-logistics-P03-T008, DT-03-field-work-stock-logistics-P03-T009 | P03 - Mobile Field Evidence And Failed Appointment And Reverse Logistics RMA And Refurbishment And Shipping And Shipment Tracking Delivery |
| [Work Order](../features/work-order.md) | F-work-order-01 |  | DT-03-field-work-stock-logistics-P04-T001, DT-03-field-work-stock-logistics-P04-T002, DT-03-field-work-stock-logistics-P04-T005 | P04 - Work Order And Workforce Capacity Skills And Route Optimization |
| [Workforce Capacity Skills And Route Optimization](../features/workforce-capacity-skills-and-route-optimization.md) | F-workforce-capacity-skills-and-route-optimization-01 |  | DT-03-field-work-stock-logistics-P04-T003, DT-03-field-work-stock-logistics-P04-T004, DT-03-field-work-stock-logistics-P04-T005 | P04 - Work Order And Workforce Capacity Skills And Route Optimization |

## Phase Decision Matrix

| Phase file | Task count | Evidence basis | Exit gate |
| --- | --- | --- | --- |
| [P01-from-scratch-app-foundation-and-delivery-runtime.md](P01-from-scratch-app-foundation-and-delivery-runtime.md) | 14 | The planning pack and local repo inspection do not prove a complete runnable implementation for `ts-oss-eng-field-work-stock-logistics`; this from-scratch foundation phase creates the app-root runtime, governance, contracts, data, CI, deployment, observability, and proof slice before feature delivery. | A clean checkout of `ts-oss-eng-field-work-stock-logistics` can run Angular and Spring Boot, apply `field_stock_logistics` migrations, validate contracts/events, run Docker Compose and Helm checks, and prove one UI/API/data/event slice. |
| [P02-appointment-management-and-contractor-hse-and-replenishment-control-and-dispatch.md](P02-appointment-management-and-contractor-hse-and-replenishment-control-and-dispatch.md) | 9 | Build the Appointment Management, Contractor HSE And Replenishment Control, Dispatch And Field Execution, Field-To-Inventory Handover capability cluster for Field Work, Stock, And Logistics, carrying source workflows, APIs, events, tables, controls, and tests from the feature files into implementable work. | Field Work, Stock, And Logistics can execute the Appointment Management, Contractor HSE And Replenishment Control, Dispatch And Field Execution, Field-To-Inventory Handover workflows through UI, API, `field_stock_logistics` persistence, outbox events, audit evidence, and release tests. |
| [P03-mobile-field-evidence-and-failed-appointment-and-reverse-logistics-rma.md](P03-mobile-field-evidence-and-failed-appointment-and-reverse-logistics-rma.md) | 9 | Build the Mobile Field Evidence And Failed Appointment, Reverse Logistics RMA And Refurbishment, Shipping And Shipment Tracking, Stock And Warehouse capability cluster for Field Work, Stock, And Logistics, carrying source workflows, APIs, events, tables, controls, and tests from the feature files into implementable work. | Field Work, Stock, And Logistics can execute the Mobile Field Evidence And Failed Appointment, Reverse Logistics RMA And Refurbishment, Shipping And Shipment Tracking, Stock And Warehouse workflows through UI, API, `field_stock_logistics` persistence, outbox events, audit evidence, and release tests. |
| [P04-work-order-and-workforce-capacity-skills-and-route-optimization.md](P04-work-order-and-workforce-capacity-skills-and-route-optimization.md) | 5 | Build the Work Order, Workforce Capacity Skills And Route Optimization capability cluster for Field Work, Stock, And Logistics, carrying source workflows, APIs, events, tables, controls, and tests from the feature files into implementable work. | Field Work, Stock, And Logistics can execute the Work Order, Workforce Capacity Skills And Route Optimization workflows through UI, API, `field_stock_logistics` persistence, outbox events, audit evidence, and release tests. |

## Split/Merge Decisions

- P01 remains the app-runtime foundation because the local repo inspection does not prove a complete runnable implementation for `ts-oss-eng-field-work-stock-logistics`.
- Feature phases are grouped from source `features/*.md` files by lifecycle ownership, UI workbench/API/data/event coupling, security/privacy controls, observability, and release-test needs.
- Every feature file appears in task `Source evidence`, the tracker coverage matrix, and this discovery artifact; tracker-only feature references are not accepted as coverage.
- Generic phase names from older task packs are retired by this refresh and replaced with feature-derived phase names.

## Validator and Regeneration Notes

- Run `python3 telcosuite-skills/skills/tmf-dev-task-planner/scripts/validate_dev_tasks.py --root ts-planning/planning/suite-details/03-oss-engineering-inventory-fulfillment/field-work-stock-logistics --strict` after refresh.
- Re-run the mirror driver after validation so `ts-oss-eng-field-work-stock-logistics/dev-tasks/` remains byte-identical to the planning source.
- If a source feature changes, refresh this app pack and verify phase count, feature coverage, task detail quality, and mirror parity again.
