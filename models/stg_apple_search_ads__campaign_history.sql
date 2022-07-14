
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
        modification_time as modified_at,
        organization_id,
        name as campaign_name,
        id as campaign_id,
        status as campaign_status,
        start_time as start_at,
        end_time as end_at,
        row_number() over (partition by id order by modification_time desc) = 1 as is_most_recent_record
    from fields
    {% if target.type == 'snowflake' -%}
    where deleted = 'false'
    {% else -%}
    where not deleted
    {% endif %}
)

select * from final
