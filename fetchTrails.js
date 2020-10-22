const request = require('request');
const fetch = require('node-fetch');
const converter = require('json-2-csv');
const fs = require('fs');
const key = 'removed'
const lat = 33.071690
const lon = -117.303610
const maxDistance = 200
const maxResults = 500
const endpoint = 'get-trails'
let params = {
	"key": key,
	"lat": lat,
	"lon" : lon,
	"maxDistance": maxDistance,
	"maxResults": maxResults
}

// Write an object as key=value&
let formatParams = (params) => {
	let results = []
	for (const key in params) {
		results.push(`${key}=${params[key]}`)
	}
	results = results.join('&')
	return results
}

params = formatParams(params)
const url = `https://www.mtbproject.com/data/${endpoint}?${params}`

// Convert JSON response to CSV
let formattedResponse = (res) => {
	/* Function for formatting the get-trails API call as a gzip compressed .csv file */
	return new Promise((resolve, reject) => {
		converter.json2csv(res, (err, csv) => {
			if (err) reject(err);
			resolve(csv)
		})
	})
}

// Write results to a file in the data directory
let writeResults = (results) => {
	/* Writes data to the ./data directory */
	const timestamp = (Math.floor(Date.now() / 1000)).toString();
	output_filename = `./data/request_${timestamp}.csv`
	fs.writeFile(output_filename, results, (err) => {
		if (err) return console.log(err);
		console.log(`Results written to ${output_filename}`)
	});
}

let fetchTrails = (url) => {
	return fetch(url)
		.then(response => response.json())
		.then(data => formattedResponse(data['trails']))
		.then(formattedResponse => writeResults(formattedResponse))
		.catch(err => console.error(err));
}

fetchTrails(url);