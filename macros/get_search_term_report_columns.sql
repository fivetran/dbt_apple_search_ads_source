{% macro get_search_term_report_columns() %}

{% set columns = [
    {"name": "_fivetran_id", "datatype": dbt.type_string()},
    {"name": "ad_group_deleted", "datatype": "boolean"},
    {"name": "ad_group_id", "datatype": dbt.type_int()},
    {"name": "ad_group_name", "datatype": dbt.type_string()},
    {"name": "bid_amount_amount", "datatype": dbt.type_numeric()},
    {"name": "bid_amount_currency", "datatype": dbt.type_string()},
    {"name": "campaign_id", "datatype": dbt.type_int()},
    {"name": "date", "datatype": "date"},
    {"name": "deleted", "datatype": "boolean"},
    {"name": "conversions", "datatype": dbt.type_int()},
    {"name": "impressions", "datatype": dbt.type_int()},
    {"name": "keyword", "datatype": dbt.type_string()},
    {"name": "keyword_display_status", "datatype": dbt.type_string()},
    {"name": "keyword_id", "datatype": dbt.type_int()},
    {"name": "local_spend_amount", "datatype": dbt.type_numeric()},
    {"name": "local_spend_currency", "datatype": dbt.type_string()},
    {"name": "match_type", "datatype": dbt.type_string()},
    {"name": "new_downloads", "datatype": dbt.type_int()},
    {"name": "redownloads", "datatype": dbt.type_int()},
    {"name": "search_term_source", "datatype": dbt.type_string()},
    {"name": "search_term_text", "datatype": dbt.type_string()},
    {"name": "taps", "datatype": dbt.type_int()}
] %}

{{ apple_search_ads_add_pass_through_columns(
    base_columns=columns,
    pass_through_fields=var('apple_search_ads__search_term_passthrough_metrics'),
    except_fields=['conversions']
    ) }}

{{ return(columns) }}

{% endmacro %}
