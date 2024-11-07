//
// Copyright (c) 2024 Adyen N.V.
//
// This file is open source and available under the MIT license. See the LICENSE file for more info.
//

import XCTest
import Adyen
@testable import adyen_react_native

class RootParserTests: XCTestCase {

  func testInit() {
    let sut = RootConfigurationParser(configuration: [:])
    XCTAssertNotNil(sut)
    XCTAssertEqual(sut.environment, .test)
    XCTAssertNil(sut.amount)
    XCTAssertNil(sut.countryCode)
    XCTAssertNil(sut.shopperLocale)
  }

  func testEUEnvironment() {
    let sut = RootConfigurationParser(configuration: ["environment": "live-eu"])
    XCTAssertEqual(sut.environment, .liveEurope)
  }

  func testIndiaEnvironment() {
    let sut = RootConfigurationParser(configuration: ["environment": "live-in"])
    XCTAssertEqual(sut.environment, .liveIndia)
  }

  func testUSEnvironment() {
    let sut = RootConfigurationParser(configuration: ["environment": "live-us"])
    XCTAssertEqual(sut.environment, .liveUnitedStates)
  }

  func testAustraliaEnvironment() {
    let sut = RootConfigurationParser(configuration: ["environment": "live-au"])
    XCTAssertEqual(sut.environment, .liveAustralia)
  }

  func testAPACEnvironment() {
    let sut = RootConfigurationParser(configuration:  ["environment": "live-apse"])
    XCTAssertEqual(sut.environment, .liveApse)
  }

  func testClientKey() {
    let sut = RootConfigurationParser(configuration: ["clientKey": "client-key"])
    XCTAssertEqual(sut.clientKey, "client-key")
  }

  func testAmount() {
    let sut = RootConfigurationParser(configuration: ["amount": ["value": 100, "currency": "EUR"]])
    XCTAssertEqual(sut.amount?.value, 100)
    XCTAssertEqual(sut.amount?.currencyCode, "EUR")
  }

  func testAmountAsString() {
    let sut = RootConfigurationParser(configuration: ["amount": ["value": "100", "currency": "EUR"]])
    XCTAssertEqual(sut.amount?.value, 100)
    XCTAssertEqual(sut.amount?.currencyCode, "EUR")
  }

  func testAmountAsFloat() {
    let sut = RootConfigurationParser(configuration: ["amount": ["value": 100.3, "currency": "EUR"]])
    XCTAssertEqual(sut.amount?.value, 100)
    XCTAssertEqual(sut.amount?.currencyCode, "EUR")
  }

  func testCountryCode() {
    let sut = RootConfigurationParser(configuration: ["countryCode": "US"])
    XCTAssertEqual(sut.countryCode, "US")
  }

  func testPayment() {
    let sut = RootConfigurationParser(configuration: ["amount": ["value": 100, "currency": "EUR"], "countryCode": "US"])
    XCTAssertEqual(sut.payment?.amount.value, 100)
    XCTAssertEqual(sut.payment?.amount.currencyCode, "EUR")
  }

  func testShopperLocale() {
    let sut = RootConfigurationParser(configuration: ["locale": "en-US"])
    XCTAssertEqual(sut.shopperLocale, "en-US")
  }

}
