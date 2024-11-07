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
    let sut = PartialPaymentParser(configuration: ["partialPayment": [:]])
    XCTAssertNotNil(sut)
    XCTAssertTrue(sut.pinRequired)
  }

  func testRequiredPinFalse() {
    let sut = PartialPaymentParser(configuration: ["pinRequired": false as NSNumber])
    XCTAssertFalse(sut.pinRequired)
  }

  func testRequiredPinTrue() {
    let sut = PartialPaymentParser(configuration: ["pinRequired": true as NSNumber])
    XCTAssertTrue(sut.pinRequired)
  }
}
