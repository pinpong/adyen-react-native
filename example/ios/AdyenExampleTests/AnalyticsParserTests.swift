  //
  // Copyright (c) 2024 Adyen N.V.
  //
  // This file is open source and available under the MIT license. See the LICENSE file for more info.
  //

  import XCTest
  import Adyen
  @testable import adyen_react_native

  class AnalyticsParserTests: XCTestCase {

    func testInit() {
      let dict: [String : Any] = [:]
      let sut = AnalyticsParser(configuration: dict as NSDictionary)
      XCTAssertNotNil(sut)
      XCTAssertTrue(sut.analyticsOn)
      XCTAssertFalse(sut.verboseLogsOn)
    }

    func testEnableAnalyticFalse() {
      let dict: [String : Any] = ["enabled": false as NSNumber]
      let sut = AnalyticsParser(configuration: dict as NSDictionary)
      XCTAssertFalse(sut.analyticsOn)
    }

    func testEnableAnalyticTrue() {
      let dict: [String : Any] = ["enabled": true as NSNumber]
      let sut = AnalyticsParser(configuration: dict as NSDictionary)
      XCTAssertTrue(sut.analyticsOn)
    }

    func testVerboseLogsTrue() {
      let dict: [String : Any] = ["verboseLogs": true as NSNumber]
      let sut = AnalyticsParser(configuration: dict as NSDictionary)
      XCTAssertTrue(sut.verboseLogsOn)
    }

    func testVerboseLogsFalse() {
      let dict: [String : Any] = ["verboseLogs": false as NSNumber]
      let sut = AnalyticsParser(configuration: dict as NSDictionary)
      XCTAssertFalse(sut.verboseLogsOn)
    }
  }
