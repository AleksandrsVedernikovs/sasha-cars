connection: "sasha-thesis"

# include all the views
include: "*.view"

# include all the dashboards
include: "*.dashboard"

map_layer: germany_states {
  file: "germany.json"
  property_key: "NAME_1"
}

explore: cars_data_large {
  #sql_always_where: (${power_ps} >= 50 AND ${power_ps} <= 750) ;;

  join: location_data {
    type: left_outer
    relationship: many_to_one
    sql_on: ${location_data.postal_code} = ${cars_data_large.postal_code};;
  }

  join: sales_facts {
    type: left_outer
    relationship: many_to_one
    sql_on: ${cars_data_large.brand} = ${sales_facts.cars_brand} AND
      ${cars_data_large.year_of_registration} = ${sales_facts.year_of_registration};;
  }
}

explore: test {}

explore: location_data {}

explore: sales_facts {}

explore: cars_data_test {}
