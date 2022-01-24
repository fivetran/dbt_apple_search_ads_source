
with base as (

    select * 
    from {{ ref('stg_apple_search_ads__creative_set_report_tmp') }}

),

fields as (

    select
        {{
            fivetran_utils.fill_staging_columns(
                source_columns=adapter.get_columns_in_relation(ref('stg_apple_search_ads__creative_set_report_tmp')),
                staging_columns=get_creative_set_report_columns()
            )
        }}
        
    from base
),

final as (
    
    select 
        _fivetran_synced,
        _fivetran_id,
        org_id as organization_id,
        campaign_id,
        ad_group_id,
        ad_format,
        date as date_day,
        creative_set_name,
        creative_set_id,
        creation_time as created_at,
        display_status,
        local_spend_amount as spend,
        local_spend_currency as currency,
        impressions,
        new_downloads,
        redownloads,
        taps
    from fields
    {% if target.type == 'snowflake' -%}
        where deleted = 'false'
    {% else -%}
        where deleted is false
    {% endif %}
)

select * from final
