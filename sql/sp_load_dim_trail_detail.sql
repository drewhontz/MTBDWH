CREATE OR REPLACE PROCEDURE sp_load_dim_trail_detail()
AS $$
BEGIN
INSERT INTO mtb.trail_detail
(
    td_natural_id
    , td_name
    , td_type
    , td_summary
    , td_link
    , td_ascent
    , td_descent
    , td_high_point
    , td_low_point
    , td_lon
    , td_lat
)
SELECT
    id::int td_natural_id
    , name td_name
    , type td_type
    , summary td_summary
    , url td_link
    , ascent::int td_ascent
    , descent::int td_descent
    , high::int td_high_point
    , low::int td_low_point
    , longitude::decimal(38,4) td_lon
    , latitude::decimal(38,4) td_lat
FROM staging.mtb_project_api s
WHERE NOT EXISTS (
    select td_natural_id
    from mtb.trail_detail td
    where s.id::int = td_natural_id
);
END;
$$ LANGUAGE plpgsql;