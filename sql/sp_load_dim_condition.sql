-- TODO: This is not going to work. Not all trails will be entered, yet all conditions will
-- re think this model
-- might just have to update the fact according to the right status?
select
 conditionstatus
 , conditiondetails
 , case
 	when conditionstatus in ('All Clear', 'Minor Issues')
    	then True
    else False
  end is_rideable
 , to_timestamp(conditiondate, 'YYYY-MM-DD HH24:MI:SS') last_updated
from staging.mtb_project_api

