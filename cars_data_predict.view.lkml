view: cars_data_predict {
  sql_table_name: public.cars_data_predict ;;

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
  }

  dimension: brand_cat {
    type: string
    sql: ${TABLE}.brand_cat ;;
  }

  dimension: collector_status {
    type: string
    sql: ${TABLE}.collector_status ;;
  }

  dimension: log_predict_price {
    type: number
    sql: ${TABLE}.log_predict_price ;;
  }

  dimension: log_price {
    type: number
    sql: ${TABLE}.log_price ;;
  }

  dimension: predict_price {
    type: number
    sql: ${TABLE}.predict_price ;;
  }

  measure: count {
    type: count
    drill_fields: [id]
  }
}
