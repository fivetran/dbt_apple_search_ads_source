from google.cloud import bigquery
import os

client = bigquery.Client.from_service_account_json(
    f"{os.getenv('HOME')}/gcloud-service-key.json"
)

schema_name = "apple_search_ads"

tables = [
    {"seed": "ad_group_history", "source": "ad_group_history"},
    {"seed": "ad_group_report", "source": "ad_group_report"},
    {"seed": "campaign_history", "source": "campaign_history"},
    {"seed": "campaign_report", "source": "campaign_report"},
    {"seed": "keyword_history", "source": "keyword_history"},
    {"seed": "keyword_report", "source": "keyword_report"},
    {"seed": "organization", "source": "organization"},
]

for table_set in tables:
    delete_job = client.delete_table(
        f"{schema_name}.{table_set['source']}", not_found_ok=True
    )
    job = client.copy_table(
        f"{schema_name}.{table_set['seed']}", f"{schema_name}.{table_set['source']}"
    )
    job.result()  # Wait for the job to complete.