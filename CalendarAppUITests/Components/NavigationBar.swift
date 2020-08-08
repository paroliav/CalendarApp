//
//  NavigationBar.swift
//  CalendarAppUITests
//
//  Created by Vivek Parolia on 8/8/20.
//  Copyright © 2020 Vivek Parolia. All rights reserved.
//

import Foundation

let btAddEvent = "Add"
let navBarTitleNewEvent = "New Event"

func addEvent() {
    calendarApp.buttons[btAddEvent].tap()
}

func createEvent() {
    calendarApp.navigationBars[navBarTitleNewEvent].buttons[btAddEvent].tap()
}
