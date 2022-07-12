
with base as (

    select * 
    from {{ ref('stg_apple_search_ads__organization_tmp') }}

),

fields as (

    select
        {{
            fivetran_utils.fill_staging_columns(
                source_columns=adapter.get_columns_in_relation(ref('stg_apple_search_ads__organization_tmp')),
                staging_columns=get_organization_columns()
            )
        }}
        
    from base
),

final as (
    
    select 
        id as organization_id,
        currency,
        payment_model,
        name as organization_name,
        time_zone
    from fields
)

select * from final
