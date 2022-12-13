CREATE TABLE [etl].[IncrementalLoadMark_DL] (
    [ID]                   INT            IDENTITY (1, 1) NOT NULL,
    [FolderName]           NVARCHAR (256) NOT NULL,
    [MarkValue]            NVARCHAR (32) NULL,
    [LoadType]             NVARCHAR (32)  NOT NULL,
    [CreatedTimestampUTC]  DATETIME2 (7)  NOT NULL,
    [LastLoadTimestampUTC] DATETIME2 (7)  NULL,
    CONSTRAINT [PK_etl_IncrementalLoadMark] PRIMARY KEY CLUSTERED ([ID] ASC)
);


GO
ALTER TABLE [etl].[IncrementalLoadMark_DL] SET (LOCK_ESCALATION = AUTO);

