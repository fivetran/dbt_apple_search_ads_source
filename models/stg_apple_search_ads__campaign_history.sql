
with base as (

    select * 
    from {{ ref('stg_apple_search_ads__campaign_history_tmp') }}

),

fields as (

    select
        {{
            fivetran_utils.fill_staging_columns(
                source_columns=adapter.get_columns_in_relation(ref('stg_apple_search_ads__campaign_history_tmp')),
                staging_columns=get_campaign_history_columns()
            )
        }}
        
    from base
),

final as (
    
    select 
    -- rename here
    from fields
)

select * from final
