CREATE PROCEDURE [PREP].[Import_DoorDash]

AS
	INSERT OOD.OnlineOrder (
		[MerchantRelatedId],
		[Merchant],
		[OrderDateTime],
		[OrderRecievedDateTime], 
		[StoreId], 
		[StoreName], 
		[Tax], 
		[Subtotal], 
		[Commission],
		[Total], 
		[FinalOrderStatus], 
		[AdditionalNotes]
	)
	SELECT 	
		[RELATED_DOORDASH_DELIVERY_ID], 
		'Door Dash',
		CAST([TIMESTAMP_LOCAL] AS DATETIME), 
		CAST([ORDER_RECEIVED_TIME] AS DATETIME), 
		[STORE_ID], 
		[STORE_NAME], 
		[TAX_AMOUNT],
		[SUBTOTAL],
		[COMMISSION],
		(([SUBTOTAL] - [COMMISSION]) + [TAX_AMOUNT]),
		[FINAL_ORDER_STATUS], 
		[DESCRIPTION]
	FROM ( 
		SELECT 
			[RELATED_DOORDASH_DELIVERY_ID], 
			CONVERT(DATETIME, SUBSTRING([TIMESTAMP_LOCAL], 0, 17)) AS [TIMESTAMP_LOCAL],
			CONVERT(DATETIME, SUBSTRING([ORDER_RECEIVED_TIME], 0, 17)) AS [ORDER_RECEIVED_TIME], 
			[STORE_ID], 
			[STORE_NAME], 
			[TAX_AMOUNT],
			[SUBTOTAL],
			[COMMISSION],
			[FINAL_ORDER_STATUS], 
			[DESCRIPTION]
		FROM PREP.DoorDash
		WHERE 
			TRANSACTION_TYPE = 'DELIVERY'
	) D
	WHERE NOT EXISTS (SELECT MerchantRelatedId 
					  FROM OOD.OnlineOrder O 
					  WHERE D.RELATED_DOORDASH_DELIVERY_ID = O.MerchantRelatedId)
		
		