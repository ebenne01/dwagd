//
//  DateExtension.swift
//  DayOfWeek
//
//  Created by Edward Bennett on 10/29/19.
//  Copyright © 2019 Edward Bennett. All rights reserved.
//

import Foundation

extension Date {
  var isLeapYear: Bool {
    let year = Calendar.current.component(.year, from: self)
    return (year % 400 == 0) || ((year % 4 == 0) && year % 100 != 0)
  }
}
