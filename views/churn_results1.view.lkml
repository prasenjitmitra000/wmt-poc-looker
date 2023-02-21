# The name of this view in Looker is "Churn Results1"
view: churn_results1 {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: `Customer_Order.Churn_Results1`
    ;;
  # No primary key is defined for this view. In order to join this view in an Explore,
  # define primary_key: yes on a dimension that has no repeated values.

  # Here's what a typical dimension looks like in LookML.
  # A dimension is a groupable field that can be used to filter query results.
  # This dimension will be called "City Tier" in Explore.

  dimension: city_tier {
    type: number
    sql: ${TABLE}.CityTier ;;
  }

  dimension: complain {
    type: number
    sql: ${TABLE}.Complain ;;
  }

  dimension: day_since_last_order {
    type: number
    sql: ${TABLE}.DaySinceLastOrder ;;
  }

  dimension: hour_spend_on_app {
    type: number
    sql: ${TABLE}.HourSpendOnApp ;;
  }

  dimension: number_of_device_registered {
    type: number
    sql: ${TABLE}.NumberOfDeviceRegistered ;;
  }

  # A measure is a field that uses a SQL aggregate function. Here are defined sum and average
  # measures for this dimension, but you can also add measures of many different aggregates.
  # Click on the type parameter to see all the options in the Quick Help panel on the right.

  measure: total_number_of_device_registered {
    type: sum
    sql: ${number_of_device_registered} ;;
  }

  measure: average_number_of_device_registered {
    type: average
    sql: ${number_of_device_registered} ;;
  }

  dimension: order_count {
    type: number
    sql: ${TABLE}.OrderCount ;;
  }

  dimension: predicted_label {
    type: number
    sql: ${TABLE}.predicted_label ;;
  }

  # This field is hidden, which means it will not show up in Explore.
  # If you want this field to be displayed, remove "hidden: yes".

  dimension: predicted_label_probs {
    hidden: yes
    sql: ${TABLE}.predicted_label_probs ;;
  }

  dimension: satisfaction_score {
    type: number
    sql: ${TABLE}.SatisfactionScore ;;
  }

  dimension: tenure {
    type: number
    sql: ${TABLE}.Tenure ;;
  }

  dimension: warehouse_to_home {
    type: number
    sql: ${TABLE}.WarehouseToHome ;;
  }

  measure: count {
    type: count
    drill_fields: []
  }
}

# The name of this view in Looker is "Churn Results1 Predicted Label Probs"
view: churn_results1__predicted_label_probs {
  # No primary key is defined for this view. In order to join this view in an Explore,
  # define primary_key: yes on a dimension that has no repeated values.

  # This field is hidden, which means it will not show up in Explore.
  # If you want this field to be displayed, remove "hidden: yes".

  dimension: churn_results1__predicted_label_probs {
    type: string
    hidden: yes
    sql: churn_results1__predicted_label_probs ;;
  }

  # Here's what a typical dimension looks like in LookML.
  # A dimension is a groupable field that can be used to filter query results.
  # This dimension will be called "Label" in Explore.

  dimension: label {
    type: number
    sql: label ;;
  }

  # A measure is a field that uses a SQL aggregate function. Here are defined sum and average
  # measures for this dimension, but you can also add measures of many different aggregates.
  # Click on the type parameter to see all the options in the Quick Help panel on the right.

  measure: total_label {
    type: sum
    sql: ${label} ;;
  }

  measure: average_label {
    type: average
    sql: ${label} ;;
  }

  dimension: prob {
    type: number
    sql: prob ;;
  }
}
