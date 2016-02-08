require("babel-register")({
	"presets": ["es2015"]
});

import co from "co";
import webdriver from "selenium-webdriver";
import {DateFormatter} from "qa-locator-utility";

let By = webdriver.By;
let until = webdriver.until;

export default class ReactPage {
	constructor() {
		this.driver = new webdriver.Builder()
			.forBrowser("firefox")
			.build();
	}

	visit(url) {
		var self = this;

		return co(function*() {
			self.driver.get(url);

			let findChart = "//*[@qa-chart-type]";

			let chartTypeValue = yield self.driver
				.findElement(By.xpath(findChart))
				.getAttribute("qa-chart-type");

			let findChartWhenValueChanges = `//*[@qa-chart-type != '${chartTypeValue}']`;

			return yield self.driver.wait(
				until.elementLocated(
					By.xpath(findChartWhenValueChanges)), 
						3000);
		});
	}

	displayedChart() {
		let self = this;

		return co(function*() {
			let findChart = "//*[@qa-chart-title]";

			let element = yield self.driver
				.findElement(By.xpath(findChart));


			return yield element.getText();
		});
	}

	listOfDates() {
		let self = this;

		return co(function*(){
			let findAllListItems = "//*[@qa-list-item-id]";

			let list_items = yield self.driver.wait(()=>{
				return self.driver.findElements(
					By.xpath(findAllListItems));
			},2000);

			return yield list_items.map((item) => {
				return item.getText();
			});
		});
	}

	emphasizedDate() {
		let self = this;

		return co(function*(){
			let findEmphasizedDate = "//*[@qa-emphasized-date]";

			let emphasized_date = yield self.driver.wait(()=>{
				return self.driver.findElement(
					By.xpath(findEmphasizedDate));
			},2000);

			return yield emphasized_date.getText();
		});
	}

	emphasizedButton() {
		let self = this;

		return co(function*(){
			let findEmphasizedButton = "//*[@qa-button-selected]";

			let emphasized_button = yield self.driver.wait(()=>{
				return self.driver.findElement(
					By.xpath(findEmphasizedButton));
			},2000);

			return yield emphasized_button.getText();
		});
	}

	changeSelectedDate(_date) {
		let self = this;

		let date = DateFormatter.encodeUSDate(_date);
		console.log(date);

		return co(function*(){
			let findListItemByDate = `//*[@qa-list-item-id = '${date}']`;

			let listItem = yield self.driver.wait(()=>{
				return self.driver.findElement(
					By.xpath(findListItemByDate));
			},2000);

			listItem.click();

			let findChartByDate = `//*[@qa-chart-type = '${date}']`;

			return self.driver.wait(
				until.elementLocated(
					By.xpath(findChartByDate)), 
						3000);
		});
	}

	changeAggregationType(type) {
		let self = this;

		return co(function*(){
			let findButtonByType = `//*[@qa-button-id = '${type}']`;
			let findChart = "//*[@qa-chart-type]";

			let chartTypeValue = yield self.driver
				.findElement(By.xpath(findChart))
				.getAttribute("qa-chart-type");

			let button = self.driver.findElement(
					By.xpath(findButtonByType));

			let text = yield button.getText();

			yield button.click();

			let findChartWhenValueChanges = `//*[@qa-chart-type != '${chartTypeValue}']`;

			return yield self.driver.wait(
				until.elementLocated(
					By.xpath(findChartWhenValueChanges)), 
						3000);
		});
	}
}

function getDriver() {
	return new webdriver.Builder()
		.forBrowser("firefox")
		.build();
}
