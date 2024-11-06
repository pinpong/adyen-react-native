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
      let sut = AnalyticsParser(configuration: ["analitics":[:]])
      XCTAssertNotNil(sut)
      XCTAssertTrue(sut.analyticsOn)
      XCTAssertFalse(sut.verboseLogsOn)
    }

    func testEnableAnalyticFalse() {
      let sut = AnalyticsParser(configuration: ["enabled": false as NSNumber])
      XCTAssertFalse(sut.analyticsOn)
    }

    func testEnableAnalyticTrue() {
      let sut = AnalyticsParser(configuration: ["enabled": true as NSNumber])
      XCTAssertTrue(sut.analyticsOn)
    }

    func testVerboseLogsTrue() {
      let sut = AnalyticsParser(configuration: ["verboseLogs": true as NSNumber])
      XCTAssertTrue(sut.verboseLogsOn)
    }

    func testVerboseLogsFalse() {
      let sut = AnalyticsParser(configuration: ["verboseLogs": false as NSNumber])
      XCTAssertFalse(sut.verboseLogsOn)
    }
  }
