--Products that have Max rating with respect to reviews
SELECT 
       [SPORTS_CLOTHING].[dbo].[info_v2$].[product_id],
       [SPORTS_CLOTHING].[dbo].[info_v2$].[product_name],
       MAX([SPORTS_CLOTHING].[dbo].[reviews_v2$].[rating]) AS max_rating,
       [SPORTS_CLOTHING].[dbo].[reviews_v2$].[reviews]
FROM [SPORTS_CLOTHING].[dbo].[info_v2$]  
FULL OUTER JOIN [SPORTS_CLOTHING].[dbo].[reviews_v2$] ON [SPORTS_CLOTHING].[dbo].[info_v2$].[product_id] = [SPORTS_CLOTHING].[dbo].[reviews_v2$].[product_id]
WHERE [SPORTS_CLOTHING].[dbo].[reviews_v2$].[reviews] IS NOT NULL
GROUP BY 
	   [SPORTS_CLOTHING].[dbo].[info_v2$].[product_id],
       [SPORTS_CLOTHING].[dbo].[info_v2$].[product_name],
	   [SPORTS_CLOTHING].[dbo].[reviews_v2$].[rating],
	   [SPORTS_CLOTHING].[dbo].[reviews_v2$].[reviews]
ORDER BY
		 max_rating DESC,[SPORTS_CLOTHING].[dbo].[reviews_v2$].[reviews] DESC;


--Top 5 Selling Products and thier rating
SELECT 
       DISTINCT([SPORTS_CLOTHING].[dbo].[info_v2$].[product_id]),
       [SPORTS_CLOTHING].[dbo].[info_v2$].[product_name],
	   [SPORTS_CLOTHING].[dbo].[finance$].[revenue],
       [SPORTS_CLOTHING].[dbo].[reviews_v2$].[rating] AS max_rating
FROM [SPORTS_CLOTHING].[dbo].[info_v2$]  
FULL OUTER JOIN [SPORTS_CLOTHING].[dbo].[reviews_v2$] ON [SPORTS_CLOTHING].[dbo].[info_v2$].[product_id] = [SPORTS_CLOTHING].[dbo].[reviews_v2$].[product_id]
FULL OUTER JOIN [SPORTS_CLOTHING].[dbo].[finance$] ON [SPORTS_CLOTHING].[dbo].[info_v2$].[product_id] =[SPORTS_CLOTHING].[dbo].[finance$].product_id
WHERE [SPORTS_CLOTHING].[dbo].[reviews_v2$].[reviews] IS NOT NULL  AND [SPORTS_CLOTHING].[dbo].[info_v2$].[product_name] !='NOT DEFINED'

ORDER BY
		 max_rating DESC, [SPORTS_CLOTHING].[dbo].[finance$].[revenue] DESC
OFFSET 0 ROWS FETCH NEXT 5 ROWS ONLY;
		 
--Top selling products with low discount and thier rating
SELECT 
       DISTINCT([SPORTS_CLOTHING].[dbo].[info_v2$].[product_id]),
       [SPORTS_CLOTHING].[dbo].[info_v2$].[product_name],
	   [SPORTS_CLOTHING].[dbo].[finance$].[revenue],
	   [SPORTS_CLOTHING].[dbo].[finance$].[discount],
       [SPORTS_CLOTHING].[dbo].[reviews_v2$].[rating] 
FROM [SPORTS_CLOTHING].[dbo].[info_v2$]  
FULL OUTER JOIN [SPORTS_CLOTHING].[dbo].[reviews_v2$] ON [SPORTS_CLOTHING].[dbo].[info_v2$].[product_id] = [SPORTS_CLOTHING].[dbo].[reviews_v2$].[product_id]
FULL OUTER JOIN [SPORTS_CLOTHING].[dbo].[finance$] ON [SPORTS_CLOTHING].[dbo].[info_v2$].[product_id] =[SPORTS_CLOTHING].[dbo].[finance$].product_id
WHERE [SPORTS_CLOTHING].[dbo].[reviews_v2$].[reviews] IS NOT NULL  AND [SPORTS_CLOTHING].[dbo].[info_v2$].[product_name] !='NOT DEFINED'

ORDER BY
		 [SPORTS_CLOTHING].[dbo].[finance$].[revenue] DESC,
		 [SPORTS_CLOTHING].[dbo].[finance$].[discount] ASC
OFFSET 0 ROWS FETCH NEXT 10 ROWS ONLY;


--Which brand gives more revenue
SELECT 
	   DISTINCT[SPORTS_CLOTHING].[dbo].[brands_v2$].[brand],
	   SUM([SPORTS_CLOTHING].[dbo].[finance$].[revenue]) AS total
FROM 
	   [SPORTS_CLOTHING].[dbo].[brands_v2$]
JOIN [SPORTS_CLOTHING].[dbo].[finance$] ON [SPORTS_CLOTHING].[dbo].[brands_v2$].[product_id]=[SPORTS_CLOTHING].[dbo].[finance$].[product_id]
GROUP BY
		[SPORTS_CLOTHING].[dbo].[brands_v2$].[brand]
ORDER BY 
		total DESC;

--Which brand gives more revenue and average discount offer to customer
SELECT 
	   DISTINCT[SPORTS_CLOTHING].[dbo].[brands_v2$].[brand],
	   ROUND(SUM([SPORTS_CLOTHING].[dbo].[finance$].[revenue]),3) AS total,
	   ROUND(AVG([SPORTS_CLOTHING].[dbo].[finance$].[discount]),3) AS averge_discount_offer
FROM 
	   [SPORTS_CLOTHING].[dbo].[brands_v2$]
JOIN [SPORTS_CLOTHING].[dbo].[finance$] ON [SPORTS_CLOTHING].[dbo].[brands_v2$].[product_id]=[SPORTS_CLOTHING].[dbo].[finance$].[product_id]
WHERE [SPORTS_CLOTHING].[dbo].[brands_v2$].[brand] !='NOT DEFINED'
GROUP BY
		[SPORTS_CLOTHING].[dbo].[brands_v2$].[brand]
ORDER BY 
		total DESC;

--Product with highest  revenue  with zero discount offer and rating
SELECT 
	 [SPORTS_CLOTHING].[dbo].[finance$].[product_id],
	 [SPORTS_CLOTHING].[dbo].[finance$].[revenue],
	 [SPORTS_CLOTHING].[dbo].[finance$].[discount],
	 [SPORTS_CLOTHING].[dbo].[reviews_v2$].[rating]
FROM 
	 [SPORTS_CLOTHING].[dbo].[finance$]
FULL OUTER JOIN [SPORTS_CLOTHING].[dbo].[reviews_v2$] ON [SPORTS_CLOTHING].[dbo].[finance$].[product_id]= [SPORTS_CLOTHING].[dbo].[reviews_v2$].[product_id]
WHERE [SPORTS_CLOTHING].[dbo].[finance$].[revenue] IS NOT NULL AND [SPORTS_CLOTHING].[dbo].[finance$].[discount]=0
ORDER BY 
	 [SPORTS_CLOTHING].[dbo].[finance$].[revenue] DESC,
     [SPORTS_CLOTHING].[dbo].[finance$].[discount] ASC,
	 [SPORTS_CLOTHING].[dbo].[reviews_v2$].[rating] DESC
	
--Product with highest revenue with low sale and listing price
SELECT  [product_id],
		[revenue],
      [listing_price],
      [sale_price]      
FROM 
	  [SPORTS_CLOTHING].[dbo].[finance$]
WHERE  [sale_price]>0 AND ([revenue] IS NOT NULL  OR [listing_price] IS NOT NULL) AND [listing_price]>0
ORDER BY
		[revenue] DESC,
		[listing_price] ASC

--Which women brand gives more revenue
SELECT 
	  DISTINCT[SPORTS_CLOTHING].[dbo].[info_v2$].[product_name],
	  [SPORTS_CLOTHING].[dbo].[finance$].[revenue],
	  [SPORTS_CLOTHING].[dbo].[brands_v2$].[brand]
FROM 
     [SPORTS_CLOTHING].[dbo].[info_v2$]
FULL OUTER JOIN [SPORTS_CLOTHING].[dbo].[finance$] ON [SPORTS_CLOTHING].[dbo].[info_v2$].[product_id]=[SPORTS_CLOTHING].[dbo].[finance$].[product_id]
FULL OUTER JOIN [SPORTS_CLOTHING].[dbo].[brands_v2$] ON [SPORTS_CLOTHING].[dbo].[info_v2$].[product_id]=[SPORTS_CLOTHING].[dbo].[brands_v2$].[product_id]   

WHERE 
     [SPORTS_CLOTHING].[dbo].[info_v2$].[product_name] LIKE 'Wo%%' AND [SPORTS_CLOTHING].[dbo].[finance$].[revenue] IS NOT NULL
ORDER BY
     [SPORTS_CLOTHING].[dbo].[finance$].[revenue] DESC


--Which men product and brand gives more revenue
SELECT 
	  DISTINCT[SPORTS_CLOTHING].[dbo].[info_v2$].[product_name],
	  [SPORTS_CLOTHING].[dbo].[finance$].[revenue],
	  [SPORTS_CLOTHING].[dbo].[brands_v2$].[brand]
FROM 
     [SPORTS_CLOTHING].[dbo].[info_v2$]
FULL OUTER JOIN [SPORTS_CLOTHING].[dbo].[finance$] ON [SPORTS_CLOTHING].[dbo].[info_v2$].[product_id]=[SPORTS_CLOTHING].[dbo].[finance$].[product_id]
FULL OUTER JOIN [SPORTS_CLOTHING].[dbo].[brands_v2$] ON [SPORTS_CLOTHING].[dbo].[info_v2$].[product_id]=[SPORTS_CLOTHING].[dbo].[brands_v2$].[product_id]   

WHERE 
     [SPORTS_CLOTHING].[dbo].[info_v2$].[product_name] LIKE 'Me%%' AND [SPORTS_CLOTHING].[dbo].[finance$].[revenue] IS NOT NULL
ORDER BY
     [SPORTS_CLOTHING].[dbo].[finance$].[revenue] DESC

--Aggregating data on revenue, reviews, and ratings, along with the last visit date
SELECT 
    [SPORTS_CLOTHING].[dbo].[info_v2$].[product_name],
    [SPORTS_CLOTHING].[dbo].[brands_v2$].[brand],
    [SPORTS_CLOTHING].[dbo].[finance$].[revenue],
    COUNT([SPORTS_CLOTHING].[dbo].[reviews_v2$].[reviews]) AS total_reviews,
    AVG([SPORTS_CLOTHING].[dbo].[reviews_v2$].[rating]) AS average_rating,
    [SPORTS_CLOTHING].[dbo].[traffic_v3$].[last_visited]
FROM 
    [SPORTS_CLOTHING].[dbo].[info_v2$] 
JOIN [SPORTS_CLOTHING].[dbo].[reviews_v2$]  ON [SPORTS_CLOTHING].[dbo].[info_v2$].[product_id] = [SPORTS_CLOTHING].[dbo].[reviews_v2$].[product_id]
JOIN [SPORTS_CLOTHING].[dbo].[finance$]  ON [SPORTS_CLOTHING].[dbo].[info_v2$].[product_id] = [SPORTS_CLOTHING].[dbo].[finance$].[product_id]
JOIN [SPORTS_CLOTHING].[dbo].[traffic_v3$] ON [SPORTS_CLOTHING].[dbo].[info_v2$].[product_id] = [SPORTS_CLOTHING].[dbo].[traffic_v3$].[product_id]
JOIN [SPORTS_CLOTHING].[dbo].[brands_v2$] On [SPORTS_CLOTHING].[dbo].[info_v2$].[product_id] =[SPORTS_CLOTHING].[dbo].[brands_v2$].[product_id]
WHERE 
    [SPORTS_CLOTHING].[dbo].[finance$].[revenue] > 1000
GROUP BY 
    [SPORTS_CLOTHING].[dbo].[info_v2$].[product_name],
	[SPORTS_CLOTHING].[dbo].[brands_v2$].[brand], 
	[SPORTS_CLOTHING].[dbo].[finance$].[revenue], 
	[SPORTS_CLOTHING].[dbo].[traffic_v3$].[last_visited]
ORDER BY 
    average_rating DESC, 
	[SPORTS_CLOTHING].[dbo].[traffic_v3$].[last_visited] DESC;
