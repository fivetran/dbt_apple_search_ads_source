{% macro get_ad_group_history_columns() %}

{% set columns = [
    {"name": "campaign_id", "datatype": dbt.type_int()},
    {"name": "end_time", "datatype": dbt.type_timestamp()},
    {"name": "id", "datatype": dbt.type_int()},
    {"name": "modification_time", "datatype": dbt.type_timestamp()},
    {"name": "name", "datatype": dbt.type_string()},
    {"name": "organization_id", "datatype": dbt.type_int()},
    {"name": "start_time", "datatype": dbt.type_timestamp()},
    {"name": "status", "datatype": dbt.type_string()},
] %}

{{ return(columns) }}

{% endmacro %}
