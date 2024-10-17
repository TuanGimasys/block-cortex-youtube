#########################################################{
# PURPOSE
# Dynamically generates html links (including filters) to support navigation between
# related youtube Dashboards.
#
# SOURCE
# Extends View template_dashboard_navigation_ext
#
# REFERENCED BY
# Explores:
#   ad_group_insights_by_ad_format
#   ad_group_insights_by_age_gender
#   ad_group_insights_by_audience
#   line_item_insights
#
# CUSTOMIZATIONS {
# While the template_dashboard_navigation_ext provides much of the logic needed, customizations
# are required.#
#   1. Updated dimension map_filter_numbers_to_dashboard_filter_names with:
#       - filter number-to-dashboard filter values as follows:
#           1   advertiser
#           2   campaign
#           3   date
#       - example syntax:
#             sql: "1|advertiser||2|campaign||3|date" ;;
#
#   2. Updated dash_bindings dimension to:
#      list the filters used on the dashboard that should be passed between dashboards in the set:
#       dashboard name                    link text               filters used
#       ---------------                   --------------------    ----------
#       youtube_1_overview                  Overview                1,2,3
#       youtube_2_campaign_line_items       Campaign Line Items     1,2,3
#       youtube_3_audience_type             Audience Type           1,2,3
#       youtube_4_ad_format                 Ad Format               1,2,3
#       youtube_5_detailed_performance      Detailed Performance    1,2,3
#
#       - example syntax:
#           "youtube_1_overview|Overview|1,2,3||youtube_2_campaign_line_items|Campaign Line Items|1,2,3||youtube_3_audience_type|Audience Type|1,2,3"
#
#   3. Updated dimension parameter_navigation_focus_page to allow values 3, 4 and 5
#
#   4. Updated hidden and label properties of filter1 to filter3. Also updated filter3 to use "type: date".
#
#   5. Added view_label = "@{label_view_for_dashboard_navigation}" for how these fields appear in the Explore
#}
#
# HOW TO USE FOR NAVIGATION {
#   1. Add to an Explore using a bare join
#         explore: line_item_insights {
#         join: youtube_dashboard_navigation_ext {
#           relationship: one_to_one
#           sql:  ;;
#           }}
#
#   2. Open the Explore and add "Dashboard Links" dimension to a Single Value Visualization.
#
#   3. Add these navigation parameters to visualization and set to desired values:
#         Navigation Style = Buttons (or if using LookML, buttons)
#         Navigation Focus Page = 1 (if adding to first dashboard listed, set to 2 if added viz to second dashboard)
#
#   4. Add navigation filters to the visualization. These filters will "listen" to the dashboard filters.
#
#   5. Add Visualization to dashboard and edit dashboard to pass the dashboard filters
#    to Filters 1 to N accordingly.
#
#    Alternatively, you can edit the dashboard LookML and the "listen" property as shown in
#    the LookML example below:
#       - name: navigation
#         explore: line_item_insights
#         type: single_value
#         fields: [youtube_dashboard_navigation_ext.navigation_links]
#         filters:
#           youtube_dashboard_navigation_ext.parameter_navigation_focus_page: '1'
#           youtube_dashboard_navigation_ext.parameter_navigation_style: 'buttons'
#         show_single_value_title: false
#         show_comparison: false
#         listen:
#           advertiser: youtube_dashboard_navigation_ext.filter1
#           campaign: youtube_dashboard_navigation_ext.filter2
#           date: youtube_dashboard_navigation_ext.filter3
#}
#########################################################}

include: "/views/core/template_dashboard_navigation_ext.view"
view: youtube_dashboard_navigation_ext {
  extends: [template_dashboard_navigation_ext]
  view_label: "@{label_view_for_dashboard_navigation}"

  dimension: map_filter_numbers_to_dashboard_filter_names {
    sql: '1|advertiser||2|campaign||3|date' ;;
    # sql: "1|date||2|business_unit||3|customer_type||4|customer_country" ;;
  }

#--> Uses constants to define the dashboard id|link text|filter set for each dashboard. See manifest to make changes
  dimension: dash_bindings {
    hidden: yes
    type: string
    sql:    "@{link_map_youtube_dash_bindings_overview}||@{link_map_youtube_dash_bindings_campaign_line_items}||@{link_map_youtube_dash_bindings_audience_type}||@{link_map_youtube_dash_bindings_ad_format}||@{link_map_youtube_dash_bindings_detailed_performance}"
      ;;
  }

  # dimension: dash_bindings {
  #   hidden: yes
  #   type: string
  #   sql:    "youtube_1_overview|Overview|1,2,3||youtube_2_campaign_line_items|Campaign Line Items|1,2,3||youtube_3_audience_type|Audience Type|1,2,3||youtube_4_ad_format|Ad Format|1,2,3||youtube_5_detailed_performance|Detailed Performance|1,2,3"
  #         ;;
  #   }

  parameter: parameter_navigation_focus_page {
    allowed_value: {value:"3"}
    allowed_value: {value:"4"}
    allowed_value: {value:"5"}
  }

  filter: filter1 { hidden: no label: "Advertiser" }
  filter: filter2 { hidden: no label: "Campaign"}
  filter: filter3 {
    type: date
    hidden: no
    label: "Date"
  }

}
