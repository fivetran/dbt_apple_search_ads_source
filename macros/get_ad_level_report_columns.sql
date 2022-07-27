{% macro get_ad_level_report_columns() %}

{% set columns = [
    {"name": "_fivetran_synced", "datatype": dbt_utils.type_timestamp()},
    {"name": "ad_group_id", "datatype": dbt_utils.type_int()},
    {"name": "ad_id", "datatype": dbt_utils.type_int()},
    {"name": "campaign_id", "datatype": dbt_utils.type_int()},
    {"name": "date", "datatype": "date"},
    {"name": "impressions", "datatype": dbt_utils.type_int()},
    {"name": "local_spend_amount", "datatype": dbt_utils.type_numeric()},
    {"name": "local_spend_currency", "datatype": dbt_utils.type_string()},
    {"name": "new_downloads", "datatype": dbt_utils.type_int()},
    {"name": "redownloads", "datatype": dbt_utils.type_int()},
    {"name": "taps", "datatype": dbt_utils.type_int()}
] %}

{{ fivetran_utils.add_pass_through_columns(columns, var('apple_search_ads__ad_passthrough_metrics')) }}

{{ return(columns) }}

{% endmacro %}
