SELECT 

date_date,
COUNT(orders_id) as nb_transactions,
SUM(revenue) as revenue,
SUM(revenue)/COUNT(orders_id) as average_basket,
SUM(margin) as margin,
SUM(operational_margin) as operational_margin

FROM {{ref("int_orders_operational")}}

GROUP BY date_date
ORDER BY date_date desc
