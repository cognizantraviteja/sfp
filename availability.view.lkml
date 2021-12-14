view: availability {
  derived_table: {
    sql: WITH sql_runner_query AS (SELECT distinct
        'Availability' as  Availability,
          --numeric_data_series.cloudTagName  AS numeric_data_series_cloud_tag_name,
          (10780/10800) as Value
      FROM `sfp_data.NumericDataSeries`
           AS numeric_data_series
      WHERE DATE(eventTimestamp) = "2021-12-10"
      )
      SELECT distinct
           'Availability' as  Availability,
          --sql_runner_query.numeric_data_series_cloud_tag_name AS cloud_tag_name,
           (10780/10800) as Value
      FROM sql_runner_query
       ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  dimension: availability {
    type: string
    sql: ${TABLE}.Availability ;;
  }

  dimension: value {
    type: number
    sql: ${TABLE}.Value ;;
  }

  set: detail {
    fields: [availability, value]
  }
}
