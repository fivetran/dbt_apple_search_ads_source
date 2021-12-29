{% macro get_ad_group_history_columns() %}

{% set columns = [
    {"name": "_fivetran_synced", "datatype": dbt_utils.type_timestamp()},
    {"name": "automated_keywords_opt_in", "datatype": "boolean"},
    {"name": "campaign_id", "datatype": dbt_utils.type_int()},
    {"name": "cpa_goal_amount", "datatype": dbt_utils.type_numeric()},
    {"name": "cpa_goal_currency", "datatype": dbt_utils.type_string()},
    {"name": "default_cpc_bid_amount", "datatype": dbt_utils.type_numeric()},
    {"name": "default_cpc_bid_currency", "datatype": dbt_utils.type_string()},
    {"name": "deleted", "datatype": "boolean"},
    {"name": "end_time", "datatype": dbt_utils.type_timestamp()},
    {"name": "id", "datatype": dbt_utils.type_int()},
    {"name": "modification_time", "datatype": dbt_utils.type_timestamp()},
    {"name": "name", "datatype": dbt_utils.type_string()},
    {"name": "organization_id", "datatype": dbt_utils.type_int()},
    {"name": "serving_state_reasons", "datatype": dbt_utils.type_string()},
    {"name": "serving_status", "datatype": dbt_utils.type_string()},
    {"name": "start_time", "datatype": dbt_utils.type_timestamp()},
    {"name": "status", "datatype": dbt_utils.type_string()},
    {"name": "storefronts", "datatype": dbt_utils.type_string()}
] %}

{{ return(columns) }}

{% endmacro %}
