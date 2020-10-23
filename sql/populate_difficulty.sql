-- Populate difficulty table
insert into mtb.difficulty
  (d_name, d_description)
  select distinct
  	difficulty name
    , case
    	when difficulty = 'green'
        	then 'beginner'
        when difficulty = 'greenBlue'
        	then 'beginner-intermediate'
        when difficulty = 'blue'
            then 'intermediate'
        when difficulty = 'blueBlack'
        	then 'intermediate-advanced'
        when difficulty = 'black'
            then 'advanced'
        when difficulty = 'dblack'
        	then 'expert'
        else 'no description'
        end as description
  from staging.mtb_project_api