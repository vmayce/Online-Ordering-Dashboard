﻿CREATE TABLE [OOD].[Fee]
(
	[FeeId] INT NOT NULL IDENTITY(1,1), 
	[MerchantRelatedId] INT NOT NULL,
	[Merchant] NVARCHAR(50) NULL,
	[Type] NVARCHAR(50) NULL,
    CONSTRAINT PK_Fee_FeeId PRIMARY KEY (FeeId)
)
