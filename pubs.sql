SELECT t.type, SUM(s.qty) as total_ventas
FROM titles t
JOIN sales s ON t.title_id = s.title_id
GROUP BY t.type;
