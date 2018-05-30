view: cars_data_test {
  sql_table_name: public.cars_data_test ;;

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
  }

  dimension: brand {
    type: string
    sql: ${TABLE}.brand ;;
  }

  dimension: brand_cat {
    type: string
    sql: ${TABLE}.brand_cat ;;
  }

  dimension: collector_status {
    type: string
    sql: ${TABLE}.collector_status ;;
  }

  dimension: days_until_sold {
    type: number
    sql: ${TABLE}.days_until_sold ;;
  }

  dimension: fuel_type {
    type: string
    sql: ${TABLE}.fuel_type ;;
  }

  dimension: gearbox {
    type: string
    sql: ${TABLE}.gearbox ;;
  }

  dimension: kilometer {
    type: number
    sql: ${TABLE}.kilometer ;;
  }

  dimension: log_predict_price {
    type: number
    sql: ${TABLE}.log_predict_price ;;
  }

  dimension: log_price {
    type: number
    sql: ${TABLE}.log_price ;;
  }

  dimension: model {
    type: string
    sql: ${TABLE}.model ;;
  }

  dimension: not_repaired_damage {
    type: string
    sql: ${TABLE}.not_repaired_damage ;;
  }

  dimension: power_ps {
    type: number
    sql: ${TABLE}.power_ps ;;
  }

  dimension: predict_price {
    type: number
    sql: ${TABLE}.predict_price ;;
  }

  dimension: price {
    type: number
    sql: ${TABLE}.price ;;
  }

  dimension: error {
    type: number
    sql: ${price} - ${predict_price};;
  }

  dimension: vehicle_type {
    type: string
    sql: ${TABLE}.vehicle_type ;;
  }

  dimension: year_of_registration {
    type: number
    sql: ${TABLE}.year_of_registration ;;
    full_suggestions: yes
  }

  measure: count {
    type: count
    drill_fields: [brand,model,year_of_registration,fuel_type,collector_status,days_until_sold,kilometer,power_ps,price,predict_price]
  }

  measure: count_reasonable_error {
    type: count
    filters: {
      field: error
      value: ">=-2000 AND <=2000"
    }
    #sql: ${error} ;;
  }
}
