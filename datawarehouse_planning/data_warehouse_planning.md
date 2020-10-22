# Data Warehouse Planning

The function of this data warehouse will be to store local MTB trail information.  
The warehouse should support retrieving rideable trails near a user.  
Rideable would mean that it fits the users experience level (determined by the trail's rating) and conditions.

Use Cases this warehouse should support are:
- Finding *local* trails that are *rideable* and appropriate for the user's *skill level*.
- Finding trails that have may be in need of conditions updates
	- This would be accomplished by finding trails that have not been updated in an arbitrary amount of time
	- A good future feature would be to track weather by location and figure out which trails should be updated after a heavy rain

## Pseudo - Queries
1 - SELECT * FROM FACT WHERE is_rideable = True AND difficulty in ('Beginner', 'Intermediate', 'Beginner-Intermediate')
2 - SELECT * FROM FACT WHERE latest_condition > 30daysago
3 - Finding trails by difficulty and length
4 - Finding trails with long descents

## Entities
- Trail
- Locations
- Rating

## Fact
- TrailRating

## Dimensions
- TrailDetail
- Location
- Difficulty
- Condition

### TrailRating (Fact)
t_id
t_difficulty_id
t_location_id
t_condition_id
t_stars
t_votes
t_length

### TrailDetail (Dimension)
td_id
td_natural_id
td_name
td_type
td_summary
td_link
td_lon
td_lat
td_ascent
td_descent
td_high_point
td_low_point

### Location (Dimension)
l_location_id
l_city_name
l_state_name

### Difficulty (Dimension)
d_difficulty_id
d_name
d_description

### Condition (Dimension)
c_id
c_status
c_description
c_last_updated
c_is_latest
c_is_rideable

## Thoughts on Organization Above
I think the main fa