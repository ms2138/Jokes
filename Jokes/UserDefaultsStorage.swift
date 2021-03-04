//
//  UserDefaultsStorage.swift
//  Jokes
//
//  Created by mani on 2021-03-02.
//

import Foundation

@propertyWrapper struct UserDefaultsStorage<Value> {
    let key: String
    var defaults: UserDefaults = .standard

    var wrappedValue: Value
}
