{% macro get_keyword_history_columns() %}

{% set columns = [
    {"name": "ad_group_id", "datatype": dbt.type_int()},
    {"name": "bid_amount", "datatype": dbt.type_numeric()},
    {"name": "bid_currency", "datatype": dbt.type_string()},
    {"name": "campaign_id", "datatype": dbt.type_int()},
    {"name": "id", "datatype": dbt.type_int()},
    {"name": "match_type", "datatype": dbt.type_string()},
    {"name": "modification_time", "datatype": dbt.type_timestamp()},
    {"name": "status", "datatype": dbt.type_string()},
    {"name": "text", "datatype": dbt.type_string()}
] %}

{{ return(columns) }}

{% endmacro %}
