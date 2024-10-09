{% macro get_campaign_report_columns() %}

{% set columns = [
    {"name": "date", "datatype": "date"},
    {"name": "id", "datatype": dbt.type_int()},
    {"name": "conversions", "datatype": dbt.type_int()},
    {"name": "impressions", "datatype": dbt.type_int()},
    {"name": "local_spend_amount", "datatype": dbt.type_numeric()},
    {"name": "local_spend_currency", "datatype": dbt.type_string()},
    {"name": "new_downloads", "datatype": dbt.type_int()},
    {"name": "redownloads", "datatype": dbt.type_int()},
    {"name": "taps", "datatype": dbt.type_int()}
] %}

{{ fivetran_utils.add_pass_through_columns(columns, var('apple_search_ads__campaign_passthrough_metrics')) }}

{{ return(columns) }}

{% endmacro %}
