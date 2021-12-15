# The name of this view in Looker is "Numeric Data Series"
view: numeric_data_series {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: `sfp_data.NumericDataSeries`
    ;;
  # No primary key is defined for this view. In order to join this view in an Explore,
  # define primary_key: yes on a dimension that has no repeated values.

  # Here's what a typical dimension looks like in LookML.
  # A dimension is a groupable field that can be used to filter query results.
  # This dimension will be called "Cloud Tag Name" in Explore.

  dimension: cloud_tag_name {
    type: string
    sql: ${TABLE}.cloudTagName ;;
  }

  # Dates and timestamps can be represented in Looker using a dimension group of type: time.
  # Looker converts dates and timestamps to the specified timeframes within the dimension group.

  dimension_group: event_timestamp {
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}.eventTimestamp ;;
  }

  dimension_group: ingest_timestamp {
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}.ingestTimestamp ;;
  }

  dimension: meta_json {
    type: string
    sql: ${TABLE}.metaJson ;;
  }

  # This field is hidden, which means it will not show up in Explore.
  # If you want this field to be displayed, remove "hidden: yes".

  dimension: meta_kv {
    hidden: yes
    sql: ${TABLE}.metaKV ;;
  }

  dimension: payload_json {
    type: string
    sql: ${TABLE}.payloadJson ;;
  }

  dimension: payload_kv {
    hidden: yes
    sql: ${TABLE}.payloadKV ;;
  }

  dimension: payload_qualifier_json {
    type: string
    sql: ${TABLE}.payloadQualifierJson ;;
  }

  dimension: payload_qualifier_kv {
    hidden: yes
    sql: ${TABLE}.payloadQualifierKV ;;
  }

  dimension: tag_definition {
    type: string
    sql: ${TABLE}.tagDefinition ;;
  }

  dimension: tag_name {
    type: string
    sql: ${TABLE}.tagName ;;
  }

  dimension: value {
    type: string
    sql: ${TABLE}.value ;;
  }
  measure: value1 {
    type: string
    sql: ${TABLE}.value ;;
  }
  dimension: valueint {
    type: number
    sql: ${TABLE}.value ;;
  }
  measure: sum {
    type: sum
    sql: ${TABLE}.value ;;
  }

  measure: Availability {
    type: string
    sql: distinct ((SUM(${TABLE}.value ) / 10800) * 100) ;;
    }

    measure: Performance {
      type: string
      sql: distinct (((SUM(${TABLE}.value ))/540)*100) ;;
    }


}

# The name of this view in Looker is "Numeric Data Series Meta Kv"
view: numeric_data_series__meta_kv {
  # No primary key is defined for this view. In order to join this view in an Explore,
  # define primary_key: yes on a dimension that has no repeated values.

  # Here's what a typical dimension looks like in LookML.
  # A dimension is a groupable field that can be used to filter query results.
  # This dimension will be called "Key" in Explore.

  dimension: key {
    type: string
    sql: key ;;
  }

  # This field is hidden, which means it will not show up in Explore.
  # If you want this field to be displayed, remove "hidden: yes".

  dimension: numeric_data_series__meta_kv {
    type: string
    hidden: yes
    sql: numeric_data_series__meta_kv ;;
  }

  dimension: value {
    type: string
    sql: value ;;
  }
}

# The name of this view in Looker is "Numeric Data Series Payload Kv"
view: numeric_data_series__payload_kv {
  # No primary key is defined for this view. In order to join this view in an Explore,
  # define primary_key: yes on a dimension that has no repeated values.

  # Here's what a typical dimension looks like in LookML.
  # A dimension is a groupable field that can be used to filter query results.
  # This dimension will be called "Key" in Explore.

  dimension: key {
    type: string
    sql: key ;;
  }

  # This field is hidden, which means it will not show up in Explore.
  # If you want this field to be displayed, remove "hidden: yes".

  dimension: numeric_data_series__payload_kv {
    type: string
    hidden: yes
    sql: numeric_data_series__payload_kv ;;
  }

  dimension: value {
    type: string
    sql: value ;;
  }
}

# The name of this view in Looker is "Numeric Data Series Payload Qualifier Kv"
view: numeric_data_series__payload_qualifier_kv {
  # No primary key is defined for this view. In order to join this view in an Explore,
  # define primary_key: yes on a dimension that has no repeated values.

  # Here's what a typical dimension looks like in LookML.
  # A dimension is a groupable field that can be used to filter query results.
  # This dimension will be called "Key" in Explore.

  dimension: key {
    type: string
    sql: key ;;
  }

  # This field is hidden, which means it will not show up in Explore.
  # If you want this field to be displayed, remove "hidden: yes".

  dimension: numeric_data_series__payload_qualifier_kv {
    type: string
    hidden: yes
    sql: numeric_data_series__payload_qualifier_kv ;;
  }

  dimension: value {
    type: string
    sql: value ;;
  }
}
