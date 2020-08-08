//
//  DateHelper.swift
//  CalendarAppUITests
//
//  Created by Vivek Parolia on 8/8/20.
//  Copyright © 2020 Vivek Parolia. All rights reserved.
//

import Foundation

extension Date {

    func startOfMonth() -> Date {
        let interval = Calendar.current.dateInterval(of: .month, for: self)
        return (interval?.start.toLocalTime())! // Without toLocalTime it give last months last date
    }

    func endOfMonth() -> Date {
        let interval = Calendar.current.dateInterval(of: .month, for: self)
        return interval!.end
    }

    // Convert UTC (or GMT) to local time
    func toLocalTime() -> Date {
        let timezone    = TimeZone.current
        let seconds     = TimeInterval(timezone.secondsFromGMT(for: self))
        return Date(timeInterval: seconds, since: self)
    }
    
    func monthWithDate() -> String? {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MMM d"
        return dateFormatter.string(from: self)
    }
    
    func dayOfWeekMonthAndDate() -> String? {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "EEEE, MMMM d"
        return dateFormatter.string(from: self)
    }
    
    func fullMonthYear() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MMMM yyyy"
        return dateFormatter.string(from: self)
    }
    
    func fullMonth() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MMMM"
        return dateFormatter.string(from: self)
    }

    
}


func getRandomValidDate() -> Date {
    var calendar = NSCalendar.current
    calendar.timeZone = .current
      var dateFrom = Date().startOfMonth()
      let dateTo = Date().endOfMonth()
      var availabledates : [Date] = []
      
      while dateFrom <= dateTo {
          if !calendar.isDateInWeekend(dateFrom) && !isPublicHoliday(date: dateFrom){
              availabledates.append(dateFrom)
          }
          dateFrom = Calendar.current.date(byAdding: .day, value: 1, to: dateFrom)!
      }
      
      let randomInt = Int.random(in: 0..<availabledates.count)
      return availabledates[randomInt]
}
