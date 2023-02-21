# The name of this view in Looker is "Left Joint"
view: left_joint {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: `Customer_Order.left_joint`
    ;;
  # No primary key is defined for this view. In order to join this view in an Explore,
  # define primary_key: yes on a dimension that has no repeated values.

  # Dates and timestamps can be represented in Looker using a dimension group of type: time.
  # Looker converts dates and timestamps to the specified timeframes within the dimension group.

  dimension_group: _partitiondate {
    type: time
    timeframes: [
      raw,
      date,
      week,
      month,
      quarter,
      year
    ]
    convert_tz: no
    datatype: date
    sql: ${TABLE}._PARTITIONDATE ;;
  }

  dimension_group: _partitiontime {
    type: time
    timeframes: [
      raw,
      date,
      week,
      month,
      quarter,
      year
    ]
    convert_tz: no
    datatype: date
    sql: ${TABLE}._PARTITIONTIME ;;
  }

  # Here's what a typical dimension looks like in LookML.
  # A dimension is a groupable field that can be used to filter query results.
  # This dimension will be called "Billing Address" in Explore.

  dimension: billing_address {
    type: number
    sql: ${TABLE}.billing_address ;;
  }

  # A measure is a field that uses a SQL aggregate function. Here are defined sum and average
  # measures for this dimension, but you can also add measures of many different aggregates.
  # Click on the type parameter to see all the options in the Quick Help panel on the right.

  measure: total_billing_address {
    type: sum
    sql: ${billing_address} ;;
  }

  measure: average_billing_address {
    type: average
    sql: ${billing_address} ;;
  }

  dimension: billing_method {
    type: string
    sql: ${TABLE}.billing_method ;;
  }

  dimension: cust_email {
    type: string
    sql: ${TABLE}.cust_email ;;
  }

  dimension: cust_id {
    type: number
    sql: ${TABLE}.cust_id ;;
  }

  dimension: cust_name {
    type: string
    sql: ${TABLE}.cust_name ;;
  }

  dimension: cust_no {
    type: number
    sql: ${TABLE}.cust_no ;;
  }

  dimension: order_id {
    type: number
    sql: ${TABLE}.order_id ;;
  }

  dimension: payment_status {
    type: string
    sql: ${TABLE}.payment_status ;;
  }

  dimension: shipping_state {
    type: string
    sql: ${TABLE}.shipping_state ;;
  }

  measure: count {
    type: count
    drill_fields: [cust_name]
  }
}
