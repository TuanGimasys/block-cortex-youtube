- dashboard: youtube_3_audience_type
  title: YouTube Perfomance by Audience Type
  extends: youtube_template
  crossfilter_enabled: false

  elements:
  - name: dashboard_navigation
    explore: ad_group_insights_by_age_gender
    filters:
      youtube_dashboard_navigation_ext.parameter_navigation_focus_page: 3
###############################################################################################
  - name: header_demographic_breakdown
    type: text
    body_text: "<div style=\"position: relative; text-align: center;
                      min-height: 40px; padding: 2px;
                      border-bottom: 2px #C0C0C0 inset; width: 100%;\">
                <span style=\"background-color: #FFFFFF; color: #808080;
                      font-size: 120%; font-weight: bold; height: 20px; margin-bottom: 2px;\">
                What was the performance by demographic breakdown?
                </span>
                </div>"
    row: 2
    col: 0
    width: 24
    height: 2
###############################################################################################
  - name: impressions_by_age_group_and_gender
    title: Impressions by Age Group and Gender
    explore: ad_group_insights_by_age_gender
    type: looker_line
    fields: [ad_group_insights_by_age_gender.total_impressions,
             ad_group_insights_by_age_gender.cpm,
             ad_group_insights_by_age_gender.ctr_formatted,
             ad_group_insights_by_age_gender.youtube_age,
             ad_group_insights_by_age_gender.gender]
    pivots: [ad_group_insights_by_age_gender.gender]
    filters:
      ad_group_insights_by_age_gender.gender: Male,Female
    sorts: [ad_group_insights_by_age_gender.gender, ad_group_insights_by_age_gender.youtube_age]
    show_x_axis_label: false
    x_axis_label_rotation: 0
    trellis: pivot
    trellis_rows: 2
    hide_legend: false
    legend_position: center
    show_null_points: false
    discontinuous_nulls: true
    interpolation: step
    point_style: circle
    y_axes: [{label: '', orientation: left, valueFormat: '[>1000000]0.0,,"M";[>1000]0.0,"K";0',
                series: [{axisId: ad_group_insights_by_age_gender.total_impressions,
                              id: Female - ad_group_insights_by_age_gender.total_impressions,
                            name: Female Impressions},
                        {axisId: ad_group_insights_by_age_gender.total_impressions,
                              id: Male - ad_group_insights_by_age_gender.total_impressions,
                            name: Male Impressions}],
                        showLabels: true, showValues: true},
              {label: CPM, orientation: right,
                  series: [{axisId: ad_group_insights_by_age_gender.cpm,
                                id: Female - ad_group_insights_by_age_gender.cpm,
                              name: Female CPM},
                          {axisId: ad_group_insights_by_age_gender.cpm,
                              id: Male - ad_group_insights_by_age_gender.cpm,
                              name: Male CPM}],
                          showLabels: true, showValues: true},
            {label: '', orientation: right,
                  series: [{axisId: ad_group_insights_by_age_gender.ctr_formatted,
                                id: Female - ad_group_insights_by_age_gender.ctr_formatted,
                              name: Female CTR},
                          {axisId: ad_group_insights_by_age_gender.ctr_formatted,
                                id: Male - ad_group_insights_by_age_gender.ctr_formatted,
                              name: Male CTR}],
                          valueFormat: 0.00"%"}]
    series_types:
      Female - ad_group_insights_by_age_gender.total_impressions: column
      Male - ad_group_insights_by_age_gender.total_impressions: column
    series_colors:
      Female - ad_group_insights_by_age_gender.total_impressions: "#D6E7C9"
      Male - ad_group_insights_by_age_gender.total_impressions: "#D6E7C9"
      Male - ad_group_insights_by_age_gender.cpm: "#D35EFF"
      Female - ad_group_insights_by_age_gender.cpm: "#D35EFF"
      Male - ad_group_insights_by_age_gender.ctr_formatted: "#E52592"
      Female - ad_group_insights_by_age_gender.ctr_formatted: "#E52592"
    series_labels:
      Female - ad_group_insights_by_age_gender.total_impressions: Female Impressions
      Male - ad_group_insights_by_age_gender.total_impressions: Male Impressions
      Female - ad_group_insights_by_age_gender.cpm: Female CPM
      Male - ad_group_insights_by_age_gender.cpm: Male CPM
      Female - ad_group_insights_by_age_gender.ctr_formatted: Female CTR
      Male - ad_group_insights_by_age_gender.ctr_formatted: Male CTR
    series_point_styles:
      Male - ad_group_insights_by_age_gender.cpm: diamond
      Female - ad_group_insights_by_age_gender.cpm: diamond
    listen:
      advertiser: ad_group_insights_by_age_gender.advertiser
      campaign: ad_group_insights_by_age_gender.campaign
      date: ad_group_insights_by_age_gender.date_date
    row: 4
    col: 0
    width: 24
    height: 10
 ###############################################################################################
  - name: views_by_age_and_gender
    title: TrueView Views by Age and Gender
    explore: ad_group_insights_by_age_gender
    type: looker_line
    fields: [ad_group_insights_by_age_gender.youtube_age,
             ad_group_insights_by_age_gender.total_trueview_views,
             ad_group_insights_by_age_gender.trueview_vr_formatted,
             ad_group_insights_by_age_gender.cpv,
             ad_group_insights_by_age_gender.gender]
    pivots: [ad_group_insights_by_age_gender.gender]
    filters:
      ad_group_insights_by_age_gender.gender: Male,Female
    sorts: [ad_group_insights_by_age_gender.gender, ad_group_insights_by_age_gender.youtube_age]
    show_x_axis_label: false
    x_axis_label_rotation: 0
    trellis: pivot
    trellis_rows: 2
    legend_position: center
    show_null_points: false
    discontinuous_nulls: true
    interpolation: step
    point_style: circle
    y_axes: [{label: '', orientation: left, valueFormat: '[>1000000]0.0,,"M";[>1000]0.0,"K";0',
                series: [{axisId: ad_group_insights_by_age_gender.total_trueview_views,
                              id: Female - ad_group_insights_by_age_gender.total_trueview_views,
                            name: Female TrueView Views},
                         {axisId: ad_group_insights_by_age_gender.total_trueview_views,
                              id: Male - ad_group_insights_by_age_gender.total_trueview_views,
                            name: Male Trueview Views}
                        ], },
             {label: '', orientation: right, valueFormat: 0"%", lineWidth: 1,
                series: [{axisId: ad_group_insights_by_age_gender.trueview_vr_formatted,
                              id: Female - ad_group_insights_by_age_gender.trueview_vr_formatted,
                            name: Female Trueview VR},
                         {axisId: ad_group_insights_by_age_gender.trueview_vr_formatted,
                              id: Male - ad_group_insights_by_age_gender.trueview_vr_formatted,
                            name: Male Trueview VR}
                        ],},
             {label: '', orientation: right,
                series: [{axisId: ad_group_insights_by_age_gender.cpv,
                              id: Female - ad_group_insights_by_age_gender.cpv,
                            name: Female CPV},
                         {axisId: ad_group_insights_by_age_gender.cpv,
                              id: Male - ad_group_insights_by_age_gender.cpv,
                            name: Male CPV}
                        ]}
             ]
    series_types:
      Female - ad_group_insights_by_age_gender.total_trueview_views: column
      Male - ad_group_insights_by_age_gender.total_trueview_views: column
    series_colors:
      Female - ad_group_insights_by_age_gender.total_trueview_views: "#FCDEC8"
      Male - ad_group_insights_by_age_gender.total_trueview_views: "#FCDEC8"
      Male - ad_group_insights_by_age_gender.trueview_vr_formatted: "#EA4335"
      Female - ad_group_insights_by_age_gender.trueview_vr_formatted: "#EA4335"
      Female - ad_group_insights_by_age_gender.cpv: "#7CB342"
      Male - ad_group_insights_by_age_gender.cpv: "#7CB342"
    series_labels:
      Female - ad_group_insights_by_age_gender.total_trueview_views: Female TrueView Views
      Male - ad_group_insights_by_age_gender.total_trueview_views: Male TrueView Views
      Male - ad_group_insights_by_age_gender.trueview_vr_formatted: Male TrueView VR
      Female - ad_group_insights_by_age_gender.trueview_vr_formatted: Female TrueView VR
      Female - ad_group_insights_by_age_gender.cpv: Female CPV
      Male - ad_group_insights_by_age_gender.cpv: Male CPV
    series_point_styles:
      Female - ad_group_insights_by_age_gender.trueview_vr_formatted: triangle
      Male - ad_group_insights_by_age_gender.trueview_vr_formatted: triangle
    listen:
      advertiser: ad_group_insights_by_age_gender.advertiser
      campaign: ad_group_insights_by_age_gender.campaign
      date: ad_group_insights_by_age_gender.date_date
    row: 14
    col: 0
    width: 24
    height: 10
###############################################################################################
  - name: header_audience_type
    type: text
    body_text: "<div style=\"position: relative; text-align: center;
                      min-height: 40px; padding: 2px;
                      border-bottom: 2px #C0C0C0 inset; width: 100%;\">
                <span style=\"background-color: #FFFFFF; color: #808080;
                      font-size: 120%; font-weight: bold; height: 20px; margin-bottom: 2px;\">
                What was the performance by audience type?
                </span>
                </div>"
    row: 24
    col: 0
    width: 24
    height: 2
###############################################################################################
  - name: impressions_by_audience_type
    title: Impressions by Audience Segment Type
    explore: ad_group_insights_by_audience
    type: looker_line
    fields: [ad_group_insights_by_audience.youtube_audience_segment_type, ad_group_insights_by_audience.total_impressions,
      ad_group_insights_by_audience.cpm, ad_group_insights_by_audience.ctr_formatted]
    sorts: [ad_group_insights_by_audience.youtube_audience_segment_type]
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: false
    show_y_axis_labels: true
    show_y_axis_ticks: true
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
    y_axes: [{label: '', orientation: left, valueFormat: '[>1000000]0.0,,"M";[>1000]0.0,"K";0',
                series: [{axisId: ad_group_insights_by_audience.total_impressions,
                              id: ad_group_insights_by_audience.total_impressions,
                            name: Total Impressions}],},
             {label: '', orientation: right,
                series: [{axisId: ad_group_insights_by_audience.cpm,
                              id: ad_group_insights_by_audience.cpm,
                            name: CPM}], },
             {label: '', orientation: right, valueFormat: 0.00"%",
                series: [{axisId: ad_group_insights_by_audience.ctr_formatted,
                              id: ad_group_insights_by_audience.ctr_formatted,
                            name: CTR}], }]
    series_types:
      ad_group_insights_by_audience.total_impressions: column
    series_colors:
      ad_group_insights_by_audience.total_impressions: "#D6E7C9"
      ad_group_insights_by_audience.cpm: "#D35EFF"
      ad_group_insights_by_audience.ctr_formatted: "#E52592"
    series_point_styles:
      ad_group_insights_by_audience.cpm: triangle
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
              pointFormat: '<tr><td style="text-align: left;color:{point.color};">{series.name}:&nbsp;&nbsp;</th><td style="text-align: right;color:{point.color}" >${point.y:,.2f}</td></tr>',
              footerFormat: '</table>',
              shared: true,
            },
            lineWidth: 2,
          },
          {
            dataLabels: false,
            tooltip: {
              headerFormat: '<table><th style="font-size: 1.8em;text-align: left;">{point.key}</th>',
              pointFormat: '<tr><td style="text-align: left;color:{point.color};">{series.name}:&nbsp;&nbsp;</th><td style="text-align: right;color:{point.color}" >{point.y:,.2f}%</td></tr>',
              footerFormat: '</table>',
              shared: true,
            },
            lineWidth: 2,
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
      advertiser: ad_group_insights_by_audience.advertiser
      campaign: ad_group_insights_by_audience.campaign
      date: ad_group_insights_by_audience.date_date
    row: 26
    col: 0
    width: 24
    height: 10
###############################################################################################
  - name: views_by_audience_type
    title: TrueView Views by Audience Segment Type
    explore: ad_group_insights_by_audience
    type: looker_line
    fields: [ad_group_insights_by_audience.youtube_audience_segment_type,
            ad_group_insights_by_audience.total_trueview_views,
            ad_group_insights_by_audience.trueview_vr_formatted,
            ad_group_insights_by_audience.cpv]
    sorts: [ad_group_insights_by_audience.youtube_audience_segment_type]
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: false
    show_y_axis_labels: true
    show_y_axis_ticks: true
    show_x_axis_label: false
    show_x_axis_ticks: true
    x_axis_label_rotation: 0
    legend_position: left
    point_style: circle
    show_null_points: false
    discontinuous_nulls: true
    interpolation: step
    y_axes: [{label: '', orientation: left, valueFormat: '[>1000000]0.0,,"M";[>1000]0.0,"K";0',
                series: [{axisId: ad_group_insights_by_audience.total_trueview_views,
                              id: ad_group_insights_by_audience.total_trueview_views,
                            name: Total TrueView Views}], },
             {label: '', orientation: right, valueFormat: 0"%",
                series: [{axisId: ad_group_insights_by_audience.trueview_vr_formatted,
                              id: ad_group_insights_by_audience.trueview_vr_formatted,
                            name: TrueView VR}], },
             {label: '', orientation: right,
                series: [{axisId: ad_group_insights_by_audience.cpv,
                              id: ad_group_insights_by_audience.cpv,
                            name: CPV}], }]
    series_types:
      ad_group_insights_by_audience.total_trueview_views: column
    series_colors:
      ad_group_insights_by_audience.total_trueview_views: "#FCDEC8"
      ad_group_insights_by_audience.trueview_vr_formatted: "#EA4335"
      ad_group_insights_by_audience.cpv: "#7CB342"
    series_point_styles:
      ad_group_insights_by_audience.trueview_vr_formatted: triangle
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
              pointFormat: '<tr><td style="text-align: left;color:{point.color};">{series.name}:&nbsp;&nbsp;</th><td style="text-align: right;color:{point.color}" >{point.y:,.2f}%</td></tr>',
              footerFormat: '</table>',
              shared: true,
            },
            lineWidth: 2,
          },
          {
            dataLabels: false,
            tooltip: {
              headerFormat: '<table><th style="font-size: 1.8em;text-align: left;">{point.key}</th>',
              pointFormat: '<tr><td style="text-align: left;color:{point.color};">{series.name}:&nbsp;&nbsp;</th><td style="text-align: right;color:{point.color}" >${point.y:,.3f}</td></tr>',
              footerFormat: '</table>',
              shared: true,
            },
            lineWidth: 2,
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
      advertiser: ad_group_insights_by_audience.advertiser
      campaign: ad_group_insights_by_audience.campaign
      date: ad_group_insights_by_audience.date_date
    row: 36
    col: 0
    width: 24
    height: 10
