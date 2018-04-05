--DROP TABLE employee

CREATE TABLE employee (
    id          uuid      NOT NULL DEFAULT gen_random_uuid()
  , firstname   char(20)  NOT NULL DEFAULT ''
  , lastname    char(30)  NOT NULL DEFAULT ''
  , employeeid  char(50)  NOT NULL UNIQUE
  , password	char(20)  NOT NULL DEFAULT ''
  , active      boolean   DEFAULT true
  , role        char(30)  NOT NULL DEFAULT 'cashier' CHECK (role in ('cashier', 'supervisor'))
  , manager     uuid	  NOT NULL
  , createdon   timestamp without time zone NOT NULL DEFAULT now()
  , CONSTRAINT employee_pkey 		  PRIMARY KEY (id)
  , CONSTRAINT employee_fkey_manager  FOREIGN KEY (manager) REFERENCES employee(id)
) WITH (
	OIDS=FALSE
);

CREATE INDEX ix_employee_employeeid 
		  ON employee 
	   USING btree (
				lower(employeeid::text) COLLATE pg_catalog."default"
);

INSERT INTO employee (
	employeeid
  , role
) VALUES (
	'default'
  , 'supervisor'
) RETURNING id, createdon;

INSERT INTO employee (
	firstname
  , lastname
  , employeeid
  , role
  , manager
) VALUES (
    'adam'
  , 'anderson'
  , 'adamanderson'
  , 'supervisor'
  , 'default'
) RETURNING id, createdon;

INSERT INTO employee (
	firstname
  , lastname
  , employeeid
  , manager
) VALUES (
	'betty'
  , 'black'
  , 'bettyblack'
  , 'adamanderson'
) RETURNING id, createdon;

INSERT INTO employee (
	firstname
  , lastname
  , employeeid
  , manager
) VALUES (
	'carlos'
  , 'cartman'
  , 'carloscartman'
  , 'adamanderson'
) RETURNING id, createdon;
