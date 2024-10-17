- dashboard: youtube_1_overview
  title: YouTube Performance Overview
  extends: youtube_template

  elements:
  - name: header_overall_performance
    type: text
    body_text: "<div style=\"position: relative; text-align: center;
                      min-height: 40px; padding: 2px;
                      border-bottom: 2px #C0C0C0 inset; width: 100%;\">
                <span style=\"background-color: #FFFFFF; color: #808080;
                      font-size: 120%; font-weight: bold; height: 20px; margin-bottom: 2px;\">
                Overall Performance
                </span>
                </div>"
    row: 2
    col: 0
    width: 24
    height: 2
###############################################################################################
  - name: impressions
    title: 'Impressions'
    explore: line_item_insights
    type: single_value
    fields: [line_item_insights.total_impressions_formatted,
            line_item_insights.cpm,
            line_item_insights.total_trueview_views_formatted,
            line_item_insights.cpv,
            line_item_insights.trueview_vr,
            line_item_insights.cpc,
            line_item_insights.total_clicks_formatted,
            line_item_insights.ctr,
            line_item_insights.total_spend_formatted]
    hidden_fields: [line_item_insights.cpm,
                    line_item_insights.total_trueview_views_formatted,
                    line_item_insights.cpv,
                    line_item_insights.trueview_vr,
                    line_item_insights.cpc,
                    line_item_insights.total_clicks_formatted,
                    line_item_insights.ctr,
                    line_item_insights.total_spend_formatted]
    note_state: collapsed
    note_display: hover
    note_text: The number of times your ad was viewed for a specific duration depending
      on ad format.
    listen:
      advertiser: line_item_insights.advertiser
      campaign: line_item_insights.campaign
      date: line_item_insights.date_date
    row: 3
    col: 0
    width: 5
    height: 2
###############################################################################################
  - name: cpm
    title: 'CPM'
    explore: line_item_insights
    type: single_value
    fields: [line_item_insights.total_impressions_formatted,
            line_item_insights.cpm,
            line_item_insights.total_trueview_views_formatted,
            line_item_insights.cpv,
            line_item_insights.trueview_vr,
            line_item_insights.cpc,
            line_item_insights.total_clicks_formatted,
            line_item_insights.ctr,
            line_item_insights.total_spend_formatted]
    hidden_fields: [line_item_insights.total_impressions_formatted,
                    line_item_insights.total_trueview_views_formatted,
                    line_item_insights.cpv, line_item_insights.trueview_vr,
                    line_item_insights.cpc,
                    line_item_insights.total_clicks_formatted,
                    line_item_insights.ctr,
                    line_item_insights.total_spend_formatted]
    note_state: collapsed
    note_display: hover
    note_text: The average cost for 1,000 impressions.
    listen:
      advertiser: line_item_insights.advertiser
      campaign: line_item_insights.campaign
      date: line_item_insights.date_date
    row: 3
    col: 5
    width: 5
    height: 2
###############################################################################################
  - name: ctr
    title: 'CTR'
    explore: line_item_insights
    type: single_value
    fields: [line_item_insights.total_impressions_formatted,
            line_item_insights.cpm,
            line_item_insights.total_trueview_views_formatted,
            line_item_insights.cpv,
            line_item_insights.trueview_vr,
            line_item_insights.cpc,
            line_item_insights.total_clicks_formatted,
            line_item_insights.ctr,
            line_item_insights.total_spend_formatted]
    hidden_fields: [line_item_insights.total_clicks_formatted,
                    line_item_insights.total_impressions_formatted,
                    line_item_insights.total_spend_formatted,
                    line_item_insights.total_trueview_views_formatted,
                    line_item_insights.trueview_vr,
                    line_item_insights.cpm,
                    line_item_insights.cpc,
                    line_item_insights.cpv]
    note_state: collapsed
    note_display: hover
    note_text: The number of clicks on the ad divided by the number of impressions.
    listen:
      advertiser: line_item_insights.advertiser
      campaign: line_item_insights.campaign
      date: line_item_insights.date_date
    row: 3
    col: 10
    width: 5
    height: 2
###############################################################################################
  - name: cpv
    title: 'CPV'
    explore: line_item_insights
    type: single_value
    fields: [line_item_insights.total_impressions_formatted,
            line_item_insights.cpm,
            line_item_insights.total_trueview_views_formatted,
            line_item_insights.cpv,
            line_item_insights.trueview_vr,
            line_item_insights.cpc,
            line_item_insights.total_clicks_formatted,
            line_item_insights.ctr,
            line_item_insights.total_spend_formatted]
    hidden_fields: [line_item_insights.total_impressions_formatted,
                    line_item_insights.cpm,
                    line_item_insights.total_trueview_views_formatted,
                    line_item_insights.trueview_vr,
                    line_item_insights.cpc,
                    line_item_insights.total_clicks_formatted,
                    line_item_insights.ctr,
                    line_item_insights.total_spend_formatted]
    note_state: collapsed
    note_display: hover
    note_text: The average cost per TrueView view.
    listen:
      advertiser: line_item_insights.advertiser
      campaign: line_item_insights.campaign
      date: line_item_insights.date_date
    row: 3
    col: 15
    width: 5
    height: 2
###############################################################################################
  - name: trueview_vr
    title: 'TrueView VR'
    explore: line_item_insights
    type: single_value
    fields: [line_item_insights.total_impressions_formatted,
            line_item_insights.cpm,
            line_item_insights.total_trueview_views_formatted,
            line_item_insights.cpv,
            line_item_insights.trueview_vr,
            line_item_insights.cpc,
            line_item_insights.total_clicks_formatted,
            line_item_insights.ctr,
            line_item_insights.total_spend_formatted]
    hidden_fields: [line_item_insights.total_impressions_formatted,
                    line_item_insights.cpm,
                    line_item_insights.total_trueview_views_formatted,
                    line_item_insights.cpv,
                    line_item_insights.cpc,
                    line_item_insights.total_clicks_formatted,
                    line_item_insights.ctr,
                    line_item_insights.total_spend_formatted]
    note_state: collapsed
    note_display: hover
    note_text: The number of TrueView views over the number of impressions.
    listen:
      advertiser: line_item_insights.advertiser
      campaign: line_item_insights.campaign
      date: line_item_insights.date_date
    row: 3
    col: 20
    width: 4
    height: 2
###############################################################################################
# Row 2 of KPIs
  - name: clicks
    title: 'Clicks'
    explore: line_item_insights
    type: single_value
    fields: [line_item_insights.total_impressions_formatted,
            line_item_insights.cpm,
            line_item_insights.total_trueview_views_formatted,
            line_item_insights.cpv,
            line_item_insights.trueview_vr,
            line_item_insights.cpc,
            line_item_insights.total_clicks_formatted,
            line_item_insights.ctr,
            line_item_insights.total_spend_formatted]
    hidden_fields: [line_item_insights.total_impressions_formatted,
                    line_item_insights.total_trueview_views_formatted,
                    line_item_insights.total_spend_formatted,
                    line_item_insights.trueview_vr,
                    line_item_insights.ctr,
                    line_item_insights.cpv,
                    line_item_insights.cpm,
                    line_item_insights.cpc]
    note_state: collapsed
    note_display: hover
    note_text: Total number of clicks on the ad.
    listen:
      advertiser: line_item_insights.advertiser
      campaign: line_item_insights.campaign
      date: line_item_insights.date_date
    row: 5
    col: 0
    width: 5
    height: 2
###############################################################################################
  - name: cpc
    title: 'CPC'
    explore: line_item_insights
    type: single_value
    fields: [line_item_insights.total_impressions_formatted,
            line_item_insights.cpm,
            line_item_insights.total_trueview_views_formatted,
            line_item_insights.cpv,
            line_item_insights.trueview_vr,
            line_item_insights.cpc,
            line_item_insights.total_clicks_formatted,
            line_item_insights.ctr,
            line_item_insights.total_spend_formatted]
    hidden_fields: [line_item_insights.cpm,
                    line_item_insights.cpv,
                    line_item_insights.ctr,
                    line_item_insights.total_clicks_formatted,
                    line_item_insights.total_impressions_formatted,
                    line_item_insights.total_spend_formatted,
                    line_item_insights.total_trueview_views_formatted,
                    line_item_insights.trueview_vr]
    note_state: collapsed
    note_display: hover
    note_text: The average cost per click.
    listen:
      advertiser: line_item_insights.advertiser
      campaign: line_item_insights.campaign
      date: line_item_insights.date_date
    row: 5
    col: 5
    width: 5
    height: 2
###############################################################################################
  - name: total_trueview_views
    title: 'TrueView Views'
    explore: line_item_insights
    type: single_value
    fields: [line_item_insights.total_impressions_formatted,
            line_item_insights.cpm,
            line_item_insights.total_trueview_views_formatted,
            line_item_insights.cpv,
            line_item_insights.trueview_vr,
            line_item_insights.cpc,
            line_item_insights.total_clicks_formatted,
            line_item_insights.ctr,
            line_item_insights.total_spend_formatted]
    hidden_fields: [line_item_insights.total_impressions_formatted,
                    line_item_insights.cpm,
                    line_item_insights.cpv,
                    line_item_insights.trueview_vr,
                    line_item_insights.cpc,
                    line_item_insights.total_clicks_formatted,
                    line_item_insights.ctr,
                    line_item_insights.total_spend_formatted]
    note_state: collapsed
    note_display: hover
    note_text: The number of times your ad was viewed for a specific duration depending
      on ad format.
    listen:
      advertiser: line_item_insights.advertiser
      campaign: line_item_insights.campaign
      date: line_item_insights.date_date
    row: 5
    col: 10
    width: 5
    height: 2
###############################################################################################
  - name: spend
    title: 'Total Spend'
    explore: line_item_insights
    type: single_value
    fields: [line_item_insights.total_impressions_formatted,
            line_item_insights.cpm,
            line_item_insights.total_trueview_views_formatted,
            line_item_insights.cpv,
            line_item_insights.trueview_vr,
            line_item_insights.cpc,
            line_item_insights.total_clicks_formatted,
            line_item_insights.ctr,
            line_item_insights.total_spend_formatted]
    hidden_fields: [line_item_insights.cpc,
                    line_item_insights.cpm,
                    line_item_insights.cpv,
                    line_item_insights.ctr,
                    line_item_insights.total_clicks_formatted,
                    line_item_insights.total_impressions_formatted,
                    line_item_insights.total_trueview_views_formatted,
                    line_item_insights.trueview_vr]
    note_state: collapsed
    note_display: hover
    note_text: The total cost of media across the campaigns shown.
    listen:
      advertiser: line_item_insights.advertiser
      campaign: line_item_insights.campaign
      date: line_item_insights.date_date
    row: 5
    col: 15
    width: 9
    height: 2
###############################################################################################
  - name: header_campaign_performance
    type: text
    body_text: "<div style=\"position: relative; text-align: center;
                      min-height: 40px; padding: 2px;
                      border-bottom: 2px #C0C0C0 inset; width: 100%;\">
                <span style=\"background-color: #FFFFFF; color: #808080;
                      font-size: 120%; font-weight: bold; height: 20px; margin-bottom: 2px;\">
                What was the performance by month?
                </span>
                </div>"
    row: 7
    col: 0
    width: 24
    height: 2
###############################################################################################
  - name: monthly_campaign_performance
    explore: line_item_insights
    type: looker_line
    fields: [line_item_insights.total_impressions_formatted, line_item_insights.date_month,
      line_item_insights.cpm, line_item_insights.cpv]
    fill_fields: [line_item_insights.date_month]
    sorts: [line_item_insights.date_month]
    title_hidden: true
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density_custom: 5
    show_x_axis_label: false
    show_x_axis_ticks: true
    x_axis_datetime_label: "%b %y"
    legend_position: left
    y_axis_combined: true
    show_null_points: false
    discontinuous_nulls: true
    interpolation: step
    point_style: circle
    y_axes: [
           {label: '', orientation: left,
              series: [{axisId: line_item_insights.total_impressions_formatted,
                            id: line_item_insights.total_impressions_formatted,
                          name: Total Impressions}],},
          {label: '', orientation: right,
            series: [{axisId: line_item_insights.cpm,
                          id: line_item_insights.cpm, name: CPM}],},
          {label: CPV, orientation: right,
            series: [{axisId: line_item_insights.cpv,
                          id: line_item_insights.cpv, name: CPV}],}]
    series_types:
      line_item_insights.total_impressions_formatted: column
    series_colors:
      # line_item_insights.total_impressions_formatted: "#E2F2D7" #D6E7C9
      # line_item_insights.cpm: "#9334E6" #A042F3 #D35EFF #C750FF
      line_item_insights.total_impressions_formatted: "#D6E7C9"
      line_item_insights.cpm: "#D35EFF"
      line_item_insights.cpv: "#7CB342"
    series_labels:
      line_item_insights.cpv: CPV (as applicable)
    series_point_styles:
      line_item_insights.cpm: triangle
    advanced_vis_config: |-
      {
        tooltip: {
         // backgroundColor: '#bebeb6',
          shared: true,
          formatter: null,
          shadow: true,
        },
        series: [{
            dataLabels: true,
            tooltip: {
              headerFormat: '<table><th style="font-size: 1.8em;text-align: left;color: #FFFFFF;">{point.key}</th>',
              pointFormat: '<tr><th style="text-align: left;color:{point.color};">{series.name}:&nbsp;&nbsp;</th><td style="text-align: right;color:{point.color};" >{point.y:,.0f}</td></tr>',
              footerFormat: '</table>',
              shared: true,
            },
          },
          {
            dataLabels: false,
            tooltip: {
              headerFormat: '<table><th style="font-size: 1.8em;text-align: left;color: #FFFFFF;">{point.key}</th>',
              pointFormat: '<tr><th style="text-align: left;color:{point.color};">{series.name}:&nbsp;&nbsp;</th><td style="text-align: right;color:{point.color};" >${point.y:,.2f}</td></tr>',
              footerFormat: '</table>',
              shared: true,
            },
            lineWidth: 1,
          },
          {
            dataLabels: false,
            tooltip: {
              headerFormat: '<table><th style="font-size: 1.8em;text-align: left;color: #FFFFFF;">{point.key}</th>',
              pointFormat: '<tr><th style="text-align: left;color:{point.color};">{series.name}:&nbsp;&nbsp;</th><td style="text-align: right;color:{point.color};" >${point.y:,.3f}</td></tr>',
              footerFormat: '</table>',
              shared: true,
            },
            lineWidth: 1,
          },
        ],
      }
    listen:
      advertiser: line_item_insights.advertiser
      campaign: line_item_insights.campaign
      date: line_item_insights.date_date
    row: 9
    col: 0
    width: 24
    height: 9
###############################################################################################
  - name: header_cumulative_spend
    type: text
    body_text: "<div style=\"position: relative; text-align: center;
                      min-height: 40px; padding: 2px;
                      border-bottom: 2px #C0C0C0 inset; width: 100%;\">
                <span style=\"background-color: #FFFFFF; color: #808080;
                      font-size: 120%; font-weight: bold; height: 20px; margin-bottom: 2px;\">
                Cumulative Spend
                </span>
                </div>"
    row: 16
    col: 0
    width: 24
    height: 2
###############################################################################################
  - name: cumulative_spend
    explore: line_item_insights
    type: looker_line
    fields: [line_item_insights.date_month, line_item_insights.cumulative_total_spend_formatted]
    fill_fields: [line_item_insights.date_month]
    sorts: [line_item_insights.date_month]
    title_hidden: true
    show_x_axis_label: false
    hide_legend: true
    show_null_points: true
    point_style: none
    y_axes: [{label: '', orientation: left,
              series: [{axisId: line_item_insights.cumulative_total_spend_formatted,
                            id: line_item_insights.cumulative_total_spend_formatted,
                          name: Cumulative Spend}],}]
    series_types:
      line_item_insights.cumulative_total_spend_formatted: area
    series_colors:
      # line_item_insights.cumulative_total_spend_formatted: "#2186b0" #3399cc #4db8e6
      line_item_insights.cumulative_total_spend_formatted: "#4db8e6"
    x_axis_datetime_label: "%b %y"
    reference_lines: [{reference_type: line, line_value: max, range_start: max, range_end: min,
        margin_top: deviation, margin_value: mean, margin_bottom: deviation, label_position: right,
        color: "#000000"}, {reference_type: line, line_value: min, range_start: max,
        range_end: min, margin_top: deviation, margin_value: mean, margin_bottom: deviation,
        label_position: left, color: "#000000"}]
    advanced_vis_config: |-
      {
        tooltip: {
          format: '<table><th style="font-size: 1.8em;text-align: left;color: #FFFFFF;">{key}</th></table><table>{#each points}<tr><th style="text-align: left;color:{point.color};">{series.name}:&nbsp;&nbsp;&nbsp;</th><td style="text-align: right;color:{point.color};" >${point.y:,.0f}</td></tr>{/each}',
          footerFormat: '</table>',
         // backgroundColor: '#bebeb6',
          shared: true,
          formatter: null,
          shadow: true,
          },
        series: [{
          name: "Cumulative Spend",
          lineWidth: 3,
          marker: {
            enabled: false
          },
        }, ],
        yAxis: [{
          plotLines: [{
              color: '#transparent',
              label: {
                align: 'right',
                verticalAlign: 'top',
                x: -5,
                y: 2,
              },
            },
            {
              color: '#transparent',
              label: {
                align: 'left',
                verticalAlign: 'bottom',
                x: 0,
                y: -1,
              },
            },
          ],
        }, ],
      }
    listen:
      advertiser: line_item_insights.advertiser
      campaign: line_item_insights.campaign
      date: line_item_insights.date_date
    row: 19
    col: 0
    width: 24
    height: 9
