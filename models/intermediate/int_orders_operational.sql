select
orders_id,
date_date,
revenue,
quantity,
purchase_cost,
margin,
shipping_fee,
logcost,
ship_cost,
margin + shipping_fee -logcost - CAST(ship_cost as FLOAT64) as operational_margin

FROM {{ref("int_orders_margin")}}

JOIN {{ref("stg_raw__ship")}}

using(orders_id)
