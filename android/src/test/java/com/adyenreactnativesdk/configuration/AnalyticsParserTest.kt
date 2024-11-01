package com.adyenreactnativesdk.configuration

import com.adyen.checkout.components.core.AnalyticsLevel
import org.junit.Assert
import org.junit.Test

class AnalyticsParserTest {

    @Test
    fun testConfigurationOnSubDictionary() {
        // GIVEN
        val config = WritableMapMock()
        val analyticsConfig = WritableMapMock()
        config.putMap(AnalyticsParser.ROOT_KEY, analyticsConfig)

        // WHEN
        val analyticsParser = AnalyticsParser(config)

        // THEN
        Assert.assertSame(analyticsParser.analytics.level, AnalyticsLevel.NONE)
        Assert.assertFalse(analyticsParser.verboseLogs)
    }

    @Test
    fun testIsEnabled() {
        // GIVEN
        val config = WritableMapMock()
        config.putBoolean(AnalyticsParser.ENABLED_KEY, true)
        config.putBoolean(AnalyticsParser.VERBOSE_LOGS_KEY, false)


        // WHEN
        val analyticsParser = AnalyticsParser(config)

        // THEN
        Assert.assertSame(analyticsParser.analytics.level, AnalyticsLevel.ALL)
        Assert.assertFalse(analyticsParser.verboseLogs)
    }

    @Test
    fun testIsNotEnabled() {
        // GIVEN
        val config = WritableMapMock()
        config.putBoolean(AnalyticsParser.ENABLED_KEY, false)
        config.putBoolean(AnalyticsParser.VERBOSE_LOGS_KEY, true)

        // WHEN
        val analyticsParser = AnalyticsParser(config)

        // THEN
        Assert.assertSame(analyticsParser.analytics.level, AnalyticsLevel.NONE)
        Assert.assertTrue(analyticsParser.verboseLogs)
    }
}