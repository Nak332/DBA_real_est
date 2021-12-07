USE RealEstate
GO

INSERT INTO [Contract Type] (ContractTypeID, ContractTypeName) VALUES
('CNTR1', 'Rent'),
('CNTR2', 'Buy'),
('CNTR3', 'Sell');

INSERT INTO [Payment Frequency Type] (PaymentFrequencyTypeID, PaymentFrequencyTypeName) VALUES
('PFR01', '1 Year'),
('PFR02', '2 Year'),
('PFR03', '3 Year'),
('PFR04', '4 Year'),
('PFR05', '5 Year'),
('PFR06', '6 Year'),
('PFR07', '7 Year'),
('PFR08', '8 Year'),
('PFR09', '9 Year'),
('PFR10', '10 Year'),
('PFR11', '11 Year'),
('PFR12', '12 Year'),
('PFR13', '13 Year'),
('PFR14', '14 Year'),
('PFR15', '15 Year'),
('PFR16', '16 Year'),
('PFR17', '17 Year'),
('PFR18', '18 Year'),
('PFR19', '19 Year'),
('PFR20', '20 Year');

INSERT INTO [Property Type] (PropertyTypeID, PropertyTypeName) VALUES
('PTY01', 'House'),
('PTY02', 'Apartment');

INSERT INTO Address(AddressID, Address, Street, Province, City, BuildingNumber) VALUES
		('ADR0001','5663 Ballad Lane, Luxville, MO 4125-2621','Groove Street','Alabama','Luxville','MO 4125-2621'),
		('ADR0002','771 Golden Blvd, Davenport, PM 35363-1412','Little Asia','Iowa','Davenport','PM 35363-1412'),
		('ADR0003','4932 Silver Range APT7, Burbank, GWS 757-333','Little Asia','Michigan','Burbank','APT7 GWS 757-333');

INSERT INTO Property(PropertyID, PropertyTypeID, AddressID, TransactionDate, Status, Floors, Bedrooms, Bathrooms, Garages, ParkingSpaces) Values
		('PR000001','PTY01','ADR0001','2015-05-13','Not Available','2','3','2','1','0'),
		('PR000002','PTY02','ADR0003','2015-04-06','Not Available','10','1','1','0','2'),
		('PR000003','PTY01','ADR0002','2015-06-10','Available','1','5','3','1','0');

INSERT INTO Clients(ClientID, ClientName, ClientEmail, ClientPhone, ClientAddress)VALUES
		('CLT0000001', 'Tang Yao Zu', 'yzt@coolemail.com', '0770090051', '4016  Sussex Court'),
        ('CLT0000002', 'Bandar Ramzi Ba', 'thisemail@thatemail.com', '0113496069', '2393  Meadowbrook Mall Road'),
        ('CLT0000003','Reggie Schoen', 'schoen@mytown.ca', '0770090087', '4083  Wayside Lane'),
        ('CLT0000004', 'Una Suzuki', 'unasuzuki@what.ca', '0118496044', '4109  Wayside Lane'),
        ('CLT0000005', 'Kimberley Cada', 'kcada@thisemail.com', '0114496022', '4311  Round Table Drive'),
        ('CLT0000006', 'Kasha Sollers', 'ksollers@heresmyemail.ca', '0207946042', '362  Werninger Street'),
        ('CLT0000007', 'Francesco Abrev', 'lovetosql@databaseguy.eu', '0116496052', '368  Werninger Street'),
        ('CLT0000008', 'Marhta Niswander', 'niswander@onlymarhtas.co.uk', '0131496080', '3566  Hedge Street');

INSERT INTO Agents(AgentID, AgentName, AgentEmail, AgentPhone) VALUES
		('AGN001', 'Mike Oxmaul', 'mike0xmaul@estatez.co', '0192381284'),
		('AGN002', 'Karen Bowman', 'karenbow@estatez.co', '0139519321'),
		('AGN003', 'Joko Nomad', 'jkmad@estatez.co','0134242526'),
		('AGN004', 'Dimitri', 'tripaloski@estatez.co', '0123941413');

INSERT INTO  Contract(ContractID, PropertyID, ContractTypeID, [Contract Details], PaymentFrequencyTypeID, PaymentAmount, DateSigned, StartDate, EndDate) Values
		('CTR0001','PR000001','CNTR1','The client will be renting the house in Ballad Lane for 5 years','PFR05','150000','2015-03-15','2015-03-18','2020-03-18'),
		('CTR0002','PR000002','CNTR2','The client is buying a house in Golden Boulevard','PFR20','500000','2015-06-10','2015-06-15','2035-06-15'),
		('CTR0003','PR000002','CNTR2','The client is buying a room in the Silver Range apartment on the fifth floor','PFR10','200000','2015-05-20','2015-05-25','2025-05-25');
		
INSERT INTO [Contract Invoice] (InvoiceID, ClientID, AgentID, ContractID, issuedBy, issuedTo, invoiceDetails, invoiceAmount, dateCreated, billingDate, datePaid) Values
		('INV00001','CLT0000001','AGN002','CTR0001','Karen Bowman','Tang Yao Zu','The payment of the house will be in form of 5 year installment, with $2500 fee every month','2','2015-03-15','2015-05-15','2015-05-12'),
		('INV00002','CLT0000005','AGN001','CTR0002','Mike Oxmaul','Kimberley Cada','The payment of the house will be in form of 20 year installment, with $2085 fee every month','1','2015-06-10','2015-06-13','2015-06-12'),
		('INV00003','CLT0000004','AGN004','CTR0003','Dimitri','Una Suzuki','The apartment is bought and the payment will be in form of 10 year installment, with $1667 fee every month','1','2015-05-23','2015-05-25','2015-05-24');


		--Msg 547, Level 16, State 0, Line 35
		--The INSERT statement conflicted with the FOREIGN KEY constraint "FK__Property__Addres__30F848ED". The conflict occurred in database "RealEstate", table "dbo.Address", column 'AddressID'.
		--Msg 547, Level 16, State 0, Line 61
		--The INSERT statement conflicted with the FOREIGN KEY constraint "FK__Contract__Proper__33D4B598". The conflict occurred in database "RealEstate", table "dbo.Property", column 'PropertyID'.
		--Msg 547, Level 16, State 0, Line 66
		--The INSERT statement conflicted with the FOREIGN KEY constraint "FK__Contract __Contr__3A81B327". The conflict occurred in database "RealEstate", table "dbo.Contract", column 'ContractID'.
		