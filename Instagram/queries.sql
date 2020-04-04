-- Finding the 5 oldest users
SELECT * FROM users
ORDER BY created_at
LIMIT 5;

-- Most popular registration date
SELECT username, DAYNAME(created_at) AS day_registered,
COUNT(*) AS total
FROM users
GROUP BY day_registered
ORDER BY total DESC
LIMIT 2;