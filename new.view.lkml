view: table_a {
  derived_table: {
    sql: select * from (values (1), (2)) as t (id) ;;
  }

  dimension: id {
    type: number
    primary_key: yes
    sql: ${TABLE}.id ;;
  }
}

view: table_b {
  derived_table: {
    sql: select * from (values (1, 1, null), (1, 1, 'not null')) as t (id, a_id, blah) ;;
  }

  dimension: id {
    type: number
    primary_key: yes
    sql: ${TABLE}.id ;;
  }

  dimension: a_id {
    type: number
    sql: ${TABLE}.a_id ;;
  }

  dimension: blah {
    type: string
    sql: ${TABLE}.blah ;;
  }

  dimension: has_blah {
    type: yesno
    sql: ${blah} is not null ;;
  }

  measure: count_with_blah {
    type: count
    filters: {
      field: has_blah
      value: "yes"
    }
  }

  measure: count_without_blah {
    type: count
    filters: {
      field: has_blah
      value: "no"
    }
  }
}
