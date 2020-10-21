view: location_data {
  sql_table_name: public.location_data ;;

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
  }

  dimension: city {
    type: string
    sql: ${TABLE}.city ;;
  }

  dimension: latitude {
    type: number
    sql: ${TABLE}.latitude ;;
  }

  dimension: longitude {
    type: number
    sql: ${TABLE}.longitude ;;
  }

  dimension: place_name {
    type: string
    sql: ${TABLE}.place_name ;;
  }

  dimension: postal_code {
    type: number
    sql: ${TABLE}.postal_code ;;
  }
  dimension: location {
    type: location
    sql_latitude: ${TABLE}.latitude;;
    sql_longitude: ${TABLE}.longitude;;

  }

  dimension: state {
    type: string
    sql:
     CASE
       WHEN ${TABLE}.state = 'BadenWfcrttemberg' THEN 'Baden-Württemberg'
       WHEN ${TABLE}.state = 'Bayern' THEN 'Bayern'
       WHEN ${TABLE}.state = 'Berlin' THEN 'Berlin'
       WHEN ${TABLE}.state = 'Brandenburg' THEN 'Brandenburg'
       WHEN ${TABLE}.state = 'Bremen' THEN 'Bremen'
       WHEN ${TABLE}.state = 'Hamburg' THEN 'Hamburg'
       WHEN ${TABLE}.state = 'Hessen' THEN 'Hessen'
       WHEN ${TABLE}.state = 'MecklenburgVorpommern' THEN 'Mecklenburg-Vorpommern'
       WHEN ${TABLE}.state = 'Niedersachsen' THEN 'Niedersachsen'
       WHEN ${TABLE}.state = 'NordrheinWestfalen' THEN 'Nordrhein-Westfalen'
       WHEN ${TABLE}.state = 'RheinlandPfalz' THEN 'Rheinland-Pfalz'
       WHEN ${TABLE}.state = 'Saarland' THEN 'Saarland'
       WHEN ${TABLE}.state = 'Sachsen' THEN 'Sachsen'
       WHEN ${TABLE}.state = 'SachsenAnhalt' THEN 'Sachsen-Anhalt'
       WHEN ${TABLE}.state = 'SchleswigHolstein' THEN 'Schleswig-Holstein'
       WHEN ${TABLE}.state = 'Thfcringen' THEN 'Thüringen'
       ELSE 'Unknown'
    END;;
    map_layer_name: germany_states
  }

  dimension: state_abbreviation {
    type: string
    sql: ${TABLE}.state_abbreviation ;;
  }

  measure: count {
    type: count
    drill_fields: [id, place_name]
  }
}
