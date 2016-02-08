import chai, {expect} from "chai";
import {PageObjectFactory} from "../factory/PageObjectFactory";
import co from "co";

module.exports = function() {
	let page;

this.Given(/^the initial dataset$/, function (jsonString, done) {
	/**
	 * Setup Initial State
	 * ===================
	 *
	 * Put the remote service in a particular state before each test
	 */
	let json = JSON.parse(jsonString);
	AnalyticsService.initializeState(json);

	page = PageObjectFactory.getAnalyticsPage();

	done();
});

this.When(/^I visit the page at "([^"]*)"$/, function (url, done) {
	co(function*(){
		yield page.visit(url);

		done();
	});
});

this.Then(/^I should see a bar chart for "([^"]*)"$/, function (expectedChartTitle, done) {
	co(function*(){
		let chartTitle = yield page.displayedChart();

		expect(chartTitle).to.equal(expectedChartTitle);

		done();
	});
});

this.Then(/^I should see a selectable list that includes these (.*)$/, function (dates, table, done) {
	co(function*(){
		let list = yield page.listOfDates();

		let data = table.hashes().map(function(item) {
			return item.dates;
		});

		expect(list)
			.to
			.include
			.members(data);

		done();
	});
});

this.Then(/^I should see the "([^"]*)" list item emphasized$/, function (listItem, done) {
	co(function*() {
		let value = yield page.emphasizedDate();
		expect(value).to.equal(listItem);

		done();
	});
});

this.Then(/^I should see the "([^"]*)" button emphasized$/, function (button, done) {
	co(function*() {
		let value = yield page.emphasizedButton();
		expect(button).to.equal(value);

		done();
	});
});

this.When(/^I select to aggregate by "([^"]*)"$/, function (type, done) {
	co(function*(){
		yield page.changeAggregationType(type);

		done();
	});
});

this.When(/^I select the date "([^"]*)"$/, function (date, done) {
	co(function*(){
		yield page.changeSelectedDate(date);

		done();
	});
});
};
