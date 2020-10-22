CREATE TABLE mtb.trail_detail
(
	td_id int identity not null distkey sortkey,
	td_natural_id int,
	td_name varchar(256) not null,
	td_type varchar(36),
	td_summary varchar(256),
	td_link varchar(256),
	td_lon decimal(38,4),
	td_lat decimal(38,4),
	td_ascent int,
	td_descent int,
	td_high_point int,
	td_low_point int,
	primary key(td_id)
) diststyle key