from google.cloud import bigquery
import os

client = bigquery.Client.from_service_account_json(
    f"{os.getenv('HOME')}/gcloud-service-key.json"
)

schema_name = "apple_search_ads_source_integration_tests_stg_apple_search_ads"

tables = [
    {"seed": "ad_group_history_data", "source": "ad_group_history"},
    {"seed": "ad_group_report_data", "source": "ad_group_report"},
    {"seed": "campaign_history_data", "source": "campaign_history"},
    {"seed": "campaign_report_data", "source": "campaign_report"},
    {"seed": "keyword_history_data", "source": "keyword_history"},
    {"seed": "keyword_report_data", "source": "keyword_report"},
    {"seed": "organization_data", "source": "organization"},
]

for table_set in tables:
    delete_job = client.delete_table(
        f"{schema_name}.{table_set['source']}", not_found_ok=True
    )
    job = client.copy_table(
        f"{schema_name}.{table_set['seed']}", f"{schema_name}.{table_set['source']}"
    )
    job.result()  # Wait for the job to complete.