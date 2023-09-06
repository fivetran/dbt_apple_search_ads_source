{{ config(enabled=var('ad_reporting__apple_search_ads_enabled', True)) }}

{{
    fivetran_utils.union_data(
        table_identifier='keyword_history', 
        database_variable='apple_search_ads_database', 
        schema_variable='apple_search_ads_schema', 
        default_database=target.database,
        default_schema='apple_search_ads',
        default_variable='keyword_history',
        union_schema_variable='apple_search_ads_union_schemas',
        union_database_variable='apple_search_ads_union_databases'
    )
}}