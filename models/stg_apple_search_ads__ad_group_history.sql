{{ config(enabled=var('ad_reporting__apple_search_ads_enabled', True)) }}

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
        
    
        {{ fivetran_utils.source_relation(
            union_schema_variable='apple_search_ads_union_schemas', 
            union_database_variable='apple_search_ads_union_databases') 
        }}

    from base
),

final as (

    select
        source_relation, 
        modification_time as modified_at,
        organization_id,
        campaign_id,
        name as ad_group_name,
        id as ad_group_id,
        status as ad_group_status,
        start_time as start_at,
        end_time as end_at,
        row_number() over (partition by source_relation, id order by modification_time desc) = 1 as is_most_recent_record
    from fields
)

select * 
from final
