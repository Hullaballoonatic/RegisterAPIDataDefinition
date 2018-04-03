--DROP TABLE transaction;

CREATE TABLE transaction (
	id uuid NOT NULL DEFAULT gen_random_uuid(),
	cashierID uuid NOT NULL FOREIGN KEY REFERENCES employee(id),
	sumprice money NOT NULL DEFAULT(0.00),
	type varchar(5) CHECK (type in ('sale','return')),
	ref_id uuid FOREIGN KEY REFERENCES transaction(id),
	createdon timestamp without time zone NOT NULL DEFAULT now()
);