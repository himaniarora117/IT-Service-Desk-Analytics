# IT Service Desk & Incident Performance Analytics

## Project Overview

This project analyzes a synthetic IT service desk incident dataset containing 5,000 records. It uses SQL and Power BI to examine ticket volume, SLA compliance, resolution performance, assignment-group workload, and customer satisfaction.

The objective is to demonstrate practical data analysis, KPI development, data visualization, and operational reporting skills.

## Business Objectives

- Understand ticket distribution across incident categories.
- Compare average resolution times across categories.
- Measure SLA breach rates by category and priority.
- Compare ticket volumes across assignment groups.
- Explore monthly ticket-volume trends.
- Monitor overall ticket volume and customer satisfaction.

## Tools & Technologies

- **MySQL** — data querying and analysis
- **Power BI Desktop** — dashboard development and visualization
- **Microsoft Excel** — optional data inspection
- **Git and GitHub** — version control and project presentation

## Dataset

- **Records:** 5,000 incident records
- **Type:** Synthetic data created for portfolio and learning purposes
- **Source file:** `data/incidents_import.csv`

The dataset includes fields such as ticket ID, category, priority, assignment group, resolution hours, SLA hours, creation and resolution dates, reopening status, customer satisfaction, location, channel, and ticket status.

This is a synthetic dataset and does not represent actual company or customer records.

## Dashboard

The Power BI report includes the following KPI cards and visuals.

### KPI Cards

- Total Tickets
- SLA Breach Rate
- Average Customer Satisfaction

### Charts

1. Ticket Volume by Category
2. Average Resolution Time by Category (Hours)
3. SLA Breach Rate by Category
4. SLA Breach Rate by Priority
5. Ticket Volume by Assignment Group
6. Monthly Ticket Volume

## Key Metrics

- **Total Tickets:** Count of incident records.
- **SLA Breach Rate:** Percentage of incidents whose resolution time exceeds the applicable SLA hours.
- **Average Resolution Time:** Mean resolution time in hours.
- **Average Customer Satisfaction:** Mean customer satisfaction score.
- **Ticket Volume:** Number of incidents grouped by category, assignment group, or month.

## Methodology

1. Inspected the source dataset.
2. Imported the incident records into MySQL.
3. Used SQL queries to explore ticket volume, resolution time, SLA breaches, and assignment-group performance.
4. Imported the dataset into Power BI.
5. Created KPI cards and charts to compare operational performance.
6. Used visual comparisons to identify areas that may warrant further investigation.

## Initial Findings

- The dataset contains 5,000 incident records.
- The overall SLA breach rate is approximately 17.90%.
- Average customer satisfaction is approximately 4.16 out of 5.
- Network has the highest ticket volume among the incident categories.
- Hardware has the highest average resolution time among the categories.

These findings describe the synthetic dataset used in this project and should not be interpreted as real-world company performance.

## Project Structure

```text
Project_1_IT_Service_Desk_Analytics/
├── dashboard/
├── data/
│   └── incidents_import.csv
├── screenshots/
├── sql/
│   └── analysis.sql
├── README
└── IT_Service_Desk_Analytics.pbix
```

## How to Explore the Project

1. Review the SQL queries in `sql/analysis.sql`.
2. Inspect the synthetic source dataset in `data/incidents_import.csv`.
3. Open `IT_Service_Desk_Analytics.pbix` using Power BI Desktop to explore the report.

## Limitations

- The dataset is synthetic and intended for demonstration.
- Findings are limited to the fields and records included in the dataset.
- Observed relationships should not be treated as evidence of causation.

## Future Improvements

- Add a detailed reopening-rate analysis.
- Add ticket-status and channel breakdowns.
- Improve report interactivity with slicers and drill-through.
- Add further operational recommendations supported by the data.

---

**Portfolio Project:** IT Service Desk & Incident Performance Analytics