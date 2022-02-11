--PROJECT FOCUS
--available in both the App Store and the Play Store is ideal
--recommendations as to the price range, genre, content rating, or anything else for apps that the company should target
--Top 10 List of the apps that App Trader should buy

--RECOMENDATIONS
--Skype: over a million installs and a rating of 4.1 with over 100 million reviews. a way people can virtually celebrate pi day. 
		--available in google play store, on ipad, and iphone. 
--Math Tricks: highest review count in educational math apps, FREE, install count 10 million plus, rating 4.5, only on google
--Instagram: high reviews for both apple and google (4.5). FREE. entertainment is in the top 5 genres.


--NOTE FIGURE OUT HOW TO ORDER NUMBERS WITH + SYMBOLS OR USE CAST
--LOOK AT FREE VS. PAID APPS
--INNER JOIN BETWEEN STORES

--OBSERVATIONS: Google Play Store
--Top 4 apps with highest review counts: Facebook, WhatsApp, Instagram, Messenger
--Top 5 genres are Tools, Entertainment, Education, Medical, Business
--Top 5 categories are Family, Game, Tools, Medical, Business
--Top content rating is Everyone, which is 8x higher than the next content_rating group
	--not a big difference in avg rating

--LOOKING AT GOOGLE APPS WITH HIGHEST NUMBER OF REVIEWS, RATING, INSTALL COUNT
SELECT name, install_count, review_count, rating, genres
FROM play_store_apps
--WHERE rating IS NOT NULL install_count::numeric > --USED THIS FOR RATING
ORDER BY install_count DESC

--NUMBER OF APPS PER GENRE,CATEGORY
SELECT category, COUNT(category) AS number_apps
FROM play_store_apps
GROUP BY category
ORDER by number_apps 

--FREE APPS
SELECT *
FROM play_store_apps
WHERE type = 'Free' AND rating IS NOT NULL AND genres ILIKE '%Education%' AND name ILIKE '%math%'
ORDER BY review_count DESC

--Content Rating
SELECT content_rating, COUNT(content_rating), AVG(rating)
FROM play_store_apps
GROUP BY content_rating



--OBSERVATIONS: APPLE 
--Most apps fall in the 4+ range (4433, which is 4x as many as the next highest group)
	--avg rating for apps in this category is 3.57 (second highest, with the first being 3.76)

--LOOKING AT APPLE APPS WITH HIGHEST NUMBER OF REVIEWS, RATING
SELECT *
FROM app_store_apps
WHERE name ILIKE '%skype%'
ORDER BY review_count DESC

--Content Rating
SELECT content_rating, COUNT(content_rating), AVG(rating)
FROM app_store_apps
GROUP BY content_rating

SELECT *
FROM app_store_apps
WHERE content_rating = '4+'
ORDER BY rating DESC


--JOINING
SELECT name, a.rating AS app_rating, p.rating AS play_rating, a.price AS app_price, p.price::money::decimal AS play_price, a.review_count AS app_reviews, p.review_count AS play_reviews, p.content_rating
FROM app_store_apps AS a INNER JOIN play_store_apps AS p USING(name)
ORDER BY play_reviews DESC;

