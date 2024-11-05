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

    func testRequiredPinFalse() {
      let dict: [String : Any] = ["isEnabled": false as NSNumber]
      let sut = AnalyticsParser(configuration: dict as NSDictionary)
      XCTAssertFalse(sut.analyticsOn)
    }

    func testRequiredPinTrue() {
      let dict: [String : Any] = ["verboseLogsOn": true as NSNumber]
      let sut = AnalyticsParser(configuration: dict as NSDictionary)
      XCTAssertTrue(sut.verboseLogsOn)
    }
  }
