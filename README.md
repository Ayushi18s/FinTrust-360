# FinTrust 360 – Financial Customer Complaints & Response Analytics

## Project Overview
FinTrust 360 is a data analytics capstone project that analyzes 4,975 financial customer complaints to identify complaint patterns, understand company response performance, and derive actionable business recommendations.

## Objectives
- Clean and validate raw complaint data using Excel.
- Analyze complaint trends and response performance using SQL.
- Build an interactive dashboard for exploring key metrics.
- Identify recurring customer issues and opportunities for improvement.

## Tools & Technologies
- Microsoft Excel – Data cleaning and validation
- SQL (SQLite) – Data analysis and KPI calculations
- HTML, CSS and JavaScript – Interactive dashboard
- Python – Data preparation and database creation

## Project Structure
- `data/` – Original data, cleaned data and SQLite database
- `excel/` – Cleaned workbook and cleaning documentation
- `sql/` – SQL analysis queries
- `powerbi/` – Interactive HTML dashboard and dashboard screenshot
- `report/` – SQL results and business analysis report
- `AI_USAGE.md` – Disclosure of AI assistance

## Key Findings
- Total complaints analyzed: 4,975
- Closed complaints: 4,665
- Open complaints: 310
- Timely response rate among closed complaints: 90.08%
- Average response time for closed complaints: 8.76 days
- Most reported product: Credit Card (1,191 complaints)
- Most frequent issue: Unexpected fees (545 complaints)

## Company Response Insights
OakBridge Services recorded the highest timely response rate at 94.14%, while Atlas Consumer Finance recorded the lowest at 81.80% among the companies analyzed.

Complaint volume should not be interpreted as company performance without considering company size and customer base.

## Dashboard
Open `powerbi/dashboard.html` in a web browser to explore the interactive dashboard.

A PNG preview is also available at `powerbi/dashboard_image.png`.

Note: The dashboard deliverable is an interactive HTML dashboard, not a native Power BI `.pbix` file.

## Important Methodology Notes
- Open complaints are excluded from average response time calculations.
- Timely response percentage is calculated using closed complaints only.
- A timely company response does not necessarily indicate customer satisfaction.
- The dataset contains fictional complaint records for analytical purposes.

## Deliverables
- Original and cleaned complaint datasets
- Excel cleaning workbook
- SQL analysis file containing 11 queries
- SQL query results workbook
- Interactive HTML dashboard and PNG preview
- Business analysis report
- AI usage disclosure

