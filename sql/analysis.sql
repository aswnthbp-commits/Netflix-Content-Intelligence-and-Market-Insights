-- ==========================================
-- Netflix Content Intelligence & Market Insights
-- SQL Analysis Queries
-- ==========================================

-- View Dataset
SELECT *
FROM netflix_titles
LIMIT 10;

-- Total Titles
SELECT COUNT(*) AS total_titles
FROM netflix_titles;

-- Movies vs TV Shows
SELECT
    type,
    COUNT(*) AS total
FROM netflix_titles
GROUP BY type
ORDER BY total DESC;

-- Top 10 Countries by Content
SELECT
    country,
    COUNT(*) AS total_titles
FROM netflix_titles
WHERE country IS NOT NULL
GROUP BY country
ORDER BY total_titles DESC
LIMIT 10;

-- Top 10 Genres
SELECT
    listed_in,
    COUNT(*) AS total_titles
FROM netflix_titles
GROUP BY listed_in
ORDER BY total_titles DESC
LIMIT 10;

-- Top Ratings
SELECT
    rating,
    COUNT(*) AS total_titles
FROM netflix_titles
GROUP BY rating
ORDER BY total_titles DESC;

-- Content Added Each Year
SELECT
    release_year,
    COUNT(*) AS total_titles
FROM netflix_titles
GROUP BY release_year
ORDER BY release_year;

-- Top 10 Directors
SELECT
    director,
    COUNT(*) AS total_titles
FROM netflix_titles
WHERE director IS NOT NULL
GROUP BY director
ORDER BY total_titles DESC
LIMIT 10;

-- Top 10 Actors
SELECT
    "cast",
    COUNT(*) AS total_titles
FROM netflix_titles
WHERE "cast" IS NOT NULL
GROUP BY "cast"
ORDER BY total_titles DESC
LIMIT 10;

-- Average Release Year
SELECT
    ROUND(AVG(release_year),2) AS average_release_year
FROM netflix_titles;

-- Movies Only
SELECT *
FROM netflix_titles
WHERE type='Movie';

-- TV Shows Only
SELECT *
FROM netflix_titles
WHERE type='TV Show';

-- Recent Releases
SELECT *
FROM netflix_titles
ORDER BY release_year DESC
LIMIT 20;

-- Longest Movie
SELECT *
FROM netflix_titles
WHERE duration LIKE '%min%'
ORDER BY CAST(REPLACE(duration,' min','') AS INTEGER) DESC
LIMIT 1;