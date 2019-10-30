//
//  DateExtensionTests.swift
//  DayOfWeekTests
//
//  Created by Edward Bennett on 10/29/19.
//  Copyright © 2019 Edward Bennett. All rights reserved.
//

import XCTest
@testable import DayOfWeek

class DateExtensionTests: XCTestCase {
  let leapYears = [1804, 1808, 1812, 1816, 1820, 1824, 1832, 1836, 1840, 1844,
                   1848, 1852, 1856, 1860, 1864, 1868, 1872, 1876, 1880, 1884,
                   1888, 1892, 1896, 1904, 1908, 1912, 1916, 1920, 1924, 1928,
                   1932, 1936, 1940, 1944, 1948, 1952, 1956, 1960, 1964, 1968,
                   1972, 1976, 1980, 1984, 1988, 1992, 1996, 2000, 2004, 2008,
                   2012, 2016, 2020, 2024, 2028, 2032, 2036, 2040, 2044, 2048,
                   2052, 2056, 2060, 2064, 2068, 2072, 2076, 2080, 2084, 2088,
                   2092, 2096]
  
  let nonLeapYears = [1805, 1809, 1813, 1817, 1821, 1825, 1833, 1837, 1841,
                      1845, 1849, 1853, 1857, 1861, 1865, 1869, 1873, 1877,
                      1881, 1885, 1889, 1893, 1897, 1905, 1909, 1913, 1917,
                      1921, 1925, 1929, 1933, 1937, 1941, 1945, 1949, 1953,
                      1957, 1961, 1965, 1969, 1973, 1977, 1981, 1985, 1989,
                      1993, 1997, 2001, 2005, 2009, 2013, 2017, 2021, 2025,
                      2029, 2033, 2037, 2041, 2045, 2049, 2053, 2057, 2061,
                      2065, 2069, 2073, 2077, 2081, 2085, 2089, 2093, 2097]
  
  var dateComponents: DateComponents!
  
  override func setUp() {
    dateComponents = DateComponents()
    dateComponents.month = 1
    dateComponents.day = 1
  }
  
  override func tearDown() {
    dateComponents = nil
  }
  
  func testLeapYears() {
    for year in leapYears {
      dateComponents.year = year
      let date: Date! = Calendar.current.date(from: dateComponents)
      XCTAssertEqual(true, date.isLeapYear, "failed on \(year)")
    }
  }
  
  func testNonLeapYears() {
    for year in nonLeapYears {
      dateComponents.year = year
      let date: Date! = Calendar.current.date(from: dateComponents)
      XCTAssertEqual(false, date.isLeapYear, "failed on \(year)")
    }
  }
}
