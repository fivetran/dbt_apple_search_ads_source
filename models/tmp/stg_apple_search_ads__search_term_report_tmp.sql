{{ config(enabled=var('apple_search_ads__using_search_terms', True)) }}

select * from {{ var('search_term_report') }}
