--CREATE DATABASE SPORTS_CLOTHING;
--Joining all tables to make analysis easier

--SELECT [SPORTS_CLOTHING].[dbo].[finance$].[product_id],
--		   [SPORTS_CLOTHING].[dbo].[info_v2$].[product_name],
--		   [SPORTS_CLOTHING].[dbo].[brands_v2$].[brand],
--	       [SPORTS_CLOTHING].[dbo].[finance$].[listing_price],
--	       [SPORTS_CLOTHING].[dbo].[finance$].[sale_price],
--	       [SPORTS_CLOTHING].[dbo].[finance$].[discount],
--	       [SPORTS_CLOTHING].[dbo].[finance$].[revenue],
--		   [SPORTS_CLOTHING].[dbo].[reviews_v2$].[rating],
--	       [SPORTS_CLOTHING].[dbo].[reviews_v2$].[reviews],
--		   [SPORTS_CLOTHING].[dbo].[traffic_v3$].[last_visited]

--FROM [SPORTS_CLOTHING].[dbo].[finance$]  
--	FULL OUTER JOIN [SPORTS_CLOTHING].[dbo].[info_v2$] ON  [SPORTS_CLOTHING].[dbo].[finance$].[product_id]= [SPORTS_CLOTHING].[dbo].[info_v2$].[product_id]
--	FULL OUTER JOIN [SPORTS_CLOTHING].[dbo].[reviews_v2$] ON [SPORTS_CLOTHING].[dbo].[finance$].[product_id]=[SPORTS_CLOTHING].[dbo].[reviews_v2$].[product_id]
--	FULL OUTER JOIN [SPORTS_CLOTHING].[dbo].[brands_v2$] ON [SPORTS_CLOTHING].[dbo].[finance$].[product_id]=[SPORTS_CLOTHING].[dbo].[brands_v2$].[product_id]
--	FULL OUTER JOIN [SPORTS_CLOTHING].[dbo].[traffic_v3$] ON [SPORTS_CLOTHING].[dbo].[finance$].[product_id]=[SPORTS_CLOTHING].[dbo].[traffic_v3$].[product_id]



--Replacing null values
--UPDATE [SPORTS_CLOTHING].[dbo].[brands_v2$]
--SET [brand]= 'NOT DEFINED'
--WHERE [brand] IS NULL;

--UPDATE [SPORTS_CLOTHING].[dbo].[finance$]
--SET [listing_price]= 00.00
--WHERE [listing_price] IS NULL
--UPDATE [SPORTS_CLOTHING].[dbo].[finance$]
--SET [sale_price] = 0.00
--WHERE [sale_price] IS NULL

--UPDATE [SPORTS_CLOTHING].[dbo].[info_v2$]
--SET [product_name]=' NOT DEFINED'
--WHERE [product_name] IS NULL;


--UPDATE [SPORTS_CLOTHING].[dbo].[traffic_v3$]
--SET [last_visited] = TRY_CONVERT(datetime, '1900-01-01 00:00:00.000')
--WHERE [last_visited] IS NULL;

SELECT*
FROM (
	SELECT [SPORTS_CLOTHING].[dbo].[finance$].[product_id],
			   [SPORTS_CLOTHING].[dbo].[info_v2$].[product_name],
			   [SPORTS_CLOTHING].[dbo].[brands_v2$].[brand],
			   [SPORTS_CLOTHING].[dbo].[finance$].[listing_price],
			   [SPORTS_CLOTHING].[dbo].[finance$].[sale_price],
			   [SPORTS_CLOTHING].[dbo].[finance$].[discount],
			   [SPORTS_CLOTHING].[dbo].[finance$].[revenue],
			   [SPORTS_CLOTHING].[dbo].[reviews_v2$].[rating],
			   [SPORTS_CLOTHING].[dbo].[reviews_v2$].[reviews],
			   [SPORTS_CLOTHING].[dbo].[traffic_v3$].[last_visited]

	FROM [SPORTS_CLOTHING].[dbo].[finance$]  
		FULL OUTER JOIN [SPORTS_CLOTHING].[dbo].[info_v2$] ON  [SPORTS_CLOTHING].[dbo].[finance$].[product_id]= [SPORTS_CLOTHING].[dbo].[info_v2$].[product_id]
		FULL OUTER JOIN [SPORTS_CLOTHING].[dbo].[reviews_v2$] ON [SPORTS_CLOTHING].[dbo].[finance$].[product_id]=[SPORTS_CLOTHING].[dbo].[reviews_v2$].[product_id]
		FULL OUTER JOIN [SPORTS_CLOTHING].[dbo].[brands_v2$] ON [SPORTS_CLOTHING].[dbo].[finance$].[product_id]=[SPORTS_CLOTHING].[dbo].[brands_v2$].[product_id]
		FULL OUTER JOIN [SPORTS_CLOTHING].[dbo].[traffic_v3$] ON [SPORTS_CLOTHING].[dbo].[finance$].[product_id]=[SPORTS_CLOTHING].[dbo].[traffic_v3$].[product_id]
) AS subquery1
WHERE [product_id] IS NOT NULL   AND [product_name] IS NOT NULL;


