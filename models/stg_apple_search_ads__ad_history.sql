
with base as (

    select * 
    from {{ ref('stg_apple_search_ads__ad_history_tmp') }}
),

fields as (

    select
        {{
            fivetran_utils.fill_staging_columns(
                source_columns=adapter.get_columns_in_relation(ref('stg_apple_search_ads__ad_history_tmp')),
                staging_columns=get_ad_history_columns()
            )
        }}
    from base
),

final as (
    
    select 
        creation_time as created_at,
        modification_time as modified_at,
        org_id as oranization_id,
        campaign_id,
        ad_group_id,
        name as ad_name,
        id as ad_id,
        creative_id,
        creative_type,
        status as ad_status
    from fields
    {% if target.type == 'snowflake' -%}
    where deleted = 'false'
    {% else -%}
    where not deleted
    {% endif %}
)

select *
from final
