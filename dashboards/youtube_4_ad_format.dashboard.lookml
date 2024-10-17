- dashboard: youtube_4_ad_format
  title: YouTube Performance by Ad Format
  extends: youtube_template

  elements:
  - name: dashboard_navigation
    explore: ad_group_insights_by_ad_format
    filters:
      youtube_dashboard_navigation_ext.parameter_navigation_focus_page: 4
###############################################################################################
  - name: header_demographic_breakdown
    type: text
    body_text: "<div style=\"position: relative; text-align: center;
                      min-height: 40px; padding: 2px;
                      border-bottom: 2px #C0C0C0 inset; width: 100%;\">
                <span style=\"background-color: #FFFFFF; color: #808080;
                      font-size: 120%; font-weight: bold; height: 20px; margin-bottom: 2px;\">
                What was the performance by YouTube Ad Format?
                </span>
                </div>"
    row: 2
    col: 0
    width: 24
    height: 2
###############################################################################################
  - name: impressiona_by_ad_format
    title: Impressions by YouTube Ad Format
    explore: ad_group_insights_by_ad_format
    type: looker_line
    fields: [ad_group_insights_by_ad_format.youtube_ad_format,
            ad_group_insights_by_ad_format.total_impressions,
            ad_group_insights_by_ad_format.cpm,
            ad_group_insights_by_ad_format.ctr_formatted]
    sorts: [ad_group_insights_by_ad_format.youtube_ad_format]
    limit: 5
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: false
    show_y_axis_labels: true
    show_y_axis_ticks: true
    show_x_axis_label: false
    show_x_axis_ticks: true
    x_axis_label_rotation: 0
    legend_position: center
    y_axis_combined: true
    show_null_points: false
    discontinuous_nulls: true
    interpolation: step
    point_style: circle
    y_axes: [{label: '', orientation: left, valueFormat: '[>1000000]0.0,,"M";[>1000]0.0,"K";0',
                series: [{axisId: ad_group_insights_by_ad_format.total_impressions,
                              id: ad_group_insights_by_ad_format.total_impressions,
                            name: Total Impressions}],},
             {label: '', orientation: right,
                series: [{axisId: ad_group_insights_by_ad_format.cpm,
                              id: ad_group_insights_by_ad_format.cpm,
                            name: CPM}], },
             {label: '', orientation: right,
                series: [{axisId: ad_group_insights_by_ad_format.ctr_formatted,
                              id: ad_group_insights_by_ad_format.ctr_formatted,
                            name: CTR}], valueFormat: 0.00"%"}]
    series_types:
      ad_group_insights_by_ad_format.total_impressions: column
    series_colors:
      ad_group_insights_by_ad_format.total_impressions: "#D6E7C9"
      ad_group_insights_by_ad_format.ctr_formatted: "#E52592"
      ad_group_insights_by_ad_format.cpm: "#D35EFF"
    series_point_styles:
      ad_group_insights_by_ad_format.cpm: triangle
    advanced_vis_config: |-
      {
        chart: {},
        // caption: {
        //   text: '<h1 style="font-size:1.5em; ">∅ means CPV is not applicable.</h1>'
        // },
        legend: {
          verticalAlign: 'bottom',
          align: 'center',
          alignColumns: true,
          padding: 35
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
                pointFormat: '<tr><td style="text-align: left;color:{point.color};">{series.name}:&nbsp;&nbsp;</th><td style="text-align: right;color:{point.color}" >{point.y:,.2f}%</td></tr>',
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
      advertiser: ad_group_insights_by_ad_format.advertiser
      campaign: ad_group_insights_by_ad_format.campaign
      date: ad_group_insights_by_ad_format.date_date
    row: 4
    col: 0
    width: 12
    height: 10
###############################################################################################
  - name: views_by_ad_format
    title: TrueView Views by YouTube Ad Format
    explore: ad_group_insights_by_ad_format
    type: looker_line
    fields: [ad_group_insights_by_ad_format.youtube_ad_format,
            ad_group_insights_by_ad_format.total_trueview_views,
            ad_group_insights_by_ad_format.trueview_vr_formatted,
            ad_group_insights_by_ad_format.cpv]
    filters:
      ad_group_insights_by_ad_format.total_trueview_views: ">0"
    sorts: [ad_group_insights_by_ad_format.youtube_ad_format]
    limit: 5
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: false
    show_y_axis_labels: true
    show_y_axis_ticks: true
    show_x_axis_label: false
    show_x_axis_ticks: true
    x_axis_label_rotation: 0
    legend_position: center
    show_null_points: false
    discontinuous_nulls: true
    interpolation: step
    point_style: circle
    y_axes: [{label: '', orientation: left, valueFormat: '[>1000000]0.0,,"M";[>1000]0.0,"K";0',
                series: [{axisId: ad_group_insights_by_ad_format.total_trueview_views,
                              id: ad_group_insights_by_ad_format.total_trueview_views,
                            name: Total TrueView Views}], },
              {label: '', orientation: right,
                  series: [{axisId: ad_group_insights_by_ad_format.trueview_vr_formatted,
                                id: ad_group_insights_by_ad_format.trueview_vr_formatted,
                              name: TrueView VR}], valueFormat: 0"%"},
              {label: '', orientation: right,
                  series: [{axisId: ad_group_insights_by_ad_format.cpv,
                                id: ad_group_insights_by_ad_format.cpv,
                              name: CPV}], }]
    series_types:
      ad_group_insights_by_ad_format.total_trueview_views: column
    series_colors:
      ad_group_insights_by_ad_format.cpv: "#7CB342"
      ad_group_insights_by_ad_format.total_trueview_views: "#FCDEC8"
      ad_group_insights_by_ad_format.trueview_vr_formatted: "#EA4335"
    series_point_styles:
      ad_group_insights_by_ad_format.trueview_vr_formatted: triangle
    advanced_vis_config: |-
      {
        legend: {
          verticalAlign: 'bottom',
          align: 'center',
          alignColumns: true,
          padding: 35
        },
        tooltip: {
          shared: true,
          formatter: null,
          crosshairs: true,
        },
        series: [{
          dataLabels: true,
          tooltip: {
            headerFormat: '<table><th style="font-size: 1.8em;text-align: left;">Males {point.key}</th>',
            pointFormat: '<tr><td style="text-align: left;color:{point.color};">{series.name}:&nbsp;&nbsp;</th><td style="text-align: right;color:{point.color};" >{point.y:,.0f}</td></tr>',
            footerFormat: '</table>',
            shared: true,
          },
          },
          {
            dataLabels: false,
            tooltip: {
              headerFormat: '<table><th style="font-size: 1.8em;text-align: left;">Males {point.key}</th>',
              pointFormat: '<tr><td style="text-align: left;color:{point.color};">{series.name}:&nbsp;&nbsp;</th><td style="text-align: right;color:{point.color}" >{point.y:,.2f}%</td></tr>',
              footerFormat: '</table>',
              shared: true,
            },
            lineWidth: 1,
          },
          {
            dataLabels: false,
            tooltip: {
              headerFormat: '<table><th style="font-size: 1.8em;text-align: left;">Males {point.key}</th>',
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
      advertiser: ad_group_insights_by_ad_format.advertiser
      campaign: ad_group_insights_by_ad_format.campaign
      date: ad_group_insights_by_ad_format.date_date
    row: 14
    col: 12
    width: 12
    height: 10
