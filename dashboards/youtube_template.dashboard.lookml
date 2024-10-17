#########################################################{
# The Youtube template defines the following elements
# shared across youtube-related dashboards:
#
#  - Filters including default values:
#       advertiser
#       campaign
#       date
#       line_item_type - ake filter that provides note the only youtube line item types are included
#
#  - Visualization Elements:
#       dashboard_navigation - appears at top with URL links to other dashboards
#
# This template must be EXTENDED into other dashboards and
# filters/elements can be modified further as necessary
#########################################################}

- dashboard: youtube_template
  title: YouTube Dashboard Template
  layout: newspaper
  preferred_viewer: dashboards-next
  crossfilter_enabled: true
  filters_location_top: true
  description: "Template which defines core filters and elements used in YouTube dashboards."

  filters:
  - name: advertiser
    title: Advertiser
    type: field_filter
    default_value: Canada Market Sportswear Campaigns
    allow_multiple_values: false
    required: true
    ui_config:
      type: dropdown_menu
      display: inline
    explore: line_item_insights
    field: line_item_insights.advertiser

  - name: campaign
    title: Campaign
    type: field_filter
    default_value: ''
    allow_multiple_values: true
    required: false
    ui_config:
      type: advanced
      display: popover
    explore: line_item_insights
    field: line_item_insights.campaign
    listens_to_filters: [advertiser]

  - name: date
    title: Date
    type: date_filter
    default_value: ''
    allow_multiple_values: true
    required: false
    ui_config:
      type: day_range_picker
      display: inline

  - name: line_item_type
    title: 'Only these line item types are included:'
    type: field_filter
    default_value: 'YouTube & Partners, Demand Generation'
    allow_multiple_values: false
    ui_config:
      type: button_toggles
      display: inline
      options:
        - 'YouTube & Partners, Demand Generation'
    explore: line_item_insights
    field: line_item_insights.dummy_note

  elements:
  - name: dashboard_navigation
    type: single_value
    explore: line_item_insights
    fields: [youtube_dashboard_navigation_ext.navigation_links]
    filters:
      youtube_dashboard_navigation_ext.parameter_navigation_focus_page: '1'
      youtube_dashboard_navigation_ext.parameter_navigation_style: 'buttons'
    show_single_value_title: false
    listen:
      advertiser: youtube_dashboard_navigation_ext.filter1
      campaign: youtube_dashboard_navigation_ext.filter2
      date: youtube_dashboard_navigation_ext.filter3
    row: 0
    col: 0
    width: 24
    height: 1
