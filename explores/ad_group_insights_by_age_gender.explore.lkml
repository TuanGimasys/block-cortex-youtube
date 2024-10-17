include: "/views/core/ad_group_insights_by_age_gender_rfn.view"
include: "/views/core/youtube_dashboard_navigation_ext.view"

#->> In order to focus only on YouTube data from DV360, filter the Explore to line_item_types 'YouTube & partners' ,'Demand Generation'.

explore: ad_group_insights_by_age_gender {
  label: "Ad Group Insights by Age & Gender"
  description: "Ad group insights by age and gender limited to DV360 line item types 'YouTube & partners' and 'Demand Generation'."
  sql_always_where: ${ad_group_insights_by_age_gender.line_item_type} IN ('YouTube & partners' ,'Demand Generation') ;;

  join: youtube_dashboard_navigation_ext {
    relationship: one_to_one
    sql:  ;;
  }

}
