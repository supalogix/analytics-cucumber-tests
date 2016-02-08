Feature: View Bar Chart

	As a business analyst
	I want to see a bar chart
	So I can extract meaningful insights from our data

	Background: 
		Given the initial dataset
		"""
			{
				"day": [
					{ "date": "January 01, 2016", "items": [ { "name": "item1", "value": 100}, { "name": "item2", "value": 100},{ "name": "item3", "value": 900}] },
					{ "date": "January 02, 2016", "items": [ { "name": "item1", "value": 200}, { "name": "item2", "value": 200},{ "name": "item3", "value": 800}] },
					{ "date": "January 03, 2016", "items": [ { "name": "item1", "value": 300}, { "name": "item2", "value": 300},{ "name": "item3", "value": 700}] },
					{ "date": "January 04, 2016", "items": [ { "name": "item1", "value": 400}, { "name": "item2", "value": 400},{ "name": "item3", "value": 600}] },
					{ "date": "January 05, 2016", "items": [ { "name": "item1", "value": 500}, { "name": "item2", "value": 500},{ "name": "item3", "value": 500}] },
					{ "date": "January 06, 2016", "items": [ { "name": "item1", "value": 100}, { "name": "item2", "value": 600},{ "name": "item3", "value": 400}] },
					{ "date": "January 07, 2016", "items": [ { "name": "item1", "value": 200}, { "name": "item2", "value": 700},{ "name": "item3", "value": 300}] },
					{ "date": "January 08, 2016", "items": [ { "name": "item1", "value": 300}, { "name": "item2", "value": 800},{ "name": "item3", "value": 200}] },
					{ "date": "January 09, 2016", "items": [ { "name": "item1", "value": 400}, { "name": "item2", "value": 900},{ "name": "item3", "value": 100}] },
					{ "date": "January 10, 2016", "items": [ { "name": "item1", "value": 500}, { "name": "item2", "value": 100},{ "name": "item3", "value": 100}] },
					{ "date": "January 11, 2016", "items": [ { "name": "item1", "value": 500}, { "name": "item2", "value": 200},{ "name": "item3", "value": 100}] },
					{ "date": "January 12, 2016", "items": [ { "name": "item1", "value": 400}, { "name": "item2", "value": 300},{ "name": "item3", "value": 100}] },
					{ "date": "January 13, 2016", "items": [ { "name": "item1", "value": 300}, { "name": "item2", "value": 400},{ "name": "item3", "value": 100}] },
					{ "date": "January 14, 2016", "items": [ { "name": "item1", "value": 200}, { "name": "item2", "value": 500},{ "name": "item3", "value": 100}] },
					{ "date": "January 15, 2016", "items": [ { "name": "item1", "value": 100}, { "name": "item2", "value": 600},{ "name": "item3", "value": 100}] },
					{ "date": "January 16, 2016", "items": [ { "name": "item1", "value": 200}, { "name": "item2", "value": 700},{ "name": "item3", "value": 100}] },
					{ "date": "January 17, 2016", "items": [ { "name": "item1", "value": 300}, { "name": "item2", "value": 800},{ "name": "item3", "value": 100}] },
					{ "date": "January 18, 2016", "items": [ { "name": "item1", "value": 400}, { "name": "item2", "value": 900},{ "name": "item3", "value": 100}] },
					{ "date": "January 19, 2016", "items": [ { "name": "item1", "value": 500}, { "name": "item2", "value": 100},{ "name": "item3", "value": 100}] }
				],
				"month": [
					{ "date": "January 2016", "items": [ { "name": "item1", "value": 1000}, { "name": "item2", "value": 2000},{ "name": "item3", "value": 1500}] },
					{ "date": "February 2016", "items": [ { "name": "item1", "value": 2000}, { "name": "item2", "value": 1575},{ "name": "item3", "value": 2000}] },
					{ "date": "March 2016", "items": [ { "name": "item1", "value": 3000}, { "name": "item2", "value": 100},{ "name": "item3", "value": 20000}] },
					{ "date": "April 2016", "items": [ { "name": "item1", "value": 100}, { "name": "item2", "value": 100},{ "name": "item3", "value": 100}] },
					{ "date": "May 2016", "items": [ { "name": "item1", "value": 100}, { "name": "item2", "value": 100},{ "name": "item3", "value": 100}] },
					{ "date": "June 2016", "items": [ { "name": "item1", "value": 100}, { "name": "item2", "value": 100},{ "name": "item3", "value": 100}] },
					{ "date": "July 2016", "items": [ { "name": "item1", "value": 100}, { "name": "item2", "value": 100},{ "name": "item3", "value": 100}] },
					{ "date": "August 2016", "items": [ { "name": "item1", "value": 100}, { "name": "item2", "value": 100},{ "name": "item3", "value": 100}] },
					{ "date": "September 2016", "items": [ { "name": "item1", "value": 100}, { "name": "item2", "value": 100},{ "name": "item3", "value": 100}] },
					{ "date": "October 2016", "items": [ { "name": "item1", "value": 100}, { "name": "item2", "value": 100},{ "name": "item3", "value": 100}] },
					{ "date": "November 2016", "items": [ { "name": "item1", "value": 100}, { "name": "item2", "value": 100},{ "name": "item3", "value": 100}] },
					{ "date": "December 2016", "items": [ { "name": "item1", "value": 100}, { "name": "item2", "value": 100},{ "name": "item3", "value": 100}] }
				],
				"year": [
					{ "date": "2016", "items": [ { "name": "item1", "value": 1000}, { "name": "item2", "value": 2000},{ "name": "item3", "value": 3000}] },
					{ "date": "2015", "items": [ { "name": "item1", "value": 2000}, { "name": "item2", "value": 3000},{ "name": "item3", "value": 2000}] },
					{ "date": "2014", "items": [ { "name": "item1", "value": 3000}, { "name": "item2", "value": 4000},{ "name": "item3", "value": 1000}] },
					{ "date": "2013", "items": [ { "name": "item1", "value": 4000}, { "name": "item2", "value": 1000},{ "name": "item3", "value": 4000}] }
				]
			}
		"""


	Scenario: Visit the page

		When I visit the page at "http://localhost:8000"
		Then I should see a bar chart for "January 01, 2016"
			And I should see a selectable list that includes these <dates>
				| dates            |
				| January 01, 2016 |
				| January 02, 2016 |
				| January 03, 2016 |
				| January 04, 2016 |
			And I should see the "January 01, 2016" list item emphasized
			And I should see the "Day" button emphasized

	Scenario: Change Selected Date On Daily Page

		When I visit the page at "http://localhost:8000"
			And I select the date "January 02, 2016"
		Then I should see a bar chart for "January 02, 2016"
			And I should see a selectable list that includes these <dates>
				| dates            |
				| January 01, 2016 |
				| January 02, 2016 |
				| January 03, 2016 |
				| January 04, 2016 |
			And I should see the "January 02, 2016" list item emphasized
			And I should see the "Day" button emphasized

	Scenario: Aggregate By Month

		When I visit the page at "http://localhost:8000"
			And I select to aggregate by "Month" 
		Then I should see a bar chart for "January 2016"
			And I should see a selectable list that includes these <dates>
				| dates       |
				| May 2016    |
				| June 2016   |
				| July 2016   |
				| August 2016 |
			And I should see the "January 2016" list item emphasized
			And I should see the "Month" button emphasized

	Scenario: Aggregate By Year

		When I visit the page at "http://localhost:8000"
			And I select to aggregate by "Year" 
		Then I should see a bar chart for "2016"
			And I should see a selectable list that includes these <dates>
				| dates |
				| 2016  |
				| 2015  |
				| 2014  |
				| 2013  |
			And I should see the "2016" list item emphasized
			And I should see the "Year" button emphasized
