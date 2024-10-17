include: "/views/core/line_item_insights_rfn.view"
include: "/views/core/youtube_dashboard_navigation_ext.view"

#->> In order to focus only on YouTube data from DV360, filter the Explore to line_item_types 'YouTube & partners' ,'Demand Generation'.

explore: line_item_insights {
  description: "Line item insights limited to DV360 line item types 'YouTube & partners' and 'Demand Generation'."
  sql_always_where: ${line_item_insights.line_item_type} IN ('YouTube & partners' ,'Demand Generation') ;;

  join: youtube_dashboard_navigation_ext {
    relationship: one_to_one
    sql:  ;;
  }
}
