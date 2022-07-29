<p align="center">
    <a alt="License"
        href="https://github.com/fivetran/dbt_apple_search_ads_source/blob/main/LICENSE">
        <img src="https://img.shields.io/badge/License-Apache%202.0-blue.svg" /></a>
    <a alt="dbt-core">
        <img src="https://img.shields.io/badge/dbt_Core™_version->=1.0.0_<2.0.0-orange.svg" /></a>
    <a alt="Maintained?">
        <img src="https://img.shields.io/badge/Maintained%3F-yes-green.svg" /></a>
    <a alt="PRs">
        <img src="https://img.shields.io/badge/Contributions-welcome-blueviolet" /></a>
</p>

# Apple Search Ads Source dbt Package ([Docs](https://fivetran.github.io/dbt_apple_search_ads_source/))
# 📣 What does this dbt package do?
- Materializes [Apple Search Ads staging tables](https://fivetran.github.io/dbt_apple_search_ads_source/#!/overview/apple_search_ads_source/models/?g_v=1&g_e=seeds) which leverage data in the format described by [this ERD](https://fivetran.com/docs/applications/apple-search-ads#schemainformation). These staging tables clean, test, and prepare your Apple Search Ads data from [Fivetran's connector](https://fivetran.com/docs/applications/apple-search-ads) for analysis by doing the following:
  - Names columns for consistency across all packages and for easier analysis
  - Adds freshness tests to source data
  - Adds column-level testing where applicable. For example, all primary keys are tested for uniqueness and non-null values.
- Generates a comprehensive data dictionary of your apple_search_ads data through the [dbt docs site](https://fivetran.github.io/dbt_apple_search_ads_source/).
- These tables are designed to work simultaneously with our [Apple Search Ads transformation package](https://github.com/fivetran/dbt_apple_search_ads).

# 🎯 How do I use the dbt package?
## Step 1: Prerequisites
To use this dbt package, you must have the following:
- At least one Fivetran Apple Search Ads connector syncing data into your destination. 
- A **BigQuery**, **Snowflake**, **Redshift**, **PostgreSQL**, or **Databricks** destination.

### Databricks Dispatch Configuration
If you are using a Databricks destination with this package you will need to add the below (or a variation of the below) dispatch configuration within your `dbt_project.yml`. This is required in order for the package to accurately search for macros within the `dbt-labs/spark_utils` then the `dbt-labs/dbt_utils` packages respectively.
```yml
dispatch:
  - macro_namespace: dbt_utils
    search_order: ['spark_utils', 'dbt_utils']
```

## Step 2: Install the package
Include the following apple_search_ads_source package version in your `packages.yml` file.
> TIP: Check [dbt Hub](https://hub.getdbt.com/) for the latest installation instructions or [read the dbt docs](https://docs.getdbt.com/docs/package-management) for more information on installing packages.
```yaml
packages:
  - package: fivetran/apple_search_ads_source
    version: [">=0.1.0", "<0.2.0"]
```
## Step 3: Define database and schema variables
By default, this package runs using your destination and the `apple_search_ads` schema. If this is not where your Apple Search Ads data is (for example, if your Apple Search Ads schema is named `apple_search_ads_fivetran`), add the following configuration to your root `dbt_project.yml` file:

```yml
vars:
    apple_search_ads_database: your_destination_name
    apple_search_ads_schema: your_schema_name 
```

## (Optional) Step 4: Additional configurations
### Passing Through Additional Metrics
By default, this package will select `taps`, `impressions`, and `cost` from the source reporting tables to store into the staging models. If you would like to pass through additional metrics to the staging models, add the following configuration to your `dbt_project.yml` file:
>Please ensure you exercised due diligence when adding metrics to these models. The metrics added by default (taps, impressions, and spend) have been vetted by the Fivetran team maintaining this package for accuracy. There are metrics included within the source reports, for example metric averages, which may be inaccurately represented at the grain for reports created in this package. You will want to ensure whichever metrics you pass through are indeed appropriate to aggregate at the respective reporting levels provided in this package.

```yml
vars:
    apple_search_ads__ad_group_passthrough_metrics: ['the', 'list', 'of', 'metric', 'columns', 'to', 'include'] # from apple_search_ads.ad_group_report
    apple_search_ads__ad_passthrough_metrics: ['the', 'list', 'of', 'metric', 'columns', 'to', 'include'] # from apple_search_ads.ad_level_report
    apple_search_ads__campaign_passthrough_metrics: ['the', 'list', 'of', 'metric', 'columns', 'to', 'include'] # from apple_search_ads.campaign_report
    apple_search_ads__keyword_passthrough_metrics: ['the', 'list', 'of', 'metric', 'columns', 'to', 'include'] # from apple_search_ads.keyword_report
    apple_search_ads__search_term_passthrough_metrics: ['the', 'list', 'of', 'metric', 'columns', 'to', 'include'] # from apple_search_ads.search_term_report
```

### Enabling Addiitonal Models
It's possible that your Apple Search Ads connector does not sync every table that this package expects. If your syncs exclude certain tables, it is because you either don't use that functionality in Apple Search Ads or actively excluded some tables from your syncs. To enable the corresponding functionality in the package, you must add the relevant variables. By default, the package assumes that all variables are false. Add variables for only the tables you want to enable. 

The `apple_search_ads__using_search_terms` variable below refers to the `search_terms_report` table. You must enable the [search match](https://searchads.apple.com/help/campaigns/0006-understand-search-match) function within each ad group to populate this table with data. 

```yml
# dbt_project.yml

...
config-version: 2

vars:
  apple_search_ads__using_search_terms: true # enable if you want to include the search_term_report table and want search_term_report related metrics reported
```

### Change the build schema
By default, this package builds the Apple Search Ads staging models within a schema titled (`<target_schema>` + `_apple_search_ads_source`) in your destination. If this is not where you would like your apple_search_ads staging data to be written to, add the following configuration to your root `dbt_project.yml` file:

```yml
models:
    apple_search_ads_source:
      +schema: my_new_schema_name # leave blank for just the target_schema
```
    
### Change the source table references
If an individual source table has a different name than the package expects, add the table name as it appears in your destination to the respective variable:
> IMPORTANT: See this project's [`dbt_project.yml`](https://github.com/fivetran/dbt_apple_search_ads_source/blob/main/dbt_project.yml) variable declarations to see the expected names.
    
```yml
vars:
    apple_search_ads_<default_source_table_name>_identifier: your_table_name 
```

## (Optional) Step 5: Orchestrate your models with Fivetran Transformations for dbt Core™

Fivetran offers the ability for you to orchestrate your dbt project through [Fivetran Transformations for dbt Core™](https://fivetran.com/docs/transformations/dbt). Learn how to set up your project for orchestration through Fivetran in our [Transformations for dbt Core™ setup guides](https://fivetran.com/docs/transformations/dbt#setupguide).
    
# 🔍 Does this package have dependencies?
This dbt package is dependent on the following dbt packages. Please be aware that these dependencies are installed by default within this package. For more information on the following packages, refer to the [dbt hub](https://hub.getdbt.com/) site.
> IMPORTANT: If you have any of these dependent packages in your own `packages.yml` file, we highly recommend that you remove them from your root `packages.yml` to avoid package version conflicts.
```yml
packages:
    - package: fivetran/fivetran_utils
      version: [">=0.3.0", "<0.4.0"]

    - package: dbt-labs/dbt_utils
      version: [">=0.8.0", "<0.9.0"]
```
          
# 🙌 How is this package maintained and can I contribute?
## Package Maintenance
The Fivetran team maintaining this package _only_ maintains the latest version of the package. We highly recommend that you stay consistent with the [latest version](https://hub.getdbt.com/fivetran/apple_search_ads_source/latest/) of the package and refer to the [CHANGELOG](https://github.com/fivetran/dbt_apple_search_ads_source/blob/main/CHANGELOG.md) and release notes for more information on changes across versions.

## Contributions
A small team of analytics engineers at Fivetran develops these dbt packages. However, the packages are made better by community contributions! 

We highly encourage and welcome contributions to this package. Check out [this dbt Discourse article](https://discourse.getdbt.com/t/contributing-to-a-dbt-package/657) to learn how to contribute to a dbt package!

# 🏪 Are there any resources available?
- If you have questions or want to reach out for help, please refer to the [GitHub Issue](https://github.com/fivetran/dbt_apple_search_ads_source/issues/new/choose) section to find the right avenue of support for you.
- If you would like to provide feedback to the dbt package team at Fivetran or would like to request a new dbt package, fill out our [Feedback Form](https://www.surveymonkey.com/r/DQ7K7WW).
- Have questions or want to just say hi? Book a time during our office hours [on Calendly](https://calendly.com/fivetran-solutions-team/fivetran-solutions-team-office-hours) or email us at solutions@fivetran.com.