#!/bin/bash

. venv/bin/activate
db=$1
echo `pwd`
cd integration_tests
dbt deps
dbt seed --target "$db" --full-refresh
dbt run --vars '{jira_using_priorities: false, jira_using_sprints: false, jira_using_components: false, jira_using_versions: false}' --target "$db" --full-refresh
dbt run --target "$db" --full-refresh
dbt run --target "$db"
dbt test --target "$db"