select DISTINCT ID, avg(`Absenteeism time in hours`) OVER(PARTITION BY ID) FROM Absenteeism_at_work ORDER BY ID;

select DISTINCT ID, 
				ROUND(avg(`Absenteeism time in hours`) OVER(PARTITION BY ID ROWS BETWEEN 5 PRECEDING AND CURRENT ROW), 1) AS 6_Month_Average,
                ROUND(avg(`Absenteeism time in hours`) OVER(PARTITION BY ID ROWS BETWEEN 2 PRECEDING AND CURRENT ROW), 1) AS 3_Month_Average
                FROM Absenteeism_at_work 
                ORDER BY ID, 6_Month_Average, 3_Month_Average;

select * from Absenteeism_at_work ORDER BY ID, `Month of Absence`;

