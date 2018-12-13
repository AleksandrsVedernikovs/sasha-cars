view: dt_test {
  derived_table: {
    sql: SELECT
         cars_data_large.brand  AS "brand",
         COALESCE(SUM(cars_data_large.price ), 0) AS "total_sale_price"
         FROM public.cars_data_large  AS cars_data_large
         GROUP BY 1 ;;
  }
  dimension: brand {
    type: string
    sql: ${TABLE}.brand ;;
  }

  dimension: total_sale_price {
    type: number
    sql: ${TABLE}.total_sale_price ;;
  }

  measure: ave_total_sales_price {
    type:  average
    sql: ${total_sale_price} ;;
  }
  }
