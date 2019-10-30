//
//  Day.swift
//  DayOfWeek
//
//  Created by Edward Bennett on 10/27/19.
//  Copyright © 2019 Edward Bennett. All rights reserved.
//

enum Day: Int {
  case undefined = -1
  case saturday
  case sunday
  case monday
  case tuesday
  case wednesday
  case thursday
  case friday
  
  static func fromRawValue(_ rawValue: Int) -> Day {
    return Day(rawValue: rawValue) ?? .undefined
  }
}

//
// MARK: - CustomStringConvertible
//
extension Day: CustomStringConvertible {
  var description: String {
    switch self {
      case .undefined:
        return "UNDEFINED"
      case .sunday:
        return "Sunday"
      case .monday:
        return "Monday"
      case .tuesday:
        return "Tuesday"
      case .wednesday:
        return "Wednesday"
      case .thursday:
        return "Thursday"
      case .friday:
        return "Friday"
      case .saturday:
        return "Saturday"
    }
  }
}
