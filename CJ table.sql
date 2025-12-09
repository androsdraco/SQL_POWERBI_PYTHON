--select duplicates
WITH DuplicateRecord AS(
	SELECT
		JourneyID,
		CustomerID,
		ProductID,
		VisitDate,
		Stage,
		Action,
		Duration,
		ROW_NUMBER() OVER(
		PARTITION BY CustomerID, ProductID, STAGE, Action
		ORDER BY JourneyID)AS row_num
	FROM dbo.customer_journey
)
SELECT *
FROM DuplicateRecord
WHERE row_num > 1
ORDER BY JourneyID
--add avg to null to clean

   