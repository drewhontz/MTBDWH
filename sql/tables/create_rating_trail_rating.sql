CREATE TABLE mtb.trail_rating
(
	tr_id int identity primary key,
	foreign key t_detail_id references trail_detail(td_id) distkey sortkey,
	foreign key t_difficulty_id references difficulty(d_id),
	foreign key t_location_id references location(l_id),
	foreign key t_condition_id references condition(c_id),
	t_is_rideable bit not null,
	t_stars smallint,
	t_votes int,
	t_length small int
) distyle key 