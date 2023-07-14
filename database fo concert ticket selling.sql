
-- Table: artist
CREATE TABLE artist (
    id int  NOT NULL,
    artist_name varchar(255)  NOT NULL,
    CONSTRAINT artist_pk PRIMARY KEY (id)
);

-- Table: concert
CREATE TABLE concert (
    id int  NOT NULL,
    concert_name varchar(255)  NOT NULL,
    artist_id int  NOT NULL,
    date timestamp  NOT NULL,
    hall_id int  NOT NULL,
    tickets_sold int  NOT NULL,
    CONSTRAINT concert_ak_1 UNIQUE (concert_name, date) NOT DEFERRABLE  INITIALLY IMMEDIATE,
    CONSTRAINT concert_pk PRIMARY KEY (id)
);

-- Table: customer
CREATE TABLE customer (
    id int  NOT NULL,
    customer_name varchar(255)  NOT NULL,
    email varchar(255)  NOT NULL,
    user_name varchar(255)  NOT NULL,
    password varchar(255)  NOT NULL,
    is_student boolean  NOT NULL,
    is_elderly boolean  NOT NULL,
    CONSTRAINT customer_ak_1 UNIQUE (user_name) NOT DEFERRABLE  INITIALLY IMMEDIATE,
    CONSTRAINT customer_ak_2 UNIQUE (email) NOT DEFERRABLE  INITIALLY IMMEDIATE,
    CONSTRAINT customer_pk PRIMARY KEY (id)
);

-- Table: customer_order
CREATE TABLE customer_order (
    id int  NOT NULL,
    customer_id int  NOT NULL,
    order_time timestamp  NOT NULL,
    delivery_email_address varchar(255)  NOT NULL,
    preferred_delivery_time timestamp  NULL,
    price decimal(10,2)  NOT NULL,
    discount decimal(10,2)  NOT NULL,
    final_price decimal(10,2)  NOT NULL,
    CONSTRAINT customer_order_pk PRIMARY KEY (id)
);

-- Table: hall
CREATE TABLE hall (
    id int  NOT NULL,
    hall_name varchar(255)  NOT NULL,
    location varchar(255)  NOT NULL,
    capacity int  NOT NULL,
    CONSTRAINT hall_pk PRIMARY KEY (id)
);

-- Table: order_ticket
CREATE TABLE order_ticket (
    id int  NOT NULL,
    customer_order_id int  NOT NULL,
    ticket_id int  NOT NULL,
    CONSTRAINT order_ticket_ak_1 UNIQUE (customer_order_id, ticket_id) NOT DEFERRABLE  INITIALLY IMMEDIATE,
    CONSTRAINT order_ticket_pk PRIMARY KEY (id)
);

-- Table: ticket
CREATE TABLE ticket (
    id int  NOT NULL,
    serial_number varchar(255)  NOT NULL,
    concert_id int  NOT NULL,
    ticket_category_id int  NOT NULL,
    seat varchar(255)  NULL,
    purchase_date timestamp  NOT NULL,
    CONSTRAINT ticket_ak_1 UNIQUE (serial_number) NOT DEFERRABLE  INITIALLY IMMEDIATE,
    CONSTRAINT ticket_pk PRIMARY KEY (id)
);

-- Table: ticket_category
CREATE TABLE ticket_category (
    id int  NOT NULL,
    description varchar(255)  NOT NULL,
    price decimal(10,2)  NOT NULL,
    zone smallint  NULL,
    concert_id int  NOT NULL,
    tickets_available int  NOT NULL,
    CONSTRAINT ticket_category_pk PRIMARY KEY (id)
);

-- foreign keys
-- Reference: concert_artist (table: concert)
ALTER TABLE concert ADD CONSTRAINT concert_artist
    FOREIGN KEY (artist_id)
    REFERENCES artist (id)  
    NOT DEFERRABLE 
    INITIALLY IMMEDIATE
;

-- Reference: concert_venue (table: concert)
ALTER TABLE concert ADD CONSTRAINT concert_venue
    FOREIGN KEY (hall_id)
    REFERENCES hall (id)  
    NOT DEFERRABLE 
    INITIALLY IMMEDIATE
;

-- Reference: customer_order_customer (table: customer_order)
ALTER TABLE customer_order ADD CONSTRAINT customer_order_customer
    FOREIGN KEY (customer_id)
    REFERENCES customer (id)  
    NOT DEFERRABLE 
    INITIALLY IMMEDIATE
;

-- Reference: order_ticket_customer_order (table: order_ticket)
ALTER TABLE order_ticket ADD CONSTRAINT order_ticket_customer_order
    FOREIGN KEY (customer_order_id)
    REFERENCES customer_order (id)  
    NOT DEFERRABLE 
    INITIALLY IMMEDIATE
;

-- Reference: order_ticket_ticket (table: order_ticket)
ALTER TABLE order_ticket ADD CONSTRAINT order_ticket_ticket
    FOREIGN KEY (ticket_id)
    REFERENCES ticket (id)  
    NOT DEFERRABLE 
    INITIALLY IMMEDIATE
;

-- Reference: ticket_category_concert (table: ticket_category)
ALTER TABLE ticket_category ADD CONSTRAINT ticket_category_concert
    FOREIGN KEY (concert_id)
    REFERENCES concert (id)  
    NOT DEFERRABLE 
    INITIALLY IMMEDIATE
;

-- Reference: ticket_concert (table: ticket)
ALTER TABLE ticket ADD CONSTRAINT ticket_concert
    FOREIGN KEY (concert_id)
    REFERENCES concert (id)  
    NOT DEFERRABLE 
    INITIALLY IMMEDIATE
;

-- Reference: ticket_ticket_category (table: ticket)
ALTER TABLE ticket ADD CONSTRAINT ticket_ticket_category
    FOREIGN KEY (ticket_category_id)
    REFERENCES ticket_category (id)  
    NOT DEFERRABLE 
    INITIALLY IMMEDIATE
;

-- End of file.

