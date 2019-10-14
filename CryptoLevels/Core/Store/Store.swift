//
//  Store.swift
//  CryptoLevels
//
//  Created by Lorenzo Zanotto on 13/10/2019.
//  Copyright © 2019 Lorenzo Zanotto. All rights reserved.
//

import Foundation
import Combine

final class Store: ObservableObject {
    @Published var level = CurrentLevel.empty
    @Published var orchestrator: Orchestrator
    
    @Published var loading = false
    @Published var error: NetworkError?
    
    init() {
        self.orchestrator = Orchestrator()
        self.orchestrator.associate(self)
    }
    
    func startLoadingResource() {
        loading = true
        error = nil
    }
    
    func stopLoadingResource() {
        loading = false
    }
}
