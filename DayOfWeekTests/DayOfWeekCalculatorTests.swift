//
//  DayOfWeekCalculatorTests.swift
//  DayOfWeekTests
//
//  Created by Edward Bennett on 10/28/19.
//  Copyright © 2019 Edward Bennett. All rights reserved.
//

import XCTest
@testable import DayOfWeek

class DayOfWeekCalculatorTests: XCTestCase {
  let daysOfWeek = ["12/23/1804": Day.sunday,
                    "01/01/1753": Day.monday,
                    "10/29/2019": Day.tuesday,
                    "08/18/1937": Day.wednesday,
                    "04/02/2037": Day.thursday,
                    "10/21/1949": Day.friday,
                    "06/20/1992": Day.saturday
  ]
  
  var calendar: Calendar!
  var calculator: DayOfWeekCalculator!
  var dateComponents: DateComponents!
  
  override func setUp() {
    calendar = Calendar.current
    calculator = DayOfWeekCalculator()
    dateComponents = DateComponents()
  }
  
  override func tearDown() {
    calendar = nil
    calculator = nil
    dateComponents = nil
  }
  
  func testValidDateStringReturnsDate() {
    let expectedDate = Date()
    dateComponents = calendar.dateComponents([.month, .day, .year], from: expectedDate)
    let actualDate = calculator.getDateFromString(
      "\(dateComponents.month!)/\(dateComponents.day!)/\(dateComponents.year!)")
    
    let result = Calendar.current.compare(expectedDate, to: actualDate!, toGranularity: .day)
    XCTAssertEqual(ComparisonResult.orderedSame, result, "Dates are not the same")
  }
  
  func testBadDateStringReturnsNil() {
    XCTAssertNil(calculator.getDateFromString("2019-10-29"))
  }
  
  func testGetlastTwoDigitsOfYear() throws {
    let expected = 19
    let actual = try calculator.getLastTwoDigitsOfYear(2019)
    XCTAssertEqual(expected, actual)
  }
  
  func testGetlastTwoDigitsOfYearHandlesInvalidYear() {
    XCTAssertThrowsError(try calculator.getLastTwoDigitsOfYear(20)) { (error) in
      XCTAssertEqual(error as? DateConversionError, DateConversionError.invalidYear)
    }
  }
  
  func testEarlyEighteenthCenturyDateReturnsUndefined() {
    XCTAssertEqual(Day.undefined, calculator.calculateDayOfWeek(forDate: calculator.getDateFromString("12/31/1752")!))
  }
  
  func testValidDates() {
    for (dateStr, expectedDay) in daysOfWeek {
      if let date = calculator.getDateFromString(dateStr) {
        XCTAssertEqual(expectedDay,
                       calculator.calculateDayOfWeek(forDate: date),
                       "Failed on \(dateStr)")
      } else {
        XCTFail("Invalid date")
      }
    }
  }
}
