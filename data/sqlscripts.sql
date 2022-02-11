SELECT *
FROM app_store_apps;

SELECT primary_genre, ROUND(AVG(price), 2) AS avg_price
FROM app_store_apps
GROUP BY primary_genre
ORDER BY avg_price DESC;
--Most expensive genre on average: medical, business, reference, music, productivity

SELECT SUM(CAST(review_count AS INT)) AS total_review, primary_genre
FROM app_store_apps
GROUP BY primary_genre
ORDER BY total_review DESC;
--Games, social networking, entertainment, music, shopping get most reviews

SELECT content_rating, AVG(rating) AS avg_rating
FROM app_store_apps
GROUP BY content_rating
ORDER BY avg_rating;
--younger content ratings, like 9+ and 4+, do slightly better ratings-wise

SELECT primary_genre, AVG(rating), SUM(CAST(review_count AS INT))
FROM app_store_apps
WHERE primary_genre IN ('Education', 'Finance')
GROUP BY primary_genre;
--finance (2.4 avg) and education (3.37) apps don't do so hot

SELECT name, review_count, install_count
FROM play_store_apps
WHERE type NOT LIKE 'Free'
ORDER BY review_count DESC
LIMIT 20;

SELECT DISTINCT install_count
FROM play_store_apps;

SELECT *
FROM app_store_apps AS a
INNER JOIN play_store_apps AS p
USING(name);

/*WITH both_stores AS (SELECT name, a.rating AS app_rating, p.rating AS play_rating, a.price AS app_price, p.price::money::decimal AS play_price, a.review_count AS app_reviews, p.review_count AS play_reviews, p.content_rating, p.genres
					 FROM app_store_apps AS a
					 INNER JOIN play_store_apps AS p
					 USING(name))*/
					 
WITH both_stores AS (SELECT name, a.rating AS app_rating, p.rating AS play_rating, a.price AS app_price, p.price::money::decimal AS play_price, a.review_count AS app_reviews, p.review_count AS play_reviews, p.content_rating, p.genres
					 FROM app_store_apps AS a
					 INNER JOIN play_store_apps AS p
					 USING(name))
SELECT *
FROM both_stores
ORDER BY play_rating DESC;



