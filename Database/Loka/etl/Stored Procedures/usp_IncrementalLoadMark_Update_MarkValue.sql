/***********************************************************************************************
	Original Author:	Jasminko Sofo
	Created Date:		2022-12-12
	Description:		SP that updates Incremental Load Mark value. First record is created manually: INSERT INTO [etl].[IncrementalLoadMark_DL] VALUES ('src', '1900-01-01')

	Modifications:
	Date		Developer			Changes
	-------------------------------------------------------------------------------------------

	SSMS sample call:
	EXEC etl.usp_IncrementalLoadMark_Update_MarkValue 'src', '1900-01-01';
***********************************************************************************************/
CREATE PROCEDURE [etl].[usp_IncrementalLoadMark_Update_MarkValue] @ID int, @MarkValue nvarchar(36)
AS

BEGIN

UPDATE [etl].[IncrementalLoadMark_DL]
SET 
	MarkValue = isnull(@markValue, '0'),
	LastLoadTimestampUTC = GETUTCDATE()
WHERE 
	ID = @ID

END