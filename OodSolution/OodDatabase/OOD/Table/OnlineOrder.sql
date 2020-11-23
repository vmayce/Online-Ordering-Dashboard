CREATE TABLE [OOD].[OnlineOrder]
(
	[OnlineOrderId] INT NOT NULL IDENTITY(1,1),
	[MerchantRelatedId] INT NOT NULL,
	[Merchant] NVARCHAR(50) NOT NULL,
	[OrderDateTime] DATETIME NULL,
	[OrderRecievedDateTime] DATETIME NULL, 
    [StoreId] INT NULL, 
    [StoreName] NVARCHAR(50) NULL, 
    [Tax] FLOAT NULL, 
    [Subtotal] FLOAT NULL, 
	[Commission] FLOAT NULL,
    [Total] FLOAT NULL, 
    [FinalOrderStatus] NVARCHAR(50) NULL, 
	[AdditionalNotes] NVARCHAR(500) NULL,
    CONSTRAINT PK_OnlineOrder_OnlineOrderId PRIMARY KEY (OnlineOrderId)
)
	
   
