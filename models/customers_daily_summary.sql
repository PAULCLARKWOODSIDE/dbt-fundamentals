WITH
SRC AS (SELECT {{dbt_utils.surrogate_key(['customer_id', 'order_date'])}} id,
               customer_id, 
               order_date, 
               COUNT(*) AS CNT
          FROM {{ ref('stg_orders')}}
      GROUP BY 1,2,3)
SELECT id,
       customer_id,
       order_date,
       CNT
  FROM SRC