--DROP TABLE transaction;

CREATE TABLE transaction (
    id 					uuid 			  NOT NULL DEFAULT gen_random_uuid()
  , lookupcode		 	char(12) 		  NOT NULL UNIQUE
  , cashierID 			varchar(50) 	  NOT NULL
  , sumprice 			money 			  NOT NULL DEFAULT(0.00)
  , type 				varchar(10) 	  CHECK (type in (NULL, 'sale', 'return'))
  , ref_id 				varchar(12)
  , createdon 			timestamp without time zone NOT NULL DEFAULT now()
  , FOREIGN KEY (cashierID) REFERENCES employee(employeeid)
  , FOREIGN KEY (ref_id)	REFERENCES transaction(lookupcode)
  , CONSTRAINT transaction_pkey PRIMARY KEY (id)
);

CREATE INDEX ix_transaction_lookupcode
		  ON transaction
	   USING btree (
				lower(lookupcode::text) COLLATE pg_catalog."default"
);

INSERT INTO transaction (
	lookupcode
  ,	cashierID
  , type
) VALUES (
    '0'
  , 'default'
  , 'sale'
) RETURNING id, createdon;