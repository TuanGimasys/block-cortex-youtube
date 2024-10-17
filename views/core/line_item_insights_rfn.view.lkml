#########################################################{
# SOURCES
# Refines view line_item_insights
# Extends view dv360_common_fields_ext
#
# REFERENCED BY
# Explore line_item_insights
#
# EXTENDED FIELDS
#    labels/descriptions for common dimensions
#    total_impressions, total_clicks, ctr, cpm, cpc, etc...
#
# NOTES
# - use this refinement to modify fields found in base
#   and/or add new dimensions and measures
#########################################################}

include: "/views/base/line_item_insights.view"
include: "/views/core/youtube_common_fields_ext.view"

view: +line_item_insights {
  extends: [youtube_common_fields_ext]

  dimension: line_item_insights_pk {
    type: string
    primary_key: yes
    hidden: yes
    sql: CONCAT(${pk_date_string}, CAST(${line_item_id} AS STRING), ${country_code}, ${device_type}, ${browser}, ${environment})) ;;
  }

  dimension: device_type_sorted {
    label: "Device Type (Sorted)"
    description: "Device type sorted in this order: Desktop, Smart Phone, Tablet, Smart TV, and Connected TV. Any device types outside of these will be grouped into the Other category."
    case: {
      when: {
        sql: ${TABLE}.device_type = "Desktop"  ;;
        label: "Desktop"
      }
      when: {
        sql: ${TABLE}.device_type = "Smart Phone"  ;;
        label: "Smart Phone"
      }
      when: {
        sql: ${TABLE}.device_type = "Tablet"  ;;
        label: "Tablet"
      }
      when: {
        sql: ${TABLE}.device_type = "Smart TV"  ;;
        label: "Smart TV"
      }
      when: {
        sql: ${TABLE}.device_type = "Connected TV"  ;;
        label: "Connected TV"
      }
      else: "Other"
    }
  }

  dimension: engagements {hidden: yes}

#########################################################
# MEASURES: Key KPIs
#{
# Extended from dv360_common_fields_ext and edited for
# links and drill_fields
# Or new measures unique to line_item_insights
#

  measure: total_engagements {
    type: sum
    description: "Total engagements during the specified date range."
    sql: ${engagements} ;;
    value_format_name: decimal_0
  }
#} end kpi measures

#########################################################
# MEASURES: Helper
#{
# used to support links and drills; hidden from explore

#--> used to add Line Item Type note to dashboard in the filter section
  dimension: dummy_note {
    hidden: yes
    type: string
    sql: '' ;;
  }

#} end helper measures

#########################################################
# SETS
#{
  set: line_item_details {
    fields: [campaign,
             insertion_order,
             line_item,
             total_impressions,
             cpm,
             trueview_vr,
             cpv,
             total_trueview_views,
             total_clicks,
             cpc,
             ctr,
             total_spend
            ]
  }
#} end sets

}
