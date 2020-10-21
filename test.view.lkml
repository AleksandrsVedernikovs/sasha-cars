view: test {
  derived_table: {
    explore_source: cars_data_large {
      column: brand {field: cars_data_large.brand}
      column: count {field: cars_data_large.count}
      column: revenue {field: cars_data_large.revenue}
      derived_column: average_customer_order {
        sql: revenue / count ;;
      }
    }
  }
  dimension: brand {}
  dimension: count {type: number}
  dimension: average_customer_order {type: number}
}
