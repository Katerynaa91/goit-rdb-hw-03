-- 1. Напишіть SQL команду, за допомогою якої можна:
-- вибрати всі стовпчики (За допомогою wildcard “*”) з таблиці products;
-- вибрати тільки стовпчики name, phone з таблиці shippers
-- 2. Напишіть SQL команду, за допомогою якої можна знайти середнє, максимальне та мінімальне значення стовпчика price таблички products
-- 3. Напишіть SQL команду, за допомогою якої можна обрати унікальні значення колонок category_id та price таблиці products.
-- Оберіть порядок виведення на екран за спаданням значення price та виберіть тільки 10 рядків. 
-- 4. Напишіть SQL команду, за допомогою якої можна знайти кількість продуктів (рядків), 
-- які знаходиться в цінових межах від 20 до 100.
-- 5. Напишіть SQL команду, за допомогою якої можна знайти 
-- кількість продуктів (рядків) та середню ціну (price) у кожного постачальника (supplier_id).
select * from products;

select
	name, 
	phone
from shippers;

select
	ROUND(AVG(price), 3) as mean_price,
    MIN(price) as min_price,
    MAX(price) as max_price
from products;

select
	distinct category_id,
    price
from products
order by price DESC
limit 10;

-- select
-- 	category_id,
--     price
-- from products
-- group by 1,2
-- order by price DESC
-- limit 10;

select
	COUNT(1) as product_count
from products
where 
	price >= 20 AND price <= 100;
    
select
	COUNT(1) as product_count
from products
where price BETWEEN 20 AND 100;

select 
	p.supplier_id,
	s.name,
	COUNT(1) as count_by_supplier,
	AVG(p.price) as avg_price_by_supplier
from products p join suppliers s on p.supplier_id = s.id
group by 1,2