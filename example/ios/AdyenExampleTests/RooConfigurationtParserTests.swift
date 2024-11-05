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
    let dict: [String : Any] = [:]
    let sut = RootConfigurationParser(configuration: dict as NSDictionary)
    XCTAssertNotNil(sut)
    XCTAssertEqual(sut.environment, .test)
    XCTAssertNil(sut.amount)
    XCTAssertNil(sut.countryCode)
    XCTAssertNil(sut.shopperLocale)
  }

  func testEUEnvironment() {
    let dict: [String : Any] = ["environment": "live-eu"]
    let sut = RootConfigurationParser(configuration: dict as NSDictionary)
    XCTAssertEqual(sut.environment, .liveEurope)
  }

  func testIndiaEnvironment() {
    let dict: [String : Any] = ["environment": "live-in"]
    let sut = RootConfigurationParser(configuration: dict as NSDictionary)
    XCTAssertEqual(sut.environment, .liveIndia)
  }

  func testUSEnvironment() {
    let dict: [String : Any] = ["environment": "live-us"]
    let sut = RootConfigurationParser(configuration: dict as NSDictionary)
    XCTAssertEqual(sut.environment, .liveUnitedStates)
  }

  func testAustraliaEnvironment() {
    let dict: [String : Any] = ["environment": "live-au"]
    let sut = RootConfigurationParser(configuration: dict as NSDictionary)
    XCTAssertEqual(sut.environment, .liveAustralia)
  }

  func testAPACEnvironment() {
    let dict: [String : Any] = ["environment": "live-apse"]
    let sut = RootConfigurationParser(configuration: dict as NSDictionary)
    XCTAssertEqual(sut.environment, .liveApse)
  }

  func testClientKey() {
    let dict: [String : Any] = ["clientKey": "client-key"]
    let sut = RootConfigurationParser(configuration: dict as NSDictionary)
    XCTAssertEqual(sut.clientKey, "client-key")
  }

  func testAmount() {
    let dict: [String : Any] = ["amount": ["value": 100, "currency": "EUR"]]
    let sut = RootConfigurationParser(configuration: dict as NSDictionary)
    XCTAssertEqual(sut.amount?.value, 100)
    XCTAssertEqual(sut.amount?.currencyCode, "EUR")
  }

  func testAmountAsString() {
    let dict: [String : Any] = ["amount": ["value": "100", "currency": "EUR"]]
    let sut = RootConfigurationParser(configuration: dict as NSDictionary)
    XCTAssertEqual(sut.amount?.value, 100)
    XCTAssertEqual(sut.amount?.currencyCode, "EUR")
  }

  func testAmountAsFloat() {
    let dict: [String : Any] = ["amount": ["value": 100.3, "currency": "EUR"]]
    let sut = RootConfigurationParser(configuration: dict as NSDictionary)
    XCTAssertEqual(sut.amount?.value, 100)
    XCTAssertEqual(sut.amount?.currencyCode, "EUR")
  }

  func testCountryCode() {
    let dict: [String : Any] = ["countryCode": "US"]
    let sut = RootConfigurationParser(configuration: dict as NSDictionary)
    XCTAssertEqual(sut.countryCode, "US")
  }

  func testPayment() {
    let dict: [String : Any] = ["amount": ["value": 100, "currency": "EUR"], "countryCode": "US"]
    let sut = RootConfigurationParser(configuration: dict as NSDictionary)
    XCTAssertEqual(sut.payment?.amount.value, 100)
    XCTAssertEqual(sut.payment?.amount.currencyCode, "EUR")
  }

  func testShopperLocale() {
    let dict: [String : Any] = ["locale": "en-US"]
    let sut = RootConfigurationParser(configuration: dict as NSDictionary)
    XCTAssertEqual(sut.shopperLocale, "en-US")
  }

}
