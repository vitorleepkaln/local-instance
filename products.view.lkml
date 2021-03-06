view: products {
  sql_table_name: demo_db.products ;;

  parameter: parameter1 {
    type: string
  }

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
  }

  dimension: brand {
    type: string
    sql: ${TABLE}.brand ;;
  }

  dimension: category {
    type: string
    sql: ${TABLE}.category;;
  }

  dimension: department {
    type: string
    sql: ${TABLE}.department ;;
  }

  measure: departmentconcat {
    label: "Department Concatenated"
    type: string
    sql: GROUP_CONCAT(DISTINCT ${department} ORDER BY ${department} SEPARATOR ', ') ;;
  }

  dimension: item_name {
    type: string
    sql: ${TABLE}.item_name ;;
  }

  dimension: rank {
    type: number
    sql: ${TABLE}.rank ;;
  }

  dimension: retail_price {
    type: number
    sql: ${TABLE}.retail_price ;;
  }

  dimension: sku {
    type: string
    sql: ${TABLE}.sku ;;
  }

  measure: count {
    type: count
    drill_fields: [id, item_name, inventory_items.count]
  }


  filter: category_select {
    suggest_dimension: products.category
  }

  dimension: category_comparitor {
    type: string
    sql:
    CASE
      WHEN {% condition category_select %} ${category} {% endcondition %}
        THEN ${category}
      ELSE 'Rest of Categories'
    END ;;
  }

  measure: percent_of_total {
    type: percent_of_total
    sql: ${count} ;;
  }




  measure: percent_socks {
    type: number
    sql:  ;;
  }

}
