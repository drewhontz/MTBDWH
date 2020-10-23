CREATE OR REPLACE PROCEDURE sp_load_dim_location()
AS $$
BEGIN
  insert into mtb.location (l_city_name, l_state_name)
  select distinct
	lower(trim(split_part(location, ', ', 1))) city
    , lower(trim(split_part(location, ', ', 2))) state
  from staging.mtb_project_api s
  where not exists (
      select distinct l_city_name, l_state_name
      from mtb.location l
      where lower(trim(split_part(s.location, ', ', 1))) = l_city_name
      and lower(trim(split_part(s.location, ', ', 2))) = l_state_name
  );
END;
$$ LANGUAGE plpgsql;