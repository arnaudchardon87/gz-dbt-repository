SELECT 
date_date,
SUM(operational_margin) - SUM(ads_cost) as ads_margin,
SUM(average_basket) as average_basket,
SUM(operational_margin) as operational_margin,
SUM(ads_cost) as ads_cost,
SUM(ads_impression) as ads_impression,
SUM(ads_clicks) as ads_clicks

FROM {{ref('int_campaigns_day')}}

JOIN {{ref("finance_days")}}

Using (date_date)
GROUP BY date_date