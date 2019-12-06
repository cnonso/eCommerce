/****** Object:  Table [dbo].[Account_No]    Script Date: 12/6/2019 9:51:38 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Account_No](
	[ID] [int] NOT NULL,
	[Account_No] [nvarchar](50) NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[AccountNo]    Script Date: 12/6/2019 9:51:39 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AccountNo](
	[AccountNo] [nvarchar](50) NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[AuditTrail]    Script Date: 12/6/2019 9:51:39 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AuditTrail](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Action] [nvarchar](max) NULL,
	[UserID] [nvarchar](50) NULL,
	[Username] [nvarchar](50) NULL,
	[Timestamp] [datetime2](7) NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[CancelledSales]    Script Date: 12/6/2019 9:51:39 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CancelledSales](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[CustomerID] [nvarchar](50) NULL,
	[CustomerName] [nvarchar](50) NULL,
	[ReceiptNo] [nvarchar](50) NULL,
	[Date] [date] NULL,
	[Amount] [float] NULL,
	[CancellingOfficer] [nvarchar](50) NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Cart]    Script Date: 12/6/2019 9:51:39 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Cart](
	[Id] [int] NOT NULL,
	[TransactionDate] [date] NULL,
	[ProductID] [int] NULL,
	[ProductName] [nvarchar](50) NULL,
	[Unit] [nvarchar](50) NULL,
	[Qty] [float] NULL,
	[QtyOnHand] [float] NULL,
	[PricePerUnit] [float] NULL,
	[UnitCost] [float] NULL,
	[Discount] [float] NULL,
	[SubTotal] [float] NULL,
	[PoS_MAC_Addr] [nvarchar](50) NULL,
	[Transaction_Id] [nvarchar](50) NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[CashBook]    Script Date: 12/6/2019 9:51:39 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CashBook](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Date] [date] NULL,
	[Description] [nvarchar](500) NULL,
	[RefNo] [nvarchar](50) NULL,
	[LedgerAccount] [nvarchar](50) NULL,
	[Amount] [float] NULL,
	[PaymentMode] [nvarchar](50) NULL,
	[CustomerID] [nvarchar](50) NULL,
	[TransactionType] [nvarchar](50) NULL,
	[CustomerName] [nvarchar](50) NULL,
	[LedgerAccountName] [nvarchar](50) NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Categories]    Script Date: 12/6/2019 9:51:39 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Categories](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[ChartofAccounts]    Script Date: 12/6/2019 9:51:39 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ChartofAccounts](
	[AccountID] [int] IDENTITY(1,1) NOT NULL,
	[AccountNo] [nvarchar](50) NULL,
	[AccountName] [nvarchar](50) NULL,
	[AccountType] [nvarchar](50) NULL,
	[ParentAccount] [nvarchar](50) NULL,
	[NormalBalance] [nvarchar](50) NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Company]    Script Date: 12/6/2019 9:51:39 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Company](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Company_Name] [nvarchar](50) NULL,
	[Address] [nvarchar](500) NULL,
	[Phone] [nvarchar](50) NULL,
	[Email] [nvarchar](50) NULL,
	[Contact_Person] [nvarchar](50) NULL,
	[Status] [nvarchar](50) NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[CreditSales]    Script Date: 12/6/2019 9:51:39 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CreditSales](
	[ID] [int] NOT NULL,
	[AccountName] [nvarchar](50) NULL,
	[Date] [nvarchar](50) NULL,
	[Credit] [float] NULL,
	[Debit] [float] NULL,
	[Description] [nvarchar](50) NULL,
	[ReceiptNo] [nvarchar](50) NULL,
	[UserType] [nvarchar](50) NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Customers]    Script Date: 12/6/2019 9:51:39 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Customers](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NULL,
	[PhoneNo] [nvarchar](50) NULL,
	[Address] [nvarchar](500) NULL,
	[Credit] [float] NULL,
	[Status] [nvarchar](50) NULL,
	[RegisteringStaffID] [nvarchar](50) NULL,
	[AccountNo] [nvarchar](50) NULL,
	[Email] [nvarchar](max) NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Damages]    Script Date: 12/6/2019 9:51:39 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Damages](
	[ID] [int] NOT NULL,
	[ProductID] [nvarchar](50) NULL,
	[ProductName] [nvarchar](50) NULL,
	[Qty] [float] NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Damages_Transaction]    Script Date: 12/6/2019 9:51:39 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Damages_Transaction](
	[ID] [int] NOT NULL,
	[ProductID] [numeric](18, 0) NULL,
	[ProductName] [nvarchar](50) NULL,
	[Date] [date] NULL,
	[Plus] [float] NULL,
	[Minus] [float] NULL,
	[Description] [nvarchar](50) NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Expenses]    Script Date: 12/6/2019 9:51:39 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Expenses](
	[ExpenseId] [int] IDENTITY(1,1) NOT NULL,
	[Date] [date] NULL,
	[PVNo] [nvarchar](50) NULL,
	[VendorID] [int] NULL,
	[Vendor] [nvarchar](50) NULL,
	[Account] [nvarchar](50) NULL,
	[Amount] [float] NULL,
	[Description] [nvarchar](max) NULL,
	[ModeOfPayment] [nvarchar](50) NULL,
	[ChequeNo] [nvarchar](50) NULL,
	[PaymentAccount] [nvarchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[ExpenseId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[IncomeRegister]    Script Date: 12/6/2019 9:51:39 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[IncomeRegister](
	[ID] [int] NOT NULL,
	[JournalNo] [nvarchar](50) NULL,
	[Date] [datetime] NULL,
	[ReceiptNo] [nvarchar](50) NULL,
	[Customer] [nvarchar](50) NULL,
	[CustomerNo] [nvarchar](50) NULL,
	[Amount] [float] NULL,
	[Description] [nvarchar](50) NULL,
	[PaymentMode] [nvarchar](50) NULL,
	[ChequeNo] [nvarchar](50) NULL,
	[AccountName] [nvarchar](50) NULL,
	[AccountNo] [nvarchar](50) NULL,
	[CashACName] [nvarchar](50) NULL,
	[CashACNo] [nvarchar](50) NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[InvoiceNo]    Script Date: 12/6/2019 9:51:39 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[InvoiceNo](
	[InvoiceNo] [int] NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Journal]    Script Date: 12/6/2019 9:51:39 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Journal](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[JournalNo] [int] NOT NULL,
	[Date] [datetime] NULL,
	[Description] [nvarchar](500) NULL,
	[AccountNo] [nvarchar](50) NULL,
	[ContraACNo] [nvarchar](50) NULL,
	[Debit] [float] NULL,
	[Credit] [float] NULL,
	[AccountName] [nvarchar](50) NULL,
	[ContraACName] [nvarchar](50) NULL,
	[Control] [char](10) NULL,
	[AccountType] [nvarchar](50) NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[JournalNo]    Script Date: 12/6/2019 9:51:39 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[JournalNo](
	[JournalNo] [nvarchar](50) NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Journals]    Script Date: 12/6/2019 9:51:39 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Journals](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[JournalNo] [int] NOT NULL,
	[Date] [datetime] NULL,
	[Description] [nvarchar](500) NULL,
	[AccountNo] [nvarchar](50) NULL,
	[ContraACNo] [nvarchar](50) NULL,
	[Debit] [float] NULL,
	[Credit] [float] NULL,
	[AccountName] [nvarchar](50) NULL,
	[ContraACName] [nvarchar](50) NULL,
	[Control] [char](10) NULL,
	[AccountType] [nvarchar](50) NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Password]    Script Date: 12/6/2019 9:51:39 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Password](
	[ID] [int] NOT NULL,
	[UserName] [char](10) NULL,
	[Password] [char](10) NULL,
	[UserType] [char](10) NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Payments]    Script Date: 12/6/2019 9:51:39 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Payments](
	[ID] [int] NOT NULL,
	[JournalNo] [nvarchar](50) NULL,
	[Date] [nvarchar](50) NULL,
	[PVNo] [nvarchar](50) NULL,
	[Company] [nvarchar](50) NULL,
	[CompanyID] [nvarchar](50) NULL,
	[Amount] [float] NULL,
	[Description] [nvarchar](50) NULL,
	[PaymentMode] [nvarchar](50) NULL,
	[ChequeNo] [nvarchar](50) NULL,
	[Cash Account] [nvarchar](50) NULL,
	[PurchasesID] [nvarchar](50) NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[PickUpHistory]    Script Date: 12/6/2019 9:51:39 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PickUpHistory](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[SlotID] [nvarchar](50) NULL,
	[Item] [nvarchar](50) NULL,
	[ItemID] [int] NULL,
	[PickDate] [datetime2](7) NULL,
	[Qty] [float] NULL,
	[InvoiceNo] [nvarchar](50) NULL,
	[WarehouseID] [int] NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Products]    Script Date: 12/6/2019 9:51:39 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Products](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Product_Name] [nvarchar](max) NULL,
	[Category] [nvarchar](max) NULL,
	[Selling_Price] [nvarchar](50) NULL,
	[QtyonHand] [float] NULL,
	[Unit] [nvarchar](50) NULL,
	[Unit Cost] [nvarchar](50) NULL,
	[LastPurchasedPrice] [float] NULL,
	[Product Code] [nvarchar](50) NULL,
	[MinQty] [float] NULL,
	[Company] [nvarchar](50) NULL,
	[PCsPerCarton] [float] NULL,
	[UpperBound] [nvarchar](50) NULL,
	[MidBound] [nvarchar](50) NULL,
	[LowerBound] [nvarchar](50) NULL,
	[ImageUrl] [nvarchar](max) NULL,
	[ProductDetail] [nvarchar](max) NULL,
	[SaleType] [nvarchar](50) NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Products_Trans]    Script Date: 12/6/2019 9:51:39 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Products_Trans](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[ProductID] [int] NOT NULL,
	[QtyonHand] [float] NULL,
	[Description] [nvarchar](50) NULL,
	[In Flow] [nvarchar](50) NULL,
	[Out Flow] [nvarchar](50) NULL,
	[Date] [date] NULL,
	[Year] [nvarchar](50) NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Purchases]    Script Date: 12/6/2019 9:51:39 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Purchases](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[ProductID] [nvarchar](50) NULL,
	[Product] [nvarchar](50) NULL,
	[Qty] [float] NULL,
	[Unit] [nvarchar](50) NULL,
	[UnitCost] [nchar](10) NULL,
	[CompanyID] [nvarchar](50) NULL,
	[Company] [nvarchar](50) NULL,
	[Amount] [float] NULL,
	[JournalNo] [nvarchar](50) NULL,
	[PVNo] [nvarchar](50) NULL,
	[Date] [date] NULL,
	[UserType] [nvarchar](50) NULL,
	[PurchaseStatus] [nvarchar](50) NULL,
	[CancellingOfficer] [nvarchar](50) NULL,
	[CancellingDate] [date] NULL,
	[WarehouseID] [int] NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Purchases_Listing]    Script Date: 12/6/2019 9:51:39 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Purchases_Listing](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[CompanyID] [nvarchar](50) NULL,
	[Company] [nvarchar](50) NULL,
	[PVNo] [nvarchar](50) NULL,
	[Total] [float] NULL,
	[AmountPaid] [float] NULL,
	[Balance] [float] NULL,
	[JournalNo] [nvarchar](50) NULL,
	[Date] [date] NULL,
	[UserType] [nvarchar](50) NULL,
	[WarehouseID] [int] NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[RackConfig]    Script Date: 12/6/2019 9:51:39 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RackConfig](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NULL,
	[Initial] [nvarchar](50) NULL,
	[Height] [nvarchar](50) NULL,
	[Breath] [nvarchar](50) NULL,
	[VolumePerSlot] [nvarchar](50) NULL,
	[WarehouseID] [int] NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[ReceiptNo]    Script Date: 12/6/2019 9:51:39 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ReceiptNo](
	[ReceiptNo] [nvarchar](50) NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[ReceiptNoWeb]    Script Date: 12/6/2019 9:51:39 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ReceiptNoWeb](
	[ReceiptNo] [float] NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Refunds]    Script Date: 12/6/2019 9:51:39 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Refunds](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[CustomerID] [nvarchar](50) NULL,
	[Customer Name] [nvarchar](50) NULL,
	[ReferenceNo] [nvarchar](50) NULL,
	[Amount] [float] NULL,
	[Details] [nvarchar](500) NULL,
	[Date] [date] NULL,
	[UserType] [nvarchar](50) NULL,
	[OriginatingReferenceNo] [nvarchar](50) NULL,
	[Category] [nvarchar](50) NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[ReturnedGoods]    Script Date: 12/6/2019 9:51:39 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ReturnedGoods](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[ProductID] [nvarchar](50) NULL,
	[ProductName] [nvarchar](50) NULL,
	[Qty] [float] NULL,
	[Amount] [float] NULL,
	[ReceiptNo] [nvarchar](50) NULL,
	[Date] [date] NULL,
	[CancellingOfficer] [nvarchar](50) NULL,
 CONSTRAINT [PK__Returned__3214EC073F466844] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Sales_Payment]    Script Date: 12/6/2019 9:51:39 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Sales_Payment](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[CustomerID] [nvarchar](50) NULL,
	[Customer Name] [nvarchar](50) NULL,
	[ReceiptNo] [nvarchar](50) NULL,
	[Amount] [float] NULL,
	[Cash At Hand] [float] NULL,
	[Bank] [float] NULL,
	[Bank Name] [nvarchar](50) NULL,
	[Details] [nvarchar](50) NULL,
	[Date] [date] NULL,
	[UserType] [nvarchar](50) NULL,
	[OriginatingReceiptNo] [nvarchar](50) NULL,
	[Category] [nvarchar](50) NULL,
	[MoreDetails] [nvarchar](500) NULL,
	[Cash Paid] [float] NULL,
	[Bank A] [float] NULL,
	[Bank B] [float] NULL,
	[Bank C] [float] NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Sales_Table]    Script Date: 12/6/2019 9:51:39 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Sales_Table](
	[ID] [int] NOT NULL,
	[Date] [datetime] NULL,
	[ProductID] [nvarchar](50) NULL,
	[ProductName] [nvarchar](50) NULL,
	[SPrice] [float] NULL,
	[Qtyproduced] [float] NULL,
	[PR] [float] NULL,
	[ReturnedStock] [nvarchar](50) NULL,
	[Exchange] [nvarchar](50) NULL,
	[Breakfast] [nvarchar](50) NULL,
	[Damages] [nvarchar](50) NULL,
	[FinalQty] [float] NULL,
	[TotalSales] [float] NULL,
	[Income] [float] NULL,
	[UnitCost] [float] NULL,
	[JournalNo] [nvarchar](50) NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Sales_Transactions]    Script Date: 12/6/2019 9:51:39 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Sales_Transactions](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Customer Name] [nvarchar](50) NULL,
	[CustomerID] [nvarchar](50) NULL,
	[ReceiptNo] [nvarchar](50) NULL,
	[Total] [float] NULL,
	[Discount] [float] NULL,
	[VAT] [float] NULL,
	[Total Amount] [float] NULL,
	[Amount Paid] [float] NULL,
	[Cash Paid] [float] NULL,
	[Bank A] [float] NULL,
	[Bank B] [float] NULL,
	[Bank C] [float] NULL,
	[Paid Later] [float] NULL,
	[Balance] [float] NULL,
	[Date] [date] NULL,
	[UserType] [nvarchar](50) NULL,
	[ProductID] [nvarchar](50) NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[SalesRegister]    Script Date: 12/6/2019 9:51:39 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SalesRegister](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Product] [nvarchar](50) NULL,
	[ProductCode] [nvarchar](50) NULL,
	[Qty] [float] NULL,
	[ProductID] [nvarchar](50) NULL,
	[Unit] [nvarchar](50) NULL,
	[UnitPrice] [float] NULL,
	[Amount] [float] NULL,
	[ReceiptNo] [nvarchar](50) NULL,
	[UnitCost] [float] NULL,
	[Profit] [float] NULL,
	[Discount] [float] NULL,
	[Total] [float] NULL,
	[Balance] [float] NULL,
	[Date] [date] NULL,
	[Customer] [nvarchar](max) NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[ShowRoomProducts]    Script Date: 12/6/2019 9:51:39 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ShowRoomProducts](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Product_Name] [nvarchar](50) NULL,
	[Category] [nvarchar](50) NULL,
	[Selling_Price] [nvarchar](50) NULL,
	[QtyonHand] [float] NULL,
	[Unit] [nvarchar](50) NULL,
	[Unit Cost] [nvarchar](50) NULL,
	[LastPurchasedPrice] [float] NULL,
	[Product Code] [nvarchar](50) NULL,
	[MinQty] [float] NULL,
	[Company] [nvarchar](50) NULL,
	[PCsPerCarton] [float] NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[StockItems]    Script Date: 12/6/2019 9:51:39 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[StockItems](
	[ID] [int] NOT NULL,
	[Raw_MaterialID] [nvarchar](50) NULL,
	[ItemName] [nvarchar](50) NULL,
	[Category] [nvarchar](50) NULL,
	[Unit] [nvarchar](50) NULL,
	[Unit_Conversion] [nvarchar](50) NULL,
	[Formular1] [nvarchar](50) NULL,
	[Formular2] [nvarchar](50) NULL,
	[QtyonHand] [float] NULL,
	[MinQty] [float] NULL,
	[UnitCost] [nvarchar](50) NULL,
	[LastPurchasedPrice] [nvarchar](50) NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[StockItems_OpeningBal]    Script Date: 12/6/2019 9:51:39 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[StockItems_OpeningBal](
	[ID] [int] NOT NULL,
	[Raw_MaterialID] [nvarchar](50) NULL,
	[ItemName] [nvarchar](50) NULL,
	[Date] [nvarchar](50) NULL,
	[Unit] [nvarchar](50) NULL,
	[QtyonHand] [float] NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Storage]    Script Date: 12/6/2019 9:51:39 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Storage](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[SlotID] [nvarchar](50) NULL,
	[Item] [nvarchar](50) NULL,
	[ItemID] [int] NULL,
	[Company] [nvarchar](50) NULL,
	[Unit] [nvarchar](50) NULL,
	[InitialQty] [float] NULL,
	[QtyLeft] [float] NULL,
	[ItemExpiryDate] [datetime2](7) NULL,
	[StoreDate] [datetime2](7) NULL,
	[PickDate] [datetime2](7) NULL,
	[Condition] [nvarchar](50) NULL,
	[WarehouseID] [int] NULL,
	[ItemCode] [nvarchar](50) NULL,
	[Category] [nvarchar](50) NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[StorageHistory]    Script Date: 12/6/2019 9:51:39 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[StorageHistory](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[SlotID] [nvarchar](50) NULL,
	[Item] [nvarchar](50) NULL,
	[ItemID] [int] NULL,
	[StoreDate] [datetime2](7) NULL,
	[InvoiceNo] [nvarchar](50) NULL,
	[Qty] [float] NULL,
	[Unit] [nvarchar](50) NULL,
	[WarehouseID] [int] NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Suppliers]    Script Date: 12/6/2019 9:51:39 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Suppliers](
	[ID] [int] NOT NULL,
	[Name] [nvarchar](50) NULL,
	[Address] [nvarchar](50) NULL,
	[Phone] [nvarchar](50) NULL,
	[Email] [nvarchar](50) NULL,
	[Contact_Person] [nvarchar](50) NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Users]    Script Date: 12/6/2019 9:51:39 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Users](
	[UserID] [int] IDENTITY(1,1) NOT NULL,
	[Username] [varchar](50) NOT NULL,
	[Name] [varchar](50) NOT NULL,
	[Phone] [varchar](13) NULL,
	[Email] [varchar](160) NULL,
	[StaffID] [nvarchar](50) NULL,
	[Department] [nvarchar](50) NULL,
	[Password] [varchar](40) NULL,
	[UserType] [varchar](20) NULL,
	[Status] [tinyint] NULL,
	[Logs] [int] NULL,
	[DateAdded] [date] NULL,
	[FirmID] [int] NULL,
	[RoleID] [int] NULL,
	[PasswordSetDate] [date] NULL,
	[LoginAttempt] [int] NULL,
	[LockStatus] [nvarchar](10) NULL,
	[LockTime] [datetime2](7) NULL,
	[Last6Passwords] [nvarchar](max) NULL,
	[WarehouseID] [int] NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Vendors]    Script Date: 12/6/2019 9:51:39 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Vendors](
	[VendorId] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[VendorId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Warehouse_Products_Trans]    Script Date: 12/6/2019 9:51:39 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Warehouse_Products_Trans](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[ProductID] [int] NOT NULL,
	[QtyonHand] [float] NULL,
	[Description] [nvarchar](max) NULL,
	[In Flow] [nvarchar](50) NULL,
	[Out Flow] [nvarchar](50) NULL,
	[Date] [date] NULL,
	[Year] [nvarchar](50) NULL,
	[WarehouseName] [nvarchar](50) NULL,
	[WarehouseID] [int] NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[WarehouseProducts]    Script Date: 12/6/2019 9:51:39 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[WarehouseProducts](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Product_Name] [nvarchar](max) NULL,
	[Category] [nvarchar](50) NULL,
	[Selling_Price] [nvarchar](50) NULL,
	[QtyonHand] [float] NULL,
	[Unit] [nvarchar](50) NULL,
	[Unit Cost] [nvarchar](50) NULL,
	[LastPurchasedPrice] [float] NULL,
	[Product Code] [nvarchar](50) NULL,
	[MinQty] [float] NULL,
	[Company] [nvarchar](50) NULL,
	[PCsPerCarton] [float] NULL,
	[WarehouseName] [nvarchar](50) NULL,
	[WarehouseID] [int] NULL,
	[UpperBound] [nvarchar](50) NULL,
	[MidBound] [nvarchar](50) NULL,
	[LowerBound] [nvarchar](50) NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[WarehouseRequests]    Script Date: 12/6/2019 9:51:39 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[WarehouseRequests](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[ProductID] [nvarchar](50) NULL,
	[ProductName] [nvarchar](2000) NULL,
	[QtyRequested] [float] NULL,
	[FromWarehouse] [nvarchar](50) NULL,
	[Date] [datetime2](7) NULL,
	[Status] [nvarchar](50) NULL,
	[InvoiceNo] [nvarchar](50) NULL
) ON [PRIMARY]

GO
SET IDENTITY_INSERT [dbo].[Customers] ON 

INSERT [dbo].[Customers] ([ID], [Name], [PhoneNo], [Address], [Credit], [Status], [RegisteringStaffID], [AccountNo], [Email]) VALUES (1, N'Chika Nwachukwu', N'07035770021', N'No 4 Hillary Street, Dawaki Model Estate', 0, N'Active', N'eCommerce Site', NULL, NULL)
INSERT [dbo].[Customers] ([ID], [Name], [PhoneNo], [Address], [Credit], [Status], [RegisteringStaffID], [AccountNo], [Email]) VALUES (2, N'Chika Nwachukwu', N'07035770021', N'No 4 Hillary Street, Dawaki Model Estate', 0, N'Active', N'eCommerce Site', NULL, NULL)
INSERT [dbo].[Customers] ([ID], [Name], [PhoneNo], [Address], [Credit], [Status], [RegisteringStaffID], [AccountNo], [Email]) VALUES (3, N'Chika Nwachukwu', N'07035770021', N'No 4 Hillary Street, Dawaki Model Estate', 0, N'Active', N'eCommerce Site', NULL, NULL)
INSERT [dbo].[Customers] ([ID], [Name], [PhoneNo], [Address], [Credit], [Status], [RegisteringStaffID], [AccountNo], [Email]) VALUES (4, N'Chika Nwachukwu', N'07035770021', N'No 4 Hillary Street, Dawaki Model Estate', 0, N'Active', N'eCommerce Site', NULL, NULL)
INSERT [dbo].[Customers] ([ID], [Name], [PhoneNo], [Address], [Credit], [Status], [RegisteringStaffID], [AccountNo], [Email]) VALUES (5, N'Chika Nwachukwu', N'07035770021', N'No 4 Hillary Street, Dawaki Model Estate', 0, N'Active', N'eCommerce Site', NULL, NULL)
INSERT [dbo].[Customers] ([ID], [Name], [PhoneNo], [Address], [Credit], [Status], [RegisteringStaffID], [AccountNo], [Email]) VALUES (6, N'Chika Nwachukwu', N'07035770021', N'No 4 Hillary Street, Dawaki Model Estate', 0, N'Active', N'eCommerce Site', NULL, NULL)
INSERT [dbo].[Customers] ([ID], [Name], [PhoneNo], [Address], [Credit], [Status], [RegisteringStaffID], [AccountNo], [Email]) VALUES (7, N'Chika Nwachukwu', N'07035770021', N'No 4 Hillary Street, Dawaki Model Estate', 0, N'Active', N'eCommerce Site', NULL, NULL)
INSERT [dbo].[Customers] ([ID], [Name], [PhoneNo], [Address], [Credit], [Status], [RegisteringStaffID], [AccountNo], [Email]) VALUES (8, N'Chika Nwachukwu', N'07035770021', N'No 4 Hillary Street, Dawaki Model Estate', 0, N'Active', N'eCommerce Site', NULL, NULL)
INSERT [dbo].[Customers] ([ID], [Name], [PhoneNo], [Address], [Credit], [Status], [RegisteringStaffID], [AccountNo], [Email]) VALUES (9, N'Chika Nwachukwu', N'07035770021', N'No 4 Hillary Street, Dawaki Model Estate', 0, N'Active', N'eCommerce Site', NULL, NULL)
INSERT [dbo].[Customers] ([ID], [Name], [PhoneNo], [Address], [Credit], [Status], [RegisteringStaffID], [AccountNo], [Email]) VALUES (10, N'Chika Nwachukwu', N'07035770021', N'No 4 Hillary Street, Dawaki Model Estate', 0, N'Active', N'eCommerce Site', NULL, NULL)
INSERT [dbo].[Customers] ([ID], [Name], [PhoneNo], [Address], [Credit], [Status], [RegisteringStaffID], [AccountNo], [Email]) VALUES (11, N'Chika Nwachukwu', N'07035770021', N'No 4 Hillary Street, Dawaki Model Estate', 0, N'Active', N'eCommerce Site', NULL, NULL)
INSERT [dbo].[Customers] ([ID], [Name], [PhoneNo], [Address], [Credit], [Status], [RegisteringStaffID], [AccountNo], [Email]) VALUES (12, N'Chika Nwachukwu', N'07035770021', N'No 4 Hillary Street, Dawaki Model Estate', 0, N'Active', N'eCommerce Site', NULL, NULL)
SET IDENTITY_INSERT [dbo].[Customers] OFF
SET IDENTITY_INSERT [dbo].[Products] ON 

INSERT [dbo].[Products] ([ID], [Product_Name], [Category], [Selling_Price], [QtyonHand], [Unit], [Unit Cost], [LastPurchasedPrice], [Product Code], [MinQty], [Company], [PCsPerCarton], [UpperBound], [MidBound], [LowerBound], [ImageUrl], [ProductDetail], [SaleType]) VALUES (1, N'Bioderma', N'Skin Care', N'578', 100, N'PCS', N'0', 0, N'0001', 5, N'KINEX PIPING', 100, N'', N'', N'', N'images/product_01.png', NULL, N'Retail')
INSERT [dbo].[Products] ([ID], [Product_Name], [Category], [Selling_Price], [QtyonHand], [Unit], [Unit Cost], [LastPurchasedPrice], [Product Code], [MinQty], [Company], [PCsPerCarton], [UpperBound], [MidBound], [LowerBound], [ImageUrl], [ProductDetail], [SaleType]) VALUES (2, N'Chanca Piedra', N'Vitamins', N'893', 98, N'PCS', N'0', 0, N'0002', 5, N'KINEX PIPING', 100, N'', N'', N'', N'images/product_02.png', NULL, N'Retail')
INSERT [dbo].[Products] ([ID], [Product_Name], [Category], [Selling_Price], [QtyonHand], [Unit], [Unit Cost], [LastPurchasedPrice], [Product Code], [MinQty], [Company], [PCsPerCarton], [UpperBound], [MidBound], [LowerBound], [ImageUrl], [ProductDetail], [SaleType]) VALUES (3, N'Umcka Cold Care', N'Supplements', N'1336', 97, N'PCS', N'0', 0, N'0003', 5, N'KINEX PIPING', 100, N'', N'', N'', N'images/product_03.png', NULL, N'Retail')
INSERT [dbo].[Products] ([ID], [Product_Name], [Category], [Selling_Price], [QtyonHand], [Unit], [Unit Cost], [LastPurchasedPrice], [Product Code], [MinQty], [Company], [PCsPerCarton], [UpperBound], [MidBound], [LowerBound], [ImageUrl], [ProductDetail], [SaleType]) VALUES (4, N'Cetyl Pure', N'Supplements', N'1946', 97, N'PCS', N'0', 0, N'0004', 5, N'KINEX PIPING', 100, N'', N'', N'', N'images/product_04.png', NULL, N'Retail')
INSERT [dbo].[Products] ([ID], [Product_Name], [Category], [Selling_Price], [QtyonHand], [Unit], [Unit Cost], [LastPurchasedPrice], [Product Code], [MinQty], [Company], [PCsPerCarton], [UpperBound], [MidBound], [LowerBound], [ImageUrl], [ProductDetail], [SaleType]) VALUES (5, N'CLA Core', N'Diet and Nutrition', N'377', 99, N'PCS', N'0', 0, N'0005', 5, N'KINEX PIPING', 100, N'', N'', N'', N'images/product_05.png', NULL, N'Retail')
INSERT [dbo].[Products] ([ID], [Product_Name], [Category], [Selling_Price], [QtyonHand], [Unit], [Unit Cost], [LastPurchasedPrice], [Product Code], [MinQty], [Company], [PCsPerCarton], [UpperBound], [MidBound], [LowerBound], [ImageUrl], [ProductDetail], [SaleType]) VALUES (6, N'Poo Pourri', N'Tea and Cofee', N'442', 98, N'PCS', N'0', 0, N'0006', 5, N'KINEX PIPING', 100, N'', N'', N'', N'images/product_06.png', NULL, N'Retail')
INSERT [dbo].[Products] ([ID], [Product_Name], [Category], [Selling_Price], [QtyonHand], [Unit], [Unit Cost], [LastPurchasedPrice], [Product Code], [MinQty], [Company], [PCsPerCarton], [UpperBound], [MidBound], [LowerBound], [ImageUrl], [ProductDetail], [SaleType]) VALUES (11, N'Bioderma', N'Skin Care', N'57800', 100, N'PCS', N'0', 0, N'0001', 5, N'KINEX PIPING', 100, N'', N'', N'', N'images/product_01.png', NULL, N'Wholesale')
INSERT [dbo].[Products] ([ID], [Product_Name], [Category], [Selling_Price], [QtyonHand], [Unit], [Unit Cost], [LastPurchasedPrice], [Product Code], [MinQty], [Company], [PCsPerCarton], [UpperBound], [MidBound], [LowerBound], [ImageUrl], [ProductDetail], [SaleType]) VALUES (12, N'Chanca Piedra', N'Vitamins', N'89300', 100, N'PCS', N'0', 0, N'0002', 5, N'KINEX PIPING', 100, N'', N'', N'', N'images/product_02.png', NULL, N'Wholesale')
INSERT [dbo].[Products] ([ID], [Product_Name], [Category], [Selling_Price], [QtyonHand], [Unit], [Unit Cost], [LastPurchasedPrice], [Product Code], [MinQty], [Company], [PCsPerCarton], [UpperBound], [MidBound], [LowerBound], [ImageUrl], [ProductDetail], [SaleType]) VALUES (13, N'Umcka Cold Care', N'Supplements', N'133600', 100, N'PCS', N'0', 0, N'0003', 5, N'KINEX PIPING', 100, N'', N'', N'', N'images/product_03.png', NULL, N'Wholesale')
INSERT [dbo].[Products] ([ID], [Product_Name], [Category], [Selling_Price], [QtyonHand], [Unit], [Unit Cost], [LastPurchasedPrice], [Product Code], [MinQty], [Company], [PCsPerCarton], [UpperBound], [MidBound], [LowerBound], [ImageUrl], [ProductDetail], [SaleType]) VALUES (14, N'Cetyl Pure', N'Supplements', N'194600', 100, N'PCS', N'0', 0, N'0004', 5, N'KINEX PIPING', 100, N'', N'', N'', N'images/product_04.png', NULL, N'Wholesale')
INSERT [dbo].[Products] ([ID], [Product_Name], [Category], [Selling_Price], [QtyonHand], [Unit], [Unit Cost], [LastPurchasedPrice], [Product Code], [MinQty], [Company], [PCsPerCarton], [UpperBound], [MidBound], [LowerBound], [ImageUrl], [ProductDetail], [SaleType]) VALUES (15, N'CLA Core', N'Diet and Nutrition', N'37700', 100, N'PCS', N'0', 0, N'0005', 5, N'KINEX PIPING', 100, N'', N'', N'', N'images/product_05.png', NULL, N'Wholesale')
INSERT [dbo].[Products] ([ID], [Product_Name], [Category], [Selling_Price], [QtyonHand], [Unit], [Unit Cost], [LastPurchasedPrice], [Product Code], [MinQty], [Company], [PCsPerCarton], [UpperBound], [MidBound], [LowerBound], [ImageUrl], [ProductDetail], [SaleType]) VALUES (16, N'Poo Pourri', N'Tea and Cofee', N'44200', 100, N'PCS', N'0', 0, N'0006', 5, N'KINEX PIPING', 100, N'', N'', N'', N'images/product_06.png', NULL, N'Wholesale')
SET IDENTITY_INSERT [dbo].[Products] OFF
SET IDENTITY_INSERT [dbo].[Products_Trans] ON 

INSERT [dbo].[Products_Trans] ([ID], [ProductID], [QtyonHand], [Description], [In Flow], [Out Flow], [Date], [Year]) VALUES (1, 1, 7, N'Sales - ReceiptNo[1]', N'', N'1', CAST(N'2019-12-05' AS Date), N'2019')
INSERT [dbo].[Products_Trans] ([ID], [ProductID], [QtyonHand], [Description], [In Flow], [Out Flow], [Date], [Year]) VALUES (2, 2, 7, N'Sales - ReceiptNo[1]', N'', N'1', CAST(N'2019-12-05' AS Date), N'2019')
INSERT [dbo].[Products_Trans] ([ID], [ProductID], [QtyonHand], [Description], [In Flow], [Out Flow], [Date], [Year]) VALUES (3, 3, 2, N'Sales - ReceiptNo[1]', N'', N'1', CAST(N'2019-12-05' AS Date), N'2019')
INSERT [dbo].[Products_Trans] ([ID], [ProductID], [QtyonHand], [Description], [In Flow], [Out Flow], [Date], [Year]) VALUES (4, 2, 6, N'Sales - ReceiptNo[2]', N'', N'1', CAST(N'2019-12-05' AS Date), N'2019')
INSERT [dbo].[Products_Trans] ([ID], [ProductID], [QtyonHand], [Description], [In Flow], [Out Flow], [Date], [Year]) VALUES (5, 6, 9, N'Sales - ReceiptNo[2]', N'', N'1', CAST(N'2019-12-05' AS Date), N'2019')
INSERT [dbo].[Products_Trans] ([ID], [ProductID], [QtyonHand], [Description], [In Flow], [Out Flow], [Date], [Year]) VALUES (6, 3, 1, N'Sales - ReceiptNo[3]', N'', N'1', CAST(N'2019-12-05' AS Date), N'2019')
INSERT [dbo].[Products_Trans] ([ID], [ProductID], [QtyonHand], [Description], [In Flow], [Out Flow], [Date], [Year]) VALUES (11, 6, 98, N'Sales - ReceiptNo[5]', N'', N'2', CAST(N'2019-12-04' AS Date), N'2019')
INSERT [dbo].[Products_Trans] ([ID], [ProductID], [QtyonHand], [Description], [In Flow], [Out Flow], [Date], [Year]) VALUES (12, 2, 98, N'Sales - ReceiptNo[5]', N'', N'2', CAST(N'2019-12-04' AS Date), N'2019')
INSERT [dbo].[Products_Trans] ([ID], [ProductID], [QtyonHand], [Description], [In Flow], [Out Flow], [Date], [Year]) VALUES (13, 3, 97, N'Sales - ReceiptNo[5]', N'', N'2', CAST(N'2019-12-04' AS Date), N'2019')
INSERT [dbo].[Products_Trans] ([ID], [ProductID], [QtyonHand], [Description], [In Flow], [Out Flow], [Date], [Year]) VALUES (14, 4, 97, N'Sales - ReceiptNo[5]', N'', N'1', CAST(N'2019-12-04' AS Date), N'2019')
INSERT [dbo].[Products_Trans] ([ID], [ProductID], [QtyonHand], [Description], [In Flow], [Out Flow], [Date], [Year]) VALUES (7, 1, 6, N'Sales - ReceiptNo[3]', N'', N'1', CAST(N'2019-12-05' AS Date), N'2019')
INSERT [dbo].[Products_Trans] ([ID], [ProductID], [QtyonHand], [Description], [In Flow], [Out Flow], [Date], [Year]) VALUES (8, 4, 98, N'Sales - ReceiptNo[4]', N'', N'2', CAST(N'2019-12-04' AS Date), N'2019')
INSERT [dbo].[Products_Trans] ([ID], [ProductID], [QtyonHand], [Description], [In Flow], [Out Flow], [Date], [Year]) VALUES (9, 3, 99, N'Sales - ReceiptNo[4]', N'', N'1', CAST(N'2019-12-04' AS Date), N'2019')
INSERT [dbo].[Products_Trans] ([ID], [ProductID], [QtyonHand], [Description], [In Flow], [Out Flow], [Date], [Year]) VALUES (10, 5, 99, N'Sales - ReceiptNo[4]', N'', N'1', CAST(N'2019-12-04' AS Date), N'2019')
SET IDENTITY_INSERT [dbo].[Products_Trans] OFF
INSERT [dbo].[ReceiptNoWeb] ([ReceiptNo]) VALUES (5)
SET IDENTITY_INSERT [dbo].[Sales_Payment] ON 

INSERT [dbo].[Sales_Payment] ([ID], [CustomerID], [Customer Name], [ReceiptNo], [Amount], [Cash At Hand], [Bank], [Bank Name], [Details], [Date], [UserType], [OriginatingReceiptNo], [Category], [MoreDetails], [Cash Paid], [Bank A], [Bank B], [Bank C]) VALUES (1, N'', N'Chika Nwachukwu', N'1', 2807, 0, 2807, NULL, N'Credit/Debit Card', CAST(N'2019-12-05' AS Date), N'eCommerce Site', NULL, NULL, NULL, 2807, 0, 0, 0)
INSERT [dbo].[Sales_Payment] ([ID], [CustomerID], [Customer Name], [ReceiptNo], [Amount], [Cash At Hand], [Bank], [Bank Name], [Details], [Date], [UserType], [OriginatingReceiptNo], [Category], [MoreDetails], [Cash Paid], [Bank A], [Bank B], [Bank C]) VALUES (2, N'', N'Chika Nwachukwu', N'2', 1335, 0, 1335, NULL, N'Credit/Debit Card', CAST(N'2019-12-05' AS Date), N'eCommerce Site', NULL, NULL, NULL, 1335, 0, 0, 0)
INSERT [dbo].[Sales_Payment] ([ID], [CustomerID], [Customer Name], [ReceiptNo], [Amount], [Cash At Hand], [Bank], [Bank Name], [Details], [Date], [UserType], [OriginatingReceiptNo], [Category], [MoreDetails], [Cash Paid], [Bank A], [Bank B], [Bank C]) VALUES (3, N'', N'Chika Nwachukwu', N'3', 1914, 0, 1914, NULL, N'Credit/Debit Card', CAST(N'2019-12-05' AS Date), N'eCommerce Site', NULL, NULL, NULL, 1914, 0, 0, 0)
INSERT [dbo].[Sales_Payment] ([ID], [CustomerID], [Customer Name], [ReceiptNo], [Amount], [Cash At Hand], [Bank], [Bank Name], [Details], [Date], [UserType], [OriginatingReceiptNo], [Category], [MoreDetails], [Cash Paid], [Bank A], [Bank B], [Bank C]) VALUES (4, N'', N'Chika Nwachukwu', N'4', 5605, 0, 5605, NULL, N'Credit/Debit Card', CAST(N'2019-12-04' AS Date), N'eCommerce Site', NULL, NULL, NULL, 5605, 0, 0, 0)
INSERT [dbo].[Sales_Payment] ([ID], [CustomerID], [Customer Name], [ReceiptNo], [Amount], [Cash At Hand], [Bank], [Bank Name], [Details], [Date], [UserType], [OriginatingReceiptNo], [Category], [MoreDetails], [Cash Paid], [Bank A], [Bank B], [Bank C]) VALUES (5, N'', N'Chika Nwachukwu', N'5', 7288, 0, 7288, NULL, N'Credit/Debit Card', CAST(N'2019-12-04' AS Date), N'eCommerce Site', NULL, NULL, NULL, 7288, 0, 0, 0)
SET IDENTITY_INSERT [dbo].[Sales_Payment] OFF
SET IDENTITY_INSERT [dbo].[Sales_Transactions] ON 

INSERT [dbo].[Sales_Transactions] ([ID], [Customer Name], [CustomerID], [ReceiptNo], [Total], [Discount], [VAT], [Total Amount], [Amount Paid], [Cash Paid], [Bank A], [Bank B], [Bank C], [Paid Later], [Balance], [Date], [UserType], [ProductID]) VALUES (1, N'Chika Nwachukwu', N'', N'1', 2807, 0, 0, 2807, 2807, 0, 0, 0, 0, 0, 0, CAST(N'2019-12-05' AS Date), N'eCommerce Site', NULL)
INSERT [dbo].[Sales_Transactions] ([ID], [Customer Name], [CustomerID], [ReceiptNo], [Total], [Discount], [VAT], [Total Amount], [Amount Paid], [Cash Paid], [Bank A], [Bank B], [Bank C], [Paid Later], [Balance], [Date], [UserType], [ProductID]) VALUES (2, N'Chika Nwachukwu', N'', N'2', 1335, 0, 0, 1335, 1335, 0, 0, 0, 0, 0, 0, CAST(N'2019-12-05' AS Date), N'eCommerce Site', NULL)
INSERT [dbo].[Sales_Transactions] ([ID], [Customer Name], [CustomerID], [ReceiptNo], [Total], [Discount], [VAT], [Total Amount], [Amount Paid], [Cash Paid], [Bank A], [Bank B], [Bank C], [Paid Later], [Balance], [Date], [UserType], [ProductID]) VALUES (3, N'Chika Nwachukwu', N'', N'3', 1914, 0, 0, 1914, 1914, 0, 0, 0, 0, 0, 0, CAST(N'2019-12-05' AS Date), N'eCommerce Site', NULL)
INSERT [dbo].[Sales_Transactions] ([ID], [Customer Name], [CustomerID], [ReceiptNo], [Total], [Discount], [VAT], [Total Amount], [Amount Paid], [Cash Paid], [Bank A], [Bank B], [Bank C], [Paid Later], [Balance], [Date], [UserType], [ProductID]) VALUES (4, N'Chika Nwachukwu', N'', N'4', 5605, 0, 0, 5605, 5605, 0, 0, 0, 0, 0, 0, CAST(N'2019-12-04' AS Date), N'eCommerce Site', NULL)
INSERT [dbo].[Sales_Transactions] ([ID], [Customer Name], [CustomerID], [ReceiptNo], [Total], [Discount], [VAT], [Total Amount], [Amount Paid], [Cash Paid], [Bank A], [Bank B], [Bank C], [Paid Later], [Balance], [Date], [UserType], [ProductID]) VALUES (5, N'Chika Nwachukwu', N'', N'5', 7288, 0, 0, 7288, 7288, 0, 0, 0, 0, 0, 0, CAST(N'2019-12-04' AS Date), N'eCommerce Site', NULL)
SET IDENTITY_INSERT [dbo].[Sales_Transactions] OFF
SET IDENTITY_INSERT [dbo].[SalesRegister] ON 

INSERT [dbo].[SalesRegister] ([ID], [Product], [ProductCode], [Qty], [ProductID], [Unit], [UnitPrice], [Amount], [ReceiptNo], [UnitCost], [Profit], [Discount], [Total], [Balance], [Date], [Customer]) VALUES (1, N'Bioderma', NULL, 1, N'1', N'PCS', 578, 578, N'1', 0, 578, 0, 578, NULL, CAST(N'2019-12-05' AS Date), NULL)
INSERT [dbo].[SalesRegister] ([ID], [Product], [ProductCode], [Qty], [ProductID], [Unit], [UnitPrice], [Amount], [ReceiptNo], [UnitCost], [Profit], [Discount], [Total], [Balance], [Date], [Customer]) VALUES (2, N'Chanca Piedra', NULL, 1, N'2', N'PCS', 893, 893, N'1', 0, 893, 0, 893, NULL, CAST(N'2019-12-05' AS Date), NULL)
INSERT [dbo].[SalesRegister] ([ID], [Product], [ProductCode], [Qty], [ProductID], [Unit], [UnitPrice], [Amount], [ReceiptNo], [UnitCost], [Profit], [Discount], [Total], [Balance], [Date], [Customer]) VALUES (3, N'Umcka Cold Care', NULL, 1, N'3', N'PCS', 1336, 1336, N'1', 0, 1336, 0, 1336, NULL, CAST(N'2019-12-05' AS Date), NULL)
INSERT [dbo].[SalesRegister] ([ID], [Product], [ProductCode], [Qty], [ProductID], [Unit], [UnitPrice], [Amount], [ReceiptNo], [UnitCost], [Profit], [Discount], [Total], [Balance], [Date], [Customer]) VALUES (4, N'Chanca Piedra', NULL, 1, N'2', N'PCS', 893, 893, N'2', 0, 893, 0, 893, NULL, CAST(N'2019-12-05' AS Date), NULL)
INSERT [dbo].[SalesRegister] ([ID], [Product], [ProductCode], [Qty], [ProductID], [Unit], [UnitPrice], [Amount], [ReceiptNo], [UnitCost], [Profit], [Discount], [Total], [Balance], [Date], [Customer]) VALUES (5, N'Poo Pourri', NULL, 1, N'6', N'PCS', 442, 442, N'2', 0, 442, 0, 442, NULL, CAST(N'2019-12-05' AS Date), NULL)
INSERT [dbo].[SalesRegister] ([ID], [Product], [ProductCode], [Qty], [ProductID], [Unit], [UnitPrice], [Amount], [ReceiptNo], [UnitCost], [Profit], [Discount], [Total], [Balance], [Date], [Customer]) VALUES (6, N'Umcka Cold Care', NULL, 1, N'3', N'PCS', 1336, 1336, N'3', 0, 1336, 0, 1336, NULL, CAST(N'2019-12-05' AS Date), NULL)
INSERT [dbo].[SalesRegister] ([ID], [Product], [ProductCode], [Qty], [ProductID], [Unit], [UnitPrice], [Amount], [ReceiptNo], [UnitCost], [Profit], [Discount], [Total], [Balance], [Date], [Customer]) VALUES (11, N'Poo Pourri', NULL, 2, N'6', N'PCS', 442, 884, N'5', 0, 884, 0, 884, NULL, CAST(N'2019-12-04' AS Date), NULL)
INSERT [dbo].[SalesRegister] ([ID], [Product], [ProductCode], [Qty], [ProductID], [Unit], [UnitPrice], [Amount], [ReceiptNo], [UnitCost], [Profit], [Discount], [Total], [Balance], [Date], [Customer]) VALUES (12, N'Chanca Piedra', NULL, 2, N'2', N'PCS', 893, 1786, N'5', 0, 1786, 0, 1786, NULL, CAST(N'2019-12-04' AS Date), NULL)
INSERT [dbo].[SalesRegister] ([ID], [Product], [ProductCode], [Qty], [ProductID], [Unit], [UnitPrice], [Amount], [ReceiptNo], [UnitCost], [Profit], [Discount], [Total], [Balance], [Date], [Customer]) VALUES (13, N'Umcka Cold Care', NULL, 2, N'3', N'PCS', 1336, 2672, N'5', 0, 2672, 0, 2672, NULL, CAST(N'2019-12-04' AS Date), NULL)
INSERT [dbo].[SalesRegister] ([ID], [Product], [ProductCode], [Qty], [ProductID], [Unit], [UnitPrice], [Amount], [ReceiptNo], [UnitCost], [Profit], [Discount], [Total], [Balance], [Date], [Customer]) VALUES (14, N'Cetyl Pure', NULL, 1, N'4', N'PCS', 1946, 1946, N'5', 0, 1946, 0, 1946, NULL, CAST(N'2019-12-04' AS Date), NULL)
INSERT [dbo].[SalesRegister] ([ID], [Product], [ProductCode], [Qty], [ProductID], [Unit], [UnitPrice], [Amount], [ReceiptNo], [UnitCost], [Profit], [Discount], [Total], [Balance], [Date], [Customer]) VALUES (7, N'Bioderma', NULL, 1, N'1', N'PCS', 578, 578, N'3', 0, 578, 0, 578, NULL, CAST(N'2019-12-05' AS Date), NULL)
INSERT [dbo].[SalesRegister] ([ID], [Product], [ProductCode], [Qty], [ProductID], [Unit], [UnitPrice], [Amount], [ReceiptNo], [UnitCost], [Profit], [Discount], [Total], [Balance], [Date], [Customer]) VALUES (8, N'Cetyl Pure', NULL, 2, N'4', N'PCS', 1946, 3892, N'4', 0, 3892, 0, 3892, NULL, CAST(N'2019-12-04' AS Date), NULL)
INSERT [dbo].[SalesRegister] ([ID], [Product], [ProductCode], [Qty], [ProductID], [Unit], [UnitPrice], [Amount], [ReceiptNo], [UnitCost], [Profit], [Discount], [Total], [Balance], [Date], [Customer]) VALUES (9, N'Umcka Cold Care', NULL, 1, N'3', N'PCS', 1336, 1336, N'4', 0, 1336, 0, 1336, NULL, CAST(N'2019-12-04' AS Date), NULL)
INSERT [dbo].[SalesRegister] ([ID], [Product], [ProductCode], [Qty], [ProductID], [Unit], [UnitPrice], [Amount], [ReceiptNo], [UnitCost], [Profit], [Discount], [Total], [Balance], [Date], [Customer]) VALUES (10, N'CLA Core', NULL, 1, N'5', N'PCS', 377, 377, N'4', 0, 377, 0, 377, NULL, CAST(N'2019-12-04' AS Date), NULL)
SET IDENTITY_INSERT [dbo].[SalesRegister] OFF
SET IDENTITY_INSERT [dbo].[Users] ON 

INSERT [dbo].[Users] ([UserID], [Username], [Name], [Phone], [Email], [StaffID], [Department], [Password], [UserType], [Status], [Logs], [DateAdded], [FirmID], [RoleID], [PasswordSetDate], [LoginAttempt], [LockStatus], [LockTime], [Last6Passwords], [WarehouseID]) VALUES (1, N'Admin', N'Admin', N'09021021096', N'admin@gradexcloud.net', NULL, NULL, N'850b3a19e8b483cfbe98fde8a7de2629facbfb59', N'Super Admin', 1, 733, CAST(N'2019-02-13' AS Date), 1, 1, CAST(N'2019-05-20' AS Date), 0, N'Unlocked', CAST(N'1990-01-01 06:00:00.0000000' AS DateTime2), N'cbaa8b4573330ff2acc44f3323c9a8dc5166e834;850b3a19e8b483cfbe98fde8a7de2629facbfb59;', NULL)
INSERT [dbo].[Users] ([UserID], [Username], [Name], [Phone], [Email], [StaffID], [Department], [Password], [UserType], [Status], [Logs], [DateAdded], [FirmID], [RoleID], [PasswordSetDate], [LoginAttempt], [LockStatus], [LockTime], [Last6Passwords], [WarehouseID]) VALUES (2, N'showroomadmin', N'Show Room Admin', NULL, N'showroomadmin', N'00004', NULL, N'850b3a19e8b483cfbe98fde8a7de2629facbfb59', N'Show Room Admin', 1, NULL, CAST(N'2019-05-18' AS Date), 1, 2, CAST(N'2019-05-18' AS Date), NULL, NULL, NULL, N'850b3a19e8b483cfbe98fde8a7de2629facbfb59;', NULL)
INSERT [dbo].[Users] ([UserID], [Username], [Name], [Phone], [Email], [StaffID], [Department], [Password], [UserType], [Status], [Logs], [DateAdded], [FirmID], [RoleID], [PasswordSetDate], [LoginAttempt], [LockStatus], [LockTime], [Last6Passwords], [WarehouseID]) VALUES (3, N'warehouse1', N'Warehouse One', NULL, N'warehouse1', N'00001', NULL, N'850b3a19e8b483cfbe98fde8a7de2629facbfb59', N'Warehouse 1 Admin', 0, NULL, CAST(N'2019-05-18' AS Date), 1, 2, CAST(N'2019-05-18' AS Date), NULL, NULL, NULL, N'850b3a19e8b483cfbe98fde8a7de2629facbfb59;', NULL)
INSERT [dbo].[Users] ([UserID], [Username], [Name], [Phone], [Email], [StaffID], [Department], [Password], [UserType], [Status], [Logs], [DateAdded], [FirmID], [RoleID], [PasswordSetDate], [LoginAttempt], [LockStatus], [LockTime], [Last6Passwords], [WarehouseID]) VALUES (4, N'warehouse2', N'Warehouse Two', NULL, N'warehouse2', N'00002', NULL, N'850b3a19e8b483cfbe98fde8a7de2629facbfb59', N'Warehouse 2 Admin', 1, NULL, CAST(N'2019-05-18' AS Date), 1, 2, CAST(N'2019-05-18' AS Date), NULL, NULL, NULL, N'850b3a19e8b483cfbe98fde8a7de2629facbfb59;', NULL)
INSERT [dbo].[Users] ([UserID], [Username], [Name], [Phone], [Email], [StaffID], [Department], [Password], [UserType], [Status], [Logs], [DateAdded], [FirmID], [RoleID], [PasswordSetDate], [LoginAttempt], [LockStatus], [LockTime], [Last6Passwords], [WarehouseID]) VALUES (5, N'warehouse3', N'Warehouse Three', NULL, N'warehouse3', N'00003', NULL, N'850b3a19e8b483cfbe98fde8a7de2629facbfb59', N'Warehouse 3 Admin', 0, NULL, CAST(N'2019-05-18' AS Date), 1, 2, CAST(N'2019-05-18' AS Date), NULL, NULL, NULL, N'850b3a19e8b483cfbe98fde8a7de2629facbfb59;', NULL)
INSERT [dbo].[Users] ([UserID], [Username], [Name], [Phone], [Email], [StaffID], [Department], [Password], [UserType], [Status], [Logs], [DateAdded], [FirmID], [RoleID], [PasswordSetDate], [LoginAttempt], [LockStatus], [LockTime], [Last6Passwords], [WarehouseID]) VALUES (6, N'customer', N'Ebere Johnson', NULL, N'eberejohnson@gmail.com', N'00003', NULL, N'850b3a19e8b483cfbe98fde8a7de2629facbfb59', N'Warehouse 3 Admin', 1, NULL, CAST(N'2019-05-18' AS Date), 1, 2, CAST(N'2019-05-18' AS Date), NULL, NULL, NULL, N'850b3a19e8b483cfbe98fde8a7de2629facbfb59;', NULL)
SET IDENTITY_INSERT [dbo].[Users] OFF
