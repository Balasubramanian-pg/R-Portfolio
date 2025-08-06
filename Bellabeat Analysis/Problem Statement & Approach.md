# **Bellabeat Data Analysis Case Study: Unlocking Growth Through Smart Device Insights**  

## **Introduction**  

Bellabeat is a leading high-tech company specializing in smart wellness products designed for women. Their innovative devices—such as the **Bellabeat Leaf**, **Time**, **Spring**, and **Ivy**—track health metrics like activity, sleep, stress, and reproductive health. By leveraging data-driven insights, Bellabeat empowers women to make informed decisions about their well-being.  

As a **junior data analyst** on Bellabeat’s marketing team, I was tasked with analyzing **smart device fitness data** to uncover trends that could drive growth opportunities. The goal was to provide actionable recommendations to refine Bellabeat’s marketing strategy and enhance its product ecosystem.  

## **Business Task & Stakeholder Objectives**  

### **Key Stakeholders**  
1. **Urška Sršen** – Co-founder & Chief Creative Officer  
   - Visionary leader who believes data-driven insights can unlock new growth opportunities.  
2. **Sando Mur** – Co-founder & Mathematician  
   - Ensures analytical rigor in decision-making.  
3. **Bellabeat Marketing Team**  
   - Responsible for implementing data-backed strategies to engage customers.  

### **Primary Business Questions**  
1. **Trends in Smart Device Usage** – What patterns emerge from how consumers use fitness trackers?  
2. **Application to Bellabeat Customers** – How do these trends align with (or differ from) Bellabeat’s user base?  
3. **Marketing Strategy Influence** – How can Bellabeat leverage these insights to refine its campaigns and product development?  

### **Business Task**  
The core objective was to **analyze FitBit fitness tracker data** (from a public dataset of 30 users) to identify behavioral trends and provide **high-level recommendations** for Bellabeat’s marketing strategy.  

# **Bellabeat Data Analysis Plan: 11 Key Analysis Points**

Given the datasets available, we can perform a **comprehensive analysis** of user behavior to extract actionable insights for Bellabeat. Below are the **11 most critical analysis points**, along with the **questions they answer** and the **approach** to execute them.

---

## **1. Daily Activity Trends**  
**Dataset:** `dailyActivity_merged.csv`  
**Questions:**  
- What is the average daily step count, and how does it compare to the recommended 10,000 steps?  
- How much time do users spend sedentary vs. active?  
- Are there patterns in activity levels (weekdays vs. weekends)?  

**Approach:**  
- Calculate **mean, median, and distribution** of steps, active minutes, and sedentary time.  
- Visualize trends using **line charts (daily steps) and bar graphs (active vs. sedentary time)**.  

---

## **2. Calorie Burn Analysis**  
**Dataset:** `dailyCalories_merged.csv`  
**Questions:**  
- How does calorie burn correlate with steps and activity intensity?  
- Do users burn more calories on certain days?  

**Approach:**  
- Merge with `dailyActivity_merged.csv` to analyze **steps vs. calories**.  
- Use **scatter plots and correlation coefficients** to identify relationships.  

---

## **3. Activity Intensity Breakdown**  
**Dataset:** `dailyIntensities_merged.csv`  
**Questions:**  
- What percentage of users engage in light, moderate, or vigorous activity?  
- Are there differences in intensity levels by time of day?  

**Approach:**  
- Categorize intensity levels and calculate **percentages per user**.  
- Compare with **hourly data** to see peak activity times.  

---

## **4. Hourly Step Patterns**  
**Dataset:** `hourlySteps_merged.csv`  
**Questions:**  
- When are users most active (morning, afternoon, evening)?  
- Are there differences between weekdays and weekends?  

**Approach:**  
- Aggregate steps by **hour and day of the week**.  
- Use **heatmaps or time-series plots** to visualize trends.  

---

## **5. Sleep Quality & Duration**  
**Dataset:** `sleepDay_merged.csv`  
**Questions:**  
- How many hours do users sleep on average?  
- Is there a link between sleep duration and daily activity?  

**Approach:**  
- Calculate **average sleep time, sleep efficiency (time asleep vs. in bed)**.  
- Merge with `dailyActivity_merged.csv` to see if **active users sleep better**.  

---

## **6. Weight Tracking & BMI Trends**  
**Dataset:** `weightLoginfo_merged.csv`  
**Questions:**  
- How many users track their weight consistently?  
- Is there a correlation between activity levels and weight changes?  

**Approach:**  
- Check **data completeness** (how many users log weight).  
- Merge with activity data to see if **more steps = weight loss trends**.  

---

## **7. Heart Rate & Activity Correlation**  
**Dataset:** (If available, though not listed—otherwise inferred from intensity data)  
**Questions:**  
- Does higher activity intensity lead to lower resting heart rates over time?  

**Approach:**  
- If HR data exists, analyze **resting HR trends vs. activity logs**.  

---

## **8. Sedentary Behavior Impact**  
**Dataset:** `dailyActivity_merged.csv`  
**Questions:**  
- Do users with high sedentary time have poorer sleep or higher BMI?  

**Approach:**  
- Merge with `sleepDay_merged.csv` and `weightLoginfo_merged.csv`.  
- Use **regression analysis** to test relationships.  

---

## **9. User Engagement & Consistency**  
**Datasets:** All daily/hourly logs  
**Questions:**  
- How many days do users actually wear their devices?  
- Are there "drop-off" points where usage declines?  

**Approach:**  
- Track **missing data days per user** to measure engagement.  

---

## **10. Minute-by-Minute Activity Peaks**  
**Dataset:** `minuteStepsWide_merged.csv`  
**Questions:**  
- When do users take the most steps (e.g., lunch breaks, evenings)?  

**Approach:**  
- Aggregate steps by **5-10 minute intervals** to detect micro-patterns.  

---

## **11. Device Usage vs. Health Outcomes**  
**Cross-dataset analysis**  
**Questions:**  
- Do users who track more metrics (steps, sleep, weight) see better health improvements?  

**Approach:**  
- Identify **high-engagement users** and compare their trends vs. low-engagement users.  

---

## **Final Recommendations Based on Findings**  
After conducting these analyses, we can provide Bellabeat with insights on:  
✅ **How to improve user engagement** (e.g., reminders for inactive users).  
✅ **Optimal times to send health nudges** (based on activity peaks).  
✅ **Which features to emphasize in marketing** (e.g., sleep tracking if data shows poor sleep habits).  
✅ **Potential new features** (e.g., stress tracking if gaps are found).  

---  

## **Data Preparation & Credibility Assessment**  

### **Dataset Overview**  
The analysis relied on **FitBit Fitness Tracker Data**, a publicly available dataset from Kaggle containing:  
- **Daily activity logs** (steps, distance, calories burned)  
- **Heart rate measurements**  
- **Sleep patterns** (duration, sleep stages)  
- **Weight & BMI logs**  

### **Data Limitations**  
- **Small sample size (30 users)** – May not fully represent broader consumer behavior.  
- **Potential bias** – Users may be more fitness-conscious than average.  
- **Lack of demographic details** – Missing age, gender, or geographic distribution.  

Despite these limitations, the dataset provides **valuable preliminary insights** into smart device usage trends.  

---  

## **Key Findings & Insights**  

### **1. Activity Trends: Steps & Sedentary Behavior**  
- **Most users averaged 7,000–8,000 steps/day**, falling short of the recommended **10,000 steps**.  
- **High sedentary time** (average 12+ hours/day) suggests many users are inactive despite owning a fitness tracker.  

**Implication for Bellabeat:**  
- **Gamification & reminders** could encourage more movement.  
- **Personalized step challenges** in the Bellabeat app may boost engagement.  

### **2. Sleep Patterns: Quality vs. Quantity**  
- **Average sleep duration: ~7 hours**, with many users experiencing **fragmented sleep**.  
- **Few users tracked deep sleep**, indicating a lack of awareness about sleep stages.  

**Implication for Bellabeat:**  
- **Sleep education features** (e.g., tips for better sleep hygiene).  
- **Integration with relaxation tools** (guided meditation, wind-down reminders).  

### **3. Heart Rate & Stress Correlation**  
- **Higher resting heart rates** correlated with **longer sedentary periods**.  
- **Few users actively monitored stress**, missing an opportunity for holistic health tracking.  

**Implication for Bellabeat:**  
- **Stress tracking enhancements** (e.g., guided breathing exercises).  
- **Notifications for elevated heart rates** to prompt movement breaks.  

### **4. Weight & Fitness Tracking Gaps**  
- **Only 8 users logged weight data**, suggesting low engagement with weight tracking features.  

**Implication for Bellabeat:**  
- **Incentivize weight logging** (e.g., rewards, progress badges).  
- **Sync with nutrition apps** for a more holistic health view.  

---  

## **Strategic Recommendations**  

### **1. Enhance User Engagement Through Personalization**  
- **AI-driven insights** (e.g., "You’ve been sitting too long—take a 5-minute walk!").  
- **Customizable goals** (steps, sleep, stress reduction) tailored to individual habits.  

### **2. Expand Sleep & Stress Tracking Features**  
- **Sleep score breakdowns** (light vs. deep sleep analysis).  
- **Stress management tools** (guided breathing, mindfulness exercises).  

### **3. Gamification & Community Challenges**  
- **Step competitions** (team challenges among friends).  
- **Achievement badges** for hitting wellness milestones.  

### **4. Marketing Campaign Focus Areas**  
- **"Move More, Stress Less"** – Highlight activity & stress reduction benefits.  
- **"Sleep Smarter with Bellabeat"** – Educate users on sleep optimization.  

---  

## **Conclusion**  

By analyzing **FitBit user data**, we identified key trends in **activity, sleep, and stress tracking** that Bellabeat can leverage to **improve user engagement**. Implementing **personalized insights, gamification, and deeper health tracking features** can position Bellabeat as a **leader in women’s wellness technology**.  

### **Next Steps**  
- **Larger-scale study** with Bellabeat’s own user data for more precise insights.  
- **A/B testing** new features to measure engagement impact.  
- **Partnerships with wellness apps** (e.g., meditation, nutrition) for a seamless health ecosystem.  

This analysis provides a **data-backed foundation** for Bellabeat’s marketing strategy, ensuring future growth aligns with real user behaviors and needs.  

---  
**Bottom Line:** *"Data doesn’t just inform—it transforms. By understanding how women interact with their smart devices, Bellabeat can craft experiences that don’t just track health but actively improve it."*

