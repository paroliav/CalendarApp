//
//  EventsList.swift
//  CalendarAppUITests
//
//  Created by Vivek Parolia on 8/8/20.
//  Copyright © 2020 Vivek Parolia. All rights reserved.
//

import Foundation
import XCTest

let lbMainCalendarCurrentMonth = "Current month, "+eventDate.fullMonthYear()
let newEventTitle = eventTitle+", from "+eventTime+" "+eventAMPM+" to "+eventEndTime+" "+eventAMPM

func findEventInList() -> XCUIElementQuery {
    let currentMonthYear = calendarApp.buttons[lbMainCalendarCurrentMonth]
    if !currentMonthYear.exists {
        calendarApp.buttons.element(boundBy: 0).tap()
        calendarApp.buttons.element(boundBy: 0).tap()
    }
    currentMonthYear.tap()
    calendarApp.buttons[eventDate.dayOfWeekMonthAndDate()!].tap()

    let event_predicate = NSPredicate(format: "label == %@", newEventTitle)
    return calendarApp.cells.containing(event_predicate)
}
