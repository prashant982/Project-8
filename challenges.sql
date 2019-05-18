--CHALLENGES--

--1. Find the 5 oldest users. 

SELECT * FROM users ORDER BY created_at LIMIT 5; 

--2. What day of the week do most users register on? 

SELECT DATE_FORMAT(created_at, '%a') AS 'Day of the Week',
COUNT(DATE_FORMAT(created_at, '%a')) AS 'Total'
FROM users
GROUP BY DATE_FORMAT(created_at, '%a')
ORDER BY COUNT(DATE_FORMAT(created_at, '%a')) DESC
LIMIT 1;

--3. Find the users who have never posted a photo. 

SELECT users.id,username FROM users 
LEFT JOIN photos
ON users.id = photos.user_id
WHERE image_url IS NULL;

--4. What is the single most liked photo in the database? 

SELECT username, photo_id, COUNT(photo_id) FROM users
    JOIN photos
        ON users.id = photos.user_id
    JOIN likes
        ON photos.id = likes.photo_id
    GROUP BY photo_id
    ORDER BY COUNT(photo_id) DESC LIMIT 1;
    
--5. How many times the average user post? 

SELECT (SELECT COUNT(*) FROM photos)/(SELECT COUNT(*) FROM users); 

--6. What are the top 5 most commonly used hashtags? 
    
    SELECT tag_name, COUNT(tag_name) FROM tags 
    JOIN photo_tags 
    ON tags.id = photo_tags.tag_id 
    GROUP BY tag_name
    ORDER BY COUNT(tag_name) DESC LIMIT 5; 
    
--7. Find users who have liked every single photo on the site. 

SELECT username, COUNT(*) AS total FROM users
JOIN likes
ON users.id = likes.user_id
GROUP BY likes.user_id
HAVING total = (SELECT COUNT(*) FROM photos);
