//
//  CalendarAppUITests.swift
//  CalendarAppUITests
//
//  Created by Vivek Parolia on 7/8/20.
//  Copyright © 2020 Vivek Parolia. All rights reserved.
//

import XCTest
import XCTest_Gherkin

let calendarApp = XCUIApplication(bundleIdentifier: "com.apple.mobilecal")

class CalendarAppUITests: XCTestCase {
    
    
    
    func testCalendarApp() {
        Given("I have launched the Calendar app")
        When("I want to create an event with title \"Introduction\"")
        And("It is not a weekend or a public holiday and starts at 6:05 PM")
        And("I set the duration as \"30 minutes\"")
        And("I save the event")
        Then("I should be able to find it on the date")

    }

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.

        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false

        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

}
