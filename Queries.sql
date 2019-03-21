SELECT * 
FROM [dbo].[Person]
GO

DECLARE @pointInTime datetime = '2019-03-21 11:06:21' 
DECLARE @now datetime = getutcdate()
 
SELECT *
FROM [dbo].[Person]
FOR SYSTEM_TIME 
        BETWEEN @pointInTime AND @now
GO