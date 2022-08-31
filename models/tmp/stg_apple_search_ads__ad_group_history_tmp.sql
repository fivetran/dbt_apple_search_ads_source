{{ config(enabled=var('ad_reporting__apple_search_ads_enabled', True)) }}

select * 
from {{ var('ad_group_history') }}
