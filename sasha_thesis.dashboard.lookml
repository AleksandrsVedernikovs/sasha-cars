- dashboard: sasha_thesis
  title: sasha_thesis
  layout: newspaper
  elements:
  - title: amount_of_adverts_published
    name: amount_of_adverts_published
    model: sasha_cars
    explore: cars_data_large
    type: looker_pie
    fields:
    - cars_data_large.date_created_month
    - cars_data_large.count
    sorts:
    - cars_data_large.date_created_month desc
    limit: 500
    column_limit: 50
    value_labels: labels
    label_type: labVal
    stacking: ''
    show_value_labels: false
    label_density: 25
    legend_position: center
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: true
    limit_displayed_rows: false
    y_axis_combined: true
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    x_axis_scale: auto
    y_axis_scale_mode: linear
    show_null_points: true
    point_style: none
    interpolation: linear
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    ordering: none
    show_null_labels: false
    column_spacing_ratio:
    column_group_spacing_ratio:
    series_types: {}
    colors: 'palette: Santa Cruz'
    series_colors: {}
    listen:
      Brand_filter: cars_data_large.brand
    row: 0
    col: 0
    width: 10
    height: 6
  - title: breakdown_of_ads_per_day_published_april
    name: breakdown_of_ads_per_day_published_april
    model: sasha_cars
    explore: cars_data_large
    type: looker_funnel
    fields:
    - cars_data_large.count
    - cars_data_large.date_created_day_of_week
    filters:
      cars_data_large.date_created_month_name: March
    sorts:
    - cars_data_large.count desc
    limit: 500
    column_limit: 50
    leftAxisLabelVisible: false
    leftAxisLabel: ''
    rightAxisLabelVisible: false
    rightAxisLabel: ''
    barColors:
    - 'palette: Tomato to Steel Blue'
    smoothedBars: true
    orientation: columns
    labelPosition: left
    percentType: total
    percentPosition: inline
    valuePosition: right
    labelColorEnabled: true
    labelColor: "#4d3d3d"
    groupBars: true
    labelSize: 10pt
    showLegend: true
    show_value_labels: false
    font_size: 12
    color_range:
    - "#dd3333"
    - "#80ce5d"
    - "#f78131"
    - "#369dc1"
    - "#c572d3"
    - "#36c1b3"
    - "#b57052"
    - "#ed69af"
    stacking: ''
    label_density: 25
    legend_position: center
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: true
    limit_displayed_rows: false
    y_axis_combined: true
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    x_axis_scale: auto
    y_axis_scale_mode: linear
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    value_labels: labels
    label_type: labVal
    show_null_points: true
    point_style: none
    interpolation: linear
    series_types: {}
    listen:
      Brand_filter: cars_data_large.brand
    row: 0
    col: 10
    width: 10
    height: 6
  - title: Top_10_brands_for_sale
    name: Top_10_brands_for_sale
    model: sasha_cars
    explore: cars_data_large
    type: looker_column
    fields:
    - cars_data_large.count
    - cars_data_large.logo
    sorts:
    - cars_data_large.count desc
    limit: 500
    column_limit: 50
    stacking: ''
    show_value_labels: true
    label_density: 25
    legend_position: center
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: true
    limit_displayed_rows: true
    y_axis_combined: true
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    x_axis_scale: auto
    y_axis_scale_mode: linear
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    value_labels: labels
    label_type: labVal
    show_null_points: true
    point_style: none
    interpolation: linear
    series_types: {}
    colors:
    - 'palette: Santa Cruz'
    series_colors: {}
    label_color:
    - black
    limit_displayed_rows_values:
      show_hide: show
      first_last: first
      num_rows: '10'
    listen:
      Brand_filter: cars_data_large.brand
    row: 11
    col: 0
    width: 20
    height: 12
  - title: Fuel_type_brakedown
    name: Fuel_type_brakedown
    model: sasha_cars
    explore: cars_data_large
    type: looker_column
    fields:
    - cars_data_large.count
    - cars_data_large.fuel_type
    sorts:
    - cars_data_large.count desc
    limit: 500
    dynamic_fields:
    - table_calculation: fuel_type
      label: Fuel_type
      expression: |-
        if(contains(${cars_data_large.fuel_type},"benzin"),"Petrol",
            if(contains(${cars_data_large.fuel_type},"diesel"),"Diesel",
                if(contains(${cars_data_large.fuel_type},"lpg"),"Liquefied Petroleum Gas",
                    if(contains(${cars_data_large.fuel_type},"cng"),"Compressed Natural Gas",
                        if(contains(${cars_data_large.fuel_type},"hybrid"),"Hybrid",
                            if(contains(${cars_data_large.fuel_type},"elektro"),"Electric",
                                if(contains(${cars_data_large.fuel_type},"andere"),"Bad_Data","Value_not_Entered")))))))
      value_format:
      value_format_name:
      _kind_hint: dimension
      _type_hint: string
    query_timezone: America/Los_Angeles
    stacking: ''
    show_value_labels: true
    label_density: 25
    legend_position: center
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: true
    limit_displayed_rows: false
    y_axis_combined: true
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    x_axis_scale: auto
    y_axis_scale_mode: linear
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    show_row_numbers: true
    truncate_column_names: false
    hide_totals: false
    hide_row_totals: false
    table_theme: editable
    enable_conditional_formatting: true
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    show_null_points: true
    point_style: circle
    interpolation: linear
    value_labels: legend
    label_type: labPer
    map_plot_mode: points
    heatmap_gridlines: false
    heatmap_gridlines_empty: false
    heatmap_opacity: 0.5
    show_region_field: true
    draw_map_labels_above_data: true
    map_tile_provider: positron
    map_position: fit_data
    map_scale_indicator: 'off'
    map_pannable: true
    map_zoomable: true
    map_marker_type: circle
    map_marker_icon_name: default
    map_marker_radius_mode: proportional_value
    map_marker_units: meters
    map_marker_proportional_scale_type: linear
    map_marker_color_mode: fixed
    show_legend: true
    quantize_map_value_colors: false
    reverse_map_value_colors: false
    custom_color_enabled: false
    custom_color: forestgreen
    show_single_value_title: true
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    color_range:
    - "#dd3333"
    - "#80ce5d"
    - "#f78131"
    - "#369dc1"
    - "#c572d3"
    - "#36c1b3"
    - "#b57052"
    - "#ed69af"
    series_types: {}
    colors:
    - "#a6cee3"
    - "#1f78b4"
    - "#b2df8a"
    - "#33a02c"
    - "#fb9a99"
    - "#e31a1c"
    - "#fdbf6f"
    - "#ff7f00"
    - "#cab2d6"
    - "#7438b4"
    - "#edbc0e"
    - "#b15928"
    series_colors:
      cars_data_large.count: "#4752a5"
    label_color:
    - black
    limit_displayed_rows_values:
      show_hide: hide
      first_last: first
      num_rows: 0
    conditional_formatting:
    - type: not null
      value:
      background_color: "#ded825"
      font_color:
      palette:
        name: Red to Yellow to Green
        colors:
        - "#F36254"
        - "#FCF758"
        - "#4FBC89"
      bold: false
      italic: false
      strikethrough: false
      fields:
    - type: 'null'
      value:
      background_color: "#5868fc"
      font_color: "#0e0e0f"
      palette:
        name: Red to Yellow to Green
        colors:
        - "#F36254"
        - "#FCF758"
        - "#4FBC89"
      bold: false
      italic: false
      strikethrough: false
      fields: []
    hidden_fields:
    - cars_data_large.fuel_type
    listen:
      Brand_filter: cars_data_large.brand
    row: 44
    col: 0
    width: 10
    height: 9
  - title: Gearbox_brakedown
    name: Gearbox_brakedown
    model: sasha_cars
    explore: cars_data_large
    type: looker_column
    fields:
    - cars_data_large.count
    - cars_data_large.gearbox
    sorts:
    - cars_data_large.count desc
    limit: 500
    dynamic_fields:
    - table_calculation: label_test
      label: label_test
      expression: |-
        if(contains(${cars_data_large.gearbox},"automatik"),"Auto",
          if(contains(${cars_data_large.gearbox},"manuell"),"Manual","Data_not_entered"))
      value_format:
      value_format_name:
      _kind_hint: dimension
      _type_hint: string
    query_timezone: America/Los_Angeles
    stacking: ''
    show_value_labels: true
    label_density: 25
    legend_position: center
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: false
    limit_displayed_rows: false
    y_axis_combined: true
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: false
    show_x_axis_ticks: true
    x_axis_scale: auto
    y_axis_scale_mode: linear
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    show_row_numbers: true
    truncate_column_names: false
    hide_totals: false
    hide_row_totals: false
    table_theme: editable
    enable_conditional_formatting: true
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    show_null_points: true
    point_style: circle
    interpolation: linear
    value_labels: legend
    label_type: labPer
    map_plot_mode: points
    heatmap_gridlines: false
    heatmap_gridlines_empty: false
    heatmap_opacity: 0.5
    show_region_field: true
    draw_map_labels_above_data: true
    map_tile_provider: positron
    map_position: fit_data
    map_scale_indicator: 'off'
    map_pannable: true
    map_zoomable: true
    map_marker_type: circle
    map_marker_icon_name: default
    map_marker_radius_mode: proportional_value
    map_marker_units: meters
    map_marker_proportional_scale_type: linear
    map_marker_color_mode: fixed
    show_legend: true
    quantize_map_value_colors: false
    reverse_map_value_colors: false
    custom_color_enabled: false
    custom_color: forestgreen
    show_single_value_title: true
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    color_range:
    - "#dd3333"
    - "#80ce5d"
    - "#f78131"
    - "#369dc1"
    - "#c572d3"
    - "#36c1b3"
    - "#b57052"
    - "#ed69af"
    series_types: {}
    colors:
    - "#a6cee3"
    - "#1f78b4"
    - "#b2df8a"
    - "#33a02c"
    - "#fb9a99"
    - "#e31a1c"
    - "#fdbf6f"
    - "#ff7f00"
    - "#cab2d6"
    - "#7438b4"
    - "#edbc0e"
    - "#b15928"
    series_colors:
      cars_data_large.count: "#4752a5"
    label_color:
    - black
    limit_displayed_rows_values:
      show_hide: hide
      first_last: first
      num_rows: 0
    conditional_formatting:
    - type: not null
      value:
      background_color: "#ded825"
      font_color:
      palette:
        name: Red to Yellow to Green
        colors:
        - "#F36254"
        - "#FCF758"
        - "#4FBC89"
      bold: false
      italic: false
      strikethrough: false
      fields:
    - type: 'null'
      value:
      background_color: "#5868fc"
      font_color: "#0e0e0f"
      palette:
        name: Red to Yellow to Green
        colors:
        - "#F36254"
        - "#FCF758"
        - "#4FBC89"
      bold: false
      italic: false
      strikethrough: false
      fields: []
    series_labels: {}
    y_axes:
    - label: ''
      maxValue:
      minValue:
      orientation: left
      showLabels: true
      showValues: true
      tickDensity: default
      tickDensityCustom: 5
      type: linear
      unpinAxis: false
      valueFormat: ''
      series:
      - id: cars_data_large.count
        name: Cars Data Large
        axisId: cars_data_large.count
    hide_legend: false
    x_axis_datetime_label: ''
    hidden_fields:
    - cars_data_large.gearbox
    listen:
      Brand_filter: cars_data_large.brand
    note_state: collapsed
    note_display: above
    note_text: ''
    row: 44
    col: 10
    width: 10
    height: 9
  - name: Fuel Type
    type: text
    title_text: Fuel Type
    body_text: |-
      “Alternative”" sources of energy are almost negligible in this dataset, which is not surprising considering that over 50% of the vehicles were 12 to 13 years old when this data was extracted.

      Petrol is roughly twice as prominent as Diesel.
      Dataset contains ~21000 NAs
    row: 40
    col: 0
    width: 10
    height: 4
  - name: Gearbox
    type: text
    title_text: Gearbox
    body_text: The European market is primarily a manual transmission market, so no
      surprises here. Again, there are about 6,000 NAs.
    row: 40
    col: 10
    width: 10
    height: 4
  - name: Brands
    type: text
    title_text: Brands
    body_text: |-
      The top 5 brands are German. Number 6 is Ford, which in Europe is largely perceived as German as it has its European headquarters in Cologne and many of its European products are actually designed and built in Germany. The next two brands are French, then Fiat is Italian. Seat is Spanish but it is actually part of the VW Group and their cars share almost all their components with VW products.
      In other words, German manufacturers are hugely dominant on their home turf.
    row: 6
    col: 0
    width: 20
    height: 5
  - title: Vehicle_type_brakedown
    name: Vehicle_type_brakedown
    model: sasha_cars
    explore: cars_data_large
    type: looker_column
    fields:
    - cars_data_large.vehicle_type
    - cars_data_large.count
    sorts:
    - cars_data_large.count desc
    limit: 500
    column_limit: 50
    dynamic_fields:
    - table_calculation: vehicle_type
      label: Vehicle_type
      expression: |-
        if(contains(${cars_data_large.vehicle_type},"limousine"),"Sedan",
          if(contains(${cars_data_large.vehicle_type},"kleinwagen"),"Small car",
             if(contains(${cars_data_large.vehicle_type},"kombi"),"Estate",
              if(contains(${cars_data_large.vehicle_type},"bus"),"People Carrier",
                if(contains(${cars_data_large.vehicle_type},"cabrio"),"Convertible",
                  if(contains(${cars_data_large.vehicle_type},"coupe"),"Coupe",
                    if(contains(${cars_data_large.vehicle_type},"suv"),"Suv",
                      if(contains(${cars_data_large.vehicle_type},"andere"),"Other","No_Data"))))))))
      value_format:
      value_format_name:
      _kind_hint: dimension
      _type_hint: string
    stacking: ''
    show_value_labels: true
    label_density: 25
    legend_position: center
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: true
    limit_displayed_rows: false
    y_axis_combined: true
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    x_axis_scale: auto
    y_axis_scale_mode: linear
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    colors:
    - "#a6cee3"
    - "#1f78b4"
    - "#b2df8a"
    - "#33a02c"
    - "#fb9a99"
    - "#e31a1c"
    - "#fdbf6f"
    - "#ff7f00"
    - "#cab2d6"
    - "#3094c9"
    - "#edbc0e"
    - "#b15928"
    label_color:
    - black
    hide_legend: false
    series_colors:
      cars_data_large.count: "#5252dd"
    series_labels: {}
    series_types: {}
    limit_displayed_rows_values:
      show_hide: hide
      first_last: first
      num_rows: 0
    y_axes:
    - label: Amount of cars
      maxValue:
      minValue:
      orientation: left
      showLabels: true
      showValues: true
      tickDensity: default
      tickDensityCustom: 5
      type: linear
      unpinAxis: false
      valueFormat: ''
      series:
      - id: cars_data_large.count
        name: Cars Data Large Count
        axisId: cars_data_large.count
    x_axis_datetime_label: ''
    hidden_fields:
    - cars_data_large.vehicle_type
    listen:
      Brand_filter: cars_data_large.brand
    row: 58
    col: 0
    width: 20
    height: 9
  - title: Price_distribution
    name: Price_distribution
    model: sasha_cars
    explore: cars_data_large
    type: looker_scatter
    fields:
    - cars_data_large.count
    - cars_data_large.price
    filters:
      cars_data_large.price: "[500, 1000000]"
    sorts:
    - cars_data_large.price desc
    limit: 5000
    column_limit: 50
    stacking: ''
    show_value_labels: false
    label_density: 21
    legend_position: center
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: true
    limit_displayed_rows: false
    y_axis_combined: true
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    x_axis_scale: auto
    y_axis_scale_mode: linear
    show_null_points: true
    point_style: circle_outline
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    colors:
    - "#a6cee3"
    - "#1f78b4"
    - "#b2df8a"
    - "#33a02c"
    - "#fb9a99"
    - "#e31a1c"
    - "#fdbf6f"
    - "#ff7f00"
    - "#cab2d6"
    - "#3094c9"
    - "#edbc0e"
    - "#b15928"
    label_color:
    - black
    hide_legend: false
    series_colors:
      cars_data_large.count: "#5252dd"
    series_labels: {}
    series_types: {}
    limit_displayed_rows_values:
      show_hide: hide
      first_last: first
      num_rows: 0
    y_axes:
    - label: Amount of cars
      maxValue:
      minValue:
      orientation: left
      showLabels: true
      showValues: true
      tickDensity: default
      tickDensityCustom: 5
      type: linear
      unpinAxis: false
      valueFormat: ''
      series:
      - id: cars_data_large.count
        name: Cars Data Large Count
        axisId: cars_data_large.count
    x_axis_datetime_label: ''
    x_axis_label: Price_range
    trend_lines:
    - color: "#f01111"
      label_position: right
      period: 7
      regression_type: exponential
      series_index: 1
      show_label: true
      label_type: string
    listen:
      Brand_filter: cars_data_large.brand
    row: 72
    col: 0
    width: 20
    height: 9
  - title: registration year distribution
    name: registration year distribution
    model: sasha_cars
    explore: cars_data_large
    type: looker_column
    fields:
    - cars_data_large.year_of_registration
    - cars_data_large.count
    filters:
      cars_data_large.year_of_registration: "[1960, 2016]"
    sorts:
    - cars_data_large.year_of_registration desc
    limit: 500
    column_limit: 50
    stacking: ''
    show_value_labels: true
    label_density: 25
    legend_position: center
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: true
    limit_displayed_rows: false
    y_axis_combined: true
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    x_axis_scale: auto
    y_axis_scale_mode: linear
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    reference_lines: []
    trend_lines: []
    y_axes:
    - label: ''
      maxValue:
      minValue:
      orientation: left
      showLabels: true
      showValues: true
      tickDensity: default
      tickDensityCustom: 5
      type: linear
      unpinAxis: false
      valueFormat:
      series:
      - id: cars_data_large.count
        name: Cars Data Large Count
        axisId: cars_data_large.count
    series_types: {}
    colors:
    - 'palette: Santa Cruz'
    series_colors:
      calculation_1: "#23d923"
    series_labels:
      calculation_1: mean
    label_color:
    - black
    font_size: '11'
    listen:
      Brand_filter: cars_data_large.brand
    row: 91
    col: 0
    width: 20
    height: 13
  - name: year_brakedown
    type: text
    title_text: year_brakedown
    body_text: |-
      The distribution is close to normal, with the following exceptions:

      A significant right tail
      Three peaks: one in 1999-2000, one in 2005-2006 and a large one in 2016.
      I did some research and it turns out that 1999, 2000, 2005, 2006 were all among the strongest years for new car registrations in Germany in the last 20 years. As they are also in the heart of the used car market in terms of age, it makes sense that they would translate into these peaks.
      As for 2016, the explanation is less obvious, especially as the data was collected in March and April, which is quite ealy in the year. The peak could be due to some listing errors (on purpose or not) where owners enter a date at random or to attract visitors to their ad. It could also be linked to the website’s features when creating an ad (eg. default value in drop-down menu).
      But there could also be a number of genuine 2016 cars suddenly arriving on the market. Employees in the automotive industry have often access to cheap car leasing schemes, whereby they can change their vehicle every 6 months or so. More importantly, most manufacturers register large numbers of demonstrators, press units and self-registered cars (new vehicles registered by the manufacturer or its dealers, in order to artificially boost market share and / or create cheaper opportunities to capture some customers over the competition).

      Maybe further investigation will tell us whether this theory holds.
    row: 81
    col: 0
    width: 20
    height: 10
  - title: Sales_map_distribution
    name: Sales_map_distribution
    model: sasha_cars
    explore: cars_data_large
    type: looker_map
    fields:
    - cars_data_large.brand
    - cars_data_large.count
    - location_data.state
    sorts:
    - cars_data_large.count desc
    limit: 5000
    column_limit: 50
    map_plot_mode: points
    heatmap_gridlines: true
    heatmap_gridlines_empty: false
    heatmap_opacity: 0.5
    show_region_field: true
    draw_map_labels_above_data: true
    map_tile_provider: positron
    map_position: custom
    map_scale_indicator: 'off'
    map_pannable: true
    map_zoomable: true
    map_marker_type: circle
    map_marker_icon_name: default
    map_marker_radius_mode: proportional_value
    map_marker_units: meters
    map_marker_proportional_scale_type: linear
    map_marker_color_mode: fixed
    show_view_names: true
    show_legend: true
    quantize_map_value_colors: true
    reverse_map_value_colors: false
    map: topojson
    map_projection: ''
    quantize_colors: false
    map_latitude: 50.90303283111257
    map_longitude: 9.865722656250002
    map_zoom: 5
    hidden_fields:
    - cars_data_large.brand
    series_types: {}
    map_value_colors:
    - pink
    - red
    - darkred
    listen:
      Brand_filter: cars_data_large.brand
    row: 205
    col: 0
    width: 20
    height: 13
  - name: Car_sales_map_distribution
    type: text
    title_text: Car_sales_map_distribution
    body_text: By visualising amount of cars sold on our map, we can notice interesting
      patterns especially that premium brands are mainly sold in Western Germany,
      which leads me to believe that wealthier population of Germany lives in the
      west. It would have been interesting to have buyers location data to be able
      to track down who buys them. Doing a bit of research over internet it turns
      out that ~75% of second hand cars are being exported to other western European
      countries.
    row: 199
    col: 0
    width: 20
    height: 6
  - title: Vehicle_month_of_regestration_brakedown
    name: Vehicle_month_of_regestration_brakedown
    model: sasha_cars
    explore: cars_data_large
    type: looker_column
    fields:
    - cars_data_large.month_of_registration
    - cars_data_large.count
    filters:
      cars_data_large.month_of_registration: "-NULL"
    sorts:
    - cars_data_large.month_of_registration
    limit: 5000
    query_timezone: America/Los_Angeles
    stacking: ''
    show_value_labels: true
    label_density: 25
    legend_position: center
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: true
    limit_displayed_rows: false
    y_axis_combined: true
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    x_axis_scale: auto
    y_axis_scale_mode: linear
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    show_row_numbers: false
    truncate_column_names: false
    hide_totals: false
    hide_row_totals: false
    table_theme: editable
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    show_null_points: true
    point_style: none
    interpolation: linear
    series_types: {}
    colors:
    - 'palette: Santa Cruz'
    series_colors: {}
    label_color:
    - black
    listen:
      Brand_filter: cars_data_large.brand
    row: 127
    col: 0
    width: 20
    height: 8
  - name: Month_of_reg_break_down
    type: text
    title_text: Month_of_reg_break_down
    body_text: |-
      We should note from the summary in the beginning that monthOfRegistration contains nearly 38,000 NAs. Again, it is surprising that year seems mandatory (although its value is clearly not controlled) but month is not. This variable is really a categorical variable. When filtering all of those out the picture is much better.

      March and June are the strongest months for vehicle registrations. A quick research on the internet confirmed that this is consistent with the car registration seasonality that we observe in Germany (incidentally, there is a similar effect in France and the UK).
    row: 123
    col: 0
    width: 20
    height: 4
  - title: power_tiers_summary
    name: power_tiers_summary
    model: sasha_cars
    explore: cars_data_large
    type: looker_column
    fields:
    - cars_data_large.count
    - cars_data_large.power_ps_tier
    sorts:
    - cars_data_large.power_ps_tier
    limit: 5000
    query_timezone: America/Los_Angeles
    stacking: ''
    show_value_labels: true
    label_density: 25
    legend_position: center
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: true
    limit_displayed_rows: false
    y_axis_combined: true
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    x_axis_scale: ordinal
    y_axis_scale_mode: linear
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    show_null_points: true
    point_style: none
    interpolation: linear
    barColors:
    - red
    - blue
    groupBars: true
    labelSize: 10pt
    showLegend: true
    color_range:
    - "#dd3333"
    - "#80ce5d"
    - "#f78131"
    - "#369dc1"
    - "#c572d3"
    - "#36c1b3"
    - "#b57052"
    - "#ed69af"
    yAxisMinValue:
    yAxisMaxValue:
    show_row_numbers: false
    truncate_column_names: false
    hide_totals: false
    hide_row_totals: false
    table_theme: editable
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    series_types: {}
    colors:
    - 'palette: Santa Cruz'
    series_colors: {}
    label_color:
    - black
    reference_lines: []
    hidden_fields: []
    listen:
      Brand_filter: cars_data_large.brand
    row: 113
    col: 0
    width: 20
    height: 10
  - name: Power_tiers_dist
    type: text
    title_text: Power_tiers_dist
    body_text: |-
      The engine power is measured using the metric PS (1PS = 736 Watts). Again, we know from the summary that there are some nonsensical values in the data. I was prepared to remove anything below 40PS, but then I realised that there are Trabants in the dataset! This venerable left-over from the East-German Communist era is now widely used in Berlin as a rental car for people looking for a different experience of the city. Its 2-stroke engine managed 26PS!. Out of respect for such an antiquity, I decided to set the lower bound at 25PS.

      As for the excessively high PS values, it looks like most of them are due to people confusing power output and engine capacity (in cm3). I decided to set the limit at 600PS, a more than respectable value.

      The distribution is postively skewed with a long tail (that may contain errors, as we just saw).

      There are some prefered values – around 60, 100, 120, 140 for instance. These are values that have become some sort of “market standards”: Most manufacturers will offer engines around these values. It makes it easier for the consumer to compare products. Real, measurable power output of a car is never exactly equal to its rated horsepower due to variances in industrial processes. Differences of around 5% are not uncommon for a same model.
    row: 104
    col: 0
    width: 20
    height: 9
  - title: top10_popular_models
    name: top10_popular_models
    model: sasha_cars
    explore: cars_data_large
    type: looker_column
    fields:
    - cars_data_large.count
    - cars_data_large.model
    filters:
      cars_data_large.model: "-NULL,-andere"
    sorts:
    - cars_data_large.count desc
    limit: 5000
    query_timezone: America/Los_Angeles
    stacking: ''
    show_value_labels: true
    label_density: 25
    legend_position: center
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: true
    limit_displayed_rows: true
    y_axis_combined: true
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    x_axis_scale: ordinal
    y_axis_scale_mode: linear
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    show_null_points: true
    point_style: circle
    interpolation: linear
    color_range:
    - 'palette: Looker Classic'
    yAxisMinValue:
    yAxisMaxValue:
    font_size: '12'
    barColors:
    - red
    - blue
    groupBars: true
    labelSize: 10pt
    showLegend: true
    show_row_numbers: false
    truncate_column_names: false
    hide_totals: false
    hide_row_totals: false
    table_theme: editable
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    series_types: {}
    colors:
    - 'palette: Santa Cruz'
    series_colors: {}
    label_color:
    - black
    reference_lines: []
    hidden_fields: []
    limit_displayed_rows_values:
      show_hide: show
      first_last: first
      num_rows: '10'
    listen:
      Brand_filter: cars_data_large.brand
    row: 141
    col: 0
    width: 20
    height: 8
  - name: Top10_models
    type: text
    title_text: Top10_models
    body_text: |-
      This factor variable contains 251 levels, far too many to plot. But we can select the top 10:
      Without surprise, the Volkswagen Golf (the most popular car in Europe) is also number one in the dataset. Note the very large number of vehicles designated as “other” – while some of them are probably models that exist but cannot be selected on the eBay website, it is unlikely that their number would be that high so we have to assume that once again, they are mostly due to human error. I have filter those out along with Null's.

      The next car on the list is the BMW 3-Series, which is by no means a cheap car. This fact alone shows that we are indeed working on the German market – the most high-end market in Europe. Overall top 10 models solely represent German manufacturers.
    row: 135
    col: 0
    width: 20
    height: 6
  - title: mileage_distribution
    name: mileage_distribution
    model: sasha_cars
    explore: cars_data_large
    type: table
    fields:
    - cars_data_large.count
    - cars_data_large.kilometer
    sorts:
    - cars_data_large.count desc
    limit: 5000
    query_timezone: America/Los_Angeles
    show_view_names: true
    show_row_numbers: false
    truncate_column_names: false
    hide_totals: false
    hide_row_totals: false
    table_theme: editable
    limit_displayed_rows: true
    enable_conditional_formatting: true
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    stacking: ''
    show_value_labels: true
    label_density: 25
    legend_position: center
    x_axis_gridlines: false
    y_axis_gridlines: true
    y_axis_combined: true
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    x_axis_scale: ordinal
    y_axis_scale_mode: linear
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    color_range:
    - 'palette: Looker Classic'
    yAxisMinValue:
    yAxisMaxValue:
    show_null_points: true
    point_style: circle
    interpolation: linear
    font_size: '12'
    barColors:
    - red
    - blue
    groupBars: true
    labelSize: 10pt
    showLegend: true
    series_types: {}
    colors:
    - "#5245ed"
    - "#f35f66"
    - "#1ea8df"
    - "#353b49"
    - "#49cec1"
    - "#b3a0dd"
    - "#db7f2a"
    - "#706080"
    - "#a2dcf3"
    - "#776fdf"
    - "#e9b404"
    - "#635189"
    series_colors:
      cars_data_large.count: "#ed455f"
    label_color:
    - black
    reference_lines: []
    hidden_fields: []
    limit_displayed_rows_values:
      show_hide: show
      first_last: first
      num_rows: '10'
    conditional_formatting:
    - type: high to low
      value:
      background_color:
      font_color:
      palette:
        name: Red to Yellow to Green
        colors:
        - "#F36254"
        - "#FCF758"
        - "#4FBC89"
      bold: false
      italic: false
      strikethrough: false
      fields:
      - cars_data_large.count
    - type: high to low
      value:
      background_color:
      font_color:
      palette:
        name: Red to Yellow to Green
        colors:
        - "#F36254"
        - "#FCF758"
        - "#4FBC89"
      bold: false
      italic: false
      strikethrough: false
      fields:
      - cars_data_large.kilometer
    listen:
      Brand_filter: cars_data_large.brand
    row: 155
    col: 0
    width: 20
    height: 6
  - name: kilometreage
    type: text
    title_text: kilometreage
    body_text: |-
      This table clearly shows that mileage is not a free input field. This is surprising, because mileage is one of the most important pieces of information when it comes to used cars, so maximum accuracy would have been desirable. Moreover, when I went to E-Bay myself to try out the used car ad generator, I was able to enter any value. So maybe there is some aggregating mechanism during data extract or the functionality changed recently?

      The second thing that is striking with this chart is the predominance of 150,000km cars. Given the nature of the data, there is no point trying to apply scale transformations to improve it.
    row: 149
    col: 0
    width: 20
    height: 6
  - title: brand_groups
    name: brand_groups
    model: sasha_cars
    explore: cars_data_large
    type: looker_column
    fields:
    - cars_data_large.brand_group
    - cars_data_large.count
    sorts:
    - cars_data_large.count desc
    limit: 500
    column_limit: 50
    stacking: ''
    show_value_labels: true
    label_density: 25
    legend_position: center
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: true
    limit_displayed_rows: false
    y_axis_combined: true
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    x_axis_scale: auto
    y_axis_scale_mode: linear
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    colors:
    - 'palette: Santa Cruz'
    series_colors:
      cars_data_large.count: "#d23457"
    label_color:
    - black
    listen:
      Brand_filter: cars_data_large.brand
    row: 32
    col: 0
    width: 20
    height: 8
  - name: Brand__Groups
    type: text
    title_text: Brand__Groups
    body_text: |-
      One issue we will have when looking for associations between variables is that with brand containing 40 levels, plots will be really hard to read (in addition to causing long processing times). We can improve this by grouping brands into categories based on brand perception. We could simply use mean prices to make these distinctions, but we would then create a correlation to price where there isn’t necessarily one. Moreover, brand perception involves a lot more than just price – there is history, perceived quality, marketing etc.
      So I chose another approach: Used domain-knowledge to manually classify the 40 levels into clusters. I didn’t plan on an exact number of clusters beforehand, just something manageable. I then intuitively grouped brands together and came up with 8 clusters which I then named.
      Although this intuitive approach is subjective, I believe it actually adds information to the dataset, unlike the “group by price” method which removes some.
      There are large disparities between brand categories in terms of count. The biggest surprise is the predominance of the premium brands, which are supposedly the most expensive. But the analysis of the top 10 brands above explains it: This category contains BMW, Audi and Mercedes which are all among the most common brands in Germany. Clearly, this plot would look very different in most other countries.
    row: 23
    col: 0
    width: 20
    height: 9
  - title: Damaged/Repaired
    name: Damaged/Repaired
    model: sasha_cars
    explore: cars_data_large
    type: looker_column
    fields:
    - cars_data_large.count
    - cars_data_large.not_repaired_damage
    sorts:
    - cars_data_large.count desc
    limit: 500
    column_limit: 50
    dynamic_fields:
    - table_calculation: repaireddamaged
      label: Repaired/Damaged
      expression: |-
        if(contains(${cars_data_large.not_repaired_damage},"nein"),"No",
          if(contains(${cars_data_large.not_repaired_damage},"ja"),"Yes", "No_Data"))
      value_format:
      value_format_name:
      _kind_hint: dimension
      _type_hint: string
    stacking: ''
    show_value_labels: true
    label_density: 25
    legend_position: center
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: true
    limit_displayed_rows: false
    y_axis_combined: true
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    x_axis_scale: auto
    y_axis_scale_mode: linear
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    colors:
    - 'palette: Santa Cruz'
    series_colors:
      cars_data_large.count: "#d23457"
    label_color:
    - black
    hidden_fields:
    - cars_data_large.not_repaired_damage
    listen:
      Brand_filter: cars_data_large.brand
    row: 161
    col: 10
    width: 10
    height: 6
  - name: damaged
    type: text
    title_text: damaged
    body_text: 'The variable notRepairedDamage can only take two values: “yes” or
      “no”. But it does have NAs – about 49,000, which is nearly twice as many as
      the number of “yes”. It does not seem like this is a mandatory field (and I
      could not find it on EBay). As I understand it, it refers to potential unrepaired
      damage on the vehicle being sold.'
    row: 161
    col: 0
    width: 10
    height: 6
  - title: price_vs_fueltype
    name: price_vs_fueltype
    model: sasha_cars
    explore: cars_data_large
    type: looker_column
    fields:
    - cars_data_large.count
    - cars_data_large.fuel_type
    - cars_data_large.price_tier
    pivots:
    - cars_data_large.fuel_type
    filters:
      cars_data_large.price: "[500, 600000]"
      cars_data_large.fuel_type: benzin,diesel
    sorts:
    - cars_data_large.fuel_type 0
    - cars_data_large.price_tier
    limit: 1000
    column_limit: 5
    query_timezone: America/Los_Angeles
    stacking: ''
    show_value_labels: true
    label_density: 25
    legend_position: center
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: true
    limit_displayed_rows: false
    y_axis_combined: true
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    x_axis_scale: auto
    y_axis_scale_mode: linear
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    color_range:
    - "#dd3333"
    - "#80ce5d"
    - "#f78131"
    - "#369dc1"
    - "#c572d3"
    - "#36c1b3"
    - "#b57052"
    - "#ed69af"
    font_size: '12'
    value_labels: legend
    label_type: labPer
    show_null_points: true
    point_style: none
    interpolation: linear
    show_row_numbers: true
    truncate_column_names: false
    hide_totals: false
    hide_row_totals: false
    table_theme: editable
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    series_types: {}
    y_axes:
    - label: ''
      maxValue:
      minValue:
      orientation: left
      showLabels: true
      showValues: true
      tickDensity: default
      tickDensityCustom: 5
      type: log
      unpinAxis: false
      valueFormat:
      series:
      - id: 'benzin         '
        name: 'benzin         '
        axisId: cars_data_large.count
      - id: 'diesel         '
        name: 'diesel         '
        axisId: cars_data_large.count
    colors:
    - 'palette: Santa Cruz'
    series_colors: {}
    label_color:
    - black
    row: 171
    col: 0
    width: 20
    height: 12
  - name: price&fueltype
    type: text
    title_text: price&fueltype
    body_text: |-
      I have decided to bucket price's into 5 buckets and also filter out only petrol+diesel cars as a vast majority trying to understand weather car fuel type would be strong predictor for the price of the vehicle. What was an interesting find here, was that there are more diesel cars in price range between 20-50k so newer diesel cars seems to be dearer then petrol cars.
      But on the cheapish/expensive side petrol cars are predominant. As diesel cars were not as popular pre 2000 and also hi end cars are mostly petrol engines.
    row: 167
    col: 0
    width: 20
    height: 4
  - title: correlations
    name: correlations
    model: sasha_cars
    explore: cars_data_large
    type: table
    fields:
    - cars_data_large.price
    - cars_data_large.kilometer
    - cars_data_large.year_of_registration
    - cars_data_large.count
    - cars_data_large.power_ps
    filters:
      cars_data_large.year_of_registration: ">1960,<2016"
      cars_data_large.kilometer: ">5000"
      cars_data_large.price: "[500, 600000]"
    sorts:
    - cars_data_large.count desc
    limit: 5000
    column_limit: 50
    dynamic_fields:
    - table_calculation: price_vs_kilometer_correlation
      label: Price_VS_kilometer_correlation
      expression: correl(${cars_data_large.price},${cars_data_large.kilometer})
      value_format:
      value_format_name: decimal_2
      _kind_hint: dimension
      _type_hint: number
    - table_calculation: price_vs_year_of_reg_correlation
      label: Price_VS_year_of_reg_correlation
      expression: correl(${cars_data_large.price},${cars_data_large.year_of_registration})
      value_format:
      value_format_name: decimal_2
      _kind_hint: dimension
      _type_hint: number
    - table_calculation: price_vs_power_correlation
      label: Price_VS_power_correlation
      expression: correl(${cars_data_large.price},${cars_data_large.power_ps})
      value_format:
      value_format_name: decimal_2
      _kind_hint: dimension
      _type_hint: number
    show_view_names: true
    show_row_numbers: true
    truncate_column_names: false
    hide_totals: false
    hide_row_totals: false
    table_theme: editable
    limit_displayed_rows: false
    enable_conditional_formatting: true
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    stacking: ''
    show_value_labels: false
    label_density: 25
    legend_position: center
    x_axis_gridlines: false
    y_axis_gridlines: true
    y_axis_combined: true
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    x_axis_scale: auto
    y_axis_scale_mode: linear
    show_null_points: true
    point_style: circle
    interpolation: linear
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    leftAxisLabelVisible: false
    leftAxisLabel: ''
    rightAxisLabelVisible: false
    rightAxisLabel: ''
    barColors:
    - red
    - blue
    smoothedBars: false
    orientation: automatic
    labelPosition: left
    percentType: total
    percentPosition: inline
    valuePosition: right
    labelColorEnabled: false
    labelColor: "#FFF"
    color_range:
    - "#dd3333"
    - "#80ce5d"
    - "#f78131"
    - "#369dc1"
    - "#c572d3"
    - "#36c1b3"
    - "#b57052"
    - "#ed69af"
    yAxisMinValue:
    yAxisMaxValue:
    colors:
    - 'palette: Santa Cruz'
    label_color:
    - black
    font_size: '12'
    series_colors: {}
    series_types: {}
    y_axes:
    - label: ''
      maxValue:
      minValue:
      orientation: left
      showLabels: true
      showValues: true
      tickDensity: default
      tickDensityCustom: 5
      type: log
      unpinAxis: false
      valueFormat:
      series:
      - id: 'benzin         '
        name: 'benzin         '
        axisId: cars_data_large.count
      - id: 'diesel         '
        name: 'diesel         '
        axisId: cars_data_large.count
    hidden_fields:
    - cars_data_large.year_of_registration
    - cars_data_large.count
    - cars_data_large.power_ps
    - cars_data_large.kilometer
    - cars_data_large.price
    conditional_formatting:
    - type: low to high
      value:
      background_color:
      font_color:
      palette:
        name: Red to Yellow to Green
        colors:
        - "#F36254"
        - "#FCF758"
        - "#4FBC89"
      bold: false
      italic: false
      strikethrough: false
      fields:
      - price_vs_kilometer_correlation
      - price_vs_power_correlation
      - price_vs_year_of_reg_correlation
    row: 189
    col: 0
    width: 20
    height: 10
  - name: Price__distribution
    type: text
    title_text: Price__distribution
    body_text: We can see that data lines out in the half shape of the bell curve,
      which give us normal distribution. Also please note that vast majority would
      fall in below 50k mark which makes total sense as we talking about mostly second
      hand vehicles.
    row: 67
    col: 0
    width: 20
    height: 5
  - name: Vehicle__type__brakedown
    type: text
    title_text: Vehicle__type__brakedown
    subtitle_text: This categorical variable has 8 levels and indicates the body style
      of the car (sedan, coupe, SUV etc.).
    body_text: This tends to reflect the general Western European market, with a prominence
      of “family” vehicles and smaller volumes of “niche” products (although a sample
      of new car registrations would probably show a higher proportion of SUVs considering
      the rise of this body style in recent years). Also note the large number of
      NAs – about ~25,000. E-Bay could definitely do a better job at encouraging their
      customers to write their ads properly.
    row: 53
    col: 0
    width: 20
    height: 5
  - name: Correlation vs price
    type: text
    title_text: Correlation vs price
    body_text: |-
      I wanted to examine pairs of variables to look for associations between variables in more details have correlation vs price.
      1. It is very clear that we have pretty strong negative correlation on kilometers vs price. Which is not surprise as mileage of the cars goes up price comes down.
      2. Strong positive correlation on Horse Power of the vehicles towards the price. As the power output of the car grows the vehicle gets expensive.
      3. Same we can say about the years of registration  in general. The younger is a car the dearer it usually is apart from some quite unique cases where collectible/vintage cars are in play.
    row: 183
    col: 0
    width: 20
    height: 6
  filters:
  - name: Brand_filter
    title: Brand_filter
    type: field_filter
    default_value: ''
    allow_multiple_values: true
    required: false
    model: sasha_cars
    explore: cars_data_large
    listens_to_filters: []
    field: cars_data_large.brand
