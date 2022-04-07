WITH orders AS (SELECT * FROM {{ref('stg_orders')}}),


     daily  AS (SELECT 
                    order_date, 
                    COUNT(*) AS num_orders,
                    {% for order_status in ['returned', 'completed', 'return_pending', 'shipped', 'placed'] %}
                        SUM(CASE WHEN status = '{{ order_status }}' THEN 1 ELSE 0 END) as {{ order_status }}_total
                        {%- if not loop.last -%}
                            ,
                        {%- endif %}

                        {% endfor %}

     FROM orders 
     
     
     GROUP BY order_date),
     compared AS (SELECT *, lag(num_orders) OVER (order by order_date) AS pervious_day FROM daily)
SELECT * FROM compared   order BY 1  


