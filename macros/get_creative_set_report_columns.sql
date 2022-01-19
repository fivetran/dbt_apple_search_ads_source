{% macro get_creative_set_report_columns() %}

{% set columns = [
    {"name": "_fivetran_id", "datatype": dbt_utils.type_string()},
    {"name": "_fivetran_synced", "datatype": dbt_utils.type_timestamp()},
    {"name": "ad_format", "datatype": dbt_utils.type_string()},
    {"name": "ad_group_creative_set_id", "datatype": dbt_utils.type_int()},
    {"name": "ad_group_id", "datatype": dbt_utils.type_int()},
    {"name": "avg_cpa_amount", "datatype": dbt_utils.type_numeric()},
    {"name": "avg_cpa_currency", "datatype": dbt_utils.type_string()},
    {"name": "avg_cpt_amount", "datatype": dbt_utils.type_numeric()},
    {"name": "avg_cpt_currency", "datatype": dbt_utils.type_string()},
    {"name": "campaign_id", "datatype": dbt_utils.type_int()},
    {"name": "conversion_rate", "datatype": dbt_utils.type_numeric()},
    {"name": "conversions", "datatype": dbt_utils.type_int()},
    {"name": "creation_time", "datatype": "datetime"},
    {"name": "creative_set_id", "datatype": dbt_utils.type_int()},
    {"name": "creative_set_language_display_name", "datatype": dbt_utils.type_string()},
    {"name": "creative_set_name", "datatype": dbt_utils.type_string()},
    {"name": "date", "datatype": "date"},
    {"name": "deleted", "datatype": "boolean"},
    {"name": "display_status", "datatype": dbt_utils.type_string()},
    {"name": "impressions", "datatype": dbt_utils.type_int()},
    {"name": "lat_off_installs", "datatype": dbt_utils.type_int()},
    {"name": "lat_on_installs", "datatype": dbt_utils.type_int()},
    {"name": "local_spend_amount", "datatype": dbt_utils.type_numeric()},
    {"name": "local_spend_currency", "datatype": dbt_utils.type_string()},
    {"name": "modification_time", "datatype": dbt_utils.type_timestamp()},
    {"name": "new_downloads", "datatype": dbt_utils.type_int()},
    {"name": "org_id", "datatype": dbt_utils.type_int()},
    {"name": "redownloads", "datatype": dbt_utils.type_int()},
    {"name": "status", "datatype": dbt_utils.type_string()},
    {"name": "tap_through_rate", "datatype": dbt_utils.type_float()},
    {"name": "taps", "datatype": dbt_utils.type_int()}
] %}

{{ return(columns) }}

{% endmacro %}
