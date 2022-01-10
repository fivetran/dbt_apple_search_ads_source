
with base as (

    select * 
    from {{ ref('stg_apple_search_ads__ad_group_history_tmp') }}

),

fields as (

    select
        {{
            fivetran_utils.fill_staging_columns(
                source_columns=adapter.get_columns_in_relation(ref('stg_apple_search_ads__ad_group_history_tmp')),
                staging_columns=get_ad_group_history_columns()
            )
        }}
        
    from base
),

final as (
    
    select 
        _fivetran_synced,
        modification_time as modified_at,
        id as ad_group_id,
        campaign_id,
        deleted as is_deleted,
        start_time as start_at,
        end_time as end_at,
        name as ad_group_name,
        organization_id,
        serving_state_reasons,
        serving_status,
        status
    from fields
)

select * 
from final
