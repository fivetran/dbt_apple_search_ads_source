{% macro get_keyword_history_columns() %}

{% set columns = [
    {"name": "_fivetran_synced", "datatype": dbt_utils.type_timestamp()},
    {"name": "ad_group_id", "datatype": dbt_utils.type_int()},
    {"name": "bid_amount", "datatype": dbt_utils.type_numeric()},
    {"name": "bid_currency", "datatype": dbt_utils.type_string()},
    {"name": "campaign_id", "datatype": dbt_utils.type_int()},
    {"name": "deleted", "datatype": "boolean"},
    {"name": "id", "datatype": dbt_utils.type_int()},
    {"name": "match_type", "datatype": dbt_utils.type_string()},
    {"name": "modification_time", "datatype": dbt_utils.type_timestamp()},
    {"name": "status", "datatype": dbt_utils.type_string()},
    {"name": "text", "datatype": dbt_utils.type_string()}
] %}

{{ return(columns) }}

{% endmacro %}
