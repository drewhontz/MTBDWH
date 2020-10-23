CREATE OR REPLACE PROCEDURE sp_load_dim_difficulty()
AS $$
BEGIN
  insert into mtb.difficulty (d_name, d_description)
  select distinct difficulty, 'no description'
  from staging.mtb_project_api s
  where not exists (
      select d_name
      from mtb.difficulty d
      where s.difficulty = d.d_name
  );
END;
$$ LANGUAGE plpgsql;