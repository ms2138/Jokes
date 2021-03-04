//
//  UserDefaultsStorage.swift
//  Jokes
//
//  Created by mani on 2021-03-02.
//

import Foundation

@propertyWrapper struct UserDefaultsStorage<Value> {
    let key: String
    let defaultValue: Value
    var defaults: UserDefaults = .standard

    var wrappedValue: Value {
        get {
            let value = defaults.value(forKey: key) as? Value
            return value ?? defaultValue
        }
        set {
            defaults.setValue(newValue, forKey: key)
        }
    }
}

extension UserDefaultsStorage where Value: ExpressibleByNilLiteral {
    init(key: String, defaults: UserDefaults = .standard) {
        self.init(key: key, defaultValue: nil, defaults: defaults)
    }
}
