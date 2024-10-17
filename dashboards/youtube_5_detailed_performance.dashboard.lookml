- dashboard: youtube_5_detailed_performance
  title:  YouTube Detailed Performance

  extends: youtube_template
  crossfilter_enabled: false

  elements:
  - name: dashboard_navigation
    filters:
      youtube_dashboard_navigation_ext.parameter_navigation_focus_page: 5
###############################################################################################
  - name: detailed_performance
    title: Detailed YouTube Performance
    explore: line_item_insights
    type: looker_grid
    fields: [line_item_insights.campaign, line_item_insights.insertion_order, line_item_insights.line_item,
      line_item_insights.total_impressions, line_item_insights.cpm, line_item_insights.trueview_vr,
      line_item_insights.cpv, line_item_insights.total_trueview_views, line_item_insights.total_clicks,
      line_item_insights.cpc, line_item_insights.ctr, line_item_insights.total_spend]
    sorts: [line_item_insights.campaign]
    show_row_numbers: true
    truncate_text: true
    size_to_fit: true
    table_theme: white
    header_text_alignment: left
    header_font_size: '12'
    rows_font_size: '12'
    truncate_header: false
    minimum_column_width: 75
    series_labels:
      line_item_insights.total_impressions: Impressions
      line_item_insights.total_clicks: Clicks
      line_item_insights.total_trueview_views: TrueView Views
      line_item_insights.trueview_vr: TrueView VR
    series_column_widths:
      line_item_insights.campaign: 212
      line_item_insights.insertion_order: 271
      line_item_insights.line_item: 206
      line_item_insights.total_impressions: 85
      line_item_insights.cpm: 75
    series_cell_visualizations:
      line_item_insights.total_impressions:
        is_active: false
    listen:
      advertiser: line_item_insights.advertiser
      campaign: line_item_insights.campaign
      date: line_item_insights.date_date
    row: 2
    col: 0
    width: 24
    height: 10
