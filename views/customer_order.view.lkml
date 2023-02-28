# The name of this view in Looker is "Customer Order"
view: customer_order {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: `Customer_Order.Customer_Order`
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
  # This dimension will be called "Billing Method" in Explore.

  dimension: billing_method {
    type: string
    sql: ${TABLE}.billing_method ;;
  }

  dimension: contact_number {
    type: number
    sql: ${TABLE}.contact_number ;;
  }

  # A measure is a field that uses a SQL aggregate function. Here are defined sum and average
  # measures for this dimension, but you can also add measures of many different aggregates.
  # Click on the type parameter to see all the options in the Quick Help panel on the right.

  measure: total_contact_number {
    type: sum
    sql: ${contact_number} ;;
  }

  measure: average_contact_number {
    type: average
    sql: ${contact_number} ;;
  }

  dimension: customer_id {
    primary_key: yes
    type: string
    # hidden: yes
    sql: ${TABLE}.customer_id ;;
  }
  measure: unique_users {
    type: number
    sql: count(${customer_id}) ;;
  }

  dimension: email {
    type: string
    sql: ${TABLE}.email ;;
  }

  dimension: name {
    type: string
    sql: ${TABLE}.name ;;
  }

  dimension: order_id {
    type: number
    sql: ${TABLE}.order_id ;;
  }
  measure: total_orders {
    type: number
    sql: count(${order_id}) ;;
  }

  dimension: payment_status {
    type: string
    sql: ${TABLE}.payment_status ;;
  }

  dimension: shipping_state {
    type: string
    map_layer_name: countries
    sql: (case when ${TABLE}.shipping_state = "asia" then "ABB" when ${TABLE}.shipping_state = "india" then "IND" when ${TABLE}.shipping_state = "USA" then "USA" end) ;;
  }

  dimension_group: timestamp {
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}.timestamp ;;
  }

  measure: count {
    type: count
    drill_fields: [name, customers.name, customers.customer_id]
  }
}
