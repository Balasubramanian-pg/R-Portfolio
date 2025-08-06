# How Casual Riders and Annual Members Use Cyclistic Bikes Differently  

## The Problem We're Solving  
We need to uncover the differences in bike usage between **casual riders** and **annual members** at Cyclistic.  

- **Why?** Because converting casual riders to members could mean **more predictable revenue** and **higher customer lifetime value**.  
- **How?** By analyzing **ride patterns, duration, frequency, locations, and time-based trends**, we’ll identify key behavioral differences.  

**Business Impact:**  
- If casual riders use bikes similarly to members but pay more per ride, converting them **boosts profitability**.  
- If they use bikes differently (e.g., leisure vs. commute), marketing can **tailor messaging** to highlight membership benefits.  

---  

## The Data We’re Using  
**Source:** Cyclistic’s historical trip data (Jan 2022 - Dec 2022).  

### Data Structure & Integrity  
- **Format:** Monthly CSV files (~6M records total).  
- **Columns:**  
  - `ride_id`, `rideable_type` (classic/electric/docked),  
  - `started_at`, `ended_at` (timestamps),  
  - `start/end_station_name/id` (some missing),  
  - `start/end_lat/lng` (geocoordinates),  
  - `member_casual` (user type).  

**Data Quality Check:**  
✅ **Reliable?** Yes—sourced directly from Cyclistic’s operational data.  
⚠️ **Missing Values:**  
- 833K missing `start_station_name`/`id`  
- 892K missing `end_station_name`/`id`  
- 5.8K missing `end_lat`/`lng` (could help recover station names)  

**Anomalies:**  
- Negative ride durations (IT errors—**removed**).  
- Rides <60 sec (likely cancellations—**excluded**).  
- Rides >3 hours (potential bike abandonments—**flagged**).  

---  

## How We Processed the Data  
**First Attempt: Google Sheets**  
- Too slow for 6M records.  
- Useful for initial visual checks (e.g., spotting missing station names).  

**Final Tool: R Studio**  
- Handles large datasets efficiently.  
- Cleaned data by:  
  1. Filtering out invalid ride durations.  
  2. Adding calculated columns:  
     - `ride_length` (duration in seconds).  
     - `day_of_week`, `start_month` (for time-based analysis).  

---  

## Next Steps: Analysis  
Now that the data is clean, we’ll:  
1. Compare **average ride duration** (members vs. casuals).  
2. Analyze **peak usage times** (weekdays vs. weekends).  
3. Map **popular start/end stations** for each group.  
4. Identify **seasonal trends** (monthly usage patterns).  

**Goal:** Find **actionable insights** to convert casual riders into members.  

---  

### Key Question for Stakeholders  
*"If casual riders primarily use bikes for leisure, how can we position membership as a better value than pay-per-ride?"*  

**Deliverable:** A report highlighting **where, when, and how** usage differs—and what that means for marketing.  

---  

**Final Thought:**  
Data doesn’t lie. The numbers will show us **exactly** how to turn casual riders into loyal members. Let’s find the gaps—and exploit them.
