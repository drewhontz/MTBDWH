# Mountain Bike Trails Data Warehouse

## Description
The following project was created to get some experience with Redshift, Node, and GraphQL.  
The intent was to create a GraphQL API that would allow users to find rideable MTB trails nearby w/in a rider's skill level.

## Content
The project includes:
- Node scripts (fetchTrails.js) to pull data from the [MTB Project API](https://www.mtbproject.com/data)
- Notes on how the data model/star schema was designed
	- see datawarehouse_planning for how thought process when designing this warehouse
	- see sql directory for table DDL and DML
- raw data pulled from the API (data/request_{timestamp})