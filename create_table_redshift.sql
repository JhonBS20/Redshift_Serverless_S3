create table users(
    userid integer not null distkey,
    username char(8),
    firstname varchar(30),
    lastname varchar(30),
    city varchar(30),
    state char(2),
    email varchar(100),
    phone char(14),
    likesports boolean,
    liketheatre boolean,
    likeconcerts boolean,
    likejazz boolean,
    likeclassical boolean,
    likeopera boolean,
    likerock boolean,
    likevegas boolean,
    likebroadway boolean,
    likemusicals boolean
);                        

create table event(
    eventid integer not null distkey,
    venueid smallint not null,
    catid smallint not null,
    dateid smallint not null sortkey,
    eventname varchar(200),
    starttime timestamp
);

create table sales(
    salesid integer not null,
    listid integer not null distkey,
    sellerid integer not null,
    buyerid integer not null,
    eventid integer not null,
    dateid smallint not null sortkey,
    qtysold smallint not null,
    pricepaid decimal(8,2),
    commission decimal(8,2),
    saletime timestamp
);

create table category(
    catid smallint not null distkey,
    catgroup varchar(10),
    catname varchar(10),
    catdesc varchar(50)
);

create table date(
    dateid smallint not null distkey,
    caldate date,
    day char(3),
    week smallint,
    month char(5),
    qtr char(5),
    year smallint,
    holyday boolean
);

create table listing(
    listid integer not null distkey,
    sellerid integer,
    eventid integer,
    dateid smallint,
    numtickets smallint,
    priceperticket decimal(8,2),
    totalprice decimal(8,2),
    listtime timestamp
);

create table venue(
    venueid smallint not null distkey,
    venuename varchar(100),
    venuecity varchar(30),
    venuestate char(2),
    venuestats integer
);