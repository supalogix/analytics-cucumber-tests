import ReactPage from "./PageObject/ReactPage";

export class PageObjectFactory {
	static getAnalyticsPage() {
		return new ReactPage();
	}
}
