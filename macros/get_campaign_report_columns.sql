{% macro get_campaign_report_columns() %}

{% set columns = [
    {"name": "_fivetran_synced", "datatype": dbt_utils.type_timestamp()},
    {"name": "avg_cpa_currency", "datatype": dbt_utils.type_string()},
    {"name": "avg_cpt_currency", "datatype": dbt_utils.type_string()},
    {"name": "conversions", "datatype": dbt_utils.type_int()},
    {"name": "date", "datatype": "date"},
    {"name": "id", "datatype": dbt_utils.type_int()},
    {"name": "impressions", "datatype": dbt_utils.type_int()},
    {"name": "lat_off_installs", "datatype": dbt_utils.type_int()},
    {"name": "lat_on_installs", "datatype": dbt_utils.type_int()},
    {"name": "local_spend_currency", "datatype": dbt_utils.type_string()},
    {"name": "new_downloads", "datatype": dbt_utils.type_int()},
    {"name": "redownloads", "datatype": dbt_utils.type_int()},
    {"name": "tap_through_rate", "datatype": dbt_utils.type_float()},
    {"name": "taps", "datatype": dbt_utils.type_int()}
] %}

{{ return(columns) }}

{% endmacro %}
