{{ config(enabled=var('ad_reporting__apple_search_ads_enabled', True)) }}

with base as (

    select * 
    from {{ ref('stg_apple_search_ads__ad_report_tmp') }}
),

fields as (

    select
        {{
            fivetran_utils.fill_staging_columns(
                source_columns=adapter.get_columns_in_relation(ref('stg_apple_search_ads__ad_report_tmp')),
                staging_columns=get_ad_level_report_columns()
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
        campaign_id,
        ad_group_id,
        ad_id,
        impressions,
        local_spend_amount as spend,
        local_spend_currency as currency,
        coalesce(conversions, tap_installs) as conversions, 
        coalesce(tap_installs, conversions) as tap_installs,
        coalesce(new_downloads,tap_new_downloads) as new_downloads,
        coalesce(tap_new_downloads,new_downloads) as tap_new_downloads,
        coalesce(redownloads,tap_redownloads) as redownloads,
        coalesce(tap_redownloads,redownloads) as tap_redownloads,
        taps

        {{ apple_search_ads_fill_pass_through_columns(
            pass_through_fields=var('apple_search_ads__ad_passthrough_metrics'),
            except=['conversions']) }}

    from fields
)

select *
from final
