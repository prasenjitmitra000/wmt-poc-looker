# The name of this view in Looker is "Order Churn"
view: order_churn {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: `Customer_Order.Order_Churn`
    ;;
  drill_fields: [id]
  # This primary key is the unique key for this table in the underlying database.
  # You need to define a primary key in a view in order to join to other views.

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
  }

  # Here's what a typical dimension looks like in LookML.
  # A dimension is a groupable field that can be used to filter query results.
  # This dimension will be called "Cashback Amount" in Explore.

  dimension: cashback_amount {
    type: number
    sql: ${TABLE}.CashbackAmount ;;
  }

  # A measure is a field that uses a SQL aggregate function. Here are defined sum and average
  # measures for this dimension, but you can also add measures of many different aggregates.
  # Click on the type parameter to see all the options in the Quick Help panel on the right.

  measure: total_cashback_amount {
    type: sum
    sql: ${cashback_amount} ;;
  }

  measure: average_cashback_amount {
    type: average
    sql: ${cashback_amount} ;;
  }

  dimension: complain {
    type: number
    sql: ${TABLE}.Complain ;;
  }

  dimension: coupon_used {
    type: number
    sql: ${TABLE}.CouponUsed ;;
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

  dimension: order_amount_hike_fromlast_year {
    type: number
    sql: ${TABLE}.OrderAmountHikeFromlastYear ;;
  }

  dimension: order_count {
    type: number
    sql: ${TABLE}.OrderCount ;;
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

  dimension: timestamp {
    type: string
    sql: ${TABLE}.timestamp ;;
  }

  dimension: warehouse_to_home {
    type: number
    sql: ${TABLE}.WarehouseToHome ;;
  }

  measure: count {
    type: count
    drill_fields: [id]
  }
}
