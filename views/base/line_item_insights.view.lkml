view: line_item_insights {
  sql_table_name: `@{GCP_PROJECT_ID}.@{REPORTING_DATASET}.LineItemInsights` ;;

   dimension: advertiser {
    type: string
    description: "The name of the Display & Video 360 advertiser."
    sql: ${TABLE}.advertiser ;;
  }
  dimension: advertiser_currency {
    type: string
    description: "The currency set for the given advertiser or partner."
    sql: ${TABLE}.advertiser_currency ;;
  }
  dimension: advertiser_id {
    type: number
    description: "The unique ID of the Display & Video 360 advertiser."
    sql: ${TABLE}.advertiser_id ;;
  }
  dimension: browser {
    type: string
    description: "The name of a web browser. This may be useful when defining targeting."
    sql: ${TABLE}.browser ;;
  }
  dimension: campaign {
    type: string
    description: "Associated with an advertiser, a campaign is a basic framework for managing your advertising."
    sql: ${TABLE}.campaign ;;
  }
  dimension: campaign_id {
    type: number
    description: "The ID associated with a campaign. Note: \"campaign insights\" can be achieved on top of line item insights."
    sql: ${TABLE}.campaign_id ;;
  }
  dimension: clicks {
    type: number
    description: "The number of times that users clicked on a creative during the specified date range. A click is recorded even if the user does not actually reach the landing page. For example, if a user clicks on an ad, then closes the browser before the landing page loads, a click is still recorded. For YouTube ads, this is the number of clicks on a call to action that leads to a destination URL. These are clicks that lead outside of the video. For YouTube ads on a connected TV, this is the number of clicks on Send to phone on the TV screen."
    sql: ${TABLE}.clicks ;;
  }
  dimension: country_code {
    type: string
    description: "Names of countries. Use this dimension to identify geographic locations that perform well and perform poorly."
    sql: ${TABLE}.country_code ;;
  }
  dimension_group: date {
    type: time
    description: "The date when the reported events took place. Date can be used as a column, but not as a filter. To filter by date, choose a date range for your report."
    timeframes: [raw, date, week, month, quarter, year]
    convert_tz: no
    datatype: date
    sql: ${TABLE}.date ;;
  }
  dimension: device_type {
    type: string
    description: "The type of device, such as \"Desktop\", “Connected TV”,\"Smartphone\", and \"Tablet\"."
    sql: ${TABLE}.device_type ;;
  }
  dimension: engagements {
    type: number
    description: "Engagements."
    sql: ${TABLE}.engagements ;;
  }
  dimension: environment {
    type: string
    description: "The environment where your ads served. Values include: App. Web optimized for device (inventory designed for the device it was viewed on, such as mobile websites viewed on a mobile device). Web not optimized for device (inventory that wasn't designed for a device but viewed on it, such as websites optimized for desktop but viewed on a mobile device). Unknown."
    sql: ${TABLE}.environment ;;
  }
  dimension: impressions {
    type: number
    description: "The number of times that a user's client (browser or mobile device) sent a ping to our ad server that creative content was requested and has started to download during the specified date range."
    sql: ${TABLE}.impressions ;;
  }
  dimension: insertion_order {
    type: string
    description: "The name of an insertion order."
    sql: ${TABLE}.insertion_order ;;
  }
  dimension: insertion_order_id {
    type: number
    description: "The unique ID of the Display & Video 360 insertion order."
    sql: ${TABLE}.insertion_order_id ;;
  }
  dimension: line_item {
    type: string
    description: "The name of the Display & Video 360 line item."
    sql: ${TABLE}.line_item ;;
  }
  dimension_group: line_item_end {
    type: time
    description: "The date on which the line item will stop serving."
    timeframes: [raw, date, week, month, quarter, year]
    convert_tz: no
    datatype: date
    sql: ${TABLE}.line_item_end_date ;;
  }
  dimension: line_item_id {
    type: number
    description: "The unique ID of the Display & Video 360 line item."
    sql: ${TABLE}.line_item_id ;;
  }
  dimension_group: line_item_start {
    type: time
    description: "The date on which the line item will be eligible to start serving."
    timeframes: [raw, date, week, month, quarter, year]
    convert_tz: no
    datatype: date
    sql: ${TABLE}.line_item_start_date ;;
  }
  dimension: line_item_type {
    type: string
    description: "The type of line item, such as \"Real-time bidding\" or \"Video real-time bidding\"."
    sql: ${TABLE}.line_item_type ;;
  }
  dimension: partner {
    type: string
    description: "The name of the Display & Video 360 partner."
    sql: ${TABLE}.partner ;;
  }
  dimension: partner_currency {
    type: string
    description: "The currency set for the given advertiser or partner."
    sql: ${TABLE}.partner_currency ;;
  }
  dimension: partner_id {
    type: number
    description: "The unique ID of the Display & Video 360 partner."
    sql: ${TABLE}.partner_id ;;
  }
  dimension: revenue_advertiser_currency {
    type: number
    description: "Revenue in Advertiser Currency. Revenue refers to the amount of money spent to purchase impressions and deliver ads through Display & Video 360. Revenue is calculated based on the revenue model set for line items."
    sql: ${TABLE}.revenue_advertiser_currency ;;
  }
  dimension: revenue_partner_currency {
    type: number
    description: "Revenue in Partner Currency. Revenue refers to the amount of money spent to purchase impressions and deliver ads through Display & Video 360. Revenue is calculated based on the revenue model set for line items."
    sql: ${TABLE}.revenue_partner_currency ;;
  }
  dimension: revenue_usd {
    type: number
    description: "Revenue in USD. Revenue refers to the amount of money spent to purchase impressions and deliver ads through Display & Video 360. Revenue is calculated based on the revenue model set for line items."
    sql: ${TABLE}.revenue_usd ;;
  }
  dimension: youtube_views {
    type: number
    description: "The number of times your ad has been viewed. For skippable in-stream ads running on YouTube, paid advertising views will be counted as public views on the video when one of the following happens: someone watches a complete ad that's 11-30 seconds long, someone watches at least 30 seconds of an ad that's more than 30 seconds long, or someone interacts with the ad. For in-feed video ads, this is the number of times viewers choose to watch your ad by clicking a thumbnail. This is not a viewability metric."
    sql: ${TABLE}.youtube_views ;;
  }
  measure: count {
    type: count
  }
}
