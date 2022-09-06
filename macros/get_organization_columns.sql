{% macro get_organization_columns() %}

{% set columns = [
    {"name": "currency", "datatype": dbt_utils.type_string()},
    {"name": "id", "datatype": dbt_utils.type_int()},
    {"name": "name", "datatype": dbt_utils.type_string()},
    {"name": "payment_model", "datatype": dbt_utils.type_string()},
    {"name": "time_zone", "datatype": dbt_utils.type_string()}
] %}

{{ return(columns) }}

{% endmacro %}
