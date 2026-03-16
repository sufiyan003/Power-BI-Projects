# 🎬 YouTube Trending Videos Analytics — End-to-End Data Pipeline

## Project Overview
This project implements a complete **Data Engineering pipeline** to analyze YouTube trending videos data for the US market (2017-2018). Raw data was ingested using Python, stored and transformed in Snowflake cloud warehouse, and visualized in Power BI via DirectQuery — simulating a real-world production data pipeline. 📊

## Problem Statement
YouTube generates massive amounts of trending data daily — but raw CSV files alone cannot provide actionable insights. This project bridges that gap by building a scalable, cloud-based pipeline that transforms raw trending video data into an interactive, multi-page analytics dashboard.

## Objective
To build an end-to-end data pipeline that ingests, cleans, stores, transforms, and visualizes 40,000+ YouTube trending video records — demonstrating core Data Engineering and Analytics skills across the full stack. 🚀

---

## 🏗️ Architecture

```
Kaggle Dataset (USvideos.csv)
        ↓
Python + Pandas (Clean & Transform)
        ↓
Snowflake Cloud Warehouse (Star Schema)
        ↓
SQL (Views + Window Functions)
        ↓
Power BI (DirectQuery — Live Connection)
        ↓
3-Page Interactive Dashboard
```

---

## Dashboard Preview

### Page 1 — Overview & KPIs
![Overview](https://github.com/sufiyan003/Power-BI-Projects/blob/main/YouTube%20Trending%20Videos%20Analytics/Assets/overview.png)

### Page 2 — Video & Engagement Analysis
![Engagement](https://github.com/sufiyan003/Power-BI-Projects/blob/main/YouTube%20Trending%20Videos%20Analytics/Assets/engagement.png)

### Page 3 — Channel & Trends Deep Dive
![Trends](https://github.com/sufiyan003/Power-BI-Projects/blob/main/YouTube%20Trending%20Videos%20Analytics/Assets/trends.png)

---

## Dashboard Structure

### Page 1: Overview & KPIs
High-level summary of the entire dataset with key performance indicators.

#### KPI Cards:
- **Total Trending Videos** — 41K videos
- **Total Views** — 96.55 Billion
- **Avg Engagement Rate** — 4.05%
- **Total Channels** — 2,207

#### Visualizations:
- Top 10 Channels by Views (Bar Chart)
- Views by Category (Donut Chart)
- Yearly Trending Views (Line Chart)

---

### Page 2: Video & Engagement Analysis
Deep dive into video performance and engagement patterns.

#### Visualizations:
- Top 50 Trending Videos (Table)
- Views by Publish Day (Bar Chart)
- Avg Engagement Rate by Category (Bar Chart)
- Videos by Views Category (Donut Chart)

---

### Page 3: Channel & Trends Deep Dive
Comprehensive channel analysis with monthly trends and filtering.

#### Visualizations:
- Monthly Trending Views by Year (Line Chart)
- Top 10 Channels Detailed Table (Views, Videos, Engagement, Rank)
- Avg Days to Trend by Category (Bar Chart)
- **Slicers** — Filter by Category & Trending Year

---

## Data Pipeline Details

### Step 1 — Python Data Cleaning (Pandas)
- Loaded 40,949 raw records from `USvideos.csv`
- Mapped category IDs to names using `US_category_id.json`
- Removed 48 duplicate records
- Fixed date formats — `trending_date` & `publish_time`
- Engineered new features:
  - `days_to_trend` — days between publish & trending
  - `engagement_rate` — (likes + dislikes + comments) / views × 100
  - `like_ratio` — likes / (likes + dislikes) × 100
  - `views_category` — bucketed view counts
  - `publish_hour`, `publish_day`, `trending_month`, `trending_year`
- Final cleaned dataset: **40,901 rows, zero nulls**

### Step 2 — Snowflake Data Warehouse
**Database:** `YOUTUBE_DB`
**Schema:** `YOUTUBE_SCHEMA`
**Warehouse:** `YOUTUBE_WH` (X-Small, Auto-suspend)

#### Star Schema Design:
| Table | Type | Rows |
|-------|------|------|
| `FACT_VIDEOS` | Fact Table | 40,901 |
| `CHANNEL_SUMMARY` | Dimension | 2,207 |
| `CATEGORY_SUMMARY` | Dimension | 16 |
| `DAILY_TRENDS` | Dimension | 205 |

### Step 3 — SQL Transformations
Created 5 views using advanced SQL:

```sql
-- Window Functions for Rankings
VW_TOP_CHANNELS    -- RANK() OVER (ORDER BY Total_Views DESC)
VW_TOP_CATEGORIES  -- ROUND(Views * 100.0 / SUM(Views) OVER (), 2)
VW_TOP_VIDEOS      -- RANK() OVER (ORDER BY views DESC)
VW_YEARLY_TRENDS   -- Year-over-year aggregations
VW_MONTHLY_TRENDS  -- RANK() OVER (PARTITION BY year ORDER BY views DESC)
```

### Step 4 — Power BI DirectQuery
- Connected Power BI directly to Snowflake via **DirectQuery**
- Built data model with 3 relationships
- Created 8 DAX measures in `_Measures` table

---

## DAX Measures

```
Total Videos = COUNTROWS(FACT_VIDEOS)
Total Views = SUM(FACT_VIDEOS[VIEWS])
Total Likes = SUM(FACT_VIDEOS[LIKES])
Avg Engagement Rate = ROUND(AVERAGE(FACT_VIDEOS[ENGAGEMENT_RATE]), 2)
Avg Like Ratio = AVERAGE(FACT_VIDEOS[LIKE_RATIO])
Avg Days to Trend = AVERAGE(FACT_VIDEOS[DAYS_TO_TREND])
Total Channels = DISTINCTCOUNT(FACT_VIDEOS[CHANNEL_TITLE])
Total Categories = DISTINCTCOUNT(FACT_VIDEOS[CATEGORY_NAME])
```

---

## Key Insights

| Insight | Detail |
|---------|--------|
| 🎵 Top Category | Music — 40.13B views (41.56%) |
| 🏆 Top Channel | ChildishGambinoVEVO — 3.76B views |
| 📅 Best Publish Day | Friday — highest trending views |
| ⚡ Most Engaging | Music & Howto & Style categories |
| 📈 Growth | Views grew significantly from 2017 to 2018 |
| ⏱️ Fastest to Trend | Entertainment & Shows categories |
| 🐌 Slowest to Trend | Autos & Vehicles — avg 40+ days |

---

## Technologies Used

| Technology | Purpose |
|------------|---------|
| **Python** | Data ingestion & cleaning |
| **Pandas** | Data transformation & feature engineering |
| **Snowflake** | Cloud data warehouse & storage |
| **SQL** | Data transformation, views, window functions |
| **Power BI** | Dashboard design & visualization |
| **DAX** | Custom measures & calculations |
| **DirectQuery** | Live Snowflake → Power BI connection |

---

## Repository Structure

```
YouTube-Trending-Analytics/
│
├── 📁 data/
│   ├── USvideos.csv
│   ├── US_category_id.json
│   └── youtube_cleaning.ipynb
│
├── 📁 sql/
│   ├── snowflake_setup.sql
│   └── snowflake_views.sql
│
├── 📁 powerbi/
│   ├── YouTube_Trending_Analytics.pbix
│   └── YouTube_Trending_Analytics.pdf
│
├── 📁 assets/
│   ├── page1_overview.png
│   ├── page2_engagement.png
│   └── page3_trends.png
│
└── README.md
```

---

## Getting Started

### Prerequisites
- Python 3.8+ with Pandas installed
- Snowflake account (free trial available at snowflake.com)
- Power BI Desktop (free at powerbi.microsoft.com)

### Installation

1. Clone the repository:
```bash
git clone https://github.com/sufiyan003/YouTube-Trending-Analytics.git
cd YouTube-Trending-Analytics
```

2. Install Python dependencies:
```bash
pip install pandas
```

3. Run the cleaning script:
```bash
cd data
jupyter notebook youtube_cleaning.ipynb
```

4. Set up Snowflake:
```bash
# Run in Snowflake Worksheet
sql/snowflake_setup.sql   -- Creates DB, Schema, Warehouse & Tables
sql/snowflake_views.sql   -- Creates 5 analytical views
```

5. Load CSVs into Snowflake via UI:
- `yt_fact_videos.csv` → `FACT_VIDEOS`
- `yt_channel_summary.csv` → `CHANNEL_SUMMARY`
- `yt_category_summary.csv` → `CATEGORY_SUMMARY`
- `yt_daily_trends.csv` → `DAILY_TRENDS`

6. Open Power BI:
- Open `powerbi/YouTube_Trending_Analytics.pbix`
- Update Snowflake connection credentials
- Refresh data

---

## Contact
For any inquiries, collaboration, or feedback:

- **Name:** Muhammad Sufiyan Siddiqui
- **Email:** [msufiynn780@gmail.com](mailto:msufiynn780@gmail.com)
- **LinkedIn:** [Muhammad Sufiyan](https://www.linkedin.com/in/muhammad-sufiyan-2a741b311)

Feel free to connect — always open to discussions and collaboration opportunities! 📬