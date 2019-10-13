//
//  Orchestrator.swift
//  CryptoLevels
//
//  Created by Lorenzo Zanotto on 13/10/2019.
//  Copyright © 2019 Lorenzo Zanotto. All rights reserved.
//

import Foundation

/// The orchestrator is the class that is responsible
/// of dispatching actions and updating the store.
final class Orchestrator {
    private var _store: Store?
    
    var store: Store {
        return _store ?? Store()
    }
    
    func associate(_ store: Store) {
        _store = store
    }
    
    func updateStoreValue() {
        store.levels = "Ciaoo"
    }
    
}
