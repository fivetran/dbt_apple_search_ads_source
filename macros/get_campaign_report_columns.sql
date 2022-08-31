{% macro get_campaign_report_columns() %}

{% set columns = [
    {"name": "date", "datatype": "date"},
    {"name": "id", "datatype": dbt_utils.type_int()},
    {"name": "impressions", "datatype": dbt_utils.type_int()},
    {"name": "local_spend_amount", "datatype": dbt_utils.type_numeric()},
    {"name": "local_spend_currency", "datatype": dbt_utils.type_string()},
    {"name": "new_downloads", "datatype": dbt_utils.type_int()},
    {"name": "redownloads", "datatype": dbt_utils.type_int()},
    {"name": "taps", "datatype": dbt_utils.type_int()}
] %}

{{ fivetran_utils.add_pass_through_columns(columns, var('apple_search_ads__campaign_passthrough_metrics')) }}

{{ return(columns) }}

{% endmacro %}
