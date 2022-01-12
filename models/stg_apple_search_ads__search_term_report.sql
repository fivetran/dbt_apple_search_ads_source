{{ config(enabled=var('apple_search_ads__using_search_terms', True)) }}

with base as (

    select * 
    from {{ ref('stg_apple_search_ads__search_term_report_tmp') }}

),

fields as (

    select
        {{
            fivetran_utils.fill_staging_columns(
                source_columns=adapter.get_columns_in_relation(ref('stg_apple_search_ads__search_term_report_tmp')),
                staging_columns=get_search_term_report_columns()
            )
        }}
        
    from base
),

final as (
    
    select 
        _fivetran_id,
        _fivetran_synced,
        ad_group_id,
        campaign_id,
        date,
        ad_group_name,
        bid_amount_amount as bid_amount,
        bid_amount_currency as bid_currency,
        keyword as keyword_text,
        keyword_display_status,
        keyword_id,
        local_spend_amount,
        local_spend_currency,
        match_type as keyword_match_type,
        search_term_source,
        search_term_text,
        impressions,
        taps,
        new_downloads,
        redownloads
    from fields
    where deleted is false
        and ad_group_deleted is false
)

select * from final
