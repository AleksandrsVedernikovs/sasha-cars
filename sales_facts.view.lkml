view: sales_facts {
  derived_table: {
    sql: SELECT
        CONCAT(cars_data_large.brand, ' - ', cars_data_large.year_of_registration) AS primary_key,
        cars_data_large.brand  AS "cars_brand",
        cars_data_large.year_of_registration AS "year_of_registration",
        COUNT(*) AS "total_cars_count",
        COALESCE(AVG(cars_data_large.price ), 0) AS "average_price"
      FROM public.cars_data_large  AS cars_data_large
      GROUP BY 1, 2, 3
      ;;
  }

  dimension: cars_brand_year {
    primary_key: yes
    type: string
    hidden: yes
    sql: ${TABLE}.primary_key ;;
  }

  dimension: cars_brand {
    type: string
    sql: ${TABLE}.cars_brand ;;
  }

  dimension: year_of_registration {
    type: number
    sql: ${TABLE}.year_of_registration ;;
    value_format: "#000"
  }

  dimension: average_price {
    type: number
    sql: ${TABLE}.average_price ;;
    value_format_name: usd_0
  }

  measure: total_cars_count {
    type: count
  }


}
