-- 1 Listar Clientes que não realizaram uma compra
SELECT
	c.customer_id,
	c.first_name,
	c.last_name,
	c.email
FROM
	customers c
LEFT JOIN
	orders o ON c.customer_id = o.customer_id
WHERE
	o.order_id IS NULL;


-- 2 Listar produtos que não tenham sidos comprados
SELECT
	p.product_id,
	p.product_name,
	p.list_price
FROM
	products p
LEFT JOIN
	order_items oi ON p.product_id = oi.product_id
WHERE
	oi.item_id IS NULL;


-- 3 Listar produtos sem estoque
SELECT
	p.product_id,
	p.product_name,
	s.store_id
	s.quantity
FROM
	products p
JOIN
	stocks s ON p.product_id = s.product_id
WHERE
	s.quantity = 0;


-- 4 Agrupar a quantidade de vendas por marca e loja
SELECT
	b.brand_name,
	s.store_name,
	SUM(oi.quantity) as total_sales
FROM
	order_items oi
JOIN
	products p ON oi.product_id = p.product_id
JOIN
	brands b ON p.brand_id = b.brand_id
JOIN
	orders o ON oi.order_id = o.order_id
JOIN
	stores s ON o.store_id - s.store_id
GROUP BY
	b.brand_name,
	s.store_name
ORDER BY
	b.brand_name
	s.store_name;


-- 5 Listar funcionarios que não estejam relacionados a um pedido
SELECT
	st.staff_id,
	st.first_name,
	st.last_name,
	st.email
FROM
	staffs st
LEFT JOIN
	orders o ON st.staff_id = o.staff_id
WHERE
	o.order_id IS NULL;