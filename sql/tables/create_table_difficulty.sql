CREATE TABLE mtb.difficulty
(
	d_id int not null identity(0, 1) sortkey,
	d_name varchar(21) not null,
	d_description varchar(21) not null,
	primary key(d_difficulty_id)
) diststyle all
