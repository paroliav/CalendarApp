//
//  EventForm.swift
//  CalendarAppUITests
//
//  Created by Vivek Parolia on 8/8/20.
//  Copyright © 2020 Vivek Parolia. All rights reserved.
//

import Foundation

let lbTitle = "Title"
let lbStart = "Start"


func fillTitle(title : String) {
    calendarApp.textFields[lbTitle].typeText(title)
}

func fillStartDateTime(startDate : Date, startTime : String, timeOfDay : String) {
    let predicate = NSPredicate(format: "label CONTAINS[c] %@", lbStart)
    let starts = calendarApp.cells.containing(predicate).element
    starts.tap()
    
    let hour_minutes = startTime.split(separator: ":")
    setDate(eventDate: startDate)
    setHour(hour: String(hour_minutes[0]))
    setMinutes(minute: String(hour_minutes[1]))
    setAMPM(timeOfDay: timeOfDay)
    eventAMPM = timeOfDay
    
    starts.tap()
}

func fillEndTime(duration: Int, timeUnit : String) {
    let end_predicate = NSPredicate(format: "label CONTAINS[c] %@", "Ends")
    let ends = calendarApp.cells.containing(end_predicate).element
    ends.tap()
    let hour_minute = eventTime.split(separator: ":")
    switch timeUnit {
    case "minutes":
        let startMinutes = Int((hour_minute[1] as NSString) as String)
        let endMinutes = (startMinutes ?? 0) + duration
        setHour(hour: String(hour_minute[0]))
        setMinutes(minute: String(endMinutes))
        eventEndTime = String(hour_minute[0]) + ":" + String(endMinutes)
        break
    case "hours":
        let startHour = Int((hour_minute[0] as NSString) as String)
        let endHour = (startHour ?? 0) + duration
        setHour(hour: String(endHour))
        setMinutes(minute: String(hour_minute[1]))
        eventEndTime = String(endHour) + ":" + String(hour_minute[1])
        break
    default:
        print("Unhandled duration")
    }

    ends.tap()
}
