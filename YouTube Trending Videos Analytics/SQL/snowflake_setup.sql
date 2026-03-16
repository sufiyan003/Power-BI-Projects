-- =============================================
-- YouTube Trending Analytics — Snowflake Setup
-- Author: Muhammad Sufiyan Siddiqui
-- =============================================

-- Step 1: Database & Schema
CREATE DATABASE YOUTUBE_DB;
USE DATABASE YOUTUBE_DB;

CREATE SCHEMA YOUTUBE_SCHEMA;
USE SCHEMA YOUTUBE_SCHEMA;

-- Step 2: Warehouse
CREATE WAREHOUSE YOUTUBE_WH
    WAREHOUSE_SIZE = 'X-SMALL'
    AUTO_SUSPEND = 60
    AUTO_RESUME = TRUE;

USE WAREHOUSE YOUTUBE_WH;

-- Step 3: Create Tables

-- Fact Table
CREATE OR REPLACE TABLE FACT_VIDEOS (
    video_id VARCHAR(20),
    title VARCHAR(500),
    channel_title VARCHAR(200),
    category_id VARCHAR(10),
    category_name VARCHAR(100),
    trending_date DATE,
    publish_date DATE,
    publish_time TIMESTAMP,
    publish_hour INTEGER,
    publish_day VARCHAR(20),
    trending_year INTEGER,
    trending_month VARCHAR(20),
    days_to_trend INTEGER,
    views BIGINT,
    likes BIGINT,
    dislikes BIGINT,
    comment_count BIGINT,
    engagement_rate FLOAT,
    like_ratio FLOAT,
    views_category VARCHAR(20),
    comments_disabled VARCHAR(10),
    ratings_disabled VARCHAR(10),
    video_error_or_removed VARCHAR(10)
);

-- Channel Summary
CREATE OR REPLACE TABLE CHANNEL_SUMMARY (
    channel_title VARCHAR(200),
    Total_Videos INTEGER,
    Total_Views BIGINT,
    Avg_Views FLOAT,
    Total_Likes BIGINT,
    Avg_Engagement FLOAT
);

-- Category Summary
CREATE OR REPLACE TABLE CATEGORY_SUMMARY (
    category_name VARCHAR(100),
    Total_Videos INTEGER,
    Total_Views BIGINT,
    Avg_Views FLOAT,
    Avg_Likes FLOAT,
    Avg_Engagement FLOAT
);

-- Daily Trends
CREATE OR REPLACE TABLE DAILY_TRENDS (
    trending_date DATE,
    Total_Videos INTEGER,
    Total_Views BIGINT,
    Avg_Engagement FLOAT
);

-- Confirm
SHOW TABLES;
