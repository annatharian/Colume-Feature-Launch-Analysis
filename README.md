# Colume- Feature Launch Analysis

Date: June 2025

Analyst: Anna Susan Anil

## 1. Overview
Purpose of the Analysis:

Evaluate how the Feb 20 feature launch impacted user retention, system performance, and user sentiment.

### Business Context:
Colume launched 3 new features aimed at boosting engagement. 

New Features Launched:
* Task Reminders
* Voice Assistant
* Custom Themes

### Stakeholders needed clarity on:
Retention lift from these features
Any performance bottlenecks
Spike in support issues or user confusion

### Primary Stakeholders:
Product Team, Engineering, Operations, CX

## 2. Business Objectives
2.1 Understand the Impact of New Feature Adoption on User Retention and Behavior

2.2 Evaluate how the new features launched on Feb 20, 2025, impacted system performance, user satisfaction, and support volume.

## 3. Key Questions
Retention:
* Are adopters retained better than non-adopters?
* Which features correlate with the best retention?
  
System Performance:
* Did CPU/memory usage spike after launch?
* Was there a dip in response time?
  
Support/User Sentiment:
* Did high-priority tickets increase?
* Was feedback mostly positive, negative, or neutral?

## 4. Methodology
I followed the **BAIIR framework** (Business Objective, Acquisition, Investigation, Insight, Recommendation) to guide the analysis.

### Data Cleaning (SQL)

- Removed null or empty values from key fields like user_id, timestamp, and feature_area.
- Standardized date formats across tables for consistency.
- Added a derived column to label each record as 'Before' or 'After' the feature launch (Feb 20, 2025).
- Cleaned and normalized text fields (e.g., feature names and sentiment tags).
- Filtered out known incomplete rows at the end of the dataset to avoid skewed charts.

### Data Analysis (SQL + Power BI)

Analysis was primarily performed in SQL, with Power BI used for visual storytelling and KPI tracking.

- Segmented users into adopters (used any new feature post-launch) and non-adopters.
- Calculated weekly retention, adoption rates, and user activity trends.
- Aggregated support ticket volumes by priority and feature area.
- Classified user feedback into sentiment buckets (positive, neutral, negative).
- Linked feature usage with subscription outcomes (upgrades, downgrades, non-renewals).

Tools: Power BI, DAX, SQL, Microsoft SSMS

## 5. Insights & Visuals
In the weeks following the Feb 20 feature launch, nearly 45% of the user base adopted at least one of the three new features, with adoption volume being relatively balanced across Task Reminder, Voice Assistant, and Custom Themes. Interestingly, users who adopted early were already highly active before launch, highlighting the value of targeting this segment for early rollouts. These adopters showed higher retention across six weeks, better subscription stability, and a greater likelihood to upgrade their plans. Non-adopters, on the other hand, had a higher rate of non-renewals, a potential churn signal.

While system performance scaled well post-launch (CPU usage rose but memory and response time remained stable), user sentiment was mixed. Positive feedback stood at 40.1%, while negative was close behind at 39.2%. Custom Themes received the most critical feedback and drove the highest support volume, especially in medium-priority tickets. Overall, support tickets rose significantly, with high-priority ones jumping 185%. Despite this, average post-launch feature rating held at 3.02, and engagement metrics like request volume and active users trended upward. This suggests that the features sparked strong engagement, even as they surfaced some usability gaps worth refining.

## 6. Limitations
* Retention window limited to 6 weeks
* Feedback volume could be biased toward active users
* No control group for performance benchmarking

## 7. Recommendations
* Scale infrastructure if launching multiple features simultaneously
* Prioritize support readiness for visual-heavy features like Custom Themes
* Consider A/B testing for future launches to isolate impact
