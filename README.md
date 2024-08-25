# 🏅 Online Sports Clothing Company - Revenue Maximization Project

## 🏷️ Project Overview
The aim of this project is to analyze product-related data to uncover insights that can help maximize revenue for an online sports clothing company. The dataset includes information such as prices, discounts, revenue, ratings, reviews, product descriptions, and website traffic. The analysis will be conducted exclusively using SQL.

## 🎯 Objectives
- **Identify Top Products**: Discover products with the highest ratings and reviews.
- **Revenue Insights**: Determine which brands and products contribute most to revenue.
- **Discount Strategy**: Analyze how discounts impact sales and identify optimal discount levels.
- **Customer Insights**: Analyze customer behavior through reviews, ratings, and website traffic.

## 📁 Dataset Description
The dataset comprises multiple tables with the following key attributes:

### Tables
1. **Products**
   - `product_id`: Unique identifier for each product.
   - `brand`: The brand of the product.
   - `product_name`: Name of the product.
   - `description`: Description of the product.

2. **Pricing**
   - `product_id`: Unique identifier for each product.
   - `listing_price`: The original price of the product.
   - `sale_price`: The discounted price of the product.
   - `discount`: The discount rate applied to the product.
   - `revenue`: The total revenue generated by the product.

3. **Reviews**
   - `product_id`: Unique identifier for each product.
   - `rating`: The average rating of the product.
   - `reviews`: The number of reviews the product has received.

4. **Traffic**
   - `product_id`: Unique identifier for each product.
   - `last_visited`: The last date and time the product page was visited.

📊 Insights and Recommendations
High-Performing Products: Focus on products with high ratings and reviews. Consider promoting these products more aggressively.
Optimized Discounting: Analyze the impact of low discounts on top-selling products. Products with low discounts but high sales indicate potential pricing power.
Brand Strategy: Focus on brands that contribute the most revenue. Evaluate whether these brands should maintain their discount strategy or if there's room to reduce discounts to increase profitability.
Category Focus: Depending on the revenue generated, consider whether to focus more on men's or women's brands to optimize marketing efforts.
🚀 Conclusion
By using the SQL queries above, the company can derive actionable insights to maximize revenue, improve product offerings, and refine its discounting strategy. This structured approach will help in making data-driven decisions that align with the company’s revenue goals.
