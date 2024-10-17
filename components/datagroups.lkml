datagroup: youtube_report_default_datagroup {
  max_cache_age: "12 hour"
  sql_trigger: SELECT MAX(date) FROM `@{GCP_PROJECT_ID}.@{REPORTING_DATASET}.LineItemInsights` ;;
}
