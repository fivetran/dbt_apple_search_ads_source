{% macro get_ad_level_report_columns() %}

{% set columns = [
    {"name": "ad_group_id", "datatype": dbt.type_int()},
    {"name": "ad_id", "datatype": dbt.type_int()},
    {"name": "campaign_id", "datatype": dbt.type_int()},
    {"name": "date", "datatype": "date"},
    {"name": "conversions", "datatype": dbt.type_int()},
    {"name": "impressions", "datatype": dbt.type_int()},
    {"name": "local_spend_amount", "datatype": dbt.type_numeric()},
    {"name": "local_spend_currency", "datatype": dbt.type_string()},
    {"name": "new_downloads", "datatype": dbt.type_int()},
    {"name": "redownloads", "datatype": dbt.type_int()},
    {"name": "taps", "datatype": dbt.type_int()}
] %}

{{ apple_search_ads_add_pass_through_columns(
    base_columns=columns,
    pass_through_fields=var('apple_search_ads__ad_passthrough_metrics'),
    except_fields=['conversions']
    ) }}

{{ return(columns) }}

{% endmacro %}
