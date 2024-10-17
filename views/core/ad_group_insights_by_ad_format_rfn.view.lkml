#########################################################{
# SOURCES
# Refines view ad_group_insights_by_ad_format
# Extends view dv360_common_fields_ext
#
# REFERENCED BY
# Explore ad_group_insights_by_ad_format
#
# EXTENDED FIELDS
#    labels/descriptions for common dimensions
#    total_impressions, total_clicks, ctr, cpm, cpc, etc...
#
# NOTES
# - use this refinement to modify fields found in base
#   and/or add new dimensions and measures
#########################################################}

include: "/views/base/ad_group_insights_by_ad_format.view"
include: "/views/core/youtube_common_fields_ext.view"

view: +ad_group_insights_by_ad_format {
  extends: [youtube_common_fields_ext]
  label: "Ad  Group Insights by Ad Format"

  dimension: ad_group_insights_by_ad_format_pk {
    type: string
    primary_key: yes
    hidden: yes
    sql: CONCAT(${pk_date_string}, CAST(${youtube_ad_group_id} AS STRING), ${youtube_ad_format})) ;;
  }

  dimension: trueview_ad_group {
    label: "TrueView Ad Group"
  }

  dimension: youtube_ad_format {
    label: "YouTube Ad Format"
  }

  dimension: youtube_ad_group_id {
    label: "YouTube Ad Group ID"
    value_format_name: id
  }

  dimension: youtube_engagements {
    hidden: yes
    label: "YouTube Engagements"
  }

  measure: total_youtube_engagements {
    type: sum
    label: "Total YouTube Engagements"
    description: "For YouTube video action campaigns: The number of clicks on the ad or 10 seconds of viewing time. If both happen, only the click is counted. For all other YouTube ads: The number of clicks on interactive video elements, such as teasers or expanding cards, that don't take users to an external site"
    sql: ${youtube_engagements} ;;
  }


}
