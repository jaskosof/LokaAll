
/***********************************************************************************************
	Original Author:	Jasminko Sofo
	Created Date:		2022-12-13
	Description:		SP that loads Operating Periods

	Modifications:
	Date		Developer			Changes
	-------------------------------------------------------------------------------------------

	SSMS sample call:
	EXEC dbo.usp_OperatingPeriod_Load_Data 
***********************************************************************************************/
CREATE   PROCEDURE [dbo].[usp_OperatingPeriod_Load_Data]
AS
BEGIN

--SET XACT_ABORT ON

BEGIN TRANSACTION 

/* Insert new records */
INSERT INTO dbo.OperatingPeriod(
	OperatingPeriodId,
	CreatedDateTime,
	CreatedDate, 
	StartDateTime,
	StartDate,
	FinishDateTime,
	FinishDate,
	OrganizationId
)
SELECT
	Id, 
	cast(CreatedDateTime as datetime2(7)) as CreatedDateTime,
	cast(CreatedDateTime as date) as CreatedDate,
	cast(StartDateTime as datetime2(7)) as StartDateTime,
	cast(StartDateTime as date) as StartDate,
	cast(FinishDateTime as datetime2(7)) as FinishDateTime,
	cast(FinishDateTime as date) as FinishDate,
	OrganizationId
FROM [import].[OperatingPeriod] i
WHERE NOT EXISTS (SELECT TOP 1 1 FROM dbo.OperatingPeriod d WHERE d.OperatingPeriodId = i.Id and d.CreatedDateTime = cast(i.CreatedDateTime as datetime2(7)))

COMMIT TRANSACTION;

END