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
    
    /// The orchestrator responsible of updating the store
    @Published var orchestrator: Orchestrator
    
    /// The model data contained in the store
    @Published var level = CurrentLevel.empty
    @Published var levelsList = LevelsList.empty
    
    /// The application state contained in the store
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
