{{ config(enabled=var('ad_reporting__apple_search_ads_enabled', True)) }}

with base as (

    select * 
    from {{ ref('stg_apple_search_ads__campaign_report_tmp') }}
),

fields as (

    select
        {{
            fivetran_utils.fill_staging_columns(
                source_columns=adapter.get_columns_in_relation(ref('stg_apple_search_ads__campaign_report_tmp')),
                staging_columns=get_campaign_report_columns()
            )
        }}
    from base
),

final as (
    
    select 
        date as date_day,
        id as campaign_id,
        impressions,
        local_spend_amount as spend,
        local_spend_currency as currency,
        new_downloads,
        redownloads,
        taps

        {{ fivetran_utils.fill_pass_through_columns('apple_search_ads__campaign_passthrough_metrics') }}
    from fields
)

select * 
from final
