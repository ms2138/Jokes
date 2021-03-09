//
//  CodableBool.swift
//  Jokes
//
//  Created by mani on 2021-03-08.
//

import Foundation

@propertyWrapper
struct CodableBool {
    var wrappedValue: Bool = false
}
