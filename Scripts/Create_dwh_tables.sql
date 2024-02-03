-- Setting up sales fact table for staging

CREATE TABLE staging.sales
(
    transaction_id integer,
	transactional_date timestamp,
	product_id character varying,
    customer_id integer,
    payment character varying,
    credit_card bigint,
    loyalty_card character varying,
    cost numeric,
    quantity integer,
    price numeric,
    PRIMARY KEY (transaction_id)
);

-- Setting up sales fact table for core

CREATE TABLE core.sales
(
    transaction_id integer,
	transactional_date timestamp,
	transactional_date_fk bigint,
	product_id character varying,
	product_fk integer,
    customer_id integer,
    payment_fk integer,
    credit_card bigint,
    cost numeric,
    quantity integer,
    price numeric,
	total_cost numeric,
	total_price numeric,
	profit numeric,  
    PRIMARY KEY (transaction_id)
);

-- Setting up sales payment tables for staging and core


CREATE TABLE core.dim_payment
(
    payment_pk integer NOT NULL GENERATED BY DEFAULT AS IDENTITY ( INCREMENT 1 START 1 ),
    payment character varying,
    loyalty_card character varying,
    PRIMARY KEY (payment_pk)
);
