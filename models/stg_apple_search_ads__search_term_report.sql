ADD source_relation WHERE NEEDED + CHECK JOINS AND WINDOW FUNCTIONS! (Delete this line when done.)

{{ config(enabled=fivetran_utils.enabled_vars(['ad_reporting__apple_search_ads_enabled','apple_search_ads__using_search_terms'])) }}

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
        _fivetran_id,
        campaign_id,
        ad_group_id,
        ad_group_name,
        bid_amount_amount as bid_amount,
        bid_amount_currency as bid_currency,
        keyword as keyword_text,
        keyword_display_status,
        keyword_id,
        local_spend_amount as spend,
        local_spend_currency as currency,
        match_type,
        search_term_source,
        search_term_text,
        impressions,
        taps,
        new_downloads,
        redownloads

        {{ fivetran_utils.fill_pass_through_columns('apple_search_ads__search_term_passthrough_metrics') }}
    from fields
)

select * 
from final
