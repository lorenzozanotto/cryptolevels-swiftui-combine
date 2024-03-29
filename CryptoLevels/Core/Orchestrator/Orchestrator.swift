//
//  Orchestrator.swift
//  CryptoLevels
//
//  Created by Lorenzo Zanotto on 13/10/2019.
//  Copyright © 2019 Lorenzo Zanotto. All rights reserved.
//

import Foundation
import Combine

/// The orchestrator is the class that is responsible
/// of dispatching actions and updating the store.
final class Orchestrator: ObservableObject {
    private var store: Store?
    private var network: NetworkManager
    
    init() {
        self.network = NetworkManager()
    }
    
    func associate(_ store: Store) {
        self.store = store
    }
    
    func fetchCurrentLevel() {
        guard let store = store else { return }
        guard let url = URL(string: Endpoints.CurrentLevel) else { return }
        
        store.startLoadingResource()
        _ = network.fire(at: url, output: CurrentLevel.self)
            .mapError({ (error) -> Error in
                store.error = NetworkError.map(error)
                return error
            })
            .catch { _ in Just(CurrentLevel.empty) }
            .map({ store.stopLoadingResource()
                return $0
            })
            .assign(to: \.level, on: store)
    }
    
    func fetchAllLevels() {
        guard let store = store else { return }
        guard let url = URL(string: Endpoints.LevelsList) else { return }
        
        store.startLoadingResource()
        _ = network.fire(at: url, output: LevelsList.self)
            .mapError({ (error) -> Error in
                store.error = NetworkError.map(error)
                return error
            })
            .catch { _ in Just(LevelsList.empty) }
            .map({ store.stopLoadingResource()
                return $0
            })
            .assign(to: \.levelsList, on: store)
    }
}
