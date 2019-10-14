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
    @Published var currentLevel = CurrentLevel.empty
    @Published var orchestrator: Orchestrator
    
    init() {
        self.orchestrator = Orchestrator()
        self.orchestrator.associate(self)
    }
}
