# Define the database connection to be used for this model.
connection: "wmt-poc"

# include all the views
include: "/views/**/*.view"

# Datagroups define a caching policy for an Explore. To learn more,
# use the Quick Help panel on the right to see documentation.

datagroup: wmt-poc-looker_default_datagroup {
  # sql_trigger: SELECT MAX(id) FROM etl_log;;
  max_cache_age: "1 hour"
}

persist_with: wmt-poc-looker_default_datagroup

# Explores allow you to join together different views (database tables) based on the
# relationships between fields. By joining a view into an Explore, you make those
# fields available to users for data analysis.
# Explores should be purpose-built for specific use cases.

# To see the Explore you’re building, navigate to the Explore menu and select an Explore under "Wmt-poc-looker"

explore: full_customer_details {
  join: customers {
    type: left_outer
    sql_on: ${full_customer_details.customer_id} = ${customers.customer_id} ;;
    relationship: many_to_one
  }
}

# To create more sophisticated Explores that involve multiple views, you can use the join parameter.
# Typically, join parameters require that you define the join type, join relationship, and a sql_on clause.
# Each joined view also needs to define a primary key.

explore: churn_data_yes {}

explore: churn {
  join: customers {
    type: left_outer
    sql_on: ${churn.customer_id} = ${customers.customer_id} ;;
    relationship: many_to_one
  }
}

explore: churn_results1 {
  join: churn_results1__predicted_label_probs {
    view_label: "Churn Results1: Predicted Label Probs"
    sql: LEFT JOIN UNNEST(${churn_results1.predicted_label_probs}) as churn_results1__predicted_label_probs ;;
    relationship: one_to_many
  }
}

explore: order_churn {}

explore: customers {}

explore: churn_output1 {
  join: customers {
    type: left_outer
    sql_on: ${churn_output1.customer_id} = ${customers.customer_id} ;;
    relationship: many_to_one
  }

  join: churn_output1__predicted_label_probs {
    view_label: "Churn Output1: Predicted Label Probs"
    sql: LEFT JOIN UNNEST(${churn_output1.predicted_label_probs}) as churn_output1__predicted_label_probs ;;
    relationship: one_to_many
  }
}

explore: customer_order {
  join: customers {
    type: left_outer
    sql_on: ${customer_order.customer_id} = ${customers.customer_id} ;;
    relationship: many_to_one
  }
}

explore: order_details1 {}

explore: try {}

explore: left_joint {}

explore: trial2 {}
