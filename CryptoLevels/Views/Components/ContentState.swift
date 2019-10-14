//
//  ContentState.swift
//  CryptoLevels
//
//  Created by Lorenzo Zanotto on 15/10/2019.
//  Copyright © 2019 Lorenzo Zanotto. All rights reserved.
//

import Foundation

struct ContentState<T> {
    
    /// Indicates the loading status of a request
    let loading: Bool
    
    /// The data that is going to be shown
    let data: T
    
    /// Whether the data is empty or not
    let emptyData: Bool
    
    /// An eventual error to be displayed
    let error: NetworkError?
    
    init(loading: Bool, data: T, emptyData: Bool, error: NetworkError?) {
        self.loading = loading
        self.data = data
        self.emptyData = emptyData
        self.error = error
    }
}
