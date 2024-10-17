connection: "@{CONNECTION_NAME}"

include: "/explores/**/*.explore"
include: "/dashboards/*.dashboard.lookml"
include: "/components/*.lkml"

label: "CORTEX YOUTUBE"

persist_with: youtube_report_default_datagroup
