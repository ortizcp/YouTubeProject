SELECT * 
FROM youtube.channel_insights;

# Identifying and Removing Duplicates -- No duplicates found

SELECT `Video Title`, COUNT(`Video Title`)
FROM youtube.channel_insights
GROUP BY `Video Title`
HAVING COUNT(`Video Title`) > 1
;

# Standardized Date

SELECT `Video Publish Date`,
DATE_FORMAT(STR_TO_DATE(`Video Publish Date`, '%M %e, %Y'), '%Y-%m-%d')
FROM youtube.channel_insights
;

UPDATE youtube.channel_insights
SET `Video Publish Date` = DATE_FORMAT(STR_TO_DATE(`Video Publish Date`, '%M %e, %Y'), '%Y-%m-%d')
;

# Average Watch Time (Hours)

SELECT `Content Form`, ROUND(AVG(`Watch Time In Hours`), 2) AS AVG_Watch_Hours
FROM youtube.channel_insights
WHERE `Content Form` <> 'Short'
GROUP BY `Content Form`
;

SELECT `Content Form`, ROUND(AVG(`Watch Time In Hours`), 2) AS AVG_Watch_Hours
FROM youtube.channel_insights
WHERE `Content Form` <> 'Long'
GROUP BY `Content Form`
;

# Total Watch Time (Hours)

SELECT `Content Form`, ROUND(SUM(`Watch Time In Hours`), 2) AS Total_Watch_Hours
FROM youtube.channel_insights
WHERE `Content Form` <> 'Short'
GROUP BY `Content Form`
;

SELECT `Content Form`, ROUND(SUM(`Watch Time In Hours`), 2) AS Total_Watch_Hours
FROM youtube.channel_insights
WHERE `Content Form` <> 'Long'
GROUP BY `Content Form`
;

SELECT ROUND(SUM(`Watch Time In Hours`), 2) AS Total_Watch_Hours
FROM youtube.channel_insights
;

SELECT `Content Form`, `Video Title`, ROUND(MAX(`Watch Time In Hours`), 2) AS Highest_Watch_Hours
FROM youtube.channel_insights
GROUP BY `Content Form`, `Video Title`
ORDER BY Highest_Watch_Hours DESC
;

# Average Click Through Rate (Percent)

SELECT AVG(`Percent Impressions Click-Through Rate`) AS AVG_Click_Rate 
FROM youtube.channel_insights
;

SELECT `Content Form`, AVG(`Percent Impressions Click-Through Rate`) AS AVG_Click_Rate 
FROM youtube.channel_insights
WHERE `Content Form` <> 'Long'
GROUP BY `Content Form`
;

SELECT `Content Form`, AVG(`Percent Impressions Click-Through Rate`) AS AVG_Click_Rate 
FROM youtube.channel_insights
WHERE `Content Form` <> 'Short'
GROUP BY `Content Form`
;

# Identifying Video Title with Highest Click-Through Rate

SELECT `Content Form`, `Video Title`, MAX(`Percent Impressions Click-Through Rate`) AS Highest_Click_Rate 
FROM youtube.channel_insights
GROUP BY `Content Form`, `Video Title`
ORDER BY Highest_Click_Rate DESC
;

SELECT MAX(`Percent Impressions Click-Through Rate`) AS Highest_Click_Rate 
FROM youtube.channel_insights
;

# Total Number of Impressions By Content Form

SELECT `Content Form`, SUM(`Impressions`) AS Total_Impressions
FROM youtube.channel_insights
WHERE `Content Form` <> 'Short'
GROUP BY `Content Form`
;

SELECT `Content Form`, SUM(`Impressions`) AS Total_Impressions
FROM youtube.channel_insights
WHERE `Content Form` <> 'Long'
GROUP BY `Content Form`
;

SELECT `Content Form`, `Video Title`, MAX(`Impressions`) AS Highest_Impressions
FROM youtube.channel_insights
GROUP BY `Content Form`, `Video Title`
HAVING `Content Form` <> 'Short'
ORDER BY Highest_Impressions DESC
;

# Highest Number of Views

SELECT MAX(`Views`) 
FROM youtube.channel_insights
;

SELECT `Content Form`, `Video Title`, MAX(`Views`) AS Highest_Views
FROM youtube.channel_insights
GROUP BY `Content Form`, `Video Title`
ORDER BY  Highest_Views DESC
;