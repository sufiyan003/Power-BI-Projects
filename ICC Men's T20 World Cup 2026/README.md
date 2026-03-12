# 🏏 ICC Men's T20 World Cup 2026 — Interactive Power BI Dashboard

## Project Overview
This project focuses on building a fully interactive, multi-page Power BI dashboard to analyze the ICC Men's T20 World Cup 2026 — hosted by India 🇮🇳 & Sri Lanka 🇱🇰. The dashboard covers match results, team performance, batting & bowling statistics, and venue insights across all 55 matches of the tournament. 📊

## Problem Statement
Cricket tournaments generate massive amounts of data — match results, player stats, team standings, venue details — but this data is rarely presented in a unified, interactive format. This project bridges that gap by transforming raw tournament data into a visually compelling and fully navigable dashboard that enables fans, analysts, and recruiters to explore insights at a glance.

## Objective
To design a 5-page interactive Power BI dashboard that provides a complete analytical view of the ICC T20 World Cup 2026 — from tournament-level KPIs to granular player statistics — using custom DAX measures, a structured data model, and professional dashboard design principles. 🚀

---

## Dashboard Structure

### Page 1: Tournament Overview
Provides a high-level summary of the entire tournament with key performance indicators and facts at a glance.

![Tournament Overview](https://github.com/sufiyan003/Power-BI-Projects/blob/main/ICC%20Men's%20T20%20World%20Cup%202026/Assets/Tournament%20Overview.PNG)

#### Key Metrics:
- **Total Matches:** 55 matches across Group Stage, Super Eights, Semi Finals & Final
- **Total Teams:** 20 teams from across the globe
- **Total Venues:** 8 stadiums across India & Sri Lanka
- **Top Score:** 383 runs — Sahibzada Farhan (Pakistan)
- **Most Wickets:** 14 wickets — Jasprit Bumrah (India)
- **Tournament Winner:** India 🏆

#### Visualizations:
- Matches Per Stage (Bar Chart)
- Teams by Qualification Method (Donut Chart)
- Tournament At A Glance (Summary Table)

---

### Page 2: Team Performance & Points Table
Offers a comprehensive view of team standings across Group Stage and Super Eights, along with total wins per team. 🔍

![Team Performance](https://github.com/sufiyan003/Power-BI-Projects/blob/main/ICC%20Men's%20T20%20World%20Cup%202026/Assets/Team%20Performance.PNG)

#### Key Visualizations:
- **Points Table Matrix** — Pld, W, L, Pts, NRR, Qualification status for all stages
- **Team Wins Bar Chart** — Total wins across all stages per team
- **Match Venues Map** — Dark-themed interactive map showing all 8 stadium locations
- **Slicers** — Filter by Group and Stage

#### Conditional Formatting:
- Points: Green (≥6), Gold (≥4), Red (<4)
- NRR: Gradient Red → Gold → Green
- Qualification: Green (Yes), Red (No)

---

### Page 3: Batting Statistics — Top Performers
Deep dive into batting performance across the tournament with player-level insights.

![Batting Stats](https://github.com/sufiyan003/Power-BI-Projects/blob/main/ICC%20Men's%20T20%20World%20Cup%202026/Assets/Batting%20Stats.PNG)

#### Key Visualizations:
- **Top Run Scorers** (Horizontal Bar Chart) — Top 8 batters by total runs
- **Average vs Strike Rate** (Scatter Plot) — Colored by team
- **Fifties by Player** (Column Chart) — Cyan color scheme
- **Centuries by Player** (Column Chart) — Gold color scheme
- **Slicer** — Filter by Team

---

### Page 4: Bowling Statistics — Top Performers
Comprehensive breakdown of bowling performance with economy, wickets, and averages.

![Bowling Stats](https://github.com/sufiyan003/Power-BI-Projects/blob/main/ICC%20Men's%20T20%20World%20Cup%202026/Assets/Bowling%20Stats.PNG)

#### Key Visualizations:
- **Top Wicket Takers** (Horizontal Bar Chart) — Bumrah & Varun lead with 14 each
- **Economy vs Wickets** (Scatter Plot) — Colored by team
- **Bowling Average by Player** (Column Chart) — Cyan color scheme
- **Economy Rate by Player** (Column Chart) — Gold color scheme
- **Slicer** — Filter by Team

---

### Page 5: Venue Analysis — India 🇮🇳 & Sri Lanka 🇱🇰
Explores the 8 tournament venues with capacity data, match distribution, and geographic mapping.

![Venue Analysis](https://github.com/sufiyan003/Power-BI-Projects/blob/main/ICC%20Men's%20T20%20World%20Cup%202026/Assets/Venue%20Analysis.PNG)

#### Key Metrics:
- **Total Venues:** 8
- **Most Matches at Single Venue:** 8 (Eden Gardens & Narendra Modi Stadium)
- **Largest Venue Capacity:** 132,000 (Narendra Modi Stadium, Ahmedabad)

#### Key Visualizations:
- **Matches Hosted per Venue** (Bar Chart)
- **Venue Capacity Comparison** (Column Chart)
- **Interactive Map** — Dark style, cyan bubbles, city labels
- **Slicer** — Filter by Country

---

## Data Model

8 interrelated CSV tables connected via Many-to-One relationships:

| Table | Description |
|-------|-------------|
| `teams` | 20 teams — group, qualification method, ICC ranking |
| `venues` | 8 venues — capacity, coordinates, matches hosted |
| `group_stage_matches` | 40 group stage match results |
| `knockout_matches` | 15 knockout stage match results |
| `batting_stats` | Top 15 batters — runs, average, strike rate, 50s, 100s |
| `bowling_stats` | Top 15 bowlers — wickets, economy, average |
| `points_table` | Group Stage & Super Eights standings |
| `tournament_summary` | Key tournament facts |

---

## DAX Measures

10+ custom measures written in the `_Measures` table:

```
Total Matches = 55
Total Teams = COUNTROWS(teams)
Total Venues = COUNTROWS(venues)
Top Score = MAX(batting_stats[Runs])
Most Wickets = MAX(bowling_stats[Wickets])
Avg Strike Rate = AVERAGE(batting_stats[StrikeRate])
Avg Economy = AVERAGE(bowling_stats[Economy])
Tournament Winner = "India 🏆"
Team Wins = [Wins from Group Stage] + [Wins from Knockout]
Win % = DIVIDE(Wins, TotalGames, 0) * 100
```

---

## Tournament Highlights

| Category | Detail |
|----------|--------|
| 🏆 Champion | India |
| 🥈 Runner-Up | New Zealand |
| 🏏 Player of Tournament | Sanju Samson (India) |
| 📊 Top Run Scorer | Sahibzada Farhan (Pakistan) — 383 runs |
| 🎳 Top Wicket Taker | Jasprit Bumrah (India) — 14 wickets |
| 💯 Most Centuries | Sahibzada Farhan (Pakistan) — 2 centuries |
| 🏟️ Final Venue | Narendra Modi Stadium, Ahmedabad |
| 🎯 Final Score | India 255/5 beat New Zealand 159 by 96 runs |
| 🌍 First Time Qualifier | Italy |
| 🎵 Theme Song | Feel the Thrill by Anirudh Ravichander |
| 🌐 Host Nations | India & Sri Lanka |
| 💰 Prize Money | USD 13.5 Million |

---

## Technologies Used
- **Power BI Desktop** — Dashboard design, data modeling & visualization
- **DAX** — Custom measures and calculated columns
- **Microsoft Bing Maps** — Interactive venue mapping
- **CSV / Excel** — Raw data preparation and structuring

---

## Getting Started

### Prerequisites
- Install **Power BI Desktop** (free) from [Microsoft](https://powerbi.microsoft.com/desktop)

### Installation
1. Clone the repository:
   ```bash
   git clone https://github.com/sufiyan003/ICC-T20-WorldCup-2026.git
   cd ICC-T20-WorldCup-2026
   ```
2. Open **ICC_T20_WorldCup_2026.pbix** in Power BI Desktop
3. If data doesn't load, go to **Transform Data → Data Source Settings** and update file paths to your local CSV folder
4. Click **Refresh** to reload all visuals

---

## Contact
For any inquiries, collaboration, or feedback:

- **Name:** Muhammad Sufiyan Siddiqui
- **Email:** [msufiynn780@gmail.com](mailto:msufiynn780@gmail.com)
- **LinkedIn:** [Muhammad Sufiyan](https://www.linkedin.com/in/muhammad-sufiyan-2a741b311)

Feel free to connect — always open to discussions and collaboration opportunities! 📬
