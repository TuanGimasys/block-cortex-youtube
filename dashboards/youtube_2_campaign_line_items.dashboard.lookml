- dashboard: youtube_2_campaign_line_items
  title: YouTube Performance by Campaign Line Items
  extends: youtube_template



  elements:
  - name: dashboard_navigation
    filters:
      youtube_dashboard_navigation_ext.parameter_navigation_focus_page: 2
###############################################################################################
  # - name: header_campaign_calendar
  #   type: text
  #   body_text: "<div style=\"position: relative; text-align: center;
  #               min-height: 40px; padding: 5px;\">
  #               <span style=\"background-color: #FFFFFF; color: #808080;
  #                           font-size: 120%; font-weight: bold;
  #                           padding: 0px 30px 0 30px; height: 20px; margin-bottom: 2px;\">
  #               What Campaign Line Items have run?
  #               </span>
  #               <div style=\"border-bottom: 2px #C0C0C0 inset;
  #                   width: 100%; position: absolute; \">
  #               </div>   </div>"
  #   row: 2
  #   col: 0
  #   width: 24
  #   height: 2
  - name: header_campaign_calendar
    type: text
    body_text: "<div style=\"position: relative; text-align: center;
                     min-height: 40px; padding: 2px;
                     border-bottom: 2px #C0C0C0 inset; width: 100%;\">
                <span style=\"background-color: #FFFFFF; color: #808080;
                            font-size: 120%; font-weight: bold; height: 20px; margin-bottom: 2px;\">
                  What Campaign Line Items have run?
                </span>
               </div>"
    row: 2
    col: 0
    width: 24
    height: 2
###############################################################################################
  - name: calendar
    title: YouTube Line Items Calendar
    explore: line_item_insights
    type: looker_timeline
    fields: [line_item_insights.line_item, line_item_insights.line_item_start_date,
      line_item_insights.line_item_end_date, line_item_insights.total_impressions_formatted]
    sorts: [line_item_insights.line_item_start_date]
    groupBars: true
    labelSize: 9pt
    showLegend: true
    # color_application:
    #   collection_id: 7c56cc21-66e4-41c9-81ce-a60e1c3967b2
    #   custom:
    #     id: 165669c9-eda8-b629-9e8b-0ccab834cb96
    #     label: Custom
    #     type: continuous
    #     stops:
    #     - color: "#96d2e4"
    #       offset: 0
    #     - color: "#2da5c8"
    #       offset: 50
    #     - color: "#175364"
    #       offset: 100
    #   options:
    #     steps: 5
    #     reverse: true
    color_application:
      collection_id: 7c56cc21-66e4-41c9-81ce-a60e1c3967b2
      palette_id: 5d189dfc-4f46-46f3-822b-bfb0b61777b1
      options:
        steps: 5
    valueFormat: dd-mmm-yy
    advanced_vis_config: |-
      {
        chart: {
          spacingBottom: 40,
        },
        yAxis: {
          type: 'datetime',
          opposite: true,
          title: {},
          endOnTick: false,
          startOnTick: false,
          labels: {},
        },
        tooltip: {
          format: '<table><th style="font-size: 1.8em;text-align: left;color: #FFFFFF;"><br>{key}</th></table><table>{#each points}<br><br><tr><th style="text-align: left;font-size: 1.2em">{point.formattedStart} — {point.formattedEnd}<br>{point.magnitudeFormatted} Impressions</th></tr>{/each}',
          footerFormat: '</table>',
          // backgroundColor: '#bebeb6',
          shared: true,
          shadow: true,
          padding: 10,
        },
      }
    # advanced_vis_config: |-
    #   {
    #     yAxis: {
    #       type: 'datetime',
    #       opposite: true,
    #       title: {},
    #       endOnTick: false,
    #       startOnTick: false,
    #       labels: {},
    #       },
    #     tooltip: {
    #       animation: false,
    #       backgroundColor: 'var(--vis-color-tooltip-background)',
    #       borderRadius: 4,
    #       borderWidth: 0,
    #       followPointer: true,
    #       hideDelay: 0,
    #       outside: true,
    #       padding: 8,
    #       pointFormat: '<br/>Line Item: <br/>{point.name}<br/><br/> {point.formattedStart} — {point.formattedEnd}',
    #       shadow: false,
    #       style: {
    #         color: 'white',
    #         fontWeight: 400,
    #         fontFamily: 'inherit',
    #       },
    #     },
    #   }
    listen:
      advertiser: line_item_insights.advertiser
      campaign: line_item_insights.campaign
      date: line_item_insights.date_date
    row: 4
    col: 0
    width: 24
    height: 8
###############################################################################################
  - name: header_overall_line_item_performance
    type: text
    body_text: "<div style=\"position: relative; text-align: center;
                    min-height: 40px; padding: 2px;
                    border-bottom: 2px #C0C0C0 inset; width: 100%;\">
                <span style=\"background-color: #FFFFFF; color: #808080;
                    font-size: 120%; font-weight: bold; height: 20px; margin-bottom: 2px;\">
                What was overall line item performance?
                </span>
                </div>"
    row: 12
    col: 0
    width: 24
    height: 2
###############################################################################################
  - name: line_item_impressions
    title: Impressions
    explore: line_item_insights
    type: looker_line
    fields: [line_item_insights.line_item,
             line_item_insights.total_impressions_formatted,
             line_item_insights.cpm,
             line_item_insights.cpv]
    sorts: [line_item_insights.line_item]
    limit: 15
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: false
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: false
    show_x_axis_ticks: true
    x_axis_label_rotation: 0
    legend_position: left
    show_value_labels: false
    y_axis_combined: true
    show_null_points: false
    discontinuous_nulls: true
    interpolation: step
    point_style: circle
    y_axes: [{label: '', orientation: left,
                series: [{axisId: line_item_insights.total_impressions_formatted,
                              id: line_item_insights.total_impressions_formatted,
                              name: Total Impressions}],},
             {label: '', orientation: right,
                series: [{axisId: line_item_insights.cpm,
                              id: line_item_insights.cpm, name: CPM}],},
             {label: 'CPV', orientation: right,
                series: [{axisId: line_item_insights.cpv,
                              id: line_item_insights.cpv, name: CPV}],}]
    series_types:
      line_item_insights.total_impressions_formatted: column
    series_colors:
      # line_item_insights.total_impressions_formatted: "#E2F2D7" #D6E7C9
      line_item_insights.total_impressions_formatted: "#D6E7C9"
      line_item_insights.cpm: "#D35EFF"
      line_item_insights.cpv: "#7CB342"
    series_labels:
      line_item_insights.cpv: CPV (as applicable)
    series_point_styles:
      line_item_insights.cpm: triangle
    advanced_vis_config: |-
      {
        chart: {
          spacingBottom: 60,
        },
        tooltip: {
          // backgroundColor: '#bebeb6',
          shared: true,
          formatter: null,
          shadow: true,
          crosshairs: true,
          },
        series: [{
          dataLabels: true,
          tooltip: {
            headerFormat: '<table><th style="font-size: 1.8em;text-align: left;">{point.key}</th>',
            pointFormat: '<tr><td style="text-align: left;color:{point.color};">{series.name}:&nbsp;&nbsp;</th><td style="text-align: right;color:{point.color};" >{point.y:,.0f}</td></tr>',
            footerFormat: '</table>',
            shared: true,
          },
          },
          {
            dataLabels: false,
            tooltip: {
              headerFormat: '<table><th style="font-size: 1.8em;text-align: left;">{point.key}</th>',
              pointFormat: '<tr><td style="text-align: left;color:{point.color};">{series.name}:&nbsp;&nbsp;</th><td style="text-align: right;color:{point.color}" >${point.y:,.2f}</td></tr>',
              footerFormat: '</table>',
              shared: true,
            },
            lineWidth: 1,
          },
          {
            dataLabels: false,
            tooltip: {
              headerFormat: '<table><th style="font-size: 1.8em;text-align: left;">{point.key}</th>',
              pointFormat: '<tr><td style="text-align: left;color:{point.color};">{series.name}:&nbsp;&nbsp;</th><td style="text-align: right;color:{point.color}" >${point.y:,.3f}</td></tr>',
              footerFormat: '</table>',
              shared: true,
            },
            lineWidth: 1,
          },
          ],
        xAxis: {
          allowDecimals: false,
          gridLineColor: '#e6e6e6',
          gridLineWidth: 0,
          keepOrder: true,
          labels: {
            style: {
              cursor: 'pointer',
              fontSize: '12px',
              color: 'inherit',
              textOverflow: 'none',
              angle: 0,
            },
          },
        },
      }
    listen:
      advertiser: line_item_insights.advertiser
      campaign: line_item_insights.campaign
      date: line_item_insights.date_date
    row: 14
    col: 0
    width: 24
    height: 8
###############################################################################################
  - name: trueview_views
    title: TrueView Views
    explore: line_item_insights
    type: looker_line
    fields: [line_item_insights.line_item, line_item_insights.total_trueview_views_formatted,
      line_item_insights.trueview_vr_formatted, line_item_insights.cpv]
    filters:
      line_item_insights.total_trueview_views: ">0"
    sorts: [line_item_insights.line_item]
    limit: 15
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: false
    show_y_axis_labels: true
    show_y_axis_ticks: true
    show_x_axis_label: false
    show_x_axis_ticks: true
    legend_position: left
    show_null_points: false
    discontinuous_nulls: true
    interpolation: step
    point_style: circle
    y_axes: [{label: '', orientation: left,
                series: [{axisId: line_item_insights.total_trueview_views_formatted,
                              id: line_item_insights.total_trueview_views_formatted,
                            name: Total TrueView Views}],},
            {label: '', orientation: right,
                series: [{axisId: line_item_insights.trueview_vr_formatted,
                              id: line_item_insights.trueview_vr_formatted,
                            name: TrueView VR}], valueFormat: 0"%" },
            {label: '', orientation: right,
                series: [{axisId: line_item_insights.cpv,
                              id: line_item_insights.cpv,
                           name: CPV}], }]
    series_types:
      line_item_insights.total_trueview_views_formatted: column
    series_colors:
      line_item_insights.cpv: "#7CB342"
      line_item_insights.total_trueview_views_formatted: "#FCDEC8"
      line_item_insights.trueview_vr_formatted: "#EA4335"
    series_point_styles:
      line_item_insights.trueview_vr_formatted: triangle
    x_axis_label_rotation: 0
    show_dropoff: false
    advanced_vis_config: |-
      {
        chart: {
          spacingBottom: 60,
        },
        tooltip: {
          shared: true,
          formatter: null,
          crosshairs: true,
        },
        series: [{
          dataLabels: true,
          tooltip: {
            headerFormat: '<table><th style="font-size: 1.8em;text-align: left;">{point.key}</th>',
            pointFormat: '<tr><td style="text-align: left;color:{point.color};">{series.name}:&nbsp;&nbsp;</th><td style="text-align: right;color:{point.color};" >{point.y:,.0f}</td></tr>',
            footerFormat: '</table>',
            shared: true,
          },
          },
          {
            dataLabels: false,
            tooltip: {
              headerFormat: '<table><th style="font-size: 1.8em;text-align: left;">{point.key}</th>',
              pointFormat: '<tr><td style="text-align: left;color:{point.color};">{series.name}:&nbsp;&nbsp;</th><td style="text-align: right;color:{point.color}" >{point.y:,.1f}%</td></tr>',
              footerFormat: '</table>',
              shared: true,
            },
            lineWidth: 1,
          },
          {
            dataLabels: false,
            tooltip: {
              headerFormat: '<table><th style="font-size: 1.8em;text-align: left;">{point.key}</th>',
              pointFormat: '<tr><td style="text-align: left;color:{point.color};">{series.name}:&nbsp;&nbsp;</th><td style="text-align: right;color:{point.color}" >${point.y:,.3f}</td></tr>',
              footerFormat: '</table>',
              shared: true,
            },
            lineWidth: 1,
          },
          ],
        xAxis: {
          allowDecimals: false,
          gridLineColor: '#E6E6E6',
          gridLineWidth: 0,
          keepOrder: true,
          labels: {
            style: {
              cursor: 'pointer',
              fontSize: '12px',
              color: 'inherit',
              textOverflow: 'none',
              angle: 0,
            },
          },
        },
      }
    listen:
      advertiser: line_item_insights.advertiser
      campaign: line_item_insights.campaign
      date: line_item_insights.date_date
    row: 22
    col: 0
    width: 24
    height: 8
###############################################################################################
  - name: clicks
    title: Clicks
    explore: line_item_insights
    type: looker_line
    fields: [line_item_insights.line_item, line_item_insights.total_clicks_formatted, line_item_insights.cpc,
      line_item_insights.ctr_formatted]
    sorts: [line_item_insights.line_item]
    limit: 15
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: false
    show_y_axis_labels: true
    show_y_axis_ticks: true
    show_x_axis_label: false
    show_x_axis_ticks: true
    legend_position: left
    y_axis_combined: true
    show_null_points: false
    discontinuous_nulls: true
    interpolation: step
    point_style: circle
    y_axes: [{label: '', orientation: left,
                  series: [{axisId: line_item_insights.total_clicks_formatted,
                                id: line_item_insights.total_clicks_formatted,
                              name: Total Clicks}], },
             {label: '', orientation: right,
                series: [{axisId: line_item_insights.cpc,
                              id: line_item_insights.cpc,
                            name: CPC}], },
             {label: '', orientation: right,
                series: [{axisId: line_item_insights.ctr_formatted,
                              id: line_item_insights.ctr_formatted,
                            name: CTR}], valueFormat: 0.00"%"}]
    series_types:
      line_item_insights.total_clicks_formatted: column
    series_colors:
      line_item_insights.total_clicks_formatted: "#D1E2F5"
      # line_item_insights.cpc: "#1A73E8" #3388F0 #4DA0F7
      line_item_insights.cpc: "#4DA0F7"
      line_item_insights.ctr_formatted: "#E52592"
    series_point_styles:
      line_item_insights.ctr_formatted: diamond
    x_axis_label_rotation: 0
    advanced_vis_config: |-
      {
        chart: {
          spacingBottom: 80,
        },
        tooltip: {
          shared: true,
          formatter: null,
          crosshairs: true,
        },
        series: [{
          dataLabels: true,
          tooltip: {
            headerFormat: '<table><th style="font-size: 1.8em;text-align: left;">{point.key}</th>',
            pointFormat: '<tr><td style="text-align: left;color:{point.color};">{series.name}:</th><td style="text-align: right;color:{point.color};" >{point.y:,.0f}&emsp;&emsp;&emsp;</td></tr>',
            footerFormat: '</table>',
            shared: true,
          },
          },
          {
            dataLabels: false,
            tooltip: {
              headerFormat: '<table><th style="font-size: 1.8em;text-align: left;">{point.key}</th>',
              pointFormat: '<tr><td style="text-align: left;color:{point.color};">{series.name}:</th><td style="text-align: right;color:{point.color}" >${point.y:,.2f}&emsp;&emsp;&emsp;</td></tr>',
              footerFormat: '</table>',
              shared: true,
            },
            lineWidth: 1,
          },
          {
            dataLabels: false,
            tooltip: {
              headerFormat: '<table><th style="font-size: 1.8em;text-align: left;">{point.key}</th>',
              pointFormat: '<tr><td style="text-align: left;color:{point.color};">{series.name}:</th><td style="text-align: right;color:{point.color}" >{point.y:,.3f}%&emsp;&emsp;&emsp;</td></tr>',
              footerFormat: '</table>',
              shared: true,
            },
            lineWidth: 1,
          },
          ],
        xAxis: {
          allowDecimals: false,
          gridLineColor: '#e6e6e6',
          gridLineWidth: 0,
          keepOrder: true,
          labels: {
            style: {
              cursor: 'pointer',
              fontSize: '12px',
              color: 'inherit',
              textOverflow: 'none',
              angle: 0,
            },
          },
        },
      }
    listen:
      advertiser: line_item_insights.advertiser
      campaign: line_item_insights.campaign
      date: line_item_insights.date_date
    row: 30
    col: 0
    width: 24
    height: 10
###############################################################################################
  - name: header_device_type
    type: text
    body_text: "<div style=\"position: relative; text-align: center;
                      min-height: 40px; padding: 2px;
                      border-bottom: 2px #C0C0C0 inset; width: 100%;\">
                <span style=\"background-color: #FFFFFF; color: #808080;
                      font-size: 120%; font-weight: bold; height: 20px; margin-bottom: 2px;\">
                What device did I reach users on?
                </span>
                </div>"
    row: 40
    col: 0
    width: 24
    height: 2
###############################################################################################
  - name: by_device_type
    title: Impressions by Device Type
    explore: line_item_insights
    type: looker_column
    fields: [line_item_insights.line_item, line_item_insights.total_impressions_formatted,
      line_item_insights.device_type_sorted]
    pivots: [line_item_insights.device_type_sorted]
    fill_fields: [line_item_insights.device_type_sorted]
    filters: {}
    sorts: [line_item_insights.device_type_sorted desc, line_item_insights.line_item]
    limit: 15
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_y_axis_labels: true
    show_y_axis_ticks: true
    show_x_axis_label: false
    show_x_axis_ticks: true
    stacking: normal
    legend_position: left
    point_style: none
    label_density: 25
    show_null_labels: false
    show_totals_labels: true
    show_silhouette: false
    totals_color: "#808080"
    color_application:
      collection_id: 7c56cc21-66e4-41c9-81ce-a60e1c3967b2
      palette_id: 5d189dfc-4f46-46f3-822b-bfb0b61777b1
      options:
        steps: 5
        reverse: false
    x_axis_label_rotation: 0
    column_group_spacing_ratio: 0.15
    advanced_vis_config: |-
      {
        chart: {
          spacingBottom: 60,
        },
        tooltip: {
          format: '<table><th style="font-size: 1.8em;text-align: left;">{key}</th></table><table>{#each points}<tr><th style="text-align: left;color:{point.color};">{series.name}:&nbsp;&nbsp;&nbsp;</th><td style="text-align: right;color:{point.color};" >{point.y:,.0f} ({point.percentage:.0f}%)</td></tr>{/each}',
          footerFormat: '</table>',
          shared: true
        },
        xAxis: {
          allowDecimals: false,
          gridLineColor: '#e6e6e6',
          gridLineWidth: 0,
          keepOrder: true,
          labels: {
            style: {
              cursor: 'pointer',
              fontSize: '12px',
              color: 'inherit',
              textOverflow: 'none',
              angle: 0,
            },
          },
        },
      }
    listen:
      advertiser: line_item_insights.advertiser
      campaign: line_item_insights.campaign
      date: line_item_insights.date_date
    row: 42
    col: 0
    width: 24
    height: 10
