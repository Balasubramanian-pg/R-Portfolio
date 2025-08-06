# **How Casual Riders and Annual Members Use Cyclistic Bikes Differently: A Data-Driven Deep Dive**  

## **The Core Business Challenge**  
Cyclistic, a bike-share company in Chicago, operates on a dual-customer model:  
- **Casual riders** (pay-per-ride or day-pass users).  
- **Annual members** (subscription-based riders).  

**The Problem?**  
While annual members provide steady revenue, casual riders generate higher per-ride profits—but their usage is unpredictable. **If we can convert casual riders into members, we lock in long-term revenue.**  

But first, we need to answer:  
- **How do their riding behaviors differ?**  
- **What makes casual riders choose single rides over memberships?**  
- **Can we tailor marketing to nudge them toward subscriptions?**  

This isn’t just about data—it’s about **understanding human behavior** and turning insights into profit.  

---  

## **The Data: What We’re Working With**  
### **Source & Structure**  
- **12 months of trip data** (Jan 2022 – Dec 2022).  
- **6+ million rides**, split across monthly CSV files.  
- **Key variables:**  
  - **Ride timestamps** (`started_at`, `ended_at`) → Helps track duration and peak times.  
  - **Station names & geocoordinates** → Reveals popular routes and dead zones.  
  - **Bike type** (classic, electric, docked) → Do casuals prefer certain bikes?  
  - **User type** (`member_casual`) → The core segmentation.  

### **Data Quality & Cleaning**  
Before analysis, we scrubbed the data for accuracy:  

#### **1. Missing Data**  
- **833,064 rides missing start station names.**  
- **892,742 rides missing end station names.**  
- **5,858 rides missing end coordinates.**  

**Solution:**  
- For rides missing station names but **with coordinates**, we could reverse-geocode to recover locations.  
- If no location data exists, those rides were **excluded from station-based analysis** but kept for time/duration trends.  

#### **2. Invalid Ride Durations**  
- **Negative durations** (IT errors where `ended_at` was before `started_at`) → **Removed.**  
- **Rides under 60 seconds** → Likely accidental activations or test rides → **Excluded.**  
- **Rides over 3 hours** → Potential bike abandonments or fraud → **Flagged for review.**  

**Why?**  
- Clean data prevents skewed averages (e.g., a 24-hour ride would distort true usage patterns).  

#### **3. Tool Shift: From Google Sheets to R**  
- Initially tried Google Sheets → **Too slow for 6M+ records.**  
- Switched to **R Studio** → Faster processing, better for statistical analysis.  

---  

## **Key Hypotheses: What We Expected to Find**  
Before diving into the numbers, we predicted:  

1. **Casual Riders:**  
   - More **weekend and holiday usage** (leisure-focused).  
   - Longer **average ride durations** (sightseeing, not commuting).  
   - Higher usage near **tourist hotspots** (Navy Pier, Millennium Park).  

2. **Annual Members:**  
   - More **weekday, rush-hour rides** (commuting to work).  
   - Shorter, **predictable routes** (home → train station → office).  
   - Higher usage in **residential & business districts.**  

**Now, let’s see if the data confirms this.**  

---  

## **Preliminary Findings (Before Full Analysis)**  
### **1. Ride Duration Differences**  
- **Casual riders:** Average ride **~2x longer** than members.  
  - Suggests **leisure use** (scenic routes, relaxed pace).  
- **Members:** Shorter, **efficient rides** (likely commuting).  

### **2. Time-Based Trends**  
- **Casuals peak on weekends** (especially Sundays).  
- **Members peak on weekdays** (7–9 AM & 5–6 PM → **rush hour**).  

### **3. Bike-Type Preferences**  
- **Casuals prefer electric bikes** (easier for leisure rides).  
- **Members stick to classic bikes** (consistent, predictable performance).  

### **4. Geographic Hotspots**  
- **Casuals cluster near tourist areas** (Lakefront Trail, museums).  
- **Members dominate downtown & transit hubs** (consistent work commutes).  

---  

## **Next Steps: Turning Insights Into Strategy**  
### **1. Conversion Opportunities**  
- **Target casuals with weekend-heavy usage** → Offer them **"Weekend Warrior" memberships** (unlimited Sat-Sun rides + discounted weekdays).  
- **Highlight cost savings** → Show how 10+ casual rides/month = cheaper as a member.  

### **2. Marketing Adjustments**  
- **Social media ads** near tourist spots → Push memberships as a "better way to explore."  
- **Email campaigns** to frequent casual riders → "You’d save $X with an annual pass!"  

### **3. Operational Tweaks**  
- **Rebalance bikes** before weekends → More electric bikes near leisure zones.  
- **Member perks** at commuter hubs (e.g., "Rush Hour Rewards").  

---  

## **Final Thought: Data Tells the Story, But Strategy Drives Change**  
This isn’t just about charts and averages—it’s about **finding the psychological and behavioral triggers** that make casual riders convert.  

**Our goal?** Use data to **remove friction**, **highlight value**, and **turn sporadic users into loyal members.**  

The full analysis will dive deeper—but already, the trends are clear. Now, it’s time to act.  

---  
**Question for the Team:**  
*"If casual riders value flexibility, how can we structure memberships to feel less restrictive while still locking in revenue?"*  

**Deliverable:** A full report with **visualizations, conversion recommendations, and A/B test ideas** for the marketing team.
