--Create DW

create database air2DW

go

create table FactCalendar ( 
[DateKey] int ,
[listing_id] int  not null ,
[date] datetime , 
[available] varchar(10) not null,
[price] float not null,
[adjusted_price] float not null,
[minimum_nights] int ,
[maximum_nights] int ,
);
alter table [FactCalendar] add foreign key (listing_id) references DimProperty(propertyId)
alter table [factCalendar] add foreign key ( [DateKey] ) references DimDate( [DateKey])


create table DimHost (
[dimHostKey] int identity (1,1) primary key,
[host_id] int not null ,
[host_since] datetime,
[RowIsCurrent] int default 1 not null,
[RowStartDate] date default '1821-03-25' not null,
[RowEndDate] date default '9999-12-31' not null,
[RowChangeReason] varchar(200) null,
);

Create table Verifications (
[host_id] int  ,
[id] int ,
[Verificationid] int
);
alter table [Verifications] add foreign key ( id ) references VerificationsList(id)
alter table [Verifications] add foreign key ( [host_id] ) references DimHost([host_id])


Create table VerificationsList (
[id] int identity (1,1)  primary key,
[Verification] nvarchar(max) 
);


Create table FactReviews (
[DateKey] int ,
[dimHostKey] int,
[host_id] int , 
[listing_id] int not null,
[date] datetime not null,
[reviewer_id] int not null, 
); 
alter table [FactReviews] add foreign key ( [dimHostKey] ) references DimHost( [dimHostKey])
alter table [FactReviews] add foreign key ( listing_id ) references DimProperty( propertyId)
alter table [FactReviews] add foreign key ( [DateKey] ) references DimDate( [DateKey])


create table DimProperty (


[propertyId] int primary key,
[host_id] int not null,
[latitude] float not null,
[longitude] float not null,
[bedrooms] int ,
[bathrooms_text] nvarchar(max) ,
[accommodates] int not null,
[instant_bookable] varchar(10) not null,
[neighbourhood_cleansed] nvarchar(max) not null,
[room_type] nvarchar(max) not null,
[property_type] nvarchar(max) not null,
[review_scores_rating] float ,
[number_of_reviews] float not null,
[number_of_reviews_ltm] float not null,
[last_review] datetime ,
[first_review] datetime ,
[calculated_host_listings_count] float not null, 
[RowIsCurrent] int default 1 not null,
[RowStartDate] date default '1821-03-25' not null,
[RowEndDate] date default '9999-12-31' not null,
[RowChangeReason] varchar(200) null,
);






