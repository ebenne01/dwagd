//
//  DayTests.swift
//  DayOfWeekTests
//
//  Created by Edward Bennett on 10/28/19.
//  Copyright © 2019 Edward Bennett. All rights reserved.
//

import XCTest
@testable import DayOfWeek

class DayTests: XCTestCase {
  override func setUp() {
    
  }
  
  override func tearDown() {
    
  }
  
  func testCorrectDayIsReturnedFromRawValue() {
    XCTAssertEqual(Day.tuesday, Day.fromRawValue(3))
  }
  
  func testUndefinedRawValue() {
    XCTAssertEqual(Day.undefined, Day(rawValue: -1))
  }
  
  func testOutOfRangeRawValues() {
    XCTAssertEqual(Day.undefined, Day.fromRawValue(-2))
    XCTAssertEqual(Day.undefined, Day.fromRawValue(7))
  }
  
  func testCorrectRawValueIsReturned() {
    XCTAssertEqual(-1, Day.undefined.rawValue)
    XCTAssertEqual(0, Day.saturday.rawValue)
    XCTAssertEqual(1, Day.sunday.rawValue)
    XCTAssertEqual(2, Day.monday.rawValue)
    XCTAssertEqual(3, Day.tuesday.rawValue)
    XCTAssertEqual(4, Day.wednesday.rawValue)
    XCTAssertEqual(5, Day.thursday.rawValue)
    XCTAssertEqual(6, Day.friday.rawValue)
  }
  
  func testCorrectDescriptionIsReturned() {
    XCTAssertEqual("UNDEFINED", "\(Day.undefined)")
    XCTAssertEqual("Sunday", "\(Day.sunday)")
    XCTAssertEqual("Monday", "\(Day.monday)")
    XCTAssertEqual("Tuesday", "\(Day.tuesday)")
    XCTAssertEqual("Wednesday", "\(Day.wednesday)")
    XCTAssertEqual("Thursday", "\(Day.thursday)")
    XCTAssertEqual("Friday", "\(Day.friday)")
    XCTAssertEqual("Saturday", "\(Day.saturday)")
  }
}
