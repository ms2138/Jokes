//
//  FileManager+EXT.swift
//  Jokes
//
//  Created by mani on 2021-02-22.
//

import Foundation

extension FileManager {
    var documentsDirectory: URL {
        do {
            return try FileManager.default.url(for: .documentDirectory,
                                               in: .userDomainMask,
                                               appropriateFor: nil,
                                               create: false)
        } catch {
            fatalError("Failed to find documents directory.")
        }
    }
}
