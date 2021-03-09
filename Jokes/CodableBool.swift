//
//  CodableBool.swift
//  Jokes
//
//  Created by mani on 2021-03-08.
//

import Foundation

@propertyWrapper
struct CodableBool: Codable {
    var wrappedValue: Bool = false
}

extension CodableBool {
    init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        wrappedValue = try container.decode(Bool.self)
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        try container.encode(wrappedValue)
    }
}
