//
//  DateSetter.swift
//  CalendarAppUITests
//
//  Created by Vivek Parolia on 8/8/20.
//  Copyright © 2020 Vivek Parolia. All rights reserved.
//

import Foundation

func setDate(eventDate : Date) {
    calendarApp.pickerWheels.element(boundBy: 0).adjust(toPickerWheelValue: eventDate.monthWithDate()!)
}

func setHour(hour : String) {
    calendarApp.pickerWheels.element(boundBy: 1).adjust(toPickerWheelValue: hour)
}

func setMinutes(minute: String) {
    calendarApp.pickerWheels.element(boundBy: 2).adjust(toPickerWheelValue: minute)
}

func setAMPM(timeOfDay: String) {
    calendarApp.pickerWheels.element(boundBy: 3).adjust(toPickerWheelValue: timeOfDay)
}
