WITH purchase_table as (

SELECT
date_date,
orders_id,
products_id,
revenue,
quantity,
purchase_price

FROM
{{ref('stg_raw__sales')}}
JOIN
{{ref('stg_raw__products')}}
USING (products_id)

),

purchase_cost_table AS (
SELECT 

date_date,
orders_id,
products_id,
revenue,
quantity,
purchase_price,
CAST(quantity*purchase_price AS FLOAT64) as purchase_cost,

FROM purchase_table

)

SELECT
date_date,
orders_id,
products_id,
revenue,
quantity,
purchase_price,
purchase_cost,
ROUND(revenue-purchase_cost,2) as margin

FROM purchase_cost_table
