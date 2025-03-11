# dbt_apple_search_ads_source v0.5.0
[PR #54](https://github.com/fivetran/dbt_apple_search_ads_source/pull/54) includes the following updates:

## Breaking Changes: Apple Search Ads API v5 schema updates
- Following the connector updates surrounding the Apple Search Ads API v5 release, the following fields have been introduced to the package and will be used to sunset the below fields, which will be deprecated shortly:
- `tap_installs` - new version of `conversions`
- `tap_new_downloads` - new version of `new_downloads`
- `tap_redownloads` - new version of `redownloads`

## Documentation
- Corrected references to connectors and connections in the README. ([#52](https://github.com/fivetran/dbt_apple_search_ads_source/pull/52))

# dbt_apple_search_ads_source v0.4.0
[PR #50](https://github.com/fivetran/dbt_apple_search_ads_source/pull/50) includes the following **BREAKING CHANGE** updates:

## Feature Updates: Conversion Support
- Added the `conversions` source field to each `stg_apple_search_ads__*_report` model.
> NOTE: There is no direct `conversion_value` field available in Apple Search Ads data. See the Apple Search Ads transform package [DECISIONLOG](https://github.com/fivetran/dbt_apple_search_ads/blob/main/DECISIONLOG.md#conversion-value) for more details on alternatives.
- If you are already passing in these fields via the [passthrough columns](https://github.com/fivetran/dbt_apple_search_ads?tab=readme-ov-file#passing-through-additional-metrics), the package will automatically prevent "duplicate column" errors.
> Breaking change: This update impacts users not previously including `conversions` via passthrough columns.

## Under the Hood
- Introduced the `apple_search_ads_fill_pass_through_columns` and `apple_search_ads_add_pass_through_columns` macros to maintain compatibility for users already passing conversion fields through passthrough columns.

# dbt_apple_search_ads_source v0.3.0
[PR #45](https://github.com/fivetran/dbt_apple_search_ads_source/pull/45) includes the following updates:
## Breaking changes
- Updated the source identifier format for consistency with their respective source names and compatibility with the `fivetran_utils.union_data` macro. If you are using the previous identifier, be sure to update to the current version! Identifiers now are:

| current  | previous |
|----------|----------|
|apple_search_ads_ad_level_report_identifier | apple_search_ads_ad_report_identifier |

## Feature update 🎉
- Unioning capability! This adds the ability to union source data from multiple apple_search_ads connectors. Refer to the [Union Multiple Connectors README section](https://github.com/fivetran/dbt_apple_search_ads_source/blob/main/README.md#union-multiple-connectors) for more details.

## Under the hood 🚘
- Updated tmp models to union source data using the `fivetran_utils.union_data` macro. 
- To distinguish which source each field comes from, added `source_relation` column in each staging model and applied the `fivetran_utils.source_relation` macro.
- Updated tests to account for the new `source_relation` column.

# dbt_apple_search_ads_source v0.2.2
## Bug Fix
- The `apple_search_ads__search_term_passthrough_metrics` variable was moved to be within the return call of the `get_search_term_report_columns` macro. The previous placement caused an issue where the passthrough metrics would not properly persist to downstream models. ([PR #42](https://github.com/fivetran/dbt_apple_search_ads_source/pull/42))
## Under the Hood:
- Incorporated the new `fivetran_utils.drop_schemas_automation` macro into the end of each Buildkite integration test job. ([PR #40](https://github.com/fivetran/dbt_apple_search_ads_source/pull/40))
- Updated the pull request [templates](/.github). ([PR #40](https://github.com/fivetran/dbt_apple_search_ads_source/pull/40))
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
