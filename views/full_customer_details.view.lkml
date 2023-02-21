# The name of this view in Looker is "Full Customer Details"
view: full_customer_details {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: `Customer_Order.Full_customer_details`
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
  # This dimension will be called "City Tier" in Explore.

  dimension: city_tier {
    type: number
    sql: ${TABLE}.CityTier ;;
  }

  dimension: customer_id {
    type: number
    # hidden: yes
    sql: ${TABLE}.CustomerID ;;
  }

  dimension: gender {
    type: string
    sql: ${TABLE}.Gender ;;
  }

  dimension: marital_status {
    type: string
    sql: ${TABLE}.MaritalStatus ;;
  }

  dimension: number_of_address {
    type: number
    sql: ${TABLE}.NumberOfAddress ;;
  }

  # A measure is a field that uses a SQL aggregate function. Here are defined sum and average
  # measures for this dimension, but you can also add measures of many different aggregates.
  # Click on the type parameter to see all the options in the Quick Help panel on the right.

  measure: total_number_of_address {
    type: sum
    sql: ${number_of_address} ;;
  }

  measure: average_number_of_address {
    type: average
    sql: ${number_of_address} ;;
  }

  dimension: timestamp {
    type: string
    sql: ${TABLE}.timestamp ;;
  }

  measure: count {
    type: count
    drill_fields: [id, customers.name, customers.customer_id]
  }
}
