WITH date_month_T as (
SELECT EXTRACT(MONTH from date_date) as date_month,
*

FROM {{ref('finance_campaigns_day')}}
)

SELECT 
date_month, 
SUM(ads_margin) as ads_margin,
SUM(average_basket) as average_basket,
SUM(operational_margin) as operational_margin,
SUM(ads_cost) as ads_cost,
SUM(ads_impression) as ads_impression,
SUM(ads_clicks) as ads_clicks
FROM date_month_T
GROUP BY date_month
ORDER BY date_month ASC

