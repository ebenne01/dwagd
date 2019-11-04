//
//  DayOfWeekUITests.swift
//  DayOfWeekUITests
//
//  Created by Edward Bennett on 9/16/19.
//  Copyright © 2019 Edward Bennett. All rights reserved.
//

import XCTest

class DayOfWeekUITests: XCTestCase {
  var app: XCUIApplication!
  
  override func setUp() {
    continueAfterFailure = false
    app = XCUIApplication()
    app.launch()
  }
  
  override func tearDown() {
  }
  
  func testUndefinedDate() {
    app.pickerWheels.element(boundBy: 0).adjust(toPickerWheelValue: "December")
    app.pickerWheels.element(boundBy: 1).adjust(toPickerWheelValue: "31")
    app.pickerWheels.element(boundBy: 2).adjust(toPickerWheelValue: "1752")
    XCTAssertTrue(app.staticTexts["UNDEFINED"].isHittable)
  }
  
  func testValidDate() {
    app.pickerWheels.element(boundBy: 0).adjust(toPickerWheelValue: "July")
    app.pickerWheels.element(boundBy: 1).adjust(toPickerWheelValue: "20")
    app.pickerWheels.element(boundBy: 2).adjust(toPickerWheelValue: "1969")
    XCTAssertTrue(app.staticTexts["Sunday"].isHittable)
  }
}
