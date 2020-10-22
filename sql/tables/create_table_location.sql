CREATE TABLE mtb.location
(
	l_id int identity not null,
	l_city_name varchar(35) not null,
	l_state_name varchar(12) not null,
	primary key (l_location_id)
) diststyle all