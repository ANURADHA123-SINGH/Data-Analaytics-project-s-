USE MYNTRA;
select *from products;
-- Normal query
-- SELECT MIN(discounted_price) from products
-- where discounted_price = 49;

 -- subquery
SELECT *FROM PRODUCTS
WHERE discounted_price =(SELECT MIN(discounted_price) from products);