//
//  CalendarAppStepDefinitions.swift
//  CalendarAppUITests
//
//  Created by Vivek Parolia on 8/8/20.
//  Copyright © 2020 Vivek Parolia. All rights reserved.
//

import Foundation
import XCTest_Gherkin

var eventDate : Date = Date()
var eventTime : String = ""
var eventEndTime : String = ""
var eventTitle : String = ""
var eventAMPM : String = ""

class CalendarAppStepDefinitions : StepDefiner {


    override func defineSteps() {
        step("I have launched the Calendar app") {
            calendarApp.launch()
        }
    
        step("I want to create an event with title \"(.+)\""){ (eventName: String) in
            addEvent()
            fillTitle(title: eventName)
            eventTitle = eventName
        }

    
    
        step("It is not a weekend or a public holiday and starts at (.+) (AM|PM)") { (startTime: String, timeOfDay: String) in
            let startDate: Date = getRandomValidDate()
            eventDate = startDate
            eventTime = startTime
            
            fillStartDateTime(startDate: startDate, startTime: startTime, timeOfDay: timeOfDay)
        }
        
        step("I set the duration as \"([0-9]*) (minutes|hours)\""){ (duration: Int, timeUnit: String) in
            fillEndTime(duration: duration, timeUnit: timeUnit)
        }
        
        step("I save the event") {
            createEvent()
        }
        
        step("I should be able to find it on the date") {
            takeScreenshot()
            XCTAssertGreaterThan(findEventInList().count, 0)
        }

    }
}
