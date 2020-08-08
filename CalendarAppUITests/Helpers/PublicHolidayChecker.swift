//
//  PublicHolidayChecker.swift
//  CalendarAppUITests
//
//  Created by Vivek Parolia on 8/8/20.
//  Copyright © 2020 Vivek Parolia. All rights reserved.
//

import Foundation

let PublicHolidays : [Date] = readPublicHolidays()

func isPublicHoliday(date : Date) -> Bool {
    if PublicHolidays.contains(date) {
        return true
    }
    return false
}

func readPublicHolidays() -> [Date] {
    var result: [Date] = []
    guard let fileurl = Bundle.main.url(forResource: "PublicHolidays2020", withExtension: "csv", subdirectory:"PlugIns/CalendarAppUITests.xctest")
        else {
            print("File not found")
            return []
    }
    do {
        let contents = try String(contentsOf: fileurl, encoding: .utf8)
        let rows = contents.components(separatedBy: "\r\n")
        for row in rows {
            if !row.isEmpty {
                let dateFormatter = DateFormatter()
                dateFormatter.calendar = Calendar(identifier: .iso8601)
                dateFormatter.locale = Locale(identifier: "en_AU")
                dateFormatter.timeZone = TimeZone(secondsFromGMT: 0)
                dateFormatter.dateStyle = .full
                result.append(dateFormatter.date(from: row)!)
            }
        }
        return result
    } catch {
        print("File Read Error for file \(fileurl)")
        return []
    }
}


