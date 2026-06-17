# Field Work, Stock, And Logistics P04 - Work Order And Workforce Capacity Skills And Route Optimization Development Tasks

Suite: OSS Engineering, Inventory, And Fulfillment

App: Field Work, Stock, And Logistics

App slug: `field-work-stock-logistics`

Implementation repository: `ts-oss-eng-field-work-stock-logistics`

Phase: P04 - Work Order And Workforce Capacity Skills And Route Optimization

Phase file: `P04-work-order-and-workforce-capacity-skills-and-route-optimization.md`

Phase rationale: Build the Work Order, Workforce Capacity Skills And Route Optimization capability cluster for Field Work, Stock, And Logistics, carrying source workflows, APIs, events, tables, controls, and tests from the feature files into implementable work.

Phase exit gate: Field Work, Stock, And Logistics can execute the Work Order, Workforce Capacity Skills And Route Optimization workflows through UI, API, `field_stock_logistics` persistence, outbox events, audit evidence, and release tests.

Out of scope for this phase: Runtime bootstrap is in P01; unrelated feature clusters and post-launch operations remain in their own phases.

Source tracker: [development-task-tracker.md](development-task-tracker.md)

Repository strategy: [TelcoSuite Repository Strategy](../../../../repository-strategy.md)

## Phase Coverage

- [Work Order](../features/work-order.md)
- [Workforce Capacity Skills And Route Optimization](../features/workforce-capacity-skills-and-route-optimization.md)

## Phase Tasks

### DT-03-field-work-stock-logistics-P04-T001: Build Work Order API, data model, workflow, and event spine

| Field | Value |
| --- | --- |
| Phase | P04 - Work Order And Workforce Capacity Skills And Route Optimization |
| Priority | P0 |
| Source evidence | [Work Order](../features/work-order.md), [Implementation usage](../implementation-file-usage.md), [App README](../README.md), [App overview](../../field-work-stock-logistics.md), [Modules and features](../modules-and-features.md), [Personas and journeys](../personas-and-user-journeys.md), [Suite tech/UI guidance](../../tech-and-ui-guidance.md), [Suite data model](../../data-model.md), [Suite implementation guide](../../implementation-file-usage-guide.md), [Repository strategy](../../../../repository-strategy.md) |
| Feature or module | Work Order |
| Build area | API/Data/Event/Workflow/Security/Test |
| Target artifact | `backend/src/main/java/com/telcosuite/ossengineeringinventoryfulfillment/fieldworkstocklogistics/WorkOrderController.java`, `field_stock_logistics.work_order`, `contracts/events/WorkOrderCompleted.json`, and `/api/03-oss-engineering-inventory-fulfillment/field-work-stock-logistics/v1/work-order` |
| Dependencies | DT-03-field-work-stock-logistics-P01-T013 |
| Outputs | `WorkOrderController`, `WorkOrderService`, `field_stock_logistics.work_order` migration, `WorkOrderCompleted` outbox schema, OpenAPI operations, unit/contract/migration/event replay tests |
| Missing evidence | No |

#### Implementation Notes

- Implement command and query APIs for `/api/03-oss-engineering-inventory-fulfillment/field-work-stock-logistics/v1/work-order` using TMF697, with create, update, search, detail, lifecycle transition, timeline, evidence, and exception endpoints where the feature lifecycle requires them.
- Persist `Work Order` state in `field_stock_logistics.work_order` with tenant, brand/market, lifecycle state, source authority, idempotency key, correlation ID, actor, reason code, audit fields, and `tmf_payload` JSONB.
- Publish `WorkOrderCompleted` through the transactional outbox with changed fields, replay metadata, consumer acknowledgement state, and reconciliation status for workflows: Trigger, Validation, Orchestration, Exception.
- Carry source details into code and tests for personas Field dispatcher, Field technician, Warehouse/logistics manager and objects Master entity, Referenced entities, Primary decisions, ODA boundary; keep cross-app references read-only unless they arrive through governed APIs/events/projections.

#### Acceptance Criteria

1. Given an authorized persona submits `POST /api/03-oss-engineering-inventory-fulfillment/field-work-stock-logistics/v1/work-order`, when required fields and policy checks pass, then the API returns `201` with `$.state`, persists `field_stock_logistics.work_order.id`, and appends `WorkOrderCompleted` to `field_stock_logistics.event_outbox`.
2. Given a stale, duplicate, or out-of-order request hits `PATCH /api/03-oss-engineering-inventory-fulfillment/field-work-stock-logistics/v1/work-order/{id}`, when optimistic locking or idempotency validation fails, then the API returns `409` with `$.error.code='stale-or-duplicate-command'` and no second event is emitted.
3. Given another app needs `Work Order` state, when it requests data, then it receives TMF-aligned API/event/projection output and no direct database access to `field_stock_logistics.work_order` is required.

#### Definition Of Done

- `WorkOrderController`, service, repository, DTOs, validation, error model, and migration for `field_stock_logistics.work_order` are committed under `ts-oss-eng-field-work-stock-logistics`.
- OpenAPI contract tests, unit tests, Flyway migration tests, event schema tests, and event replay tests cover `/api/03-oss-engineering-inventory-fulfillment/field-work-stock-logistics/v1/work-order`, `field_stock_logistics.work_order`, and `WorkOrderCompleted`.
- `development-task-tracker.md` records command output, source feature link, PR/evidence links, and any blocked downstream consumer.

#### Negative Scenarios

- Unauthorized, cross-tenant, or wrong-purpose requests to `/api/03-oss-engineering-inventory-fulfillment/field-work-stock-logistics/v1/work-order` return `403` and write a denial audit row instead of exposing `Work Order` data.
- Missing source authority, stale dependency state, invalid lifecycle transition, or failed policy decision keeps `field_stock_logistics.work_order` in blocked/exception state with owner and due date.
- Downstream outage or consumer rejection queues retry/replay for `WorkOrderCompleted` and prevents silent completion.

#### Edge Cases

- Bulk or project-scale updates to `Work Order` use preview, partial-failure reporting, idempotency keys, rollback/repair notes, and async export where needed.
- Historical correction preserves previous `field_stock_logistics.work_order` values, audit reason, source timestamp, actor, and downstream recalculation/replay instructions.
- Multi-tenant, market, residency, localization, and high-volume queue cases include pagination, back-pressure, circuit breaker, and replay controls.

#### Test Expectations

- `mvn test` covers `WorkOrderService`, validation, authorization, idempotency, and lifecycle transition rules.
- OpenAPI contract tests call `POST/GET/PATCH /api/03-oss-engineering-inventory-fulfillment/field-work-stock-logistics/v1/work-order` and verify `$.state`, `$.id`, error payloads, and pagination/filter behavior.
- Flyway migration tests verify `field_stock_logistics.work_order` columns and indexes; event replay tests validate `contracts/events/WorkOrderCompleted.json` and `field_stock_logistics.event_outbox` ordering.

### DT-03-field-work-stock-logistics-P04-T002: Build Work Order workbench, controls, observability, and release tests

| Field | Value |
| --- | --- |
| Phase | P04 - Work Order And Workforce Capacity Skills And Route Optimization |
| Priority | P1 |
| Source evidence | [Work Order](../features/work-order.md), [Implementation usage](../implementation-file-usage.md), [App README](../README.md), [App overview](../../field-work-stock-logistics.md), [Modules and features](../modules-and-features.md), [Personas and journeys](../personas-and-user-journeys.md), [Suite tech/UI guidance](../../tech-and-ui-guidance.md), [Suite data model](../../data-model.md), [Suite implementation guide](../../implementation-file-usage-guide.md), [Repository strategy](../../../../repository-strategy.md) |
| Feature or module | Work Order |
| Build area | UI/Security/Ops/Test |
| Target artifact | `frontend/src/app/pages/work-order/`, `tests/e2e/work-order.spec.ts`, Grafana panel `work-order`, and `docs/operations-runbook.md#work-order` |
| Dependencies | DT-03-field-work-stock-logistics-P04-T001 |
| Outputs | Angular workbench, queue/detail/timeline/evidence panels, role-aware guards, accessibility states, E2E tests, dashboard JSON, alert rules, runbook section |
| Missing evidence | No |

#### Implementation Notes

- Create `frontend/src/app/pages/work-order/` with search/intake, detail, lifecycle timeline, exception queue, evidence drawer, dependency freshness panel, and allowed-next-action controls for personas Field dispatcher, Field technician, Warehouse/logistics manager.
- Wire route guards, tenant/brand/market context, masking, no-permission states, keyboard navigation, PrimeNG table/form patterns, and saved filters using `ts-shared-ui-design-system`.
- Add dashboard metrics and runbook steps for workflows Trigger, Validation, Orchestration, Exception, event replay backlog, queue aging, policy denials, consumer lag, and completion quality.

#### Acceptance Criteria

1. Given an authorized persona opens `/app/field-work-stock-logistics/work-order`, when records exist, then the workbench returns `$.uiState='ready'` and renders `Work Order` rows with lifecycle state, owner, freshness, SLA/OLA timer, and action menu.
2. Given the persona lacks permission, when the same route loads, then the UI shows a no-permission state and the backend returns `403` with `$.error.code='access-denied'`.
3. Given replay backlog or queue aging exceeds threshold, when Grafana dashboard `work-order` refreshes, then it shows the metric and links to `docs/operations-runbook.md#work-order`.

#### Definition Of Done

- `frontend/src/app/pages/work-order/` includes route, component, service, state, fixtures, empty/loading/error/no-permission states, and accessibility labels.
- `tests/e2e/work-order.spec.ts`, accessibility checks, security tests, dashboard checks, and runbook review pass and are linked from the tracker.
- `development-task-tracker.md` captures screenshots, command output, PR links, dashboard/runbook links, and unresolved blockers.

#### Negative Scenarios

- Do not render `Work Order` details across tenant/residency boundaries; masked values stay masked in table, detail, export, timeline, and dashboard paths.
- Do not close UI actions when backend validation, event publication, reconciliation, or required evidence is incomplete.
- Do not hide downstream outage, stale source data, policy denial, or manual override behind a generic success toast.

#### Edge Cases

- Mobile or constrained layouts for `Work Order` collapse tables into accessible cards without losing lifecycle, owner, SLA/OLA, or evidence fields.
- Bulk/replay actions require preview, explicit confirmation, partial-failure details, rollback/repair notes, and operator evidence.
- High-volume dashboard and queue views use pagination, saved filters, async export, trace IDs, and back-pressure indicators.

#### Test Expectations

- `npm run lint`, `npm test`, and `tests/e2e/work-order.spec.ts` validate route, forms, guards, workbench states, and API integration.
- Accessibility tests cover keyboard navigation, focus order, screen-reader labels, color contrast, density, and responsive layout.
- Operational-readiness tests validate Grafana dashboard JSON, alert rules, event replay panel, runbook links, and release evidence.

### DT-03-field-work-stock-logistics-P04-T003: Build Workforce Capacity Skills And Route Optimization API, data model, workflow, and event spine

| Field | Value |
| --- | --- |
| Phase | P04 - Work Order And Workforce Capacity Skills And Route Optimization |
| Priority | P0 |
| Source evidence | [Workforce Capacity Skills And Route Optimization](../features/workforce-capacity-skills-and-route-optimization.md), [Implementation usage](../implementation-file-usage.md), [App README](../README.md), [App overview](../../field-work-stock-logistics.md), [Modules and features](../modules-and-features.md), [Personas and journeys](../personas-and-user-journeys.md), [Suite tech/UI guidance](../../tech-and-ui-guidance.md), [Suite data model](../../data-model.md), [Suite implementation guide](../../implementation-file-usage-guide.md), [Repository strategy](../../../../repository-strategy.md) |
| Feature or module | Workforce Capacity Skills And Route Optimization |
| Build area | API/Data/Event/Workflow/Security/Test |
| Target artifact | `backend/src/main/java/com/telcosuite/ossengineeringinventoryfulfillment/fieldworkstocklogistics/WorkforceCapacitySkillsAndRouteOptimizationController.java`, `field_stock_logistics.workforce_capacity_skills_and_route_optimization`, `contracts/events/AssignmentRecommendationCreated.json`, and `/api/03-oss-engineering-inventory-fulfillment/field-work-stock-logistics/v1/workforce-capacity-skills-and-route-optimization` |
| Dependencies | DT-03-field-work-stock-logistics-P04-T001 |
| Outputs | `WorkforceCapacitySkillsAndRouteOptimizationController`, `WorkforceCapacitySkillsAndRouteOptimizationService`, `field_stock_logistics.workforce_capacity_skills_and_route_optimization` migration, `AssignmentRecommendationCreated` outbox schema, OpenAPI operations, unit/contract/migration/event replay tests |
| Missing evidence | No |

#### Implementation Notes

- Implement command and query APIs for `/api/03-oss-engineering-inventory-fulfillment/field-work-stock-logistics/v1/workforce-capacity-skills-and-route-optimization` using TMF646, TMF696, TMF697, with create, update, search, detail, lifecycle transition, timeline, evidence, and exception endpoints where the feature lifecycle requires them.
- Persist `Workforce Capacity Skills And Route Optimization` state in `field_stock_logistics.workforce_capacity_skills_and_route_optimization` with tenant, brand/market, lifecycle state, source authority, idempotency key, correlation ID, actor, reason code, audit fields, and `tmf_payload` JSONB.
- Publish `AssignmentRecommendationCreated` through the transactional outbox with changed fields, replay metadata, consumer acknowledgement state, and reconciliation status for workflows: Trigger, Validation, Orchestration, Exception.
- Carry source details into code and tests for personas Field dispatcher, Field technician, Warehouse/logistics manager and objects Master entity, Referenced entities, Primary decisions, ODA boundary; keep cross-app references read-only unless they arrive through governed APIs/events/projections.

#### Acceptance Criteria

1. Given an authorized persona submits `POST /api/03-oss-engineering-inventory-fulfillment/field-work-stock-logistics/v1/workforce-capacity-skills-and-route-optimization`, when required fields and policy checks pass, then the API returns `201` with `$.state`, persists `field_stock_logistics.workforce_capacity_skills_and_route_optimization.id`, and appends `AssignmentRecommendationCreated` to `field_stock_logistics.event_outbox`.
2. Given a stale, duplicate, or out-of-order request hits `PATCH /api/03-oss-engineering-inventory-fulfillment/field-work-stock-logistics/v1/workforce-capacity-skills-and-route-optimization/{id}`, when optimistic locking or idempotency validation fails, then the API returns `409` with `$.error.code='stale-or-duplicate-command'` and no second event is emitted.
3. Given another app needs `Workforce Capacity Skills And Route Optimization` state, when it requests data, then it receives TMF-aligned API/event/projection output and no direct database access to `field_stock_logistics.workforce_capacity_skills_and_route_optimization` is required.

#### Definition Of Done

- `WorkforceCapacitySkillsAndRouteOptimizationController`, service, repository, DTOs, validation, error model, and migration for `field_stock_logistics.workforce_capacity_skills_and_route_optimization` are committed under `ts-oss-eng-field-work-stock-logistics`.
- OpenAPI contract tests, unit tests, Flyway migration tests, event schema tests, and event replay tests cover `/api/03-oss-engineering-inventory-fulfillment/field-work-stock-logistics/v1/workforce-capacity-skills-and-route-optimization`, `field_stock_logistics.workforce_capacity_skills_and_route_optimization`, and `AssignmentRecommendationCreated`.
- `development-task-tracker.md` records command output, source feature link, PR/evidence links, and any blocked downstream consumer.

#### Negative Scenarios

- Unauthorized, cross-tenant, or wrong-purpose requests to `/api/03-oss-engineering-inventory-fulfillment/field-work-stock-logistics/v1/workforce-capacity-skills-and-route-optimization` return `403` and write a denial audit row instead of exposing `Workforce Capacity Skills And Route Optimization` data.
- Missing source authority, stale dependency state, invalid lifecycle transition, or failed policy decision keeps `field_stock_logistics.workforce_capacity_skills_and_route_optimization` in blocked/exception state with owner and due date.
- Downstream outage or consumer rejection queues retry/replay for `AssignmentRecommendationCreated` and prevents silent completion.

#### Edge Cases

- Bulk or project-scale updates to `Workforce Capacity Skills And Route Optimization` use preview, partial-failure reporting, idempotency keys, rollback/repair notes, and async export where needed.
- Historical correction preserves previous `field_stock_logistics.workforce_capacity_skills_and_route_optimization` values, audit reason, source timestamp, actor, and downstream recalculation/replay instructions.
- Multi-tenant, market, residency, localization, and high-volume queue cases include pagination, back-pressure, circuit breaker, and replay controls.

#### Test Expectations

- `mvn test` covers `WorkforceCapacitySkillsAndRouteOptimizationService`, validation, authorization, idempotency, and lifecycle transition rules.
- OpenAPI contract tests call `POST/GET/PATCH /api/03-oss-engineering-inventory-fulfillment/field-work-stock-logistics/v1/workforce-capacity-skills-and-route-optimization` and verify `$.state`, `$.id`, error payloads, and pagination/filter behavior.
- Flyway migration tests verify `field_stock_logistics.workforce_capacity_skills_and_route_optimization` columns and indexes; event replay tests validate `contracts/events/AssignmentRecommendationCreated.json` and `field_stock_logistics.event_outbox` ordering.

### DT-03-field-work-stock-logistics-P04-T004: Build Workforce Capacity Skills And Route Optimization workbench, controls, observability, and release tests

| Field | Value |
| --- | --- |
| Phase | P04 - Work Order And Workforce Capacity Skills And Route Optimization |
| Priority | P1 |
| Source evidence | [Workforce Capacity Skills And Route Optimization](../features/workforce-capacity-skills-and-route-optimization.md), [Implementation usage](../implementation-file-usage.md), [App README](../README.md), [App overview](../../field-work-stock-logistics.md), [Modules and features](../modules-and-features.md), [Personas and journeys](../personas-and-user-journeys.md), [Suite tech/UI guidance](../../tech-and-ui-guidance.md), [Suite data model](../../data-model.md), [Suite implementation guide](../../implementation-file-usage-guide.md), [Repository strategy](../../../../repository-strategy.md) |
| Feature or module | Workforce Capacity Skills And Route Optimization |
| Build area | UI/Security/Ops/Test |
| Target artifact | `frontend/src/app/pages/workforce-capacity-skills-and-route-optimization/`, `tests/e2e/workforce-capacity-skills-and-route-optimization.spec.ts`, Grafana panel `workforce-capacity-skills-and-route-optimization`, and `docs/operations-runbook.md#workforce-capacity-skills-and-route-optimization` |
| Dependencies | DT-03-field-work-stock-logistics-P04-T003 |
| Outputs | Angular workbench, queue/detail/timeline/evidence panels, role-aware guards, accessibility states, E2E tests, dashboard JSON, alert rules, runbook section |
| Missing evidence | No |

#### Implementation Notes

- Create `frontend/src/app/pages/workforce-capacity-skills-and-route-optimization/` with search/intake, detail, lifecycle timeline, exception queue, evidence drawer, dependency freshness panel, and allowed-next-action controls for personas Field dispatcher, Field technician, Warehouse/logistics manager.
- Wire route guards, tenant/brand/market context, masking, no-permission states, keyboard navigation, PrimeNG table/form patterns, and saved filters using `ts-shared-ui-design-system`.
- Add dashboard metrics and runbook steps for workflows Trigger, Validation, Orchestration, Exception, event replay backlog, queue aging, policy denials, consumer lag, and completion quality.

#### Acceptance Criteria

1. Given an authorized persona opens `/app/field-work-stock-logistics/workforce-capacity-skills-and-route-optimization`, when records exist, then the workbench returns `$.uiState='ready'` and renders `Workforce Capacity Skills And Route Optimization` rows with lifecycle state, owner, freshness, SLA/OLA timer, and action menu.
2. Given the persona lacks permission, when the same route loads, then the UI shows a no-permission state and the backend returns `403` with `$.error.code='access-denied'`.
3. Given replay backlog or queue aging exceeds threshold, when Grafana dashboard `workforce-capacity-skills-and-route-optimization` refreshes, then it shows the metric and links to `docs/operations-runbook.md#workforce-capacity-skills-and-route-optimization`.

#### Definition Of Done

- `frontend/src/app/pages/workforce-capacity-skills-and-route-optimization/` includes route, component, service, state, fixtures, empty/loading/error/no-permission states, and accessibility labels.
- `tests/e2e/workforce-capacity-skills-and-route-optimization.spec.ts`, accessibility checks, security tests, dashboard checks, and runbook review pass and are linked from the tracker.
- `development-task-tracker.md` captures screenshots, command output, PR links, dashboard/runbook links, and unresolved blockers.

#### Negative Scenarios

- Do not render `Workforce Capacity Skills And Route Optimization` details across tenant/residency boundaries; masked values stay masked in table, detail, export, timeline, and dashboard paths.
- Do not close UI actions when backend validation, event publication, reconciliation, or required evidence is incomplete.
- Do not hide downstream outage, stale source data, policy denial, or manual override behind a generic success toast.

#### Edge Cases

- Mobile or constrained layouts for `Workforce Capacity Skills And Route Optimization` collapse tables into accessible cards without losing lifecycle, owner, SLA/OLA, or evidence fields.
- Bulk/replay actions require preview, explicit confirmation, partial-failure details, rollback/repair notes, and operator evidence.
- High-volume dashboard and queue views use pagination, saved filters, async export, trace IDs, and back-pressure indicators.

#### Test Expectations

- `npm run lint`, `npm test`, and `tests/e2e/workforce-capacity-skills-and-route-optimization.spec.ts` validate route, forms, guards, workbench states, and API integration.
- Accessibility tests cover keyboard navigation, focus order, screen-reader labels, color contrast, density, and responsive layout.
- Operational-readiness tests validate Grafana dashboard JSON, alert rules, event replay panel, runbook links, and release evidence.

### DT-03-field-work-stock-logistics-P04-T005: Prove Work Order And Workforce Capacity Skills And Route Optimization release gate, replay, and handoff evidence

| Field | Value |
| --- | --- |
| Phase | P04 - Work Order And Workforce Capacity Skills And Route Optimization |
| Priority | P1 |
| Source evidence | [Work Order](../features/work-order.md), [Workforce Capacity Skills And Route Optimization](../features/workforce-capacity-skills-and-route-optimization.md), [Implementation usage](../implementation-file-usage.md), [App README](../README.md), [App overview](../../field-work-stock-logistics.md), [Modules and features](../modules-and-features.md), [Personas and journeys](../personas-and-user-journeys.md), [Suite tech/UI guidance](../../tech-and-ui-guidance.md), [Suite data model](../../data-model.md), [Suite implementation guide](../../implementation-file-usage-guide.md), [Repository strategy](../../../../repository-strategy.md) |
| Feature or module | Work Order And Workforce Capacity Skills And Route Optimization |
| Build area | Test/Ops/Release/Event |
| Target artifact | `tests/release/work-order-and-workforce-capacity-skills-and-route-optimization.spec.ts`, `docs/release-notes/work-order-and-workforce-capacity-skills-and-route-optimization.md`, Grafana dashboard `work-order-and-workforce-capacity-skills-and-route-optimization`, and replay fixtures |
| Dependencies | DT-03-field-work-stock-logistics-P04-T002, DT-03-field-work-stock-logistics-P04-T004 |
| Outputs | Release-gate test, replay/reconciliation evidence, accessibility/security/performance reports, dashboard/runbook links, support handoff notes |
| Missing evidence | No |

#### Implementation Notes

- Create a release-gate checklist for `work-order-and-workforce-capacity-skills-and-route-optimization` covering Work Order, Workforce Capacity Skills And Route Optimization, with happy path, assisted path, negative path, edge cases, event replay, data reconciliation, security, accessibility, performance, and support evidence.
- Record producer and consumer acknowledgements for phase events, reconcile `field_stock_logistics.event_outbox`, and link replay fixtures and correlation IDs.
- Update `docs/operations-runbook.md`, `docs/release-notes/work-order-and-workforce-capacity-skills-and-route-optimization.md`, and `development-task-tracker.md` with release evidence and unresolved blockers.

#### Acceptance Criteria

1. Given all tasks in `P04-work-order-and-workforce-capacity-skills-and-route-optimization.md` are complete, when `tests/release/work-order-and-workforce-capacity-skills-and-route-optimization.spec.ts` runs, then it returns exit code `0` and links evidence for UI, API, data, event, security, ops, and test gates.
2. Given a consumer rejects an event from `work-order-and-workforce-capacity-skills-and-route-optimization`, when replay is triggered, then the replay fixture preserves `$.correlationId`, `$.eventId`, and consumer acknowledgement state.
3. Given release notes are generated, when support reviews `docs/release-notes/work-order-and-workforce-capacity-skills-and-route-optimization.md`, then open blockers, rollback steps, runbook links, and ownership contacts are present.

#### Definition Of Done

- `tests/release/work-order-and-workforce-capacity-skills-and-route-optimization.spec.ts`, replay fixtures, dashboard/runbook links, and release notes are committed.
- Accessibility, security, contract, migration, event replay, performance, and operational-readiness evidence is linked from the tracker.
- Open blockers have owner, due date, target increment, and rollback or removal criteria.

#### Negative Scenarios

- Do not mark the phase Done if event replay, reconciliation, accessibility, security, or downstream acknowledgement evidence is missing.
- Do not release `work-order-and-workforce-capacity-skills-and-route-optimization` with unresolved cross-app writes, direct schema coupling, or stale source authority assumptions.
- Do not suppress failed release gates; record failures with owner, due date, and target increment.

#### Edge Cases

- Coordinated release gates may require downstream app windows; record scheduling, owner, and fallback route in release notes.
- Historical backfill, replay, bulk update, or migration repair runs must include preview, partial failure report, and rollback evidence.
- High-volume launch periods require dashboard thresholds, alert owners, queue back-pressure, and support escalation paths.

#### Test Expectations

- `tests/release/work-order-and-workforce-capacity-skills-and-route-optimization.spec.ts`, `mvn test`, OpenAPI/event replay tests, Flyway checks, Playwright/Cypress E2E, accessibility, security, and k6/performance gates pass.
- `docker compose config`, clean-checkout smoke, `helm lint`, Kubernetes dry-run, dashboard JSON validation, and runbook link checks pass.
- Tracker evidence links command output, PRs, screenshots, replay payloads, dashboards, release notes, and support handoff notes.
