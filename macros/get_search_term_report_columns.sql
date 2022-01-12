{% macro get_search_term_report_columns() %}

{% set columns = [
    {"name": "_fivetran_id", "datatype": dbt_utils.type_string()},
    {"name": "_fivetran_synced", "datatype": dbt_utils.type_timestamp()},
    {"name": "ad_group_deleted", "datatype": "boolean"},
    {"name": "ad_group_id", "datatype": dbt_utils.type_int()},
    {"name": "ad_group_name", "datatype": dbt_utils.type_string()},
    {"name": "avg_cpa_amount", "datatype": dbt_utils.type_numeric()},
    {"name": "avg_cpa_currency", "datatype": dbt_utils.type_string()},
    {"name": "avg_cpt_amount", "datatype": dbt_utils.type_numeric()},
    {"name": "avg_cpt_currency", "datatype": dbt_utils.type_string()},
    {"name": "bid_amount_amount", "datatype": dbt_utils.type_numeric()},
    {"name": "bid_amount_currency", "datatype": dbt_utils.type_string()},
    {"name": "campaign_id", "datatype": dbt_utils.type_int()},
    {"name": "conversion_rate", "datatype": dbt_utils.type_numeric()},
    {"name": "conversions", "datatype": dbt_utils.type_int()},
    {"name": "date", "datatype": "date"},
    {"name": "deleted", "datatype": "boolean"},
    {"name": "impressions", "datatype": dbt_utils.type_int()},
    {"name": "keyword", "datatype": dbt_utils.type_string()},
    {"name": "keyword_display_status", "datatype": dbt_utils.type_string()},
    {"name": "keyword_id", "datatype": dbt_utils.type_int()},
    {"name": "lat_off_installs", "datatype": dbt_utils.type_int()},
    {"name": "lat_on_installs", "datatype": dbt_utils.type_int()},
    {"name": "local_spend_amount", "datatype": dbt_utils.type_numeric()},
    {"name": "local_spend_currency", "datatype": dbt_utils.type_string()},
    {"name": "match_type", "datatype": dbt_utils.type_string()},
    {"name": "new_downloads", "datatype": dbt_utils.type_int()},
    {"name": "redownloads", "datatype": dbt_utils.type_int()},
    {"name": "search_term_source", "datatype": dbt_utils.type_string()},
    {"name": "search_term_text", "datatype": dbt_utils.type_string()},
    {"name": "tap_through_rate", "datatype": dbt_utils.type_float()},
    {"name": "taps", "datatype": dbt_utils.type_int()}
] %}

{{ return(columns) }}

{% endmacro %}
