view: cars_data_large {
  sql_table_name: public.cars_data_large ;;

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
    action: {
      label: "Send to Zapier"
      url: "https://hooks.zapier.com/hooks/catch/2908055/8vl8jc/"
      param: {
        name: "id"
        value: "{{ value }}"
      }
    }
  }

  measure: api_test {
    type: max
    sql: ${id} ;;
  }

#comment

  dimension: brand {
    type: string
    sql: ${TABLE}.brand ;;
    drill_fields: [brand,model,name,price,count]
    full_suggestions: yes
    link:{
      label: "nice"
      url: "/explore/sasha_cars/cars_data_large?fields=cars_data_large.brand,cars_data_large.gearbox,cars_data_large.price,cars_data_large.logo&f[cars_data_large.count]={{ _filters['cars_data_large.count'] | url_encode }}&f[cars_data_large.brand]={{ _filters['cars_data_large.brand'] | url_encode }}"
      icon_url: "http://www.looker.com/favicon.ico"
    }
  }




  dimension: brand_group {
    type: string
    sql: CASE
          WHEN ${TABLE}.brand IN ('lada','trabant','other') THEN 'other'
          WHEN ${TABLE}.brand IN ('chevrolet','daewoo','dacia') THEN 'budget'
          WHEN ${TABLE}.brand IN ('hyundai','kia','skoda','daihatsu') THEN 'budget_plus'
          WHEN ${TABLE}.brand IN ('chrysler','fiat','ford','citroen','mitsubishi','opel','rover','seat','suzuki') THEN 'mid_minus'
          WHEN ${TABLE}.brand IN ('nissan','peugeot','renault','toyota') THEN 'mid_range'
          WHEN ${TABLE}.brand IN ('honda','mazda','smart','subaru','volkswagen') THEN 'mid_plus'
          WHEN ${TABLE}.brand IN ('alfaromeo','lancia','saab','jeep','volvo','mini') THEN 'premium_minus'
          WHEN ${TABLE}.brand IN ('audi','bmw','jaguar','landrover','mercedesbenz','porsche') THEN 'premium'
          ELSE null
          END ;;
  }


  dimension: brand_test {
    type: string
    case: {
      when: {
        sql: ${TABLE}.brand IN ('lada','trabant','other');;
        label: "other"
      }
      when: {
        sql: ${TABLE}.brand IN ('chevrolet','daewoo','dacia') ;;
        label: "budget"
      }
      when: {
        sql: ${TABLE}.brand IN ('hyundai','kia','skoda','daihatsu');;
        label:"budget_plus"
        }

      when: {
        sql: ${TABLE}.brand IN ('chrysler','fiat','ford','citroen','mitsubishi','opel','rover','seat','suzuki') ;;
        label: "mid_minus"
      }
      # Possibly more when statements
      else: "blalllllllllllllllllllllllllllllllllllllll"
    }
  }

#   dimension: logo_test {
#     type: string
#     sql: ${brand} ;;
#     html: <img src="https://logo.clearbit.com/{{value}}.jpg"> ;;
#   }


  dimension: logo {
    type: string
    sql: case
          when ${brand} = 'bmw' then 'http://www.carlogos.org/logo/BMW-logo-2000-2048x2048.png'
          when ${brand} = 'volkswagen' then 'http://www.carlogos.org/logo/Volkswagen-logo-2015-1920x1080.png'
          when ${brand} = 'mercedesbenz' then 'http://www.carlogos.org/logo/Mercedes-Benz-logo-2008-1920x1080.png'
          when ${brand} = 'opel' then 'http://www.carlogos.org/logo/Opel-logo-2009-1920x1080.png'
          when ${brand} = 'audi' then 'http://www.carlogos.org/logo/Audi-logo-2009-1920x1080.png'
          when ${brand} = 'ford' then 'http://www.carlogos.org/logo/Ford-logo-2003-1366x768.png'
          when ${brand} = 'renault' then 'http://www.carlogos.org/logo/Renault-logo-2015-2048x2048.png'
          when ${brand} = 'peugeot' then 'http://www.carlogos.org/logo/Peugeot-logo-2010-1920x1080.png'
          when ${brand} = 'fiat' then 'http://www.carlogos.org/logo/Fiat-logo-2006-1920x1080.png'
          when ${brand} = 'seat' then 'http://www.carlogos.org/logo/SEAT-logo-2012-6000x5000.png'
          when ${brand} = 'skoda' then 'http://www.carlogos.org/logo/Skoda-logo-2016-1920x1080.png'
          when ${brand} = 'mazda' then 'http://www.carlogos.org/logo/Mazda-logo-1997-1920x1080.png'
          when ${brand} = 'citroen' then 'http://www.carlogos.org/logo/Citroen-logo-2009-2048x2048.png'
          when ${brand} = 'nissan' then 'http://www.carlogos.org/logo/Nissan-logo-2013-1440x900.png'
          when ${brand} = 'toyota' then 'http://www.carlogos.org/logo/Toyota-logo-1989-2560x1440.png'
          when ${brand} = 'smart' then 'http://www.carlogos.org/logo/Smart-logo-1994-1366x768.png'
          when ${brand} = 'hyundai' then 'http://www.carlogos.org/logo/Hyundai-logo-silver-2560x1440.png'
          when ${brand} = 'mini' then 'http://www.carlogos.org/logo/Mini-logo-2001-1920x1080.png'
          when ${brand} = 'volvo' then 'http://www.carlogos.org/logo/Volvo-logo-2014-1920x1080.png'
          when ${brand} = 'mitsubishi' then 'http://www.carlogos.org/logo/Mitsubishi-logo-2000x2500.png'
          when ${brand} = 'honda' then 'http://www.carlogos.org/logo/Honda-logo-1920x1080.png'
          when ${brand} = 'kia' then 'http://www.carlogos.org/logo/Kia-logo-2560x1440.png'
          when ${brand} = 'alfaromeo' then 'http://www.carlogos.org/logo/Alfa-Romeo-logo-2015-1920x1080.png'
          when ${brand} = 'porsche' then 'http://www.carlogos.org/logo/Porsche-logo-2008-1920x1080.png'
          when ${brand} = 'suzuki' then 'http://www.carlogos.org/logo/Suzuki-logo-5000x2500.png'
          when ${brand} = 'chevrolet' then 'http://www.carlogos.org/logo/Chevrolet-logo-2013-2560x1440.png'
          when ${brand} = 'chrysler' then 'http://www.carlogos.org/logo/Chrysler-logo-2010-1920x1080.png'
          when ${brand} = 'dacia' then 'http://www.carlogos.org/logo/Dacia-logo-2008-1920x1080.png'
          when ${brand} = 'jeep' then 'http://www.carlogos.org/logo/Jeep-logo-green-3840x2160.png'
          when ${brand} = 'subaru' then 'http://www.carlogos.org/logo/Subaru-logo-2003-2560x1440.png'
          when ${brand} = 'landrover' then 'http://www.carlogos.org/logo/Land-Rover-logo-2011-1920x1080.png'
          when ${brand} = 'daihatsu' then 'http://www.carlogos.org/logo/Daihatsu-logo-1997-1280x233.png'
          when ${brand} = 'jaguar' then 'http://www.carlogos.org/logo/Jaguar-logo-2012-1920x1080.png'
          when ${brand} = 'saab' then 'http://www.carlogos.org/logo/Saab-logo-2013-2000x450.png'
          when ${brand} = 'daewoo' then 'http://www.carlogos.org/logo/Daewoo-logo-1920x1080.png'
          when ${brand} = 'lancia' then 'http://www.carlogos.org/logo/Lancia-logo-2007-1920x1080.png'
          when ${brand} = 'rover' then 'http://www.carlogos.org/logo/Rover-logo-2003-3840x2160.png'
          when ${brand} = 'lada' then 'http://www.carlogos.org/logo/Lada-logo-silver-1366x768.jpg'
          when ${brand} = 'trabant' then 'https://www.carsurer.com/sites/default/files/styles/colorbox/public/2017-09/trabant-car-logo.jpg?itok=sCeWF3YU'
          when ${brand} = 'sonstigeautos' then 'http://icons.iconarchive.com/icons/icons8/ios7/256/Transport-Cars-icon.png'
          else null
          end;;
    html: <img size = 10 height = 50 width = 75 src="{{value}}"></img> ;;
  }

  dimension_group: date_created {
    type: time
    timeframes: [
      raw,
      date,
      day_of_week,
      day_of_week_index,
      week,
      time,
      month,
      month_name,
      quarter,
      week_of_year,
      year,
      quarter_of_year
    ]
    convert_tz: no
    sql: ${TABLE}.date_created ;;
  }

  filter: date_filter_new {suggest_dimension: date_created_date
    type: date_time
    sql: {% condition cars_data_large.date_filter_new %}${date_created_date} {% endcondition %} ;;
  }



  filter: timeframe_picker {
    type: string
    suggestions: ["Date", "Week", "Month"]
  }

  dimension: dynamic_timeframe {
    type: string
    can_filter: no
    sql:
    CASE
    WHEN {% condition timeframe_picker %} 'Date' {% endcondition %} THEN TO_CHAR(${cars_data_large.date_created_date}, 'YYYY_MM_DD')
    WHEN {% condition timeframe_picker %} 'Week' {% endcondition %} THEN ${cars_data_large.date_created_week}
    WHEN {% condition timeframe_picker %} 'Month' {% endcondition %} THEN ${cars_data_large.date_created_month}
    END ;;
  }

  dimension: date_test{
    type: date_time
    group_label: "date_created"
    sql: ${date_created_time};;
  }

  dimension: days_on_site {
    type: number
    sql:  date ${last_seen_date} - date ${date_created_date} ;;
  }

  dimension: days_until_sold {
    type: number
    sql: ${TABLE}.days_until_sold ;;
  }

  dimension: user_id {
    tags: ["user_id", "email"]
    type: number
    sql: ${TABLE}.id ;;
  }


  measure: testing_m {
    tags: ["email", "user_id"]
    type: number
    sql: 1 ;;
  }




  dimension: days_until_sold_html {
    type: number
    sql: ${TABLE}.days_until_sold ;;
    html:<div style="border:0px;
    width: 100%;
    height: 64px;
    background: {% if value < 5 %} #33ff00
              {% elsif value < 50 %} #F15854
              {% elsif value < 75 %} #5DA5DA
              {% elsif value < 100 %} #60BD68
              {% elsif value < 200 %} #DECF3F
              {% elsif value < 300 %} #9E9E9E
              {% else %}
              #0080ff
              {% endif %}
    -moz-border-radius: 16px;
    -webkit-border-radius: 16px;
    border-radius: 16px;
    vertical-align: center;
    text-align: center;
    color:black;
    font-size: 12px;
    font-weight: bold;">
    <span style="line-height: 32px;">{{ brand._rendered_value }} - {{ price._rendered_value }} - {{ year_of_registration._rendered_value}}<span>
     <div style='font-size: 14px; font-weight: 600; line-height: 1;'>    <span style="line-height: 32px;"><a target="_blank" href="https://dcl.dev.looker.com//explore/sasha_cars/cars_data_large?fields=cars_data_large.brand,cars_data_large.gearbox,cars_data_large.price,cars_data_large.logo&f[cars_data_large.days_until_sold]={{ cars_data_large.days_until_sold._filterable_value }}">{{ cars_data_large.days_until_sold._rendered_value }}</a><span>
</div>
    <br>
    {{rendered_value}}

    </div> ;;

  }




  measure: ave_days_sold {
    type: average
    sql: ${days_until_sold} ;;
    value_format_name: decimal_0
  }

  dimension: fuel_type {
    type: string
    sql: ${TABLE}.fuel_type ;;
  }

  dimension: is_petrol_is_diesel{
    type: yesno
    sql: ${TABLE}.fuel_type = 'benzin' OR ${TABLE}.fuel_type = 'diesel';;
  }


  dimension: gearbox {
    type: string
    sql: ${TABLE}.gearbox ;;
  }

  dimension: kilometer {
    type: number
    sql: ${TABLE}.kilometer ;;
  }

  dimension_group: last_seen {
    type: time
    timeframes: [
      raw,
      date,
      week,
      month,
      quarter,
      year,
      quarter_of_year
    ]
    convert_tz: no
    sql: ${TABLE}.last_seen ;;
  }

  dimension: model {
    type: string
    sql: ${TABLE}.model ;;
    full_suggestions: yes
  }
  dimension: month_of_regestration_{
    hidden: yes
    type: number
    sql: ${TABLE}.month_of_registration ;;
  }


  dimension: month_of_registration {
    type: string
    sql: CASE
          WHEN ${TABLE}.month_of_registration = 1 THEN 'JANUARY'
          WHEN ${TABLE}.month_of_registration = 2 THEN 'FEBRUARY'
          WHEN ${TABLE}.month_of_registration = 3 THEN 'MARCH'
          WHEN ${TABLE}.month_of_registration = 4 THEN 'APRIL'
          WHEN ${TABLE}.month_of_registration = 5 THEN 'MAY'
          WHEN ${TABLE}.month_of_registration = 6 THEN 'JUNE'
          WHEN ${TABLE}.month_of_registration = 7 THEN 'JULY'
          WHEN ${TABLE}.month_of_registration = 8 THEN 'AUGUST'
          WHEN ${TABLE}.month_of_registration = 9 THEN 'SEPTEMBER'
          WHEN ${TABLE}.month_of_registration = 10 THEN 'OCTOBER'
          WHEN ${TABLE}.month_of_registration = 11 THEN 'NOVEMBER'
          WHEN ${TABLE}.month_of_registration = 12 THEN 'DECEMBER'
          END ;;
    order_by_field: month_of_regestration_
  }

  dimension: name {
    type: string
    sql: ${TABLE}.name ;;
  }

  dimension: not_repaired_damage {
    type: string
    sql: ${TABLE}.not_repaired_damage ;;
  }

  dimension: postal_code {
    type: number
    sql: ${TABLE}.postal_code ;;
  }

  dimension: power_ps {
    type: number
    sql: ${TABLE}.power_ps ;;
    drill_fields: [brand,name]
  }

  dimension: power_ps_tier {
    type: tier
    tiers: [0, 100, 200, 300, 400, 500, 600, 700, 800]
    style: integer
    sql: ${power_ps} ;;
    value_format: "*00#"
  }

  dimension: price {
    type: number
    sql: ${TABLE}.price ;;
    value_format_name: eur_0
    link:{
      label: "test"
      url: "/dashboards/german_used_cars::price?price_bucket={{value}}"
    }
  }

  dimension: price_tier {
    type: tier
    tiers: [0,20001,50001,100001,500001,1000000]
    style: integer
    sql: ${price} ;;
    value_format_name: eur_0
  }

  dimension: difference_from_average_price {
    type: number
    sql: ${sales_facts.average_price} - ${price} ;;
    value_format_name: eur_0
  }

  measure: most_expensive_item {
    type: max
    sql: ${price} ;;
    drill_fields: [id, name, count, year_of_registration, price, brand]
    #value_format_name: eur_0
    value_format: "\"€ \"#,##0"
  }


  measure: most_expensive_item_html {
    type: max
    sql: ${price} ;;
    drill_fields: [id, name, count, year_of_registration, price, brand]
    #value_format_name: eur_0
    value_format: "\"€ \"#,##0"
    html:<div style="border:0px;
    width: 100%;
    height: 64px;
    background: {% if value < 1000000 %}#60BD68{% else %}#F15854{% endif %}
    -moz-border-radius: 16px;
    -webkit-border-radius: 16px;
    border-radius: 16px;
    vertical-align: center;
    text-align: center;
    color:black;
    font-size: 12px;
    font-weight: bold;">
    <span style="line-height: 32px;">{{ brand._rendered_value }} - {{ model._rendered_value }} - {{ year_of_registration._rendered_value }}<span>
    <div style='font-size: 14px; font-weight: 600; line-height: 1;'>    <span style="line-height: 32px;"><a target="_blank" href="https://dcl.dev.looker.com//explore/sasha_cars/cars_data_large?fields=cars_data_large.brand,cars_data_large.gearbox,cars_data_large.price,cars_data_large.logo&f[cars_data_large.most_expensive_item]={{ cars_data_large.most_expensive_item._filterable_value }}">{{ cars_data_large.most_expensive_item._rendered_value }}</a><span>
</div>
    <br>
    {{rendered_value}}

    </div> ;;

  }

  measure: least_expensive_item {
    type: min
    sql: ${price} ;;
    drill_fields: [id, name, count, year_of_registration, price, brand]
    #value_format_name: decimal_0
    value_format: "\"€ \"#,##0"
  }
  measure: average_sale_price {
    type: average
    sql: ${price} ;;
    drill_fields: [id, name, count, year_of_registration, price, brand]
    #value_format:  "\"€ \"#,##0.00"
    value_format: "\"€ \"#,##0"
  }
  measure: total_sale_price {
    type: sum
    sql: ${price} ;;
    drill_fields: [id, name, count, year_of_registration, price, brand]
    #value_format_name: decimal_0
    value_format: "\"€ \"#,##0"
  }

  parameter: sale_price_metric_picker {
    description: "Use with the Sale Price Metric measure"
    type: unquoted
    allowed_value: {
      label: "Total Sale Price"
      value: "SUM"
    }
    allowed_value: {
      label: "Average Sale Price"
      value: "AVG"
    }
    allowed_value: {
      label: "Maximum Sale Price"
      value: "MAX"
    }
    allowed_value: {
      label: "Minimum Sale Price"
      value: "MIN"
    }
  }

  measure: sale_price_metric {
    description: "Use with the Sale Price Metric Picker filter-only field"
    type: number
    label_from_parameter: sale_price_metric_picker
    sql: {% parameter sale_price_metric_picker %}(${price}) ;;
    value_format_name: eur_0
  }




  filter: brand_count_picker {
    description: "Use with the Category Count measure"
    type: string
    suggest_explore: cars_data_large
    suggest_dimension: cars_data_large.brand
  }

  measure: category_count {
    description: "Use with the Brand Count Picker filter-only field"
    type: sum
    sql:
    CASE
      WHEN {% condition brand_count_picker %} ${cars_data_large.brand} {% endcondition %}
      THEN 1
      ELSE 0
    END
  ;;
  }




  measure: ave_kilometers {
    type: average
    sql: ${kilometer} ;;
    value_format_name: decimal_0
  }
  dimension: vehicle_type {
    type: string
    sql: ${TABLE}.vehicle_type ;;
  }

  dimension: year_of_registration {
    type: number
    sql: ${TABLE}.year_of_registration ;;
    full_suggestions: yes
    value_format: "0"
  }


  dimension: year_of_registration_html {
    type: number
    sql: ${TABLE}.year_of_registration ;;
    html:<div style="border:0px;
    width: 100%;
    height: 64px;
    background: {% if value < 1990 %}#60BD68{% else %}#F15854{% endif %}
    -moz-border-radius: 16px;
    -webkit-border-radius: 16px;
    border-radius: 16px;
    vertical-align: center;
    text-align: center;
    color:black;
    font-size: 12px;
    font-weight: bold;">
    <span style="line-height: 32px;">{{ brand._rendered_value }} - {{ price._rendered_value }}<span>
    <div style='font-size: 14px; font-weight: 600; line-height: 1;'>    <span style="line-height: 32px;"><a target="_blank" href="https://dcl.dev.looker.com//explore/sasha_cars/cars_data_large?fields=cars_data_large.brand,cars_data_large.gearbox,cars_data_large.price,cars_data_large.logo&f[cars_data_large.year_of_registration]={{ cars_data_large.year_of_registration._filterable_value }}">{{ cars_data_large.year_of_registration._rendered_value }}</a><span>
</div>
    <br>
    {{rendered_value}}

    </div> ;;
  }




  dimension: location {
    type: location
    sql_latitude: ${location_data.latitude} ;;
    sql_longitude: ${location_data.longitude} ;;
  }
  measure: count {
    type: count
    drill_fields: [id, name, count, year_of_registration, price, brand]
    #html: <font size="5">{{ rendered_value }}</font> ;;
  }


  measure: count_html {
    type: count
    drill_fields: [id, name, count, year_of_registration, price, brand]
  html:
  <table style='background-color: transparent !important; border:none;'><tbody><tr style='border:none;'>
  <td style='text-align: center; border:none; padding: 0; min-width: 0; width: 40px;'>
  <div style="border:0px;
  width: 64px;
  height: 64px;
  background: {% if value < 3200 %} #33ff00
              {% elsif value < 5000 %} #F15854
              {% elsif value < 7500 %} #5DA5DA
              {% elsif value < 10000 %} #60BD68
              {% elsif value < 15000 %} #DECF3F
              {% elsif value < 20000 %} #9E9E9E
              {% else %}
             #0080ff
              {% endif %}
              -moz-border-radius: 16px;
              -webkit-border-radius: 16px;
              border-radius: 16px;
              line-height: 32px;
              vertical-align: middle;
              text-align: center;
              color:black;
              font-size: 12px;
              font-weight: bold;">
              {{ value }}
              </div>
              </td>
              <td style='text-align: center; border: none;'>
              <div style='font-size: 14px; font-weight: 600; line-height: 1;'>    <span style="line-height: 32px;"><a target="_blank" href="https://dcl.dev.looker.com//explore/sasha_cars/cars_data_large?fields=cars_data_large.brand,cars_data_large.gearbox,cars_data_large.price,cars_data_large.logo&f[location_data.state]={{ location_data.state._filterable_value }}">{{ location_data.state._rendered_value }}</a><span>
</div>

              </td>
              </tr></tbody></table>

              ;;
                }

  measure: count_html_city {
    type: count
    drill_fields: [id, name, count, year_of_registration, price, brand]
    html:
      <table style='background-color: transparent !important; border:none;'><tbody><tr style='border:none;'>
      <td style='text-align: center; border:none; padding: 0; min-width: 0; width: 40px;'>
      <div style="border:0px;
      width: 64px;
      height: 64px;
      background: {% if value < 3200 %} #33ff00
                  {% elsif value < 5000 %} #F15854
                  {% elsif value < 7500 %} #800000
                  {% elsif value < 10000 %} #60BD68
                  {% elsif value < 15000 %} #0080ff
                  {% elsif value < 20000 %} #996666
                  {% else %}
                  #ff00bf
                  {% endif %}
                  -moz-border-radius: 16px;
                  -webkit-border-radius: 16px;
                  border-radius: 16px;
                  line-height: 32px;
                  vertical-align: middle;
                  text-align: center;
                  color:black;
                  font-size: 12px;
                  font-weight: bold;">
                  {{ value }}
                  </div>
                  </td>
                  <td style='text-align: center; border: none;'>
                  <div style='font-size: 14px; font-weight: 600; line-height: 1;'>{{ location_data.city._rendered_value }}</div>

                  </td>
                  </tr></tbody></table>

                  ;;
  }


  measure: most_recent_sold {
    type: date
    sql: MAX(${last_seen_date}) ;;
  }
  measure: percent_of_total_count {
    type: percent_of_total
    sql: ${count} ;;
    drill_fields: [id, name, count, year_of_registration, price, brand]
  }

  measure: count_brand {
    type: count
    drill_fields: [id, name, count, year_of_registration, price, brand]
    filters: {
      field: days_until_sold
      value: "0"
    }
  }
  measure: count_filter_value_yes {
    type: count
    drill_fields: [id, name, count, year_of_registration, price, brand]
    filters: {
      field: brand_selector
      value: "yes"
    }
  }
  measure: revenue {
    type: sum
    drill_fields: [id, name, count, year_of_registration, price, brand]
    filters: {
      field: price
      value: "500 to 1000000"
    }
    sql: ${price} ;;
    #value_format_name: usd_0
    value_format: "\"€ \"#,##0"

#  link:{
#   label: "test"
#    url: "/dashboards/german_used_cars::Test_dash"
#  }

  }


  measure: total_Dau_2 {
    type: sum
    sql: ${price} ;;
    html:
    <summary style="outline:none"> Dau: {{ revenue._rendered_value }}
    </summary>Total Dau: {{ count._rendered_value }}
    <summary style="outline:none"> Percentage: {{ percent_of_total_count._rendered_value }}
    </summary> <br/>;;
  }


  measure: html_test {
    type: sum
    sql: ${price} ;;
    html: {% if value <= 5000000 %}
          <div style = "color: black; background-color: #4FBC89; font-size:100%; text-align:center">{{rendered_value}}</div>
          {% elsif value > 5000001 and value <= 10000000 %}
          <div style = "color: black; background-color: #FCF758; font-size:100%; text-align:center">{{rendered_value}}</div>
          {% elsif value > 10000001 and value <= 25000000 %}
          <div style = "color: black; background-color: #ff3399; font-size:100%; text-align:center">{{rendered_value}}</div>
          {% elsif value > 25000001 and value <= 50000000 %}
          <div style = "color: black; background-color: #00ff00; font-size:100%; text-align:center">{{rendered_value}}</div>
          {% else %}
          <p style="color: black; background-color: #0099ff; font-size:100%; text-align:center">{{ rendered_value }}</p>
          {% endif %}

          ;;
  }


  measure: median_price {
    type: median
    sql: ${price} ;;
    drill_fields: [id, name, count, year_of_registration, price, brand]
    value_format_name: eur
  }

  measure: count_filter_value_no {
    type: count
    drill_fields: [id, name, count, year_of_registration, price, brand]
    filters: {
      field: brand_selector
      value: "no"
    }
  }

  measure: sum_per_brand_revenue {
    type: number
    sql: CASE
          WHEN (${brand} = 'bmw') THEN Sum(${price})
          WHEN (${brand} = 'audi') THEN Sum(${price})
          WHEN (${brand} = 'alfaromeo') THEN Sum(${price})
          WHEN (${brand} = 'daewoo') THEN Sum(${price})
          WHEN (${brand} = 'lancia') THEN Sum(${price})
          WHEN (${brand} = 'renault') THEN Sum(${price})
          WHEN (${brand} = 'ford') THEN Sum(${price})
          WHEN (${brand} = 'toyota') THEN Sum(${price})
          WHEN (${brand} = 'sonstigeautos') THEN Sum(${price})
          WHEN (${brand} = 'kia') THEN Sum(${price})
          WHEN (${brand} = 'peugeot') THEN Sum(${price})
          WHEN (${brand} = 'subaru') THEN Sum(${price})
          WHEN (${brand} = 'nissan') THEN Sum(${price})
          WHEN (${brand} = 'rover') THEN Sum(${price})
          WHEN (${brand} = 'mitsubishi') THEN Sum(${price})
          WHEN (${brand} = 'dacia') THEN Sum(${price})
          WHEN (${brand} = 'chevrolet') THEN Sum(${price})
          WHEN (${brand} = 'honda') THEN Sum(${price})
          WHEN (${brand} = 'daihatsu') THEN Sum(${price})
          WHEN (${brand} = 'hyundai') THEN Sum(${price})
          WHEN (${brand} = 'porsche') THEN Sum(${price})
          WHEN (${brand} = 'smart') THEN Sum(${price})
          WHEN (${brand} = 'suzuki') THEN Sum(${price})
          WHEN (${brand} = 'mazda') THEN Sum(${price})
          WHEN (${brand} = 'landrover') THEN Sum(${price})
          WHEN (${brand} = 'mercedesbenz') THEN Sum(${price})
          WHEN (${brand} = 'volkswagen') THEN Sum(${price})
          WHEN (${brand} = 'volvo') THEN Sum(${price})
          WHEN (${brand} = 'fiat') THEN Sum(${price})
          WHEN (${brand} = 'seat') THEN Sum(${price})
          WHEN (${brand} = 'mini') THEN Sum(${price})
          WHEN (${brand} = 'saab') THEN Sum(${price})
          WHEN (${brand} = 'opel') THEN Sum(${price})
          WHEN (${brand} = 'jaguar') THEN Sum(${price})
          WHEN (${brand} = 'skoda') THEN Sum(${price})
          WHEN (${brand} = 'chrysler') THEN Sum(${price})
          WHEN (${brand} = 'jeep') THEN Sum(${price})
          WHEN (${brand} = 'citroen') THEN Sum(${price})
          WHEN (${brand} = 'lada') THEN Sum(${price})
          WHEN (${brand} = 'trabant') THEN Sum(${price})



     ELSE
     NULL END;;
  }


  dimension: brand_selector {
    type: yesno
    sql: {% condition cars_data_large.brand_filter %}${brand} {% endcondition %};;
  }
  filter: brand_filter {suggest_dimension: brand
    type: string
  }

  filter: brand_filter_new {suggest_dimension: brand
    type: string
    sql: {% condition cars_data_large.brand_filter_new %}${brand} {% endcondition %} ;;
  }

  filter: TESTYESNOFILTER {suggest_dimension: brand
    type: yesno
    sql: ${brand};;
  }



#############################


  parameter: sasha_test {
    description: "Use with the Sale Price Metric measure"
    type: string
    allowed_value: {
      label: "location"
      value: "location"
    }
  }




  ############################









}
