-- DROP TABLE transactionEntry

CREATE TABLE transactionEntry (
	id 				uuid 	NOT NULL default gen_random_uuid()
  , transactionID 	uuid 	NOT NULL
  , productID 		uuid 	NOT NULL
  , price_per_unit 	money 	NOT NULL default(0.00)
  , quantity 		int 	NOT NULL default(0)
  , createdon 		timestamp without time zone NOT NULL DEFAULT now()
  , FOREIGN KEY (transactionID) REFERENCES transaction(id)
  , FOREIGN KEY (productID)		REFERENCES product(id)
  , PRIMARY KEY (transactionID, productID)
);