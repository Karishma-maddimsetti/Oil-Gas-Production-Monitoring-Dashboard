create database OilProductionDB; --create databse
use OilProductionDB;

--create table

create table Wellproduction(
ProductionID INT PRIMARY KEY,
WellName VARCHAR(50),
FieldName VARCHAR(50),
ProductionDate Date,
Oil_BBL Decimal(10,2),
Gas_mcf Decimal(10,2),
Water_BBL Decimal(10,2)
);

--Insert sample data
insert into WellProduction values
(1,'WELL-A','KRISHNA','2025-01-01',1200,500,200),
(2,'WELL-B','KRISHNA','2025-01-01',900,450,180),
(3,'WELL-C','GODAVARI','2025-01-01',1500,600,250),
(4,'WELL-A','KRISHNA','2025-02-01',1180,490,210),
(5,'WELL-B','KRISHNA','2025-02-01',850,430,190),
(6,'WELL-C','GODAVARI','2025-02-01',1450,580,260),
(7,'WELL-A','KRISHNA','2025-03-01',1100,470,220),
(8,'WELL-B','KRISHNA','2025-03-01',800,410,200),
(9,'WELL-C','GODAVARI','2025-03-01',1400,560,270);

select * from Wellproduction; ---view data

---KPI -TOTAL OIL,GAS,WATER PRODUCTION

SELECT SUM(Oil_BBL) AS TOTAL_OIL_PRODUCTION from Wellproduction;
SELECT SUM(Gas_mcf) AS TOTAL_GAS_PRODUCTION from Wellproduction;
SELECT SUM(WATER_BBL) AS TOTAL_WATER_PRODUCTION from Wellproduction;

--TOTAL PRODUCING WELL

select
WellName,
sum(oil_bbl)as TotalOil from Wellproduction
group by wellname
order by TotalOil desc;

--Field-wise Production

select
fieldName,
sum(oil_bbl)as TotalOil from Wellproduction
group by FieldName
order by TotalOil desc;

--Monthly Production Trend

select 
YEAR(ProductionDate) AS YEAR,
MONTH(ProductionDate) AS MONTH,
SUM(Oil_BBL) AS MONTHLY_OIL
FROM Wellproduction
GROUP BY 
YEAR(ProductionDate),
MONTH(ProductionDate)
ORDER BY YEAR,MONTH;


--AVG PRODUCTION PER WELL

SELECT
WellName,
AVG(Oil_BBL) AS OIL_PRODUCTION
FROM Wellproduction
GROUP BY WellName;

--HIGHEST PRODUCTION DAY

SELECT TOP 1
ProductionDate,
SUM(Oil_BBL)AS DAILY_PRODUCTION
FROM Wellproduction
GROUP BY ProductionDate
ORDER BY DAILY_PRODUCTION DESC;

--LOWER PRODUCTION DAY

SELECT TOP 1
ProductionDate,
SUM(Oil_BBL)AS TOTALOIL
FROM Wellproduction
GROUP BY ProductionDate
ORDER BY TOTALOIL ASC;

--PRODUCTION DECLINE ANALYSIS: Compare current month with previous month.

SELECT 
WellName,
ProductionDate,
Oil_BBL,
LAG(Oil_BBL) OVER (PARTITION BY WellName
ORDER BY ProductionDate) AS PREVIOUSMONTH
FROM Wellproduction;

--CALCULATE DECLINE %

SELECT
    ProductionDate,
    Oil_BBL,
    LAG(Oil_BBL) OVER
    (
        PARTITION BY WellName
        ORDER BY ProductionDate
    ) AS PreviousMonth,

    CAST(
        (
            (Oil_BBL -
            LAG(Oil_BBL) OVER
            (
                PARTITION BY WellName
                ORDER BY ProductionDate
            ))
            * 100.0
            /
            LAG(Oil_BBL) OVER
            (
                PARTITION BY WellName
                ORDER BY ProductionDate
            )
        )
        AS DECIMAL(10,2)
    ) AS DeclinePercent

FROM WellProduction;

--Create Dashboard Dataset

SELECT
FieldName,
WellName,
ProductionDate,
Oil_BBL,
Gas_MCF,
Water_BBL
FROM WellProduction;


