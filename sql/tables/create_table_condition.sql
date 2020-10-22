create table mtb.condition
(
	c_id int identity not null sortkey,
	c_status varchar(35) not null,
	c_description varchar(256),
	c_last_updated datetime not null,
	c_is_latest boolean not null,
	c_is_rideable boolean not null,
	primary key (c_id)
) distyle all