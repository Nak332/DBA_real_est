-- DROP PROCEDURE propAvailable
-- Available property

CREATE VIEW Propav AS
	SELECT 
		p.PropertyID, pt.PropertyTypeName, 
		a.Address, a.Province, a.City,
		p.TransactionDate,
		p.Floors, p.Bedrooms, p.Bathrooms,
		p.Garages, p.ParkingSpaces
	FROM 
		Property p, [Property Type] pt,
		Address a
	WHERE 
		pt.PropertyTypeID = p.PropertyTypeID AND
		a.AddressID = p.AddressID 


CREATE PROCEDURE propAvailable @status VARCHAR(20)
AS
	SELECT 
		p.PropertyID, pt.PropertyTypeName, 
		a.Address, a.Province, a.City,
		p.TransactionDate,
		p.Floors, p.Bedrooms, p.Bathrooms,
		p.Garages, p.ParkingSpaces
	FROM 
		Property p, [Property Type] pt,
		Address a
	WHERE 
		pt.PropertyTypeID = p.PropertyTypeID AND
		a.AddressID = p.AddressID AND
		p.Status = @status

-- EXEC propInput 'Available'

CREATE PROCEDURE propStatus @status VARCHAR(20)
AS
	SELECT 
		p.PropertyID, pt.PropertyTypeName, 
		a.Address, a.Province, a.City,
		p.TransactionDate,
		p.Floors, p.Bedrooms, p.Bathrooms,
		p.Garages, p.ParkingSpaces
	FROM 
		Property p, [Property Type] pt,
		Address a
	WHERE 
		pt.PropertyTypeID = p.PropertyTypeID AND
		a.AddressID = p.AddressID

-- EXEC propStatus

-- DROP PROCEDURE searchInvoice
-- Print Invoice based on InvoiceID
CREATE PROCEDURE searchInvoice @InvoiceID VARCHAR(10)
AS
	SELECT 
		cl.ClientName, a.AgentName, ci.issuedBy, ci.issuedTo,
		ci.invoiceAmount, ci.dateCreated, ci.billingDate, ci.datePaid,
		ct.ContractTypeName, pft.PaymentFrequencyTypeName
	FROM 
		[Contract Invoice] ci, Contract c, 
		[Payment Frequency Type] pft, [Contract Type] ct,
		Agents a, Clients cl
	WHERE 
		ci.InvoiceID = @InvoiceID AND
		ci.ContractID = c.ContractID AND
		c.PaymentFrequencyTypeID = pft.PaymentFrequencyTypeID AND
		ct.ContractTypeID = c.ContractTypeID AND
		ci.ClientID = cl.ClientID AND 
		ci.AgentID = a.AgentID

-- EXEC searchInvoice 'INV00001'