#########################################################{
# PURPOSE
# Provides consistent labels/descriptions/SQL for fields
# found in:
#   line_item_insights
#   ad_group_insights_by_ad_format
#   ad_group_insights_by_age_gender
#   ad_group_insights_by_audience
#
# Defines labels, descriptions and other properties for:
#   advertiser
#   advertiser_currency
#   advertiser_id
#   campaign
#   campaign_id
#   clicks
#   date
#   impressions
#   insertion_order
#   insertion_order_id
#   line_item
#   line_item_id
#   line_item_type
#   partner
#   partner_currency
#   partner_id
#   revenue_advertiser_currency
#   revenue_partner_currency
#   revenue_usd
#   youtube_views
#
# Defines measures:
#   total_impressions
#   total_clicks
#   total_trueview_views
#   total_spend
#   cumulative_total_spend
#   cpc
#   cpm
#   cpv
#   ctr
#   trueview_vr
#   total_spend_advertsier_currency
#   total_spend_partner_currency
#
# NOTE
#   - Field properties defined here can be overwritten in the extending view as necessary.
#   - When a dimension is extended into a view where the SQL property has already been
#     defined in the base view, the existing SQL property will not be replaced.
#########################################################}

view: youtube_common_fields_ext {
  extension: required
  dimension_group: date {
    label: "Event"
  }

  dimension: pk_date_string {
    hidden: yes
    type: string
    sql: CAST(${TABLE}.date AS STRING) ;;
  }

  dimension: advertiser_id {
    value_format_name: id
  }

  dimension: campaign_id {
    value_format_name: id
  }

  dimension: insertion_order_id {
    value_format_name: id
  }

  dimension: line_item_id {
    value_format_name: id
  }

#########################################################
# DIMENSIONS: Hidden
#{
# hidden from explore because measures for each are shown instead.
#
  dimension: clicks {hidden: yes}
  dimension: impressions {hidden: yes}
  dimension: revenue_advertiser_currency {
    hidden: yes
    label: "Revenue (Advertiser Currency)"
  }
  dimension: revenue_partner_currency {
    hidden: yes
    label: "Revenue (Partner Currency)"
  }
  dimension: revenue_usd {
    hidden: yes
    label: "Revenue (USD)"
  }
  dimension: youtube_views {
    hidden: yes
    label: "YouTube Views"
    }
#} end hidden dimensions

#########################################################
# MEASURES: Key KPIs
#{

  measure: total_impressions {
    type: sum
    description: "The number of times that a user’s client (browser or mobile device) sent a ping to our ad server that creative content was requested and has started to download during the specified date range."
    sql: ${impressions} ;;
    value_format_name: decimal_0
    link: {
      label: "Show Line Item Details"
      url: "@{link_build_explore_youtube_line_item_drill}"
    }
  }

  measure: total_clicks {
    type: sum
    description: "The number of times that users clicked on a creative during the specified date range. A click is recorded even if the user does not actually reach the landing page. For example, if a user clicks on an ad, then closes the browser before the landing page loads, a click is still recorded. For YouTube ads, this is the number of clicks on a call to action that leads to a destination URL. These are clicks that lead outside of the video. For YouTube ads on a connected TV, this is the number of clicks on Send to phone on the TV screen."
    sql: ${clicks} ;;
    value_format_name: decimal_0
    link: {
      label: "Show Line Item Details"
      url: "@{link_build_explore_youtube_line_item_drill}"
    }
  }

  measure: total_trueview_views {
    type: sum
    label: "Total TrueView Views"
    description: "The number of times your ad has been viewed. For skippable in-stream ads running on YouTube, paid advertising views will be counted as public views on the video when one of the following happens: someone watches a complete ad that's 11-30 seconds long, someone watches at least 30 seconds of an ad that's more than 30 seconds long, or someone interacts with the ad. For in-feed video ads, this is the number of times viewers choose to watch your ad by clicking a thumbnail. This is not a viewability metric."
    sql: ${youtube_views} ;;
    value_format_name: decimal_0
    link: {
      label: "Show Line Item Details"
      url: "@{link_build_explore_youtube_line_item_drill}"
    }
  }

  measure: total_spend {
    type: sum
    label: "Total Spend (USD)"
    description: "The amount of money spent to purchase impressions and deliver ads through Display & Video 360. Calculated based on the revenue model set for line items. This field is named Revenue in DV360."
    sql: ${revenue_usd} ;;
    value_format_name: usd
    link: {
      label: "Show Line Item Details"
      url: "@{link_build_explore_youtube_line_item_drill}"
    }
  }

  measure: cumulative_total_spend {
    type: running_total
    label: "Cumulative Spend (USD)"
    description: "Running total for The `revenue_usd`, which is the amount of money spent to purchase impressions and deliver ads through Display & Video 360. Calculated based on the revenue model set for line items."
    sql: ${total_spend} ;;
    value_format_name: usd
  }

  measure: cpc {
    type: number
    label: "CPC"
    description: "Cost per Click - The cost an advertiser pays for each click."
    sql: SAFE_DIVIDE(${total_spend}, ${total_clicks}) ;;
    value_format_name: usd
    link: {
      label: "Show Line Item Details"
      url: "@{link_build_explore_youtube_line_item_drill}"
    }
  }

  measure: cpm {
    type: number
    label: "CPM"
    description: "Cost per Mille - The estimated total cost per 1000 impressions."
    sql: SAFE_DIVIDE(${total_spend}, ${total_impressions}) * 1000 ;;
    value_format_name:usd
    link: {
      label: "Show Line Item Details"
      url: "@{link_build_explore_youtube_line_item_drill}"
    }
  }

  measure: cpv {
    type: number
    label: "CPV"
    description: "Cost per View - The cost an advertiser pays for each ad view."
    sql: SAFE_DIVIDE(${total_spend}, ${total_trueview_views}) ;;
    value_format_name: usd_three_decimal
    link: {
      label: "Show Line Item Details"
      url: "@{link_build_explore_youtube_line_item_drill}"
    }
  }

  measure: ctr {
    type: number
    label: "CTR"
    description: "Click Through Rate - Ratio of clicks to impressions."
    sql: SAFE_DIVIDE(${total_clicks}, ${total_impressions}) ;;
    value_format_name: percent_2
    link: {
      label: "Show Line Item Details"
      url: "@{link_build_explore_youtube_line_item_drill}"
    }
  }

  measure: trueview_vr {
    type: number
    label: "TrueView VR"
    description: "TrueView: View Rate - Ratio of views to impressions."
    sql: SAFE_DIVIDE(${total_trueview_views}, ${total_impressions}) ;;
    value_format_name: percent_1
    link: {
      label: "Show Line Item Details"
      url: "@{link_build_explore_youtube_line_item_drill}"
    }
  }

  measure: total_spend_advertsier_currency {
    type: sum
    label: "Total Spend (Advertiser Currency)"
    description: "The amount of money spent to purchase impressions and deliver ads through Display & Video 360. Calculated based on the revenue model set for line items. This field is named Revenue in DV360. Reported in advertiser's currency. Should always include advertiser currency dimension with this measures in report."
    sql: ${revenue_advertiser_currency} ;;
    value_format_name: decimal_2
    required_fields: [advertiser_currency]
  }

  measure: total_spend_partner_currency {
    type: sum
    label: "Total Spend (Partner Currency)"
    description: "The amount of money spent to purchase impressions and deliver ads through Display & Video 360. Calculated based on the revenue model set for line items. This field is named Revenue in DV360. Reported in partner's currency. Should always include partner currency dimension with this measure in report."
    sql: ${revenue_partner_currency} ;;
    value_format_name: decimal_2
    required_fields: [partner_currency]
  }

  measure: count {
    label: "Row Count"
  }
#} end measures

#########################################################
# MEASURES: Formatted
#{
# measures formatted for dashboard display

  measure: total_impressions_formatted {
    type: number
    group_label: "Formatted as Large Numbers"
    label: "Total Impressions"
    description: "The number of times that a user’s client (browser or mobile device) sent a ping to our ad server that creative content was requested and has started to download during the specified date range. Formatted for large values (e.g., 2.3M or 75.2K)"
    sql: ${total_impressions} ;;
    value_format_name: positive_m_or_k
    link: {
      label: "Show Line Item Details"
      url: "@{link_build_explore_youtube_line_item_drill}"
    }
  }

  measure: total_clicks_formatted {
    type: number
    group_label: "Formatted as Large Numbers"
    label: "Total Clicks"
    description: "The number of times that users clicked on a creative during the specified date range. Formatted for large values (e.g., 2.3M or 75.2K)"
    sql: ${total_clicks} ;;
    value_format_name: positive_m_or_k
    link: {
      label: "Show Line Item Details"
      url: "@{link_build_explore_youtube_line_item_drill}"
    }
  }

  measure: total_trueview_views_formatted {
    type: number
    group_label: "Formatted as Large Numbers"
    label: "Total TrueView Views"
    description: "The number of times your ad has been viewed. Formatted for large values (e.g., 2.3M or 75.2K)"
    sql: ${total_trueview_views} ;;
    value_format_name: positive_m_or_k
    link: {
      label: "Show Line Item Details"
      url: "@{link_build_explore_youtube_line_item_drill}"
    }
  }

  measure: total_spend_formatted {
    type: number
    group_label: "Formatted as Large Numbers"
    label: "Total Spend (USD)"
    description: "The amount of money spent to purchase impressions and deliver ads through Display & Video 360. Calculated based on the revenue model set for line items. This field is named Revenue in DV360. Formatted for large values (e.g., 2.3M or 75.2K)"
    sql: ${total_spend} ;;
    value_format_name: positive_usd_m_or_k
    link: {
      label: "Show Line Item Details"
      url: "@{link_build_explore_youtube_line_item_drill}"
    }
  }

  measure: cumulative_total_spend_formatted {
    type: running_total
    group_label: "Formatted as Large Numbers"
    label: "Cumulative Spend (USD)"
    description: "Cumulative Spend (USD) formatted for large values (e.g., 2.3M or 75.2K)"
    sql: ${total_spend} ;;
    value_format_name: positive_usd_m_or_k
  }

#--> formatted as 0 to 100 for dashboard tooltip display
  measure: ctr_formatted {
    hidden: yes
    type: number
    label: "CTR"
    sql: ${ctr} * 100 ;;
    value_format_name: decimal_2
  }

#--> formatted as 0 to 100 for dashboard tooltip display
  measure: trueview_vr_formatted {
    hidden: yes
    type: number
    label: "Trueview VR"
    sql: ${trueview_vr} * 100 ;;
    value_format_name: decimal_2
  }

#} end formatted measures

#########################################################
# MEASURES: Helper
#{
# used to support links and drills; hidden from explore

  measure: link_generator {
    hidden: yes
    type: number
    sql: 1 ;;
    drill_fields: [link_generator]
  }

  dimension: dummy_note {
    hidden: yes
    type: string
    sql: '' ;;
  }

#} end helper measures

}
