{% macro get_organization_columns() %}

{% set columns = [
    {"name": "currency", "datatype": dbt.type_string()},
    {"name": "id", "datatype": dbt.type_int()},
    {"name": "name", "datatype": dbt.type_string()},
    {"name": "payment_model", "datatype": dbt.type_string()},
    {"name": "time_zone", "datatype": dbt.type_string()}
] %}

{{ return(columns) }}

{% endmacro %}
