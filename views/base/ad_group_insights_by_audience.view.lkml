view: ad_group_insights_by_audience {
  sql_table_name: `@{GCP_PROJECT_ID}.@{REPORTING_DATASET}.AdGroupInsightsByAudience` ;;

 dimension: advertiser {
  type: string
  description: "The name of the Display & Video 360 advertiser."
  sql: ${TABLE}.advertiser ;;
}
dimension: advertiser_currency {
  type: string
  description: "Advertiser's currency in ISO 4217 format."
  sql: ${TABLE}.advertiser_currency ;;
}
dimension: advertiser_id {
  type: number
  description: "The unique ID of the Display & Video 360 advertiser."
  sql: ${TABLE}.advertiser_id ;;
}
dimension: campaign {
  type: string
  description: "The resource name of the campaign."
  sql: ${TABLE}.campaign ;;
}
dimension: campaign_id {
  type: number
  description: "The ID associated with a campaign."
  sql: ${TABLE}.campaign_id ;;
}
dimension: clicks {
  type: number
  description: "The number of times that users clicked on a creative during the specified date range. A click is recorded even if the user does not actually reach the landing page. For example, if a user clicks on an ad, then closes the browser before the landing page loads, a click is still recorded. For YouTube ads, this is the number of clicks on a call to action that leads to a destination URL. These are clicks that lead outside of the video. For YouTube ads on a connected TV, this is the number of clicks on  Send to phone on the TV screen."
  sql: ${TABLE}.clicks ;;
}
dimension_group: date {
  type: time
  description: "The date when the reported events took place. Date can be used as a column, but not as a filter. To filter by date, choose a date range for your report."
  timeframes: [raw, date, week, month, quarter, year]
  convert_tz: no
  datatype: date
  sql: ${TABLE}.date ;;
}
dimension: impressions {
  type: number
  description: "The number of times that a user's client (browser or mobile device) sent a ping to our ad server that creative content was requested and has started to download during the specified date range."
  sql: ${TABLE}.impressions ;;
}
dimension: insertion_order {
  type: string
  description: "The name of the insertion order."
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
dimension: line_item_id {
  type: number
  description: "The unique ID of the Display & Video 360 line item."
  sql: ${TABLE}.line_item_id ;;
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
dimension: trueview_ad_group {
  type: string
  description: "The name of the YouTube ad group. Ad groups contain one or more ads."
  sql: ${TABLE}.trueview_ad_group ;;
}
dimension: youtube_ad_group_id {
  type: number
  description: "The ID of the YouTube ad group. Ad groups contain one or more ads."
  sql: ${TABLE}.youtube_ad_group_id ;;
}
dimension: youtube_audience_segment {
  type: string
  description: "Audience Segment."
  sql: ${TABLE}.youtube_audience_segment ;;
}
dimension: youtube_audience_segment_type {
  type: string
  description: "Audience Segment Type."
  sql: ${TABLE}.youtube_audience_segment_type ;;
}
dimension: youtube_engagements {
  type: number
  description: "For YouTube video action campaigns: The number of clicks on the ad or 10 seconds of viewing time. If both happen, only the click is counted. For all other YouTube ads: The number of clicks on interactive video elements, such as teasers or expanding cards, that don't take users to an external site."
  sql: ${TABLE}.youtube_engagements ;;
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
