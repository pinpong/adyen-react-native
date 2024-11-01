//
// Copyright (c) 2024 Adyen N.V.
//
// This file is open source and available under the MIT license. See the LICENSE file for more info.
//

@_spi(AdyenInternal) import Adyen

public struct PartialPaymentParser {

    private var dict: [String: Any]

    init(configuration: [String: Any]) {
        self.init(configuration: configuration as NSDictionary)
    }

    public init(configuration: NSDictionary) {
        guard let configuration = configuration as? [String: Any] else {
            self.dict = [:]
            return
        }
        if let configurationNode = configuration[PartialPaymentKey.rootKey] as? [String: Any] {
            self.dict = configurationNode
        } else {
            self.dict = configuration
        }
    }

    public var pinRequired: Bool {
        dict[PartialPaymentKey.pinRequired] as? Bool ?? true
    }

}



