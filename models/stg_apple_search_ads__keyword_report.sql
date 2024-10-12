{{ config(enabled=var('ad_reporting__apple_search_ads_enabled', True)) }}

with base as (

    select * 
    from {{ ref('stg_apple_search_ads__keyword_report_tmp') }}
),

fields as (

    select
        {{
            fivetran_utils.fill_staging_columns(
                source_columns=adapter.get_columns_in_relation(ref('stg_apple_search_ads__keyword_report_tmp')),
                staging_columns=get_keyword_report_columns()
            )
        }}     
    
        {{ fivetran_utils.source_relation(
            union_schema_variable='apple_search_ads_union_schemas', 
            union_database_variable='apple_search_ads_union_databases') 
        }}

    from base
),

final as (

    select
        source_relation, 
        date as date_day,
        id as keyword_id,
        conversions,
        impressions,
        local_spend_amount as spend,
        local_spend_currency as currency,
        new_downloads,
        redownloads,
        taps

        {{ apple_search_ads_fill_pass_through_columns(
            pass_through_fields=var('apple_search_ads__keyword_passthrough_metrics'),
            except=['conversions']) }}

    from fields
)

select * 
from final
