/***********************************************************************************************
	Original Author:	Jasminko Sofo
	Created Date:		2022-12-13
	Description:		SP that truncates data from the specified table on import schema

	Modifications:
	Date		Developer			Changes
	-------------------------------------------------------------------------------------------

	SSMS sample call:
	EXEC import.usp_ImportTable_Truncate_Data '<TableName>';
***********************************************************************************************/
CREATE PROCEDURE [import].[usp_ImportTable_Truncate_Data] 
(
    @TableName NVARCHAR(256) 
)
AS
BEGIN

--DECLARE @TableName NVARCHAR(256) = '<TableName>';

DECLARE @sql nvarchar(max) = N'TRUNCATE TABLE import.'

SET @sql = @sql + @TableName

EXEC sp_executesql @sql

END