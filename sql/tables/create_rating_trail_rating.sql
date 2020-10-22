CREATE TABLE mtb.trail_rating
(
	tr_id int identity primary key,
	t_detail_id int not null distkey sortkey,
    t_difficulty_id int not null,
    t_location_id int not null,
    t_condition_id int not null,
	t_is_rideable boolean not null,
	t_stars smallint,
	t_votes int,
	t_length smallint,
  	foreign key (t_detail_id) references mtb.trail_detail(td_id),
	foreign key (t_difficulty_id) references mtb.difficulty(d_id),
	foreign key (t_location_id) references mtb.location(l_id),
	foreign key (t_condition_id) references mtb.condition(c_id)
)