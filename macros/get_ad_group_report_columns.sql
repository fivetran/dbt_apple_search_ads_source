{% macro get_ad_group_report_columns() %}

{% set columns = [
    {"name": "_fivetran_synced", "datatype": dbt_utils.type_timestamp()},
    {"name": "ad_group_id", "datatype": dbt_utils.type_int()},
    {"name": "avg_cpa_amount", "datatype": dbt_utils.type_numeric()},
    {"name": "avg_cpa_currency", "datatype": dbt_utils.type_string()},
    {"name": "avg_cpt_amount", "datatype": dbt_utils.type_numeric()},
    {"name": "avg_cpt_currency", "datatype": dbt_utils.type_string()},
    {"name": "conversion_rate", "datatype": dbt_utils.type_numeric()},
    {"name": "conversions", "datatype": dbt_utils.type_int()},
    {"name": "date", "datatype": "date"},
    {"name": "impressions", "datatype": dbt_utils.type_int()},
    {"name": "lat_off_installs", "datatype": dbt_utils.type_int()},
    {"name": "lat_on_installs", "datatype": dbt_utils.type_int()},
    {"name": "local_spend_amount", "datatype": dbt_utils.type_numeric()},
    {"name": "local_spend_currency", "datatype": dbt_utils.type_string()},
    {"name": "new_downloads", "datatype": dbt_utils.type_int()},
    {"name": "redownloads", "datatype": dbt_utils.type_int()},
    {"name": "tap_through_rate", "datatype": dbt_utils.type_float()},
    {"name": "taps", "datatype": dbt_utils.type_int()}
] %}

{{ return(columns) }}

{% endmacro %}
