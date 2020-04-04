-- Finding the 5 oldest users
SELECT * 
FROM users
ORDER BY created_at
LIMIT 5;

-- Most popular registration date
SELECT username, DAYNAME(created_at) AS day_registered,
COUNT(*) AS total
FROM users
GROUP BY day_registered
ORDER BY total DESC
LIMIT 2;

-- Identify inactive users (users with no photos)
SELECT username
FROM users
LEFT JOIN photos
	ON users.id = photos.user_id
WHERE photos.id IS NULL;

-- Identify most popular photo (and user who created it)
SELECT
	username,
    photos.id,
    photos.image_url,
    COUNT(*) AS total
FROM photos
INNER JOIN likes
	ON likes.photo_id = photos.id
INNER JOIN users
	ON photos.user_id = users.id
GROUP BY photos.id
ORDER BY total DESC
LIMIT 1;

-- Calculate average number of photos per user
SELECT (SELECT COUNT(*)
		FROM photos) / (SELECT COUNT(*)
						FROM USERS) AS avg;