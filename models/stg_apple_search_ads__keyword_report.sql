
with base as (

    select * 
    from {{ ref('stg_apple_search_ads__keyword_report_tmp') }}

),

fields as (

    select
        {{
            fivetran_utils.fill_staging_columns(
                source_columns=adapter.get_columns_in_relation(ref('stg_apple_search_ads__keyword_report_tmp')),
                staging_columns=get_keyword_report_columns()
            )
        }}
        
    from base
),

final as (
    
    select 
        id as keyword_id,
        date as date_day,
        conversions,
        impressions,
        local_spend_amount as spend,
        local_spend_currency as currency,
        new_downloads,
        redownloads,
        taps
        {% for metric in var('apple_search_ads__keyword_passthrough_metrics', []) %}
        , {{ metric }}
        {% endfor %}
    from fields
)

select * from final
