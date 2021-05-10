CREATE TABLE IF NOT EXISTS categories (
   categoryid int4 NOT NULL 
  ,categoryname varchar(15) NOT NULL 
  ,description text NULL 
  ,picture bytea NULL 
  ,CONSTRAINT PK_categories PRIMARY KEY (categoryid)
);
CREATE INDEX I_categories_categoryname ON categories (categoryname);

CREATE TABLE IF NOT EXISTS customerdemo (
   customerid bpchar NOT NULL 
  ,customertypeid bpchar NOT NULL 
  ,CONSTRAINT PK_customerdemo PRIMARY KEY (customerid, customertypeid)
  ,CONSTRAINT UI_customerdemo_customertypeid_customerid UNIQUE (customertypeid, customerid)
);

CREATE TABLE IF NOT EXISTS customerdemographics (
   customertypeid bpchar NOT NULL 
  ,customerdesc text NULL 
  ,CONSTRAINT PK_customerdemographics PRIMARY KEY (customertypeid)
);

CREATE TABLE IF NOT EXISTS customers (
   customerid bpchar NOT NULL 
  ,companyname varchar(40) NOT NULL 
  ,contactname varchar(30) NULL 
  ,contacttitle varchar(30) NULL 
  ,address varchar(60) NULL 
  ,city varchar(15) NULL 
  ,region varchar(15) NULL 
  ,postalcode varchar(10) NULL 
  ,country varchar(15) NULL 
  ,phone varchar(24) NULL 
  ,fax varchar(24) NULL 
  ,CONSTRAINT PK_customers PRIMARY KEY (customerid)
);
CREATE INDEX I_customers_city ON customers (city);
CREATE INDEX I_customers_companyname ON customers (companyname);
CREATE INDEX I_customers_postalcode ON customers (postalcode);
CREATE INDEX I_customers_region ON customers (region);

CREATE TABLE IF NOT EXISTS employees (
   employeeid int4 NOT NULL 
  ,lastname varchar(20) NOT NULL 
  ,firstname varchar(10) NOT NULL 
  ,title varchar(30) NULL 
  ,titleofcourtesy varchar(25) NULL 
  ,birthdate date NULL 
  ,hiredate date NULL 
  ,address varchar(60) NULL 
  ,city varchar(15) NULL 
  ,region varchar(15) NULL 
  ,postalcode varchar(10) NULL 
  ,country varchar(15) NULL 
  ,homephone varchar(24) NULL 
  ,extension varchar(4) NULL 
  ,photo bytea NULL 
  ,notes text NULL 
  ,reportsto int4 NULL 
  ,photopath varchar(255) NULL 
  ,CONSTRAINT PK_employees PRIMARY KEY (employeeid)
);
CREATE INDEX I_employees_lastname ON employees (lastname);
CREATE INDEX I_employees_postalcode ON employees (postalcode);
CREATE INDEX I_employees_reportsto ON employees (reportsto);

CREATE TABLE IF NOT EXISTS employeeterritories (
   employeeid int4 NOT NULL 
  ,territoryid varchar(20) NOT NULL 
  ,CONSTRAINT PK_employeeterritories PRIMARY KEY (employeeid, territoryid)
);
CREATE INDEX I_employeeterritories_territoryid ON employeeterritories (territoryid);

CREATE TABLE IF NOT EXISTS orderdetails (
   orderid int4 NOT NULL 
  ,productid int4 NOT NULL 
  ,unitprice numeric NOT NULL 
  ,quantity int2 NOT NULL DEFAULT 100
  ,discount numeric(12,4) NOT NULL DEFAULT 100
  ,CONSTRAINT PK_orderdetails PRIMARY KEY (orderid, productid)
);
CREATE INDEX I_orderdetails_orderid ON orderdetails (orderid);
CREATE INDEX I_orderdetails_productid ON orderdetails (productid);

CREATE TABLE IF NOT EXISTS orders (
   orderid int4 NOT NULL 
  ,customerid bpchar NULL 
  ,employeeid int4 NULL 
  ,orderdate date NULL 
  ,requireddate date NULL 
  ,shippeddate date NULL 
  ,shipvia int4 NULL 
  ,freight numeric NULL 
  ,shipname varchar(40) NULL 
  ,shipaddress varchar(60) NULL 
  ,shipcity varchar(15) NULL 
  ,shipregion varchar(15) NULL 
  ,shippostalcode varchar(10) NULL 
  ,shipcountry varchar(15) NULL 
  ,CONSTRAINT PK_orders PRIMARY KEY (orderid)
);
CREATE INDEX I_orders_customerid ON orders (customerid);
CREATE INDEX I_orders_employeeid ON orders (employeeid);
CREATE INDEX I_orders_orderdate ON orders (orderdate);
CREATE INDEX I_orders_shippeddate ON orders (shippeddate);
CREATE INDEX I_orders_shippostalcode ON orders (shippostalcode);
CREATE INDEX I_orders_shipvia ON orders (shipvia);

CREATE TABLE IF NOT EXISTS products (
   productid int4 NOT NULL 
  ,productname varchar(40) NOT NULL 
  ,supplierid int4 NULL 
  ,categoryid int4 NULL 
  ,quantityperunit varchar(20) NULL 
  ,unitprice numeric NULL 
  ,unitsinstock int2 NULL 
  ,unitsonorder int2 NULL 
  ,reorderlevel int2 NULL 
  ,discontinued numeric(1,0) NOT NULL 
  ,CONSTRAINT PK_products PRIMARY KEY (productid)
);
CREATE INDEX I_products_categoryid ON products (categoryid);
CREATE INDEX I_products_productname ON products (productname);
CREATE INDEX I_products_supplierid ON products (supplierid);

CREATE TABLE IF NOT EXISTS region (
   regionid int4 NOT NULL 
  ,regiondescription bpchar NOT NULL 
  ,CONSTRAINT PK_region PRIMARY KEY (regionid)
);

CREATE TABLE IF NOT EXISTS shippers (
   shipperid int4 NOT NULL 
  ,companyname varchar(40) NOT NULL 
  ,phone varchar(24) NULL 
  ,CONSTRAINT PK_shippers PRIMARY KEY (shipperid)
);

CREATE TABLE IF NOT EXISTS suppliers (
   supplierid int4 NOT NULL 
  ,companyname varchar(40) NOT NULL 
  ,contactname varchar(30) NULL 
  ,contacttitle varchar(30) NULL 
  ,address varchar(60) NULL 
  ,city varchar(15) NULL 
  ,region varchar(15) NULL 
  ,postalcode varchar(10) NULL 
  ,country varchar(15) NULL 
  ,phone varchar(24) NULL 
  ,fax varchar(24) NULL 
  ,homepage text NULL 
  ,CONSTRAINT PK_suppliers PRIMARY KEY (supplierid)
);
CREATE INDEX I_suppliers_companyname ON suppliers (companyname);
CREATE INDEX I_suppliers_postalcode ON suppliers (postalcode);

CREATE TABLE IF NOT EXISTS territories (
   territoryid varchar(20) NOT NULL 
  ,territorydescription bpchar NOT NULL 
  ,regionid int4 NOT NULL 
  ,CONSTRAINT PK_territories PRIMARY KEY (territoryid)
);
CREATE INDEX I_territories_regionid ON territories (regionid);

CREATE TABLE IF NOT EXISTS sampletable1 (
   itemid numeric NOT NULL 
  ,subitemid numeric NOT NULL 
  ,itemname varchar(50) NOT NULL 
  ,CONSTRAINT PK_sampletable1 PRIMARY KEY (itemid, subitemid)
);

CREATE TABLE IF NOT EXISTS sampletable2 (
   itemid int4 NOT NULL 
  ,subitemid int4 NOT NULL 
  ,branchid int4 NOT NULL 
  ,itemname varchar(50) NOT NULL 
  ,CONSTRAINT PK_sampletable2 PRIMARY KEY (itemid, subitemid, branchid)
  ,CONSTRAINT UI_sampletable2_itemid_subitemid UNIQUE (itemid, subitemid)
  ,CONSTRAINT UI_sampletable2_subitemid_itemid UNIQUE (subitemid, itemid)
);


ALTER TABLE customerdemo ADD CONSTRAINT FK_customerdemo_customerid FOREIGN KEY (customerid) REFERENCES customers(customerid);
ALTER TABLE customerdemo ADD CONSTRAINT FK_customerdemo_customertypeid FOREIGN KEY (customertypeid) REFERENCES customerdemographics(customertypeid);

ALTER TABLE employees ADD CONSTRAINT FK_employees_reportsto FOREIGN KEY (reportsto) REFERENCES employees(employeeid);

ALTER TABLE employeeterritories ADD CONSTRAINT FK_employeeterritories_employeeid FOREIGN KEY (employeeid) REFERENCES employees(employeeid);
ALTER TABLE employeeterritories ADD CONSTRAINT FK_employeeterritories_territoryid FOREIGN KEY (territoryid) REFERENCES territories(territoryid);

ALTER TABLE orderdetails ADD CONSTRAINT FK_orderdetails_orderid FOREIGN KEY (orderid) REFERENCES orders(orderid);
ALTER TABLE orderdetails ADD CONSTRAINT FK_orderdetails_productid FOREIGN KEY (productid) REFERENCES products(productid);

ALTER TABLE orders ADD CONSTRAINT FK_orders_customerid FOREIGN KEY (customerid) REFERENCES customers(customerid);
ALTER TABLE orders ADD CONSTRAINT FK_orders_employeeid FOREIGN KEY (employeeid) REFERENCES employees(employeeid);
ALTER TABLE orders ADD CONSTRAINT FK_orders_shipvia FOREIGN KEY (shipvia) REFERENCES shippers(shipperid);

ALTER TABLE products ADD CONSTRAINT FK_products_categoryid FOREIGN KEY (categoryid) REFERENCES categories(categoryid);
ALTER TABLE products ADD CONSTRAINT FK_products_categoryid FOREIGN KEY (categoryid) REFERENCES suppliers(categoryid);

ALTER TABLE territories ADD CONSTRAINT FK_territories_categoryid FOREIGN KEY (categoryid) REFERENCES region(categoryid);

ALTER TABLE sampletable2 ADD CONSTRAINT FK_sampletable2_itemid_subitemid FOREIGN KEY (itemid,subitemid) REFERENCES sampletable1(itemid,subitemid) ON DELETE CASCADE;

