WITH 
  orders AS (SELECT id AS order_id,
                    user_id as customer_id,
                    order_date,
                    status
               FROM {{ source('jaffle_shop', 'orders') }}
               
               )
SELECT * FROM orders
{{ limit_data_in_dev(column_name = 'order_date', dev_days_of_data = 2000) }}