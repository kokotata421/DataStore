//
//  KeychainCache.swift
//  DataCache
//
//  Created by Kota Kawanishi on 2019/09/10.
//  Copyright © 2019 Kota Kawanishi. All rights reserved.
//

import Foundation
import KeychainAccess

fileprivate class KeyChainDataStore: DataStorable {
    static let shared = KeyChainDataStore()
    
    private let store: Keychain = Keychain(service: Bundle.main.bundleIdentifier!)
    func save(_ key: String, value: Data) {
        store[data: key] = value
    }
    
    public func fetch(_ key: String) -> Data? {
        return store[data: key]
    }
    
    public func delete(_ key: String) {
        store[data: key] = nil
    }
    
    private init() {}
}

public final class KeyChainCache: Cacheable {
    static let shared = KeyChainCache()
    private init() {}
    
    fileprivate var store: KeyChainDataStore {
        return KeyChainDataStore.shared
    }
}
