include: "/views/core/ad_group_insights_by_ad_format_rfn.view"
include: "/views/core/youtube_dashboard_navigation_ext.view"

#->> In order to focus only on YouTube data from DV360, filter the Explore to line_item_types 'YouTube & partners' ,'Demand Generation'.

explore: ad_group_insights_by_ad_format {
  label: "Ad Group Insights by Ad Format"
  description: "Ad group insights by ad format limited to DV360 line item types 'YouTube & partners' and 'Demand Generation'."
  sql_always_where: ${ad_group_insights_by_ad_format.line_item_type} IN ('YouTube & partners' ,'Demand Generation') ;;

  join: youtube_dashboard_navigation_ext {
    relationship: one_to_one
    sql:  ;;
  }

}
