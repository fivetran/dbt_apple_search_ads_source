{{ config(enabled=fivetran_utils.enabled_vars(['ad_reporting__apple_search_ads_enabled','apple_search_ads__using_search_terms'])) }}

select * 
from {{ var('search_term_report') }}
