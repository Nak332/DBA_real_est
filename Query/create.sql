
USE RealEstate
GO

CREATE TABLE [Contract Type] (
	ContractTypeID VARCHAR(10) PRIMARY KEY NOT NULL, 
	ContractTypeName VARCHAR(20) NOT NULL
);

CREATE TABLE [Payment Frequency Type] (
	PaymentFrequencyTypeID VARCHAR(10) PRIMARY KEY NOT NULL, 
	PaymentFrequencyTypeName VARCHAR(50) NOT NULL
);

CREATE TABLE [Property Type] (
	PropertyTypeID VARCHAR(10) PRIMARY KEY NOT NULL, 
	PropertyTypeName VARCHAR(10) NOT NULL
);

CREATE TABLE Address (
	AddressID VARCHAR(10) PRIMARY KEY NOT NULL, 
	Address VARCHAR(255) NOT NULL, 
	Street VARCHAR(255) NOT NULL, 
	Province VARCHAR(50) NOT NULL, 
	City VARCHAR(100) NOT NULL, 
	BuildingNumber VARCHAR(20) NULL, 
	ApartmentNumber VARCHAR(20) NULL
);

CREATE TABLE Agents (
	AgentID VARCHAR(10) PRIMARY KEY NOT NULL, 
	AgentName VARCHAR(100) NOT NULL, 
	AgentEmail VARCHAR(200) NOT NULL, 
	AgentPhone VARCHAR(10) NOT NULL
);

CREATE TABLE Clients (
	ClientID VARCHAR(10) PRIMARY KEY NOT NULL, 
	ClientName VARCHAR(100) NOT NULL, 
	ClientEmail VARCHAR(200) NOT NULL, 
	ClientPhone VARCHAR(10) NOT NULL, 
	ClientAddress VARCHAR(255) NOT NULL
);

CREATE TABLE Property (
	PropertyID VARCHAR(10) PRIMARY KEY NOT NULL, 
	PropertyTypeID VARCHAR(10) REFERENCES [Property Type] (PropertyTypeID) NOT NULL, 
	AddressID VARCHAR(10) REFERENCES Address (AddressID) NOT NULL, 
	TransactionDate DATETIME NOT NULL, 
	Status VARCHAR(20) NOT NULL, 
	Floors INT NOT NULL, 
	Bedrooms INT NOT NULL, 
	Bathrooms INT NOT NULL, 
	Garages INT NOT NULL, 
	ParkingSpaces INT NOT NULL
);

CREATE TABLE Contract (
	ContractID VARCHAR(10) PRIMARY KEY NOT NULL, 
	PropertyID VARCHAR(10) REFERENCES Property (PropertyID) NOT NULL, 
	ContractTypeID VARCHAR(10) REFERENCES [Contract Type] (ContractTypeID) NOT NULL, 
	[Contract Details] VARCHAR(255) NULL, 
	PaymentFrequencyTypeID VARCHAR(10) REFERENCES [Payment Frequency Type] (PaymentFrequencyTypeID) NOT NULL, 
	PaymentAmount INT NOT NULL, 
	DateSigned DATETIME NOT NULL, 
	StartDate DATETIME NOT NULL, 
	EndDate DATETIME NOT NULL
);

CREATE TABLE [Contract Invoice] (
	InvoiceID VARCHAR(10) PRIMARY KEY NOT NULL, 
	ClientID VARCHAR(10) REFERENCES Clients (ClientID) NOT NULL, 
	AgentID VARCHAR(10) REFERENCES Agents (AgentID) NOT NULL, 
	ContractID VARCHAR(10) REFERENCES Contract (ContractID) NOT NULL, 
	issuedBy VARCHAR(100) NOT NULL, 
	issuedTo VARCHAR(100) NOT NULL, 
	invoiceDetails VARCHAR(255) NOT NULL, 
	invoiceAmount INT NOT NULL, 
	dateCreated DATETIME NOT NULL, 
	billingDate DATETIME NOT NULL, 
	datePaid DATETIME NOT NULL
);

CREATE NONCLUSTERED INDEX IX_Property
	ON Property (PropertyID);
