# The name of this view in Looker is "Churn Output1"
view: churn_output1 {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: `Customer_Order.Churn_output1`
    ;;
  drill_fields: [id]
  # This primary key is the unique key for this table in the underlying database.
  # You need to define a primary key in a view in order to join to other views.

  dimension: customer_id {
    primary_key: yes
    type: number
    # hidden: yes
    sql: ${TABLE}.CustomerID ;;
  }

  # Here's what a typical dimension looks like in LookML.
  # A dimension is a groupable field that can be used to filter query results.
  # This dimension will be called "Churn" in Explore.


  dimension: city_tier {
    type: number
    sql: ${TABLE}.CityTier ;;
  }

  dimension: complain {
    type: number
    sql: ${TABLE}.Complain ;;
  }

  dimension: id {
    type: number
    sql: ${TABLE}.id ;;
  }

  dimension: day_since_last_order {
    type: number
    sql: ${TABLE}.DaySinceLastOrder ;;
  }
  measure: avg_day_since_last_order {
    type: average
    sql: ${TABLE}.DaySinceLastOrder ;;
  }

  dimension: gender {
    type: string
    sql: ${TABLE}.Gender ;;
  }

  measure: hour_spend_on_app {
    type: sum
    sql: ${TABLE}.HourSpendOnApp ;;
  }

  dimension: marital_status {
    type: string
    sql: ${TABLE}.MaritalStatus ;;
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

  measure: total_orders {
    type: sum
    sql: ${order_count} ;;
  }

  dimension: predicted_label {
    type: number
    sql: ${TABLE}.predicted_label ;;
  }
  dimension: predicted_label_yesno {
    type: string
    sql: (case when ${predicted_label} = 1 then "Yes" else "No" end) ;;
  }
  measure: predicted_label_count {
    type: number
    sql: count(${predicted_label}) ;;
  }

  # This field is hidden, which means it will not show up in Explore.
  # If you want this field to be displayed, remove "hidden: yes".

  dimension: predicted_label_probs {
    hidden: yes
    sql: ${TABLE}.predicted_label_probs ;;
  }

  dimension: prefered_order_cat {
    type: string
    sql: ${TABLE}.PreferedOrderCat ;;
  }

  dimension: preferred_login_device {
    type: string
    sql: ${TABLE}.PreferredLoginDevice ;;
  }

  dimension: preferred_payment_mode {
    type: string
    sql: ${TABLE}.PreferredPaymentMode ;;
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
  dimension: complain_null {
    type: number
    hidden: yes
    sql: case ${complain} when 1 then 1 else null end;;
  }
  measure: sum_complain_null {
    hidden: yes
    type: sum
    sql: ${complain_null};;
  }
  measure: complain_rate {
    type: number
    sql: round((${sum_complain_null}/count(${complain}) * 100),2);;
  }
  dimension: satis_null {
    type: number
    hidden: yes
    sql: case ${satisfaction_score} when 4 then 1 when 5 then 1 else null end;;
  }
  measure: sum_satis_null {
    hidden: yes
    type: sum
    sql: ${satis_null};;
  }
  measure: satisfied_customers {
    type: number
    sql: round((${sum_satis_null}/count(${satisfaction_score}) * 100),2);;
  }
  dimension: precision_null {
    type: number
    hidden: yes
    sql: case ${predicted_label} when 1 then 1 else null end;;
  }
  measure: sum_precision_null {
    hidden: yes
    type: sum
    sql: ${precision_null};;
  }
  measure: precision {
    type: number
    sql: round((${sum_precision_null}/count(${predicted_label}) * 100),2);;
  }

  measure: count {
    type: count
    drill_fields: [id, customers.name, customers.customer_id]
  }
  measure: unique_users {
    type: count
  }
}

# The name of this view in Looker is "Churn Output1 Predicted Label Probs"
view: churn_output1__predicted_label_probs {
  # No primary key is defined for this view. In order to join this view in an Explore,
  # define primary_key: yes on a dimension that has no repeated values.

  # This field is hidden, which means it will not show up in Explore.
  # If you want this field to be displayed, remove "hidden: yes".

  dimension: churn_output1__predicted_label_probs {
    type: string
    hidden: yes
    sql: churn_output1__predicted_label_probs ;;
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
