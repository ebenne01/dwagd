//
//  DayOfWeekCalculator.swift
//  DayOfWeek
//
//  Created by Edward Bennett on 10/27/19.
//  Copyright © 2019 Edward Bennett. All rights reserved.
//

import Foundation

struct DayOfWeekCalculator {
  let monthKeys = [ 1: (month: "January", keyNumber: 1, leapYearAdjustment: -1),
                    2: (month: "February", keyNumber: 4, leapYearAdjustment: -1),
                    3: (month: "March", keyNumber: 4, leapYearAdjustment: 0),
                    4: (month: "April", keyNumber: 0, leapYearAdjustment: 0),
                    5: (month: "May", keyNumber: 2, leapYearAdjustment: 0),
                    6: (month: "June", keyNumber: 5, leapYearAdjustment: 0),
                    7: (month: "July", keyNumber: 0, leapYearAdjustment: 0),
                    8: (month: "August", keyNumber: 3, leapYearAdjustment: 0),
                    9: (month: "September", keyNumber: 6, leapYearAdjustment: 0),
                    10: (month: "October", keyNumber: 1, leapYearAdjustment: 0),
                    11: (month: "November", keyNumber: 4, leapYearAdjustment: 0),
                    12: (month: "December", keyNumber: 6, leapYearAdjustment: 0)]
  
  func calculateDayOfWeek(forDate date: Date) -> Day {
    let dateComponents = Calendar.current.dateComponents([.month, .day, .year], from: date)
    do {
      let month = dateComponents.month!
      let day = dateComponents.day!
      let year = dateComponents.year!
      
      guard year > 1752 else { return .undefined }
      
      let lastTwoDigitsOfYear = try getLastTwoDigitsOfYear(year)
      
      var sum = lastTwoDigitsOfYear
      sum += lastTwoDigitsOfYear / 4
      sum += day
      
      let monthKey = monthKeys[month]!
      sum += monthKey.keyNumber
      
      if date.isLeapYear {
        sum += monthKey.leapYearAdjustment
      }
      
      if year < 1800 {
        sum += 4
      } else if year < 1900 {
        sum += 2
      } else if year > 1999 {
        sum -= 1
      }
      
      let dayNumber = sum % 7
      return Day.fromRawValue(dayNumber)
    } catch {
      return .undefined
    }
  }
  
  func getDateFromString(_ str: String) -> Date? {
    let formatter = DateFormatter()
    formatter.dateFormat = "MM/dd/yyyy"
    return formatter.date(from: str)
  }
  
  func getLastTwoDigitsOfYear(_ year: Int) throws -> Int {
    let yearStr = String(year)
    guard yearStr.count == 4 else { throw DateConversionError.invalidYear }
    return Int(yearStr.suffix(2).description)!
  }
}

enum DateConversionError: Error {
  case invalidYear
}
