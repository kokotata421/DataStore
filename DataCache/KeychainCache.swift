//
//  KeychainCache.swift
//  DataCache
//
//  Created by Kota Kawanishi on 2019/09/10.
//  Copyright © 2019 Kota Kawanishi. All rights reserved.
//

import Foundation
import KeychainAccess

class KeyChainDataStore: DataStorable {
    private static let store: Keychain = Keychain(service: Bundle.main.bundleIdentifier!)
    static func save(_ key: String, value: Data) {
        store[data: key] = value
    }
    
    static public func fetch(_ key: String) -> Data? {
        return store[data: key]
    }
    
    static public func delete(_ key: String) {
        store[data: key] = nil
    }
    
    private init() {}
}


typealias KeyChainCache = Cache<KeyChainDataStore>

