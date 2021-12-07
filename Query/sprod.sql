GO

drop procedure propAvailable
-- Available property
CREATE PROCEDURE propAvailable @av varchar(15)
AS
	---DECLARE propCursor CURSOR 
	---FOR
		SELECT 
			p.PropertyID, pt.PropertyTypeName, 
			a.Address, a.Province, a.City,
			p.TransactionDate,
			p.Floors, p.Bedrooms, p.Bathrooms,
			p.Garages, p.ParkingSpaces,p.Status
		FROM 
			Property p, [Property Type] pt,
			Address a
		WHERE 
			pt.PropertyTypeID = p.PropertyTypeID AND
			a.AddressID = p.AddressID AND
			p.Status = @av



	---DECLARE propCursor CURSOR 
	---FOR
Create VIEW Propav as
		SELECT 
			p.PropertyID, pt.PropertyTypeName, 
			a.Address, a.Province, a.City,
			p.TransactionDate,
			p.Floors, p.Bedrooms, p.Bathrooms,
			p.Garages, p.ParkingSpaces,p.Status
		FROM 
			Property p, [Property Type] pt,
			Address a
		WHERE 
			pt.PropertyTypeID = p.PropertyTypeID AND
			a.AddressID = p.AddressID

	OPEN propCursor
	DECLARE 
		@pid VARCHAR, @ptn VARCHAR,
		@ad VARCHAR, @prov VARCHAR, @city VARCHAR,
		@tdate DATE,
		@floor INT, @bed INT, @bath INT,
		@garage INT, @park INT
	FETCH NEXT FROM propCursor
	INTO @pid, @ptn, @ad, @prov, @city,
		@tdate, @floor, @bed, @bath,
		@garage, @park 

	PRINT 'Property ID: ' + CAST(@pid AS VARCHAR)
	PRINT '------------------------------'
	WHILE @@FETCH_STATUS = 0
	BEGIN
		PRINT 'Property Type  : ' + CAST(@ptn AS VARCHAR)
		PRINT 'Address        : ' + CAST(@ad AS VARCHAR)
		PRINT 'Province       : ' + CAST(@prov AS VARCHAR)
		PRINT 'City           : ' + CAST(@city AS VARCHAR)
		PRINT 'T.Date         : ' + CAST(@tdate AS VARCHAR)
		PRINT '-----------Details-----------'
		PRINT 'Floors         : ' + @floor
		PRINT 'Bedrooms       : ' + @bed 
		PRINT 'Bathrooms      : ' + @bath
		PRINT 'Garages        : ' + @garage
		PRINT 'Parking Spaces : ' + @park
		PRINT '------------------------------'
		FETCH NEXT FROM propCursor
		INTO @pid, @ptn, @ad, @prov, @city,
			@tdate, @floor, @bed, @bath,
			@garage, @park 
	END
	CLOSE propCursor
	DEALLOCATE propCursor




GO
-- Print Invoice based on InvoiceID
CREATE PROCEDURE searchInvoice @InvoiceID VARCHAR(10)
AS
	DECLARE invoiceCursor CURSOR 
	FOR
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

	OPEN invoiceCursor
	DECLARE @id INT, @aid INT, @iby VARCHAR, @ito VARCHAR,
		@ina INT, @dac DATE, @bid DATE, @dap DATE,
		@ctn VARCHAR, @pftn VARCHAR
	FETCH NEXT FROM invoiceCursor
	INTO @id, @aid, @iby, @ito,
		@ina, @dac, @bid, @dap,
		@ctn, @pftn

	PRINT 'Invoice ID: ' + @InvoiceID
	PRINT '------------------------------'
	WHILE @@FETCH_STATUS = 0
	BEGIN
		PRINT 'Client       : ' + CAST(@id AS VARCHAR)
		PRINT 'Agent        : ' + CAST(@aid AS VARCHAR)
		PRINT 'Issued By    : ' + CAST(@iby AS VARCHAR)
		PRINT 'Issued To    : ' + CAST(@ito AS VARCHAR)
		PRINT 'Invoice      : ' + @ina
		PRINT 'Date Created : ' + CAST(@dac AS VARCHAR)
		PRINT 'Billing Date : ' + CAST(@bid AS VARCHAR)
		PRINT 'Date Paid    : ' + CAST(@dap AS VARCHAR)
		PRINT 'Contract     : ' + CAST(@ctn AS VARCHAR)
		PRINT 'Payment Freq : ' + CAST(@pftn AS VARCHAR)
		PRINT '------------------------------'
		FETCH NEXT FROM invoiceCursor
		INTO @id, @aid, @iby, @ito,
		@ina, @dac, @bid, @dap,
		@ctn, @pftn
	END
	CLOSE invoiceCursor
	DEALLOCATE invoiceCursor 

EXEC searchInvoice '12'