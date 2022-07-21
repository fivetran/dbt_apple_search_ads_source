{% macro get_ad_history_columns() %}

{% set columns = [
    {"name": "_fivetran_synced", "datatype": dbt_utils.type_timestamp()},
    {"name": "ad_group_id", "datatype": dbt_utils.type_int()},
    {"name": "campaign_id", "datatype": dbt_utils.type_int()},
    {"name": "creation_time", "datatype": dbt_utils.type_timestamp()},
    {"name": "creative_id", "datatype": dbt_utils.type_int()},
    {"name": "creative_type", "datatype": dbt_utils.type_string()},
    {"name": "deleted", "datatype": "boolean"},
    {"name": "id", "datatype": dbt_utils.type_int()},
    {"name": "modification_time", "datatype": dbt_utils.type_timestamp()},
    {"name": "name", "datatype": dbt_utils.type_string()},
    {"name": "org_id", "datatype": dbt_utils.type_int()},
    {"name": "serving_status", "datatype": dbt_utils.type_string()},
    {"name": "status", "datatype": dbt_utils.type_string()}
] %}

{{ return(columns) }}

{% endmacro %}
