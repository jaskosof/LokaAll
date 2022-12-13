
/***********************************************************************************************
	Original Author:	Jasminko Sofo
	Created Date:		2022-12-13
	Description:		SP that loads Vehicle Events

	Modifications:
	Date		Developer			Changes
	-------------------------------------------------------------------------------------------

	SSMS sample call:
	EXEC dbo.usp_VehicleEvent_Load_Data 
***********************************************************************************************/
CREATE   PROCEDURE [dbo].[usp_VehicleEvent_Load_Data]
AS
BEGIN

--SET XACT_ABORT ON

BEGIN TRANSACTION 

/* Insert new records */
INSERT INTO dbo.VehicleEvent(
	VehicleEventId,
	CreatedDateTime,
	CreatedDate, 
	Event,
	OrganizationId,
	Lat,
	Lng
)
SELECT
	Id, 
	cast(CreatedDateTime as datetime2(7)) as CreatedDateTime,
	cast(CreatedDateTime as date) as CreatedDate,
	Event,
	OrganizationId,
	Lat,
	Lng
FROM [import].[VehicleEvent] i
WHERE NOT EXISTS (SELECT TOP 1 1 FROM dbo.VehicleEvent d WHERE d.VehicleEventId = i.Id and d.CreatedDateTime = cast(i.CreatedDateTime as datetime2(7)))

COMMIT TRANSACTION;

END