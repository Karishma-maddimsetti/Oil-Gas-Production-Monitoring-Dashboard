# Oil-Gas-Production-Monitoring-Dashboard
End-to-end Oil &amp; Gas Data Analytics project using SQL Server and Power BI. Features KPI reporting, production trend analysis, well performance monitoring, field-wise production insights, and interactive dashboard visualizations.


## Project Overview

This project focuses on monitoring upstream oil and gas well production using SQL and Power BI. The objective is to analyze well performance, production trends, field-wise output, production decline, and key operational KPIs.

The project demonstrates how SQL can be used for data extraction, aggregation, and analytical reporting, while Power BI is used to create interactive dashboards for business insights.

## Business Problem

Oil and gas operators need to continuously monitor well performance to identify production trends, top-performing assets, declining wells, and overall field productivity.

This dashboard provides a centralized view of production data and supports data-driven decision-making through KPI tracking and visual analytics.

## Tools Used

* SQL Server
* Power BI
* DAX
* Microsoft Excel (Data Preparation)

## Dataset

The dataset contains well production information, including:

* Well Name
* Field Name
* Production Date
* Oil Production (BBL)
* Gas Production (MCF)
* Water Production (BBL)

## Project Workflow

### 1. Database Design

Created a SQL Server database and production table to store well-level production records.

### 2. Data Analysis Using SQL

Performed analytical reporting using:

* Aggregate Functions
* GROUP BY
* ORDER BY
* Window Functions
* LAG()
* SQL Views

### 3. KPI Development

Calculated the following KPIs:

* Total Oil Production
* Total Gas Production
* Total Water Production
* Number of Active Wells
* Top Producing Well
* Lowest Producing Well
* Highest Production Day
* Average Production Per Well

### 4. Production Trend Analysis

Analyzed monthly production trends and identified production changes over time.

### 5. Production Decline Analysis

Used SQL Window Functions (LAG) to compare current production against previous production periods and calculate decline percentages.

## SQL Views Created

* vw_KPI_Summary
* vw_TopProducingWell
* vw_FieldWiseProduction
* vw_MonthlyProductionTrend
* vw_AvgProductionPerWell
* vw_HighestProductionDay
* vw_LowestProductionWell
* vw_ProductionComparison
* vw_ProductionDecline
* vw_OilGasProduction
* vw_WaterCut

## Power BI Dashboard

### KPI Cards

* Total Oil Production
* Total Gas Production
* Total Water Production
* Number of Wells

### Visualizations

* Monthly Production Trend (Line Chart)
* Production by Well (Bar Chart)
* Production by Field (Column Chart)
* Oil vs Gas Production (Clustered Bar Chart)
* Water Cut Analysis (Pie Chart)

### Filters

* Well Name
* Field Name
* Production Date

## Key Insights

* Identified the highest-producing wells.
* Compared production performance across fields.
* Tracked monthly production trends.
* Evaluated production decline percentages.
* Analyzed water cut to assess well efficiency.
* Monitored overall field production performance.

## Skills Demonstrated

* SQL Querying
* Data Aggregation
* KPI Development
* Window Functions
* Production Analytics
* Oil & Gas Domain Knowledge
* Data Visualization
* Power BI Dashboard Design
* Business Intelligence Reporting

