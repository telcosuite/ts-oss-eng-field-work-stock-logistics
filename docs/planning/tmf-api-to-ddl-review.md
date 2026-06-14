# Field Work, Stock, And Logistics TMF API To DDL Review

Reviewed: 2026-06-14

Status: Complete for baseline app implementation. Endpoint-specific contract tests and final story-level field promotion still happen during build.

## Scope

This review covers `field_stock_logistics` in suite database `ts_oss_engineering_fulfillment`. It uses the local TMF Open API reference set, the suite data model, the API-to-DDL traceability matrix, and the V001 starter DDL.

The review confirms that the app can move into implementation with a V002 typed DDL baseline while preserving full TMF payload compatibility through validated `tmf_payload`, typed common TMF columns, and normalized support tables.

## TMF API Baseline Selection

| TMF API | Local baseline spec | Resources/path roots reviewed | V001 table groups |
| --- | --- | --- | --- |
| TMF646 | `references/tmforum-open-apis/openapi-specs/TMF646_AppointmentManagement/TMF646_Appointment_Management_API_v4.0.0_swagger.json` | `appointment`, `searchTimeSlot` | appointment; dispatch_plan |
| TMF697 | `references/tmforum-open-apis/openapi-specs/TMF697_Work_Order/TMF697-WorkOrder-v4.0.0.swagger.json` | `cancelWorkOrder`, `workOrder` | work_order; remediation_task; vendor_work_package; build_program |
| TMF687 | `references/tmforum-open-apis/openapi-specs/TMF687_StockManagement/TMF687_Stock_Management_API_v4.0.0_swagger.json` | `adjustProductStock`, `checkProductStock`, `productStock`, `queryProductStock`, `reserveProductStock` | stock_item; stock_balance; bill_of_material_intent references |
| TMF700 | `references/tmforum-open-apis/openapi-specs/TMF700_ShippingOrder/TMF700-ShippingOrder-v4.0.0.swagger.json` | `shippingOrder` | shipping_order; vendor_work_package references |
| TMF684 | `references/tmforum-open-apis/openapi-specs/TMF684_ShipmentTracking/shipmentTracking_v10_Jan18_SwaggerValidatorPassed.json` | `TMF684` | tracking_event; shipping_order references |
| TMF639 | `references/tmforum-open-apis/openapi-specs/TMF639_ResourceInventory/TMF639-Resource_Inventory_Management-v5.0.0.oas.yaml` | `resource` | resource_inventory; identifier_resource; inventory_location_binding; topology; assignment |

## Current DDL Coverage

Current starter DDL is in `database/postgres/suites/ts_oss_engineering_fulfillment/V001__create_app_schemas_and_starter_tables.sql` under schema `field_stock_logistics`.

| Current table | TMF purpose | V002 decision |
| --- | --- | --- |
| `field_stock_logistics.appointment` | Starter table for Field Work, Stock, And Logistics; V002 promotes common TMF fields and keeps full validated payload support. | Keep and refine through `database/postgres/suites/ts_oss_engineering_fulfillment/V005__refine_field_stock_logistics_tmf_core.sql` |
| `field_stock_logistics.work_order` | Starter table for Field Work, Stock, And Logistics; V002 promotes common TMF fields and keeps full validated payload support. | Keep and refine through `database/postgres/suites/ts_oss_engineering_fulfillment/V005__refine_field_stock_logistics_tmf_core.sql` |
| `field_stock_logistics.dispatch_plan` | Starter table for Field Work, Stock, And Logistics; V002 promotes common TMF fields and keeps full validated payload support. | Keep and refine through `database/postgres/suites/ts_oss_engineering_fulfillment/V005__refine_field_stock_logistics_tmf_core.sql` |
| `field_stock_logistics.field_evidence` | Starter table for Field Work, Stock, And Logistics; V002 promotes common TMF fields and keeps full validated payload support. | Keep and refine through `database/postgres/suites/ts_oss_engineering_fulfillment/V005__refine_field_stock_logistics_tmf_core.sql` |
| `field_stock_logistics.stock_item` | Starter table for Field Work, Stock, And Logistics; V002 promotes common TMF fields and keeps full validated payload support. | Keep and refine through `database/postgres/suites/ts_oss_engineering_fulfillment/V005__refine_field_stock_logistics_tmf_core.sql` |
| `field_stock_logistics.stock_balance` | Starter table for Field Work, Stock, And Logistics; V002 promotes common TMF fields and keeps full validated payload support. | Keep and refine through `database/postgres/suites/ts_oss_engineering_fulfillment/V005__refine_field_stock_logistics_tmf_core.sql` |
| `field_stock_logistics.shipping_order` | Starter table for Field Work, Stock, And Logistics; V002 promotes common TMF fields and keeps full validated payload support. | Keep and refine through `database/postgres/suites/ts_oss_engineering_fulfillment/V005__refine_field_stock_logistics_tmf_core.sql` |
| `field_stock_logistics.tracking_event` | Starter table for Field Work, Stock, And Logistics; V002 promotes common TMF fields and keeps full validated payload support. | Keep and refine through `database/postgres/suites/ts_oss_engineering_fulfillment/V005__refine_field_stock_logistics_tmf_core.sql` |
| `field_stock_logistics.field_inventory_handover` | Starter table for Field Work, Stock, And Logistics; V002 promotes common TMF fields and keeps full validated payload support. | Keep and refine through `database/postgres/suites/ts_oss_engineering_fulfillment/V005__refine_field_stock_logistics_tmf_core.sql` |
| `field_stock_logistics.event_outbox` | App outbox for domain and TMF notification events. | Keep and refine through `database/postgres/suites/ts_oss_engineering_fulfillment/V005__refine_field_stock_logistics_tmf_core.sql` |

## Resource To Table Decisions

| TMF API/resource | Master or anchor table | Path coverage | Promoted field candidates | Field handling strategy |
| --- | --- | --- | --- | --- |
| TMF646 `appointment` | `field_stock_logistics.appointment` | `/appointment`, `/appointment/{id}` | `id`, `href`, `category`, `creationDate`, `description`, `externalId`, `lastUpdate`, `attachment` | Promote common TMF lifecycle/reference fields; store remaining validated resource fields in tmf_payload and characteristics tables. |
| TMF646 `searchTimeSlot` | `field_stock_logistics.appointment` | `/searchTimeSlot`, `/searchTimeSlot/{id}` | `id`, `href`, `searchDate`, `searchResult`, `availableTimeSlot`, `relatedEntity`, `relatedParty`, `relatedPlace` | Promote common TMF lifecycle/reference fields; store remaining validated resource fields in tmf_payload and characteristics tables. |
| TMF697 `cancelWorkOrder` | `field_stock_logistics.work_order` | `/cancelWorkOrder`, `/cancelWorkOrder/{id}` | `id`, `href`, `cancellationDate`, `cancellationReason`, `category`, `completionDate`, `description`, `expectedCompletionDate` | Promote common TMF lifecycle/reference fields; store remaining validated resource fields in tmf_payload and characteristics tables. |
| TMF697 `workOrder` | `field_stock_logistics.work_order` | `/workOrder`, `/workOrder/{id}` | `id`, `href`, `cancellationDate`, `cancellationReason`, `category`, `completionDate`, `description`, `expectedCompletionDate` | Promote common TMF lifecycle/reference fields; store remaining validated resource fields in tmf_payload and characteristics tables. |
| TMF687 `adjustProductStock` | `field_stock_logistics.stock_item` | `/adjustProductStock`, `/adjustProductStock/{id}` | `id`, `href`, `creationDate`, `description`, `lastInventoryDate`, `lastUpdate`, `name`, `replenishmentDate` | Promote common TMF lifecycle/reference fields; store remaining validated resource fields in tmf_payload and characteristics tables. |
| TMF687 `checkProductStock` | `field_stock_logistics.stock_item` | `/checkProductStock`, `/checkProductStock/{id}` | `id`, `href`, `creationDate`, `description`, `lastInventoryDate`, `lastUpdate`, `name`, `replenishmentDate` | Promote common TMF lifecycle/reference fields; store remaining validated resource fields in tmf_payload and characteristics tables. |
| TMF687 `productStock` | `field_stock_logistics.stock_item` | `/productStock`, `/productStock/{id}` | `id`, `href`, `creationDate`, `description`, `lastInventoryDate`, `lastUpdate`, `name`, `replenishmentDate` | Promote common TMF lifecycle/reference fields; store remaining validated resource fields in tmf_payload and characteristics tables. |
| TMF687 `queryProductStock` | `field_stock_logistics.stock_item` | `/queryProductStock`, `/queryProductStock/{id}` | `id`, `href`, `creationDate`, `description`, `lastInventoryDate`, `lastUpdate`, `name`, `replenishmentDate` | Promote common TMF lifecycle/reference fields; store remaining validated resource fields in tmf_payload and characteristics tables. |
| TMF687 `reserveProductStock` | `field_stock_logistics.stock_item` | `/reserveProductStock`, `/reserveProductStock/{id}` | `id`, `href`, `creationDate`, `description`, `lastInventoryDate`, `lastUpdate`, `name`, `replenishmentDate` | Promote common TMF lifecycle/reference fields; store remaining validated resource fields in tmf_payload and characteristics tables. |
| TMF700 `shippingOrder` | `field_stock_logistics.shipping_order` | `/shippingOrder`, `/shippingOrder/{id}` | `id`, `href`, `creationDate`, `lastUpdateDate`, `status`, `note`, `placeFrom`, `placeTo` | Promote common TMF lifecycle/reference fields; store remaining validated resource fields in tmf_payload and characteristics tables. |
| TMF684 `TMF684` | `field_stock_logistics.shipping_order` | Component/schema-level resource | Common TMF metadata plus payload validation | Promote common TMF metadata; store resource-specific fields in tmf_payload until query patterns justify additional typed columns. |
| TMF639 `resource` | `field_stock_logistics.appointment` | `/resource`, `/resource/{id}` | Common TMF metadata plus payload validation | Promote common TMF metadata; store resource-specific fields in tmf_payload until query patterns justify additional typed columns. |

## V002 DDL Refinement

Migration: `database/postgres/suites/ts_oss_engineering_fulfillment/V005__refine_field_stock_logistics_tmf_core.sql`

The migration adds this implementation baseline for the app:

| Area | Decision |
| --- | --- |
| Common TMF fields | Add reusable typed columns such as `tmf_id`, `tmf_href`, `tmf_type`, `tmf_base_type`, `tmf_schema_location`, `tmf_referred_type`, `tmf_name`, `tmf_description`, `tmf_lifecycle_status`, `tmf_state`, dates, priority, and external ID to every V001 app table. |
| Full TMF compatibility | Keep the V001 `tmf_payload` column as the complete validated TMF resource snapshot for fields that are not yet promoted to typed columns. |
| Characteristics and references | Add normalized `tmf_characteristic`, `tmf_resource_reference`, `tmf_external_identifier`, `tmf_related_party`, `tmf_note`, `tmf_attachment`, and `tmf_relationship` support tables. |
| API/resource map | Add `tmf_api_resource_map` rows for the selected local TMF APIs and resource roots. |
| Event contracts | Add baseline event contract rows for create, update, state-change, and delete events per reviewed API resource. |
| Privacy and audit | Add table-level privacy, retention, legal-hold, residency, masking, and audit policy rows. |
| High-volume candidates | `field_stock_logistics.tracking_event`, `field_stock_logistics.event_outbox` |

## Event Contract Baseline

Events are registered in `field_stock_logistics.event_contract` using `field_stock_logistics.event_outbox` as the publication basis. Consumers must be added when integrations are designed; no app should directly write another app schema.

## Privacy, Retention, And Audit Baseline

| Table | Data classification | Retention class | Audit level |
| --- | --- | --- | --- |
| `field_stock_logistics.appointment` | internal | operational_telemetry | standard |
| `field_stock_logistics.work_order` | confidential | business_lifecycle | standard-high |
| `field_stock_logistics.dispatch_plan` | internal | operational_telemetry | standard |
| `field_stock_logistics.field_evidence` | internal | operational_telemetry | standard |
| `field_stock_logistics.stock_item` | internal | operational_telemetry | standard |
| `field_stock_logistics.stock_balance` | internal | operational_telemetry | standard |
| `field_stock_logistics.shipping_order` | confidential | business_lifecycle | standard-high |
| `field_stock_logistics.tracking_event` | internal | operational_telemetry | standard |
| `field_stock_logistics.field_inventory_handover` | internal | operational_telemetry | standard |
| `field_stock_logistics.event_outbox` | internal | operational_telemetry | standard |

## Build Gate Result

| Gate item | Result |
| --- | --- |
| API/resource review | Complete for baseline implementation |
| V002 typed DDL | Complete: `database/postgres/suites/ts_oss_engineering_fulfillment/V005__refine_field_stock_logistics_tmf_core.sql` |
| Event contract register | Baseline complete |
| Privacy/retention/audit classification | Baseline complete |
| Remaining implementation control | Validate exact endpoint operations and contract tests as Angular/Spring Boot features are built |
