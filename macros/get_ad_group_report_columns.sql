{% macro get_ad_group_report_columns() %}

{% set columns = [
    {"name": "ad_group_id", "datatype": dbt_utils.type_int()},
    {"name": "date", "datatype": "date"},
    {"name": "impressions", "datatype": dbt_utils.type_int()},
    {"name": "local_spend_amount", "datatype": dbt_utils.type_numeric()},
    {"name": "local_spend_currency", "datatype": dbt_utils.type_string()},
    {"name": "new_downloads", "datatype": dbt_utils.type_int()},
    {"name": "redownloads", "datatype": dbt_utils.type_int()},
    {"name": "taps", "datatype": dbt_utils.type_int()}
] %}

{{ return(columns) }}

{% endmacro %}
