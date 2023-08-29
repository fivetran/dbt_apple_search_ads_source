ADD source_relation WHERE NEEDED + CHECK JOINS AND WINDOW FUNCTIONS! (Delete this line when done.)

{{ config(enabled=var('ad_reporting__apple_search_ads_enabled', True)) }}

{{
    fivetran_utils.union_data(
        table_identifier='ad_group_report', 
        database_variable='apple_search_ads_database', 
        schema_variable='apple_search_ads_schema', 
        default_database=target.database,
        default_schema='apple_search_ads',
        default_variable='ad_group_report_source',
        union_schema_variable='apple_search_ads_union_schemas',
        union_database_variable='apple_search_ads_union_databases'
    )
}}