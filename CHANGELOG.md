# dbt_apple_search_ads_source v0.UPDATE.UPDATE

 ## Under the Hood:

- Incorporated the new `fivetran_utils.drop_schemas_automation` macro into the end of each Buildkite integration test job.
- Updated the pull request [templates](/.github).
# dbt_apple_search_ads_source v0.2.1

## 🕷️ Bugfixes 🕷️
- Updated enabled config for `search_term_report` source to correctly handle `and` operation between invoked vars. [#37](https://github.com/fivetran/dbt_apple_search_ads_source/pull/36)

## Contributors

[@nszoni](https://github.com/nszoni) ([#37](https://github.com/fivetran/dbt_apple_search_ads_source/pull/37))

# dbt_apple_search_ads_source v0.2.0

## 🚨 Breaking Changes 🚨:
[PR #33](https://github.com/fivetran/dbt_apple_search_ads_source/pull/33) includes the following breaking changes:
- Dispatch update for dbt-utils to dbt-core cross-db macros migration. Specifically `{{ dbt_utils.<macro> }}` have been updated to `{{ dbt.<macro> }}` for the below macros:
    - `any_value`
    - `bool_or`
    - `cast_bool_to_text`
    - `concat`
    - `date_trunc`
    - `dateadd`
    - `datediff`
    - `escape_single_quotes`
    - `except`
    - `hash`
    - `intersect`
    - `last_day`
    - `length`
    - `listagg`
    - `position`
    - `replace`
    - `right`
    - `safe_cast`
    - `split_part`
    - `string_literal`
    - `type_bigint`
    - `type_float`
    - `type_int`
    - `type_numeric`
    - `type_string`
    - `type_timestamp`
    - `array_append`
    - `array_concat`
    - `array_construct`
- For `current_timestamp` and `current_timestamp_in_utc` macros, the dispatch AND the macro names have been updated to the below, respectively:
    - `dbt.current_timestamp_backcompat`
    - `dbt.current_timestamp_in_utc_backcompat`
- `packages.yml` has been updated to reflect new default `fivetran/fivetran_utils` version, previously `[">=0.3.0", "<0.4.0"]` now `[">=0.4.0", "<0.5.0"]`.

## 🕷️ Bugfixes 🕷️
- Updated the default value for `apple_search_ads__using_search_terms` to `true` to be consistent across Ad Reporting and the rest of this package in the `src_apple_search_ads.yml` for the `search_term_report`. [#36](https://github.com/fivetran/dbt_apple_search_ads_source/pull/36)
- Updated `README` to show package dependency matrix. [#36](https://github.com/fivetran/dbt_apple_search_ads_source/pull/36)

# dbt_apple_search_ads_source v0.1.2

This [PR #21](https://github.com/fivetran/dbt_apple_search_ads_source/pull/21) updates macros for history tables to only include columns that are referenced downstream.
# dbt_apple_search_ads_source v0.1.0 - v0.1.1

## Initial Release
- This is the initial release of this package. For more information refer to the [README](/README.md).
