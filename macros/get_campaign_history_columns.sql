{% macro get_campaign_history_columns() %}

{% set columns = [
    {"name": "_fivetran_synced", "datatype": dbt_utils.type_timestamp()},
    {"name": "adam_id", "datatype": dbt_utils.type_int()},
    {"name": "budget_amount", "datatype": dbt_utils.type_numeric()},
    {"name": "budget_currency", "datatype": dbt_utils.type_string()},
    {"name": "budget_orders", "datatype": dbt_utils.type_string()},
    {"name": "daily_budget_amount", "datatype": dbt_utils.type_numeric()},
    {"name": "daily_budget_currency", "datatype": dbt_utils.type_string()},
    {"name": "deleted", "datatype": "boolean"},
    {"name": "end_time", "datatype": dbt_utils.type_timestamp()},
    {"name": "id", "datatype": dbt_utils.type_int()},
    {"name": "loc_invoice_detail_buyer_email", "datatype": dbt_utils.type_string()},
    {"name": "loc_invoice_detail_buyer_name", "datatype": dbt_utils.type_string()},
    {"name": "loc_invoice_detail_client_name", "datatype": dbt_utils.type_string()},
    {"name": "loc_invoice_detail_order_number", "datatype": dbt_utils.type_string()},
    {"name": "modification_time", "datatype": dbt_utils.type_timestamp()},
    {"name": "name", "datatype": dbt_utils.type_string()},
    {"name": "organization_id", "datatype": dbt_utils.type_int()},
    {"name": "payment_model", "datatype": dbt_utils.type_string()},
    {"name": "serving_state_reasons", "datatype": dbt_utils.type_string()},
    {"name": "serving_status", "datatype": dbt_utils.type_string()},
    {"name": "start_time", "datatype": dbt_utils.type_timestamp()},
    {"name": "status", "datatype": dbt_utils.type_string()}
] %}

{{ return(columns) }}

{% endmacro %}
