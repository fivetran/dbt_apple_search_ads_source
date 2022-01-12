
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
        row_number() over (partition by id order by modification_time desc) = 1 as is_most_recent_record,
        id as ad_group_id,
        campaign_id,
        start_time as start_at,
        end_time as end_at,
        name as ad_group_name,
        organization_id,
        serving_state_reasons,
        serving_status,
        status
    from fields
    {% if target.type == 'snowflake' -%}
        where deleted = 'false'
    {% else -%}
        where deleted is false
    {% endif %}
)

select * from final
