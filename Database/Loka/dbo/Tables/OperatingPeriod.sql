CREATE TABLE [dbo].[OperatingPeriod] (
    [Id]                BIGINT         IDENTITY (1, 1) NOT NULL,
    [OperatingPeriodId] NVARCHAR (256) NOT NULL,
    [CreatedDateTime]   DATETIME2 (7)  NOT NULL,
    [CreatedDate]       DATE           NOT NULL,
    [StartDateTime]     DATETIME2 (7)  NOT NULL,
    [StartDate]         DATE           NOT NULL,
    [FinishDateTime]    DATETIME2 (7)  NOT NULL,
    [FinishDate]        DATE           NOT NULL,
    [OrganizationId]    NVARCHAR (256) NOT NULL,
    CONSTRAINT [PK_dbo_OperatingPeriod] PRIMARY KEY NONCLUSTERED ([CreatedDate] ASC, [ID] ASC) WITH (FILLFACTOR = 90, DATA_COMPRESSION = PAGE)
);

