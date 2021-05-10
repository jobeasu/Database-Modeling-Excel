CREATE TABLE IF NOT EXISTS apartment_sales (
   id int4 NOT NULL 
  ,sigungu_name varchar(30) NOT NULL 
  ,jibun varchar(20) NOT NULL 
  ,ji varchar(20) NOT NULL 
  ,bun varchar(20) NOT NULL 
  ,apt_name varchar(40) NOT NULL 
  ,exclusive_area float8 NOT NULL 
  ,deal_month timestamp NOT NULL 
  ,deal_day int2 NOT NULL 
  ,deal_amount int4 NOT NULL 
  ,floor int2 NOT NULL 
  ,build_year int2 NULL 
  ,road_name varchar(100) NULL 
  ,cancel_deal_day timestamp NULL 
  ,CONSTRAINT PK_apartmentsales PRIMARY KEY (id)
);
CREATE INDEX I_apartmentsales_categoryname ON apartment_sales (categoryname);

CREATE TABLE IF NOT EXISTS apartment_rent (
   id int4 NOT NULL 
  ,sigungu_name varchar(30) NOT NULL 
  ,jibun varchar(20) NOT NULL 
  ,ji varchar(20) NOT NULL 
  ,bun varchar(20) NOT NULL 
  ,apt_name varchar(40) NOT NULL 
  ,exclusive_area float8 NOT NULL 
  ,deal_month timestamp NOT NULL 
  ,deal_day int2 NOT NULL 
  ,deal_amount int4 NOT NULL 
  ,floor int2 NOT NULL 
  ,build_year int2 NULL 
  ,road_name varchar(100) NULL 
  ,cancel_deal_day timestamp NULL 
  ,CONSTRAINT PK_apartmentrent PRIMARY KEY (id)
);
CREATE INDEX I_apartmentrent_categoryname ON apartment_rent (categoryname);

