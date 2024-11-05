//
// Copyright (c) 2024 Adyen N.V.
//
// This file is open source and available under the MIT license. See the LICENSE file for more info.
//


import XCTest
import Adyen
@testable import adyen_react_native

class PartialPaymentParserTests: XCTestCase {

  func testInit() {
    let dict: [String : Any] = [:]
    let sut = PartialPaymentParser(configuration: dict as NSDictionary)
    XCTAssertNotNil(sut)
    XCTAssertTrue(sut.pinRequired)
  }

  func testRequiredPinFalse() {
    let dict: [String : Any] = ["pinRequired": false as NSNumber]
    let sut = PartialPaymentParser(configuration: dict as NSDictionary)
    XCTAssertFalse(sut.pinRequired)
  }

  func testRequiredPinTrue() {
    let dict: [String : Any] = ["pinRequired": true as NSNumber]
    let sut = PartialPaymentParser(configuration: dict as NSDictionary)
    XCTAssertTrue(sut.pinRequired)
  }
}
