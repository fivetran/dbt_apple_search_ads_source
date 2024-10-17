{% macro get_keyword_report_columns() %}

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

{{ apple_search_ads_add_pass_through_columns(
    base_columns=columns,
    pass_through_fields=var('apple_search_ads__keyword_passthrough_metrics'),
    except_fields=['conversions']
    ) }}

{{ return(columns) }}

{% endmacro %}
