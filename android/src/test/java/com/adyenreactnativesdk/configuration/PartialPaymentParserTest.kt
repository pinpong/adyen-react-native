package com.adyenreactnativesdk.configuration

import org.junit.Assert.assertEquals
import org.junit.Test

class PartialPaymentParserTest {

    @Test
    fun testConfigurationOnEmptySubDictionary() {
        // GIVEN
        val config = WritableMapMock()
        val partialPaymentConfiguration = WritableMapMock()
        config.putMap(PartialPaymentParser.ROOT_KEY, partialPaymentConfiguration)

        // WHEN
        val sut = PartialPaymentParser(config)

        // THEN
        assertEquals(sut.pinRequired, true)
    }

    @Test
    fun testConfigurationNegativeValue() {
        // GIVEN
        val config = WritableMapMock()
        val partialPaymentConfiguration = WritableMapMock()
        partialPaymentConfiguration.putBoolean(PartialPaymentParser.PIN_REQUIRED_KEY, false)
        config.putMap(PartialPaymentParser.ROOT_KEY, partialPaymentConfiguration)

        // WHEN
        val sut = PartialPaymentParser(config)

        // THEN
        assertEquals(sut.pinRequired, false)
    }

    @Test
    fun testConfigurationPositiveValue() {
        // GIVEN
        val config = WritableMapMock()
        val partialPaymentConfiguration = WritableMapMock()
        partialPaymentConfiguration.putBoolean(PartialPaymentParser.PIN_REQUIRED_KEY, true)
        config.putMap(PartialPaymentParser.ROOT_KEY, partialPaymentConfiguration)

        // WHEN
        val sut = PartialPaymentParser(config)

        // THEN
        assertEquals(sut.pinRequired, true)
    }

}