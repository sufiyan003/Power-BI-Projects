-- =============================================
-- YouTube Trending Analytics — SQL Views
-- Author: Muhammad Sufiyan Siddiqui
-- Using: Window Functions, RANK, QUALIFY
-- =============================================

USE DATABASE YOUTUBE_DB;
USE SCHEMA YOUTUBE_SCHEMA;
USE WAREHOUSE YOUTUBE_WH;

-- =============================================
-- View 1: Top 10 Channels by Views
-- Window Function: RANK()
-- =============================================
CREATE OR REPLACE VIEW VW_TOP_CHANNELS AS
SELECT
    channel_title,
    Total_Views,
    Total_Videos,
    Avg_Engagement,
    RANK() OVER (ORDER BY Total_Views DESC) AS rank
FROM CHANNEL_SUMMARY
QUALIFY rank <= 10;

-- =============================================
-- View 2: Category Distribution with % Share
-- Window Function: SUM() OVER ()
-- =============================================
CREATE OR REPLACE VIEW VW_TOP_CATEGORIES AS
SELECT
    category_name,
    Total_Videos,
    Total_Views,
    Avg_Engagement,
    ROUND(Total_Views * 100.0 / SUM(Total_Views) OVER (), 2) AS views_pct
FROM CATEGORY_SUMMARY
ORDER BY Total_Views DESC;

-- =============================================
-- View 3: Yearly Trends Aggregation
-- =============================================
CREATE OR REPLACE VIEW VW_YEARLY_TRENDS AS
SELECT
    trending_year,
    COUNT(*) AS total_videos,
    SUM(views) AS total_views,
    ROUND(AVG(engagement_rate), 2) AS avg_engagement,
    ROUND(AVG(likes), 0) AS avg_likes
FROM FACT_VIDEOS
GROUP BY trending_year
ORDER BY trending_year;

-- =============================================
-- View 4: Monthly Trending Analysis
-- Window Function: RANK() OVER PARTITION BY
-- =============================================
CREATE OR REPLACE VIEW VW_MONTHLY_TRENDS AS
SELECT
    trending_year,
    trending_month,
    COUNT(*) AS total_videos,
    SUM(views) AS total_views,
    ROUND(AVG(engagement_rate), 2) AS avg_engagement,
    RANK() OVER (PARTITION BY trending_year ORDER BY SUM(views) DESC) AS month_rank
FROM FACT_VIDEOS
GROUP BY trending_year, trending_month;

-- =============================================
-- View 5: Top 50 Trending Videos
-- Window Function: RANK() for views & engagement
-- =============================================
CREATE OR REPLACE VIEW VW_TOP_VIDEOS AS
SELECT
    video_id,
    title,
    channel_title,
    category_name,
    views,
    likes,
    dislikes,
    comment_count,
    engagement_rate,
    like_ratio,
    days_to_trend,
    RANK() OVER (ORDER BY views DESC) AS views_rank,
    RANK() OVER (ORDER BY engagement_rate DESC) AS engagement_rank
FROM FACT_VIDEOS
QUALIFY views_rank <= 50;

-- Verify all views
SHOW VIEWS;

-- Test queries
SELECT * FROM VW_TOP_CHANNELS;
SELECT * FROM VW_TOP_CATEGORIES;
SELECT * FROM VW_YEARLY_TRENDS;
