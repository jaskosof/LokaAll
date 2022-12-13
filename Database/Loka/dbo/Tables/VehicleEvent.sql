CREATE TABLE [dbo].[VehicleEvent] (
    [Id]              BIGINT         IDENTITY (1, 1) NOT NULL,
    [VehicleEventId]  NVARCHAR (256) NOT NULL,
    [CreatedDateTime] DATETIME2 (7)  NOT NULL,
    [CreatedDate]     DATE           NOT NULL,
    [Event]           NVARCHAR (256) NOT NULL,
    [OrganizationId]  NVARCHAR (256) NOT NULL,
    [Lat]             DECIMAL (7, 4) NULL,
    [Lng]             DECIMAL (7, 4) NULL,
    CONSTRAINT [PK_dbo_VehicleEvent] PRIMARY KEY NONCLUSTERED ([CreatedDate] ASC, [ID] ASC) WITH (FILLFACTOR = 90, DATA_COMPRESSION = PAGE)
);

