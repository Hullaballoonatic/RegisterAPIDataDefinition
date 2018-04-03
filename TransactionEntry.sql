CREATE TABLE transactionEntry (
	transactionID uuid FOREIGN KEY REFERENCES transaction(ID),
	productID uuid FOREIGN KEY REFERENCES product(ID),
	price_per_unit money NOT NULL default(0.00),
	quantity int NOT NULL default(0),
	PRIMARY KEY (transactionID, productID)
);